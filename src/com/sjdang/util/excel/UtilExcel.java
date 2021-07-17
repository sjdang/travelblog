package com.sjdang.util.excel;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;

public class UtilExcel {
	
	public static final String OFFICE_EXCEL_2003_POSTFIX = "xls";
    public static final String OFFICE_EXCEL_2010_POSTFIX = "xlsx";
    public static final String EMPTY = "";
    public static final String POINT = ".";
    public static SimpleDateFormat sdf =   new SimpleDateFormat("yyyy/MM/dd");
    
    /**  
    * @Description: TODO(获取path后缀名)  
    * @param path
    * @return String
    */
    public static String getPostfix(String path) {
        if (path==null || EMPTY.equals(path.trim())) {
            return EMPTY;
        }
        if (path.contains(POINT)) {
            return path.substring(path.lastIndexOf(POINT)+1, path.length());
        }
        return EMPTY;
    }
    
    /**  
    * @Description: TODO(获取HSSFCell单元格数值)  
    * @param hssfCell
    * @return String
    */
    @SuppressWarnings({ "static-access"})
    public static String getHssfValue(HSSFCell hssfCell) {
         if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) {
             return String.valueOf(hssfCell.getBooleanCellValue());
         }
         if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
             String cellValue = "";
             if (HSSFDateUtil.isCellDateFormatted(hssfCell)) {      
                 Date date = HSSFDateUtil.getJavaDate(hssfCell.getNumericCellValue());
                 cellValue = sdf.format(date);
             } else {
                 DecimalFormat df = new DecimalFormat("#.###############");
                 cellValue = df.format(hssfCell.getNumericCellValue());
                 String strArr = cellValue.substring(cellValue.lastIndexOf(POINT)+1,cellValue.length());
                 if (strArr.equals("00")) {
                     cellValue = cellValue.substring(0, cellValue.lastIndexOf(POINT));
                 }
             }
             return cellValue;
         }
         return String.valueOf(hssfCell.getStringCellValue());
    }
    
    /**  
    * @Description: TODO(获取XSSFCell单元格数值)  
    * @param xssfCell
    * @return String
    */
    public static String getXssfValue(XSSFCell xssfCell) {
         if (xssfCell.getCellType() == Cell.CELL_TYPE_BOOLEAN) {
             return String.valueOf(xssfCell.getBooleanCellValue());
         }
         if (xssfCell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
             String cellValue = "";
             if (DateUtil.isCellDateFormatted(xssfCell)) {
                 Date date = DateUtil.getJavaDate(xssfCell.getNumericCellValue());
                 cellValue = sdf.format(date);
             } else {
                 DecimalFormat df = new DecimalFormat("#.###############");
                 cellValue = df.format(xssfCell.getNumericCellValue());
                 String strArr = cellValue.substring(cellValue.lastIndexOf(POINT)+1,cellValue.length());
                 if (strArr.equals("00")) {
                     cellValue = cellValue.substring(0, cellValue.lastIndexOf(POINT));
                 }
             }
             return cellValue;
         }
         return String.valueOf(xssfCell.getStringCellValue());
    }

}
