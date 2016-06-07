package com.netease.edu.test;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;

public class ExcelResolvePOITest {
	
	private static List<String> getTitle(HSSFSheet sheet){
		List<String> title = new ArrayList<String>();
		
		HSSFRow firstRow = sheet.getRow(0);
		Iterator<Cell> cols = firstRow.cellIterator();
		while(cols.hasNext()){
			title.add(cols.next().getStringCellValue());
		}
		
		return title;
	}

	public static void main(String[] args)throws Exception {
		String path = "/Users/summer/soft/cloud.xlsx";
		InputStream is = new FileInputStream(path);
		HSSFWorkbook book = new HSSFWorkbook(is);
		
		long start = System.currentTimeMillis();
		HSSFSheet sheet = book.getSheetAt(0);
		List<String> title = getTitle(sheet);
		/*System.out.println(title.size());
		for(String t : title)
			System.out.println(t);*/
		
		int rows = sheet.getLastRowNum();
		for(int i = 1; i < rows; ++i){
			System.out.println("++++++++++++++++++++"+i+"++++++++++++++++++++++");
			HSSFRow row = sheet.getRow(i);
			int cols = title.size();
			for(int j = 0; j < cols; ++j){
				HSSFCell cell = row.getCell(j);
				int type = cell.getCellType();
				switch(type){
					case HSSFCell.CELL_TYPE_NUMERIC:
						System.out.println(title.get(j) + ": " + cell.getNumericCellValue());
						break;
					case HSSFCell.CELL_TYPE_STRING:
						System.out.println(title.get(j) + ": " + cell.getStringCellValue());
						break;
					case HSSFCell.CELL_TYPE_BLANK:
						System.out.println(title.get(j) + ": " + cell.getStringCellValue());
						break;
					default:
						break;
				}
			}
			System.out.println("++++++++++++++++++++"+i+"++++++++++++++++++++++");
		}
		
		
		book.close();
		long end = System.currentTimeMillis();
		System.out.println((end - start) / 1000 + "s");
	}
}
