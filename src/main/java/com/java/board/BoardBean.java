package com.java.board;

public class BoardBean {
	private String no;
	private String title;
	private String content;
	private String name;
	
	public BoardBean() {
	}
	public BoardBean(String title, String content, String name,String no) {
		super();
		this.title = title;
		this.content = content;
		this.name = name;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	
	
}