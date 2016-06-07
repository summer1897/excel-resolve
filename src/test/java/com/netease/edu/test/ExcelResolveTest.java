package com.netease.edu.test;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

public class ExcelResolveTest {
	
	private static List<String> getTitle(Sheet sheet){
		List<String> list = new ArrayList<String>();
		
		int cols = sheet.getColumns();
		for(int col = 0; col < cols; ++col){
			Cell cell = sheet.getCell(0,col);
			list.add(cell.getContents());
		}
		
		return list;
	}

	public static void main(String[] args){
		String path = "/Users/summer/soft/cloud.xls";
		try{
			InputStream in = new FileInputStream(path);
			Workbook book = Workbook.getWorkbook(in);
			System.out.println(book);
			Sheet sheet = book.getSheet(0);
			
			List<String> title = getTitle(sheet);
			
			int rows = sheet.getRows();
			int cols = sheet.getColumns();
			
			for(int row = 0; row < rows; ++row){
				System.out.println("***************"+row+"******************");
				
				for(int col = 0; col < cols; ++col){
					Cell cell = sheet.getCell(row, col);
					
					System.out.println(title.get(row) +": "+cell.getContents());
				}
				
				System.out.println("*********************************");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
