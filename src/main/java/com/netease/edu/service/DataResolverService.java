package com.netease.edu.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Service;

import com.netease.edu.util.WorkbookFactory;

@Service
@SuppressWarnings("unused")
public class DataResolverService {

	public List<ArrayList<Object>> readData(String path){
		return readData(new File(path));
	}
	
	private Sheet getSheet(File file,int index){
		Workbook book = WorkbookFactory.getWorkbook(file);
		return book.getSheetAt(index);
	}
	
	private Sheet getSheet(String path,int index){
		return getSheet(new File(path),index);
	}
	
	public List<String> readTitle(String path){
		return readTitle(new File(path));
	}
	
	public List<String> readTitle(File file){
		List<String> titles = new ArrayList<String>();
		Row row = getSheet(file,0).getRow(0);
		Iterator<Cell> cells = row.cellIterator();
		while(cells.hasNext()){
			titles.add(cells.next().getStringCellValue());
		}
		return titles;
	}
	
	public List<ArrayList<Object>> readData(File file){
		List<ArrayList<Object>> cells = new ArrayList<ArrayList<Object>>();
		Sheet sheet = getSheet(file,0);
		
		int rows = sheet.getLastRowNum();
		int cols = readTitle(file).size();
		
		for(int i = 1; i < rows; ++i){
			Row row = sheet.getRow(i);
			ArrayList<Object> cell = new ArrayList<Object>();
			for(int j = 0; j < cols; ++j){
				Cell col = row.getCell(j);
				switch(col.getCellType()){
					case Cell.CELL_TYPE_NUMERIC:
						cell.add(col.getNumericCellValue());
						break;
					case Cell.CELL_TYPE_STRING:
						cell.add(col.getStringCellValue());
						break;
					case Cell.CELL_TYPE_BLANK:
						 cell.add(col.getStringCellValue());
						break;
					case Cell.CELL_TYPE_BOOLEAN:
						cell.add(col.getBooleanCellValue());
						break;
					default:
						break;
				}
			}
			cells.add(cell);
		}
		
		return cells;
	}
}
