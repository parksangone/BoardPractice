package com.study.board.pageInfo;

import lombok.Data;

@Data
public class PageInfo {
	private int totalCount; 		// 총 게시물 갯수
	private int listCount = 10;		// 한 페이지당 보여줄 게시물 갯수
	private int totalPage;			// 총 페이지
	private int curPage=1;			// 현재 페이지
	private int pageCount = 5;			// 하단에 보여줄 페이지 리스트의 갯수
	private int startPage;			// 시작 페이지
	private int endPage;			// 끝 페이지
	
	private String search; // 검색내용
	
	// 총 게시물 저장 및 변수 세팅
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		// 총 페이지 수
		totalPage = totalCount / listCount;
		if (totalCount % listCount > 0) {
			totalPage++;
		}
		
		// 현재 페이지
		if(curPage>totalPage) {
			curPage=totalPage;
		}
		if(curPage < 1) {
			curPage=1;
		}
		
		// 시작 페이지
		startPage = ((curPage-1)/pageCount) * pageCount + 1;
		
		// 끝 페이지
		endPage = startPage + pageCount -1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}
}
