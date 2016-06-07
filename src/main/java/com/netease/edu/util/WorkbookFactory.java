package com.netease.edu.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Workbook;

@SuppressWarnings("unused")
public class WorkbookFactory extends org.apache.poi.ss.usermodel.WorkbookFactory{

	private static enum ExcelEnum{
		
		EXCEL_2003_OR_BEFORE("excel_2003_or_before",10,"xls"),
		EXCEL_2007_OR_LATTER("excel_2007_or_latter",20,"xlsx")
		;
		
		private String type;
		private int value;
		private String suffix;
		
		ExcelEnum(String type,int value,String suffix){
			this.type = type;
			this.value = value;
			this.suffix = suffix;
		}
		
		public int getValue(String type){
			for(ExcelEnum e : ExcelEnum.values()){
				if(e.getType().equals(type))
					return e.getValue();
			}
			return -1;
		}
		
		public String getSuffix(String type){
			for(ExcelEnum e : ExcelEnum.values()){
				if(e.getType().equals(type))
					return e.getSuffix();
			}
			return null;
		}
		public static ExcelEnum getExcel(String suffix){
			for(ExcelEnum e : ExcelEnum.values()){
				if(e.getSuffix().equals(suffix))
					return e;
			}
			return null;
		}
		
		public int getValue(){
			return this.value;
		}
		public String getType(){
			return this.type;
		}
		public String getSuffix(){
			return this.suffix;
		}
	}
	
	private static String getExt(String fileName){
		int index = fileName.lastIndexOf(".");
		if(-1 == index)
			throw new RuntimeException("该文件无扩展名!");
		return fileName.substring(index + 1);
	}
	
	
	private static void checkExcel(File file){
		if(file.isDirectory()){
			try {
				throw new RuntimeException("文件路径错误，没有指定待操作文件名称: "+file.getCanonicalPath());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		String ext = getExt(file.getName());
		
		
		if(!ExcelEnum.EXCEL_2003_OR_BEFORE.getSuffix().equals(ext) && !ExcelEnum.EXCEL_2007_OR_LATTER.getSuffix().equals(ext)){
			throw new RuntimeException("不支持该"+ext+"格式的Excel文件后缀格式!");
		}
	}
	
	private static void checkExcel(String path){
		checkExcel(new File(path));
	}
	
	public static Workbook getWorkbook(File file){
		Workbook book = null;
		
		checkExcel(file);
		
		try {
			book = create(file);
		} catch (EncryptedDocumentException e) {
			e.printStackTrace();
		} catch (InvalidFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return book;
	}
	
	public static Workbook getWorkbook(String path){
		return getWorkbook(new File(path));
	}
	
	public static void main(String[] args)throws Exception {
		File f = new File("/Users/summer/soft/cloud.xlsx");
		Workbook book = WorkbookFactory.getWorkbook(f);
		System.out.println(book.getSheetAt(0).getRow(0).getCell(0).getStringCellValue());
	}
}
