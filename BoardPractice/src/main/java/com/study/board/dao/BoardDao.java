package com.study.board.dao;

import java.util.List;

import com.study.board.dto.BoardDto;
import com.study.board.pageInfo.PageInfo;

public interface BoardDao {
	public List<BoardDto> selectList(PageInfo pageInfo);
	public BoardDto selectView(int bId);
	public int insertBoard(BoardDto boardDto);
	public int deleteBoard(BoardDto boardDto);
	public int modifyBoard(BoardDto boardDto);
	public int upHit(BoardDto boardDto);
	public int selectPageCount(PageInfo pageInfo);
	public List<BoardDto> searhBoard(PageInfo pageInfo);
} 
