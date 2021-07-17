package com.sjdang.util.excel;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

public class ExcelReader {
	
	private static Logger logger = Logger.getLogger(ExcelReader.class.getName());
	public int totalRows;
	public static int totalCells;
	
	/**  
	* @Description: TODO(分类读取Excel .xlsx .xls 格式文件内容)  
	* @param file
	* @throws IOException  
	* @return List<ArrayList<String>>
	*/
	public List<ArrayList<String>> readExcel(MultipartFile file) throws IOException {
		if (file==null || UtilExcel.EMPTY.equals(file.getOriginalFilename().trim())) {
			return null;
		}
		String postfix = UtilExcel.getPostfix(file.getOriginalFilename());
		if (!UtilExcel.EMPTY.equals(postfix)) {
			if (UtilExcel.OFFICE_EXCEL_2003_POSTFIX.equals(postfix)) {
				return readXls(file);
			} else if (UtilExcel.OFFICE_EXCEL_2010_POSTFIX.equals(postfix)) {
				return readXlsx(file);
			} else {					
				return null;
			}
		}
		return null;
	}
	
	/**  
	* @Description: TODO(读取Excel 2010 .xlsx 格式文件内容)  
	* @param file
	* @return List<ArrayList<String>>
	*/
	public List<ArrayList<String>> readXlsx(MultipartFile file) {
		List<ArrayList<String>> resultList = new ArrayList<ArrayList<String>>();
	    // IO流读取文件
	    InputStream input = null;
	    ArrayList<String> rowList = null;
		try {
			input = file.getInputStream();
		    // 创建文档
			XSSFWorkbook wb = new XSSFWorkbook(input);
	        // 读取sheet(页)
	        for (int numSheet=0; numSheet<wb.getNumberOfSheets(); numSheet++) {
	        	XSSFSheet xssfSheet = wb.getSheetAt(numSheet);
	        	if (xssfSheet == null) {
	        		continue;
	        	}
	        	totalRows = xssfSheet.getLastRowNum();
	        	// 读取Row,从第二行开始
	        	for (int rowNum = 1;rowNum <= totalRows;rowNum++) {
	        		XSSFRow xssfRow = xssfSheet.getRow(rowNum);
	        		if (xssfRow!=null) {
	        			rowList = new ArrayList<String>();
	        			totalCells = xssfRow.getLastCellNum();
	        			// 读取列，从第一列开始
	        			for (int c=0;c<=totalCells+1;c++) {
	        				XSSFCell cell = xssfRow.getCell(c);
	        				if (cell==null) {
	        					rowList.add(UtilExcel.EMPTY);
	        					continue;
	        				}	        				
	        				rowList.add(UtilExcel.getXssfValue(cell).trim());
	        			}
	        			resultList.add(rowList);
	        			System.out.println(rowList);
	        			logger.debug(rowList);
	        		}
	        	}
	        }
	        return resultList;
		} catch (IOException e) {			
			logger.error(e.getMessage());
		} finally {
			try {
				input.close();
			} catch (IOException e) {
				logger.error(e.getMessage());
			}
		}
		return null;
	}

	/**  
	* @Description: TODO(读取Excel 2003-2007 .xls 格式文件内容)  
	* @param file
	* @return List<ArrayList<String>>
	*/
	public List<ArrayList<String>> readXls(MultipartFile file){ 
		List<ArrayList<String>> resultList = new ArrayList<ArrayList<String>>();
	    // IO流读取文件
	    InputStream input = null;
	    ArrayList<String> rowList = null;
		try {
			input = file.getInputStream();
		    // 创建文档
			HSSFWorkbook wb = new HSSFWorkbook(input);           		    
	        // 读取sheet(页)
	        for (int numSheet=0;numSheet<wb.getNumberOfSheets();numSheet++) {
	        	HSSFSheet hssfSheet = wb.getSheetAt(numSheet);
	        	if (hssfSheet == null) {
	        		continue;
	        	}
	        	totalRows = hssfSheet.getLastRowNum();	        	
	        	// 读取Row,从第二行开始
	        	for (int rowNum = 1;rowNum <= totalRows;rowNum++) {
	        		HSSFRow hssfRow = hssfSheet.getRow(rowNum);
	        		if (hssfRow!=null) {
	        			rowList = new ArrayList<String>();
	        			totalCells = hssfRow.getLastCellNum();
	        			// 读取列，从第一列开始
	        			for (int c=0;c<=totalCells+1;c++) {
	        				HSSFCell cell = hssfRow.getCell(c);
	        				if (cell==null) {
	        					rowList.add(UtilExcel.EMPTY);
	        					continue;
	        				}	        				
	        				rowList.add(UtilExcel.getHssfValue(cell).trim());
	        			}	     
	        			resultList.add(rowList);
	        			System.out.println(rowList);
	        			logger.debug(rowList);
	        		}	        		
	        	}
	        }
	        return resultList;
		} catch (IOException e) {			
			logger.error(e.getMessage());
		} finally {
			try {
				input.close();
			} catch (IOException e) {
				logger.error(e.getMessage());
			}
		}
		return null;
	}

}
