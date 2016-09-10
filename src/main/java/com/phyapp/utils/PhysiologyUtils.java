package com.phyapp.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

import com.phyapp.web.exception.PhysiologyException;

public class PhysiologyUtils {

	public static String uploadQuestionAnswer(Map<String, Object> map ) {
		// TODO Auto-generated method stub
		return null;
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
				excelMap.put(sheetData.getSheetName(),sheetData.getData()); System.out.println(excelMap);
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