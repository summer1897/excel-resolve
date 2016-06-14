package com.netease.entity;

import java.util.ArrayList;
import java.util.List;

public class ClassVo {

	private Title title;
	private Object classInfo;
	
	public static List<ClassVo> convert(List<Title> title,List<Object> classes){
		List<ClassVo> classVos = new ArrayList<ClassVo>();
		
		//System.out.println("not equal: "+(title.size() != classes.size()));
		if(null == title || null == classes)
			return classVos;
		
		for(int i = 0; i < title.size(); ++i){
			ClassVo cv = new ClassVo(title.get(i),classes.get(i));
			classVos.add(cv);
		}
		return classVos;
	}
	
	public ClassVo(Title title,Object classInfo){
		this.title = title;
		this.classInfo = classInfo;
	}
	
	public void setTitle(Title title){
		this.title = title;
	}
	public Title getTitle(){
		return this.title;
	}
	public void setClassInfo(Object classInfo){
		this.classInfo = classInfo;
	}
	public Object getClassInfo(){
		return this.classInfo;
	}
}
