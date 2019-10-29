package com.study.board.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardDto {
	private int bId;
	private String id;
	private String name;
	private String title;
	private String content;
	private Timestamp bDate;
	private int hit;
	
	public BoardDto() {
		super();
	}
	
	public BoardDto(int bId, String id, String name, String title, String content, Timestamp bDate, int hit) {
		super();
		this.bId = bId;
		this.id = id;
		this.name = name;
		this.title = title;
		this.content = content;
		this.bDate = bDate;
		this.hit = hit;
	}
	
	/* 롬복 왜 안될까... 
	 * bId의 b를 대문자로 바꾸면 에러남*/
	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public Timestamp getbDate() {
		return bDate;
	}

	public void setbDate(Timestamp bDate) {
		this.bDate = bDate;
	}

	
}
