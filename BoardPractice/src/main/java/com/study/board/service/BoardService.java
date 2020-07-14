package com.study.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.board.dao.BoardDao;
import com.study.board.dto.BoardDto;
import com.study.board.pageInfo.PageInfo;

@Service
public class BoardService implements IBoardService {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 게시글 리스트 가져오기
	@Override
	public List<BoardDto> selectList(PageInfo pageInfo) {
		// 게시글 해당 페이지 글 목록 가져오기
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		pageInfo.setTotalCount(boardDao.selectPageCount());
		
		return boardDao.selectList(pageInfo);
	}
	
	// 해당 게시글 상세보기
	@Override
	public BoardDto selectView(BoardDto boardDto, String userId) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		
		// boardDto에 해당 게시글 정보 저장
		boardDto = boardDao.selectView(boardDto.getbId());
		
		// 조회수 증가 (작성자가 아닐 때만 증가)
		if(userId==null || !userId.equals(boardDto.getId())) {
			boardDao.upHit(boardDto);
			boardDto.setHit(boardDto.getHit() + 1);
		}
		
		return boardDto;
	}
	
	// 글작성
	@Override
	public int insertBoard(BoardDto boardDto) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		
		int result = boardDao.insertBoard(boardDto);
		
		return result;
	}

	// 글삭제
	@Override
	public int deleteBoard(BoardDto boardDto) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		int result = boardDao.deleteBoard(boardDto);
		
		return result;
	}
	
	// 글수정
	@Override
	public int modifyBoard(BoardDto boardDto) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		int result = boardDao.modifyBoard(boardDto);
		
		return result;
	}
}
