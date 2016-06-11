package com.netease.edu.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Service;

import com.netease.edu.util.WorkbookFactory;
import com.netease.entity.Title;

@Service
@SuppressWarnings("unused")
public class DataResolverService {
	
	private static final String DEFAULT_WIDTH = "15%";

	public List<ArrayList<Object>> readData(String path){
		return readData(new File(path));
	}
	
	private Sheet getSheet(File file,int index){
		
		if(!file.exists() || file.isDirectory()){
			try {
				throw new RuntimeException("没有找到带操作数据文件: "+file.getCanonicalPath());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		if(index < 0)
			throw new RuntimeException("查找的Excel表索引不能为负数: "+ index);
		
		Workbook book = WorkbookFactory.getWorkbook(file);
		
		int numberOfSheets = book.getNumberOfSheets();
		if(index >= numberOfSheets)
			throw new RuntimeException("查找的Excel表索引超过Excel文件的最大表数目: numberOfSheets="+numberOfSheets+",index="+index);
		return book.getSheetAt(index);
	}
	
	private Sheet getSheet(String path,int index){
		return getSheet(new File(path),index);
	}
	
	public List<Title> readTitle(String path,int cols){
		return readTitle(new File(path),cols);
	}
	
	public List<Title> readTitle(File file,int cols){
		List<Title> titles = new ArrayList<Title>();
		titles.add(new Title("序号","5%"));
		Row row = getSheet(file,0).getRow(0);
		for(int col = 0; col < cols; ++col){
			Cell cell = row.getCell(col);
			titles.add(new Title(cell.getStringCellValue(),DEFAULT_WIDTH));
		}
		return titles;
	}
	
	public List<Title> readTitle(String path){
		return readTitle(new File(path));
	}
	
	public List<Title> readTitle(File file){
		return readTitle(file,getSheet(file,0).getRow(0).getLastCellNum());
	}
	
	public List<ArrayList<Object>> readData(File file){
		Sheet sheet = getSheet(file,0);
		return readData(file,sheet.getLastRowNum(),readTitle(file).size());
	}
	
	public List<ArrayList<Object>> readData(String path,final int rows,int cols){
		return readData(new File(path),rows,cols);
	}
	
	private String clearZero(String str){
		int index = -1;
		index = str.lastIndexOf(".");
		if(-1 != index)
			return str.substring(0, index);
		return "";
	}
	
	private Object getValueFromCellType(Cell cell){
		if(null == cell)
			return null;
		switch(cell.getCellType()){
			case Cell.CELL_TYPE_NUMERIC:
				return clearZero(cell.getNumericCellValue()+"");
			case Cell.CELL_TYPE_STRING:
				return cell.getStringCellValue();
			case Cell.CELL_TYPE_BLANK:
				 return cell.getStringCellValue();
			case Cell.CELL_TYPE_BOOLEAN:
				return cell.getBooleanCellValue();
			default:
				return null;
		}
	}
	
	public List<ArrayList<Object>> readData(File file,final int rows,final int cols){
		List<ArrayList<Object>> cells = new ArrayList<ArrayList<Object>>();
		Sheet sheet = getSheet(file,0);
		
		for(int i = 1; i < rows; ++i){
			Row row = sheet.getRow(i);
			ArrayList<Object> cell = new ArrayList<Object>();
			cell.add(new Integer(i));
			for(int j = 0; j < cols; ++j){
				Cell col = row.getCell(j);
				cell.add(getValueFromCellType(col));
			}
			cells.add(cell);
		}
		
		return cells;
	}
	
	public List<Object> readDataByRow(String path,int rowNumber){
		return readDataByRow(new File(path),rowNumber);
	}
	
	public List<Object> readDataByRow(File file,int rowNumber){
		return readDataByRow(file,rowNumber,readTitle(file).size());
	}
	
	/**
	 * 显示指定行号的课程信息
	 * @param file
	 * @param rowNumber 行号
	 * @param cols 显示的列数
	 * @return
	 */
	public List<Object> readDataByRow(File file,int rowNumber,int cols){
		List<Object> cell = new ArrayList<Object>();
		Sheet sheet = getSheet(file,0);
		Row row = sheet.getRow(rowNumber);
		System.out.println("col: "+cols);
		cell.add(new Integer(rowNumber));
		for(int j = 0; j < cols; ++j){
			Cell col = row.getCell(j);
			System.out.println(j+"--"+col);
			cell.add(getValueFromCellType(col));
		}
		
		return cell;
	}
	
	public List<Object> readDataByRow(String path,int rowNumber,int cols){
		return readDataByRow(new File(path),rowNumber,cols);
	}
	
	public List<ArrayList<Object>> readDataByClassId(String path,String classId,int cols){
		return readDataByClassId(new File(path),classId,cols);
	}
	
	/**
	 * 根据课程id获取所有课程信息
	 * @param file
	 * @param classId
	 * @param cols 显示的列数
	 * @return
	 */
	public List<ArrayList<Object>> readDataByClassId(File file,String classId,int cols){
		List<ArrayList<Object>> cells = new ArrayList<ArrayList<Object>>();
		Sheet sheet = getSheet(file,0);
		int rows = sheet.getLastRowNum();
		for(int i = 1; i < rows; ++i){
			Row row = sheet.getRow(i);
			String id = clearZero(row.getCell(0).getNumericCellValue() + "");
			if(classId.equals(id)){
				ArrayList<Object> cell = new ArrayList<Object>();
				cell.add(new Integer(i));
				for(int j = 0; j < cols; ++j){
					Cell col = row.getCell(j);
					cell.add(getValueFromCellType(col));
				}
				cells.add(cell);
			}
		}
		
		return cells;
	}
	
}
