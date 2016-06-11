package com.netease.entity;

public class Title {

	public static final String DEFAULT_WIDTH = "5%";
	private String content;
	private String width;
	
	public Title(String content){
		this(content,DEFAULT_WIDTH);
	}
	public Title(String content,String width){
		this.content = content;
		this.width = width;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWidth() {
		return width;
	}
	public void setWidth(String width) {
		this.width = width;
	}
}
