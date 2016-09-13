package com.phyapp.web.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.phyapp.utils.PhysiologyConstants;
import com.phyapp.utils.PhysiologyUtils;
import com.phyapp.web.modal.Answers;
import com.phyapp.web.modal.Login;
import com.phyapp.web.modal.Question;
import com.phyapp.web.modal.Testdetail;
import com.phyapp.web.modal.Testhistory;
import com.phyapp.web.modal.Testtype;
import com.phyapp.web.modal.UserDetail;
import com.phyapp.web.modal.UserRole;
import com.phyapp.web.service.LoginService;
import com.phyapp.web.service.QuestionService;
import com.phyapp.web.service.TestDetailService;
import com.phyapp.web.service.TestTypeService;
import com.phyapp.web.service.UserService;
import com.phyapp.web.value.NextQueuestion;
import com.phyapp.web.value.QuestionAnswer;
import com.phyapp.web.value.RegistrationVO;
import com.phyapp.web.value.TestDetailResponse;
import com.phyapp.web.value.TestResponse;

@Controller
public class HelloController {

	@Autowired
	TestTypeService testTypeService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	TestDetailService testDetailService;
	
	@Autowired
	QuestionService questionService;
	
	@RequestMapping(value = {"/home**" }, method = RequestMethod.GET)
	public ModelAndView welcomePage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Hello World");
		model.addObject("message", "This is welcome page!");
		model.setViewName("homePage");
		return model;

	}

	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public ModelAndView errorPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Exception");
		model.setViewName("errorPage");
		return model;

	}
	
	@RequestMapping(value = "/adminHome", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Admin");
		model.addObject("message", "This is protected page - Admin Page!");
		model.setViewName("adminPage");

		return model;

	}
	
	@RequestMapping(value = "/doctorHome", method = RequestMethod.GET)
	public ModelAndView doctorHome() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Doctor");
		model.addObject("message", "This is protected page - Database Page!");
		List<Testtype> testTypes = testTypeService.getList();
		List<Login> loggedInUsers = loginService.getListByUserRole(PhysiologyConstants.ROLE_PATIENT);
		List<TestDetailResponse> testResults = new ArrayList<TestDetailResponse>();
		for (Login loginUser : loggedInUsers) {
			TestDetailResponse tres = new TestDetailResponse();
			Login login = loginService.getLoginDetailByUserName(loginUser.getUsername());
			UserDetail userDetail = login.getUserDetail();
			tres.setUserDetail(userDetail);
			Map<String, Testdetail> testDetailsforUser = new LinkedHashMap<String, Testdetail>();
			for (Testtype testType : testTypes) {
				Testdetail testDetail = testDetailService.getLatestTestDetailByUserIdAndTestType(userDetail.getId(), testType.getId());
				testDetailsforUser.put(testType.getTestName(), testDetail);
			}
			tres.setTestResults(testDetailsforUser);
			testResults.add(tres);
		}
		model.addObject("testTypes", testTypes);
		model.addObject("testResults", testResults);
		model.setViewName("doctorHomePage");
		return model;

	}
	
	
	
	@RequestMapping(value = "/testdetail/{testDetailId}", method = RequestMethod.GET)
    public String testDetailPage(@PathVariable(value="testDetailId") Integer testDetailId, ModelMap model) {
		Testdetail testdetail = testDetailService.getTestDetailById(testDetailId);
		List<Map<Question,Testhistory>> questionList = new ArrayList<Map<Question,Testhistory>>();
		for (Testhistory testhistory : testdetail.getTesthistories()) {
			Map<Question,Testhistory> map = new HashMap<Question,Testhistory>();
			Question question = questionService.getQuestionById(testhistory.getQuestionId());			
			map.put(question, testhistory);
			questionList.add(map);
		}
		model.addAttribute("userdetail",testdetail.getUserDetail());
		model.addAttribute("testType", testdetail.getTesttype());
		model.addAttribute("totalQuestion",testdetail.getTesthistories().size());
		model.addAttribute("questionList",questionList);
		model.addAttribute("targetURL", PhysiologyUtils.determineTargetUrl(SecurityContextHolder.getContext().getAuthentication()));
		return "testDetailPage";
    }
	
	@RequestMapping(value = "/testdetail/all/{userid}/{testtypeid}", method = RequestMethod.GET)
    public String testDetailByUserIdPage(@PathVariable(value="userid") Integer userid,@PathVariable(value="testtypeid") Integer testtypeid, ModelMap model) {
		List<Testdetail> testdetails = testDetailService.getAllTestDetailByUserIdAndTestType(userid, testtypeid);
		model.addAttribute("testdetails",testdetails);
		model.addAttribute("targetURL", PhysiologyUtils.determineTargetUrl(SecurityContextHolder.getContext().getAuthentication()));
		return "allTestDetailByUserIdPage";
    }
	
	@RequestMapping(value = "/patientHome", method = RequestMethod.GET)
	public ModelAndView patientHome() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Patient");
		model.addObject("message", "This is protected page - Database Page!");
		model.addObject("testTypes", testTypeService.getList());
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Login login = loginService.getLoginDetailByUserName(auth.getName());
		model.addObject("loginDetails",login);		
		model.setViewName("patientHomePage");

		return model;

	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
		@RequestParam(value = "logout", required = false) String logout) {

	  ModelAndView model = new ModelAndView();
	  if (error != null) {
		model.addObject("error", "Invalid username and password!");
	  }

	  if (logout != null) {
		model.addObject("msg", "You've been logged out successfully.");
	  }
	  model.setViewName("loginPage");

	  return model;

	}

	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "adminHomePage";
    }   
    
 
    @RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "accessDeniedPage";
    }
  
    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){    
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }
 
    private String getPrincipal(){
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
 
        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }
 
    @RequestMapping(value = { "/registration"}, method = RequestMethod.GET)
    public String registrationPage(ModelMap model) {
//    	model.addAttribute("role", PhysiologyConstants.ROLE_PATIENT);
        return "registrationPage";
    }
    
    @RequestMapping(value = "registration", method = RequestMethod.POST, consumes="application/json", headers = "Accept=application/json",  produces = "application/json")
   	public @ResponseBody String registrationPage(@RequestBody RegistrationVO regInfo, UriComponentsBuilder ucBuilder) {
        JsonObject response = new JsonObject();
    	try{
    		UserDetail userDetail = new UserDetail();
    		userDetail.setName(regInfo.getName());
    		userDetail.setFname(regInfo.getFname());
    		userDetail.setPhno(regInfo.getContactNo());
    		userDetail.setAddress(regInfo.getAddress());
    		userDetail.setSex(Integer.parseInt(regInfo.getGender()));
    		userDetail.setEducationType(regInfo.getEduType());
    		userDetail.setEducationMedium(regInfo.getEduMedium());
    		userDetail.setMaritialStatus(Integer.parseInt(regInfo.getMaritalStatus()));
    		userDetail.setMonthlyIncome(regInfo.getIncome());
    		userDetail.setReligion(regInfo.getReligion());
    		userDetail.setFamilyType(Integer.parseInt(regInfo.getFamilyType()));
    		userDetail.setBirthorder(Integer.parseInt(regInfo.getBirthOrder()));
    		userDetail.setLocality(regInfo.getLocality());
    		
    		userService.saveUserDetail(userDetail);
    		
    		UserRole userRole= new UserRole();
    		userRole.setUsername(regInfo.getUsername());
    		userRole.setRole(regInfo.getRole());
    		userService.saveUserRole(userRole);
    		
    		Login login = new Login();
    		login.setUserDetail(userDetail);
    		login.setStatus(PhysiologyConstants.ACTIVE);
    		login.setUsername(regInfo.getUsername());
    		login.setPassword(regInfo.getPassword());
    		loginService.saveLoginDetail(login);
    		
    		
    		response.addProperty("successMsg", "success");
			response.addProperty("errorMsg", "");
    	}catch(Exception ex){
   			response.addProperty("successMsg", "");
			response.addProperty("errorMsg",  "error: "+ex.getMessage());
   		}
		return response.toString();
    }
    
    @RequestMapping(value = { "/resetpassword"}, method = RequestMethod.GET)
    public String resetPasswordPage(ModelMap model) {
        return "resetpasswordPage";
    }
 
    
    
    @RequestMapping(value = { "/testtypes"}, method = RequestMethod.GET)
    public String testTypes(ModelMap model) {
    	model.addAttribute("testTypes", testTypeService.getList());
    	return "testTypesPage";
    }
    
    
    @RequestMapping(value = { "/question"}, method = RequestMethod.GET)
    public String questionPage(ModelMap model) {
        return "questionPage";
    }
    
    @RequestMapping(value = "starttest/{userid}/{testtypeid}", method = RequestMethod.GET)
    public String startTest(@PathVariable(value="userid") Integer userId,@PathVariable(value="testtypeid") Integer testTypeId,ModelMap model) {     	
    	model.addAttribute("userdetail",userService.getUserDetailById(userId));
    	model.addAttribute("testType",testTypeService.getTestTypeById(testTypeId));	
    	Integer testId = testDetailService.createNewTest(userId, testTypeId);
    	List<Question> questionList = questionService.getListByTestType(testTypeId);    	
    	model.addAttribute("questions",questionList);
    	model.addAttribute("totalQuestion",questionList.size());
    	model.addAttribute("testid", testId);
    	return "questionPage";
    }
    
    
    @RequestMapping(value = "testresult/{testtypeid}/{score}", method = RequestMethod.GET)
    public String testResult(@PathVariable(value="testtypeid") Integer testtypeid, @PathVariable(value="score") Integer score,ModelMap model) {    	
    	model.addAttribute("testType",testTypeService.getTestTypeById(testtypeid));
    	model.addAttribute("score", score);
    	model.addAttribute("targetURL", PhysiologyUtils.determineTargetUrl(SecurityContextHolder.getContext().getAuthentication()));
    	return "resultPage";
    }
    
    @RequestMapping(value = "saveTestResult", method = RequestMethod.POST, consumes="application/json", headers = "Accept=application/json",  produces = "application/json")
   	public @ResponseBody String saveTestResult(@RequestBody TestResponse test, UriComponentsBuilder ucBuilder) {
   		JsonObject response = new JsonObject();
   		Integer totalScore = 0;
   		try {
   			System.out.println(test.getUserid());
   			System.out.println(test.getTestid());
   			System.out.println(test.getQuestions());   			
   			Testdetail testDetail =  testDetailService.getTestDetailById(test.getTestid());
   			UserDetail userDetail = userService.getUserDetailById(test.getUserid());
   			Testtype testtype = testTypeService.getTestTypeById(test.getTestTypeId());
   			QuestionAnswer [] queAns = test.getQuestions();
   			for (QuestionAnswer questionAnswer : queAns) {
   				totalScore +=questionAnswer.getScore();
   				Testhistory testhistory = new Testhistory();
   				testhistory.setTestdetail(testDetail);
   				testhistory.setUserDetail(userDetail);
   				testhistory.setQuestionId(questionAnswer.getQid());
   				testhistory.setTesttype(testtype);
   				testhistory.setQuestiontype(questionService.getQuestonType(questionAnswer.getQuestionType()));
   				testhistory.setSelectedTypeId(questionAnswer.getOption());
   				testhistory.setOptionscore(questionAnswer.getScore());
   				testhistory.setUpdatedOn(new Date());
   				testDetailService.saveTestHistory(testhistory);   				
			}
   			
   			
   			testDetail.setScore(totalScore);
   			testDetailService.saveTestDetail(testDetail);
   			response.addProperty("testtypeid", testtype.getId());
   			response.addProperty("score", totalScore);
   			response.addProperty("successMsg", "success");
			response.addProperty("errorMsg", "");
   		}catch(Exception ex){
   			response.addProperty("successMsg", "");
			response.addProperty("errorMsg", ex.getMessage());
   		}
		return response.toString();
    }
    
     
    private Login getLoginDetails(){
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return loginService.getLoginDetailByUserName(auth.getName());
    }
    
    @RequestMapping(value = "saveAndNext", method = RequestMethod.POST, consumes="application/json", headers = "Accept=application/json",  produces = "application/json")
	public @ResponseBody String saveSelectedOption(@RequestBody NextQueuestion quizform, UriComponentsBuilder ucBuilder) {
		JsonObject response = new JsonObject();
		try {
			Integer testId = quizform.getTestId();
			if(StringUtils.isEmpty(quizform.getTestId())){
				testId = testDetailService.createNewTest(quizform.getUserId(), quizform.getTestType());
			}
			quizform.setTestId(testId);
			response.addProperty("testId", testId);
			Testdetail test = testDetailService.getTestDetailById(quizform.getTestId());
			Integer qno = quizform.getQno();
			if (qno == null) {
				qno = 1;
			} else {
				System.out.println("save option for Question:"+qno);
			}
			System.out.println("@@@"+quizform.getAction());
			if("back".equals(quizform.getAction())){
				qno = qno-2;
			}
			response.addProperty("qno", qno);
			Question question = questionService.getQuestionByQNo(test.getTesttype().getId(), qno);
			response.addProperty("totalQuestion", questionService.getTotalQuestionByTestType(quizform.getTestType()));
			response.add("nextQuestion", getNextQuestionJson(question));
			response.addProperty("successMsg", "true");
			response.addProperty("errorMsg","");
		} catch (Exception e) {
			response.addProperty("successMsg", "");
			response.addProperty("errorMsg", "quiestion id: " + quizform.getQno() + " not found.");
		}		
		return response.toString();
    	}	

    private JsonElement getNextQuestionJson(Question question) {
    	JsonObject response = new JsonObject();
    	if(question!=null){
    		response.addProperty("qid", question.getId());
    		response.addProperty("question", question.getQuestion());
    		response.addProperty("testType", question.getTestType());
    		response.addProperty("questionType", question.getQuestiontype().getType());
    		JsonArray answers = new JsonArray();
    		for (Answers ans : question.getAnswerses()) {
    			JsonObject answer = new JsonObject();
    			answer.addProperty("ansId", ans.getId());
    			answer.addProperty("label", ans.getDescription());
    			answer.addProperty("score", ans.getScore());
    			answers.add(answer);
			}
    		
    		response.add("answers", answers);
    	}
		return response;
	}

	@RequestMapping(value = "/uploadQuestion", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String uploadFile(
			@RequestParam("fileName") MultipartFile multipartFile) {
		JsonObject jsonObject = new JsonObject();
		try {
			File convFile = new File(multipartFile.getOriginalFilename());
			multipartFile.transferTo(convFile);
			
			Map<String, Object> map = PhysiologyUtils.readExcelData(convFile);
			String response = PhysiologyUtils.uploadQuestionAnswer(testTypeService,questionService, map);
			jsonObject.addProperty("result", "Successfully uploaded ["+response+"].");
			return jsonObject.toString();
		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.addProperty("result", "error occured " + e.getMessage());
			return jsonObject.toString();
		}
	}
}