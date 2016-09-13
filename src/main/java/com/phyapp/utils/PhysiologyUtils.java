package com.phyapp.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

import com.phyapp.web.exception.PhysiologyException;
import com.phyapp.web.modal.Answers;
import com.phyapp.web.modal.Question;
import com.phyapp.web.modal.Questiontype;
import com.phyapp.web.modal.Testtype;
import com.phyapp.web.service.QuestionService;
import com.phyapp.web.service.TestTypeService;

@Configuration
public class PhysiologyUtils {

	
	public static String determineTargetUrl(Authentication authentication) {
        String url = "";
 
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
 
        List<String> roles = new ArrayList<String>();
 
        for (GrantedAuthority a : authorities) {
            roles.add(a.getAuthority());
        }
 
        if (isAdmin(roles)) {
            url = "/admin";
        }  else if (isDoctor(roles)) {
            url = "/doctorHome";
        } else if (isPatient(roles)) {
            url = "/patientHome";
        } else {
            url = "/accessDenied";
        }
 
        return url;
    }
	
	 private static boolean isDoctor(List<String> roles) {
	        if (roles.contains("ROLE_DOCTOR")) {
	            return true;
	        }
	        return false;
	    }
	 
	    private static boolean isAdmin(List<String> roles) {
	        if (roles.contains("ROLE_ADMIN")) {
	            return true;
	        }
	        return false;
	    }
	 
	    private static  boolean isPatient(List<String> roles) {
	        if (roles.contains("ROLE_PATIENT")) {
	            return true;
	        }
	        return false;
	    }
	
	public static String uploadQuestionAnswer(TestTypeService testTypeService, QuestionService queService, Map<String, Object> map ) {
		//INSERT TEST IF IT IS NOT ALREADY EXISTS.
		Set<Entry<String, Object>> testList = map.entrySet();System.out.println(testList);
		for (Entry<String, Object> test : testList) {
			String testName = test.getKey();
			System.out.println(testName);
			
			Testtype testType = testTypeService.isTestTypeAvailable(new Testtype(testName));
			if(testType==null){
				testType = new Testtype(testName);
				testTypeService.saveTestType(testType);
			}
			List<Map<String,String>> questionList = (List<Map<String, String>>) test.getValue();
			for (Map<String, String> question : questionList) {
				Question newQuestion = new Question();				
				
				Questiontype queType = queService.getDefaultQuestionType();
				newQuestion.setQuestiontype(queType);
				newQuestion.setTestType(testType.getId());
				newQuestion.setQuestion(question.get("question"));
				queService.saveQuestion(newQuestion);
				
				Answers optionA = new Answers();
				optionA.setQuestion(newQuestion);
				optionA.setDescription(question.get("optiona"));
				optionA.setScore(getScore(question,"scorea"));
				queService.saveAnswer(optionA);
				
				Answers optionB = new Answers();
				optionB.setQuestion(newQuestion);
				optionB.setDescription(question.get("optionb"));
				optionB.setScore(getScore(question,"scoreb"));
				queService.saveAnswer(optionB);
				
				Answers optionC = new Answers();
				optionC.setQuestion(newQuestion);
				optionC.setDescription(question.get("optionc"));
				optionC.setScore(getScore(question,"scorec"));
				queService.saveAnswer(optionC);
				
				Answers optionD = new Answers();
				optionD.setQuestion(newQuestion);
				optionD.setDescription(question.get("optiond"));
				optionD.setScore(getScore(question,"scored"));
				queService.saveAnswer(optionD);
				
			}
		}
		return "uploaded";
	}

	private static Integer getScore(Map<String,String> question, String key) {
		try{
			return Integer.parseInt(question.get(key));
		} catch(Exception ex){
			return 0;
		}
	}

	public static Map<String, Object> readExcelData(File excel) throws PhysiologyException {
		Map<String, Object> excelMap = new LinkedHashMap<String, Object>();	
		try {			
			InputStream input = new FileInputStream(excel);
			POIFSFileSystem fs = new POIFSFileSystem(input);
			HSSFWorkbook wb = new HSSFWorkbook(fs);			
			for (int i = 0; i < wb.getNumberOfSheets(); i++) {
				try{
				HSSFSheet sheet = wb.getSheetAt(i);
				ExcelSheet sheetData = readSheet(excelMap, sheet);
				excelMap.put(sheetData.getSheetName(),sheetData.getData());
				}catch(Exception ex){
					System.err.println("There is some error in read Data from sheet.");
				}
			}
			
		} catch (Exception ex) {
			throw new PhysiologyException("error in readExcelData", ex);
		}
		return excelMap;
	}
	
	private static ExcelSheet readSheet(Map<String, Object> excelMap, HSSFSheet sheet)
			throws IllegalAccessException, InvocationTargetException {

		List<Map<String,String>> mapList = new ArrayList<Map<String,String>>();
		Iterator<Row> rowIterator = sheet.rowIterator();
		String sheetName = sheet.getSheetName();
		ExcelSheet excelSheet = new ExcelSheet();
		excelSheet.setSheetName(sheetName);
		
		List<String> headers = getRowInList(rowIterator.next());
		

		while (rowIterator.hasNext()) {
			Map<String, String> cellValues = getMapFromRow(headers, rowIterator.next());
			mapList.add(cellValues);
		}
		excelSheet.setData(mapList);
		return excelSheet;
		
	
	}
	
	private static Map<String,String> getMapFromRow(List<String> headers, Row row){
		HashMap<String, String> rowMap = new LinkedHashMap<String, String>();				
		for (int cn = 0; cn < headers.size(); cn++) {
			Cell c = row.getCell(cn, Row.RETURN_BLANK_AS_NULL);
			if (c == null) {
				rowMap.put(headers.get(cn), "");
			} else {
				c.setCellType(Cell.CELL_TYPE_STRING);
				rowMap.put(headers.get(cn), c.getStringCellValue());
			}
		}
		return rowMap;
	}
	
	
	private static List<String> getRowInList(Row headerRow) {
		List<String> rowData = new ArrayList<String>();
		Iterator<Cell> cellIterator = headerRow.cellIterator();
		while (cellIterator.hasNext()) {
			Cell cell = cellIterator.next();
			cell.setCellType(Cell.CELL_TYPE_STRING);
			rowData.add(cell.getStringCellValue());
		}
		return rowData;
	}

}
class ExcelSheet{
	private String sheetName;
	private Object data;
	public String getSheetName() {
		return sheetName;
	}
	public void setSheetName(String sheetName) {
		this.sheetName = sheetName;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}		
}