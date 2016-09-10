package com.phyapp.web.controller;

import java.io.File;
import java.util.Map;

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
import com.phyapp.utils.PhysiologyUtils;
import com.phyapp.web.modal.Answers;
import com.phyapp.web.modal.Login;
import com.phyapp.web.modal.Question;
import com.phyapp.web.modal.Testdetail;
import com.phyapp.web.service.LoginService;
import com.phyapp.web.service.QuestionService;
import com.phyapp.web.service.TestDetailService;
import com.phyapp.web.service.TestTypeService;
import com.phyapp.web.service.UserService;
import com.phyapp.web.value.NextQueuestion;

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
	
	@RequestMapping(value = { "/", "/home**" }, method = RequestMethod.GET)
	public ModelAndView welcomePage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Hello World");
		model.addObject("message", "This is welcome page!");
		model.setViewName("homePage");
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
		model.setViewName("doctorHomePage");

		return model;

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
        return "registrationPage";
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
		return "questionPage";
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
			String response = PhysiologyUtils.uploadQuestionAnswer(map);
			jsonObject.addProperty("result", "Successfully uploaded ["+response+"].");
			return jsonObject.toString();
		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.addProperty("result", "error occured " + e.getMessage());
			return jsonObject.toString();
		}
	}
}