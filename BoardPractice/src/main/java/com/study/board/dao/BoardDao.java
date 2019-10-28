package com.study.board.dao;

import java.util.List;

import com.study.board.dto.BoardDto;

public interface BoardDao {
	public List<BoardDto> selectList();
	public BoardDto selectView(int bId);
	public int insertBoard(BoardDto boardDto);
	public int deleteBoard(BoardDto boardDto);
	public int modifyBoard(BoardDto boardDto);
} 
