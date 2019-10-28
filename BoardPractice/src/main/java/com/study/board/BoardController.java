package com.study.board;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.board.dao.BoardDao;
import com.study.board.dto.BoardDto;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 게시글 리스트 화면
	@RequestMapping("/list")
	public String board(Model model) {
		// 게시글 전체 목록 가져오기
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
				
		model.addAttribute("list", boardDao.selectList());
				
		return "board/list";
	}
	
	// 게시글 상세보기 화면
	@RequestMapping("/view")
	public String boardView(Model model, BoardDto boardDto) {
				
		// 해당 게시글 가져오기
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		
		model.addAttribute("view", boardDao.selectView(boardDto.getbId()));
					
		return "board/view";
	}
	
	// 게시글 작성 화면
	@RequestMapping("/write")
	public String boardWrite(Model model) {
		
		return "board/write";
	}
	
	// 게시글 수정 화면
	@RequestMapping("/modify")
	public String boardModify(Model model, BoardDto boardDto) {
		
		// 해당 게시글 가져오기
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
				
		model.addAttribute("view", boardDao.selectView(boardDto.getbId()));
						
		return "board/modify";
	}
	
	// 게시글 리스트 가져오기
	@RequestMapping("/selectList")
	public @ResponseBody Map<String, Object> selectList(Model model) {
		
		// 게시글 전체 목록 가져오기
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		
		Map<String, Object> map = new HashMap<>(); 
		map.put("list", boardDao.selectList());
		
		return map;
	}
	
	// 해당 게시글 가져오기
	@RequestMapping("/selectDo")
	public @ResponseBody Map<String, Object> selectDo(Model model, BoardDto boardDto) {

		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		
		Map<String, Object> map = new HashMap<>(); 
		map.put("view",boardDao.selectView(boardDto.getbId()));
			
		return map;
	}
	
	// 게시글 작성
	@RequestMapping("/writeDo")
	@ResponseBody
	public Map<String, Object> writeDo(Model model, BoardDto boardDto) {

		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		
		int result = boardDao.insertBoard(boardDto);
		String message = "";
		
		if(result == 1) {
			message = "성공";
		} else {
			message = "실패";
		}
		
		Map<String, Object> map = new HashMap<>(); 
		map.put("result", message);
			
		return map;
	}
	
	// 게시글 삭제
	@RequestMapping("/deleteDo")
	public @ResponseBody Map<String, Object> deleteDo(Model model, BoardDto boardDto) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			
		int result = boardDao.deleteBoard(boardDto);
		String message = "";
		
		if(result == 1) {
			message = "성공";
		} else {
			message = "실패";
		}
		
		Map<String, Object> map = new HashMap<>(); 
		map.put("result", message);
			
		return map;
	}
	
	// 게시글 수정
	@RequestMapping("/modifyDo")
	@ResponseBody
	public Map<String, Object> modifyDo(Model model, BoardDto boardDto) {

		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			
		int result = boardDao.modifyBoard(boardDto);
		String message = "";
			
		if(result == 1) {
			message = "성공";
		} else {
			message = "실패";
		}
			
		Map<String, Object> map = new HashMap<>(); 
		map.put("result", message);
				
		return map;
	}
}
