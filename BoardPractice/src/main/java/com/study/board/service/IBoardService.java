package com.study.board.service;

import java.util.List;

import com.study.board.dto.BoardDto;
import com.study.board.pageInfo.PageInfo;

public interface IBoardService {
	public List<BoardDto> selectList(PageInfo pageInfo);
	public BoardDto selectView(BoardDto boardDto, String userId);
	public int insertBoard(BoardDto boardDto);
	public int deleteBoard(BoardDto boardDto);
	public int modifyBoard(BoardDto boardDto);
}
