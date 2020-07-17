<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%	
	// 세션에서 사용자 정보 받아오기
	String id = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
	String loginStatus = (String) session.getAttribute("loginStatus");
%>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
	$(document).ready(function () {
		// 비로그인시 글작성 a태그(글작성) 삭제
		if("<%=loginStatus%>" != "YES") {
			$('.member').remove();
		}
		
	});

	// 검색 
	function searchDo() {
		var search = $('#search').val();
		window.location.replace("/board/list?curPage="+ 1 + "&search="+search);
	}
	
	// 페이지로 이동 (페이지)
	function goPage(curPage) {
		var search = '${pageInfo.search}';
		window.location.replace("/board/list?curPage="+curPage + "&search=" + search);
	}
</script>
</head>
<body>
	게시판 리스트 <br>
	<a href="/">HOME</a> <br>
	
	<table id="listTable" border="1"> 
		<tr>
			<td>번호</td>
			<td>작성자(ID)</td>
			<td>작성자</td>
			<td>제목</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr style="cursor:pointer" onclick="location.href='view?bId=${dto.bId}'">
				<td>${dto.bId}</td>
				<td>${dto.id}</td>
				<td>${dto.name}</td>
				<td>${dto.title}</td>
				<td>${dto.bDate}</td>
				<td>${dto.hit}</td>
			</tr>
		</c:forEach>
	</table>
	<br>	
	<div id="paging">
		<a style="text-decoration:none" href="#" onclick="goPage(${pageInfo.curPage - 1})">◀</a> 
		<c:forEach var="page" begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1">
			<a style="text-decoration:none" href="#" onclick="goPage(${page})">${page}</a>
		</c:forEach>
		<a style="text-decoration:none" href="#" onclick="goPage(${pageInfo.curPage + 1})">▶</a>
	</div>
	<br>
	
	<form id="searchForm">		
		<input type="text" id="search" name="search" placeholder="검색어를 입력해주세요." >
		<input type="button" onclick="searchDo()" value="검색">
	</form>
	
	<br>
	<a class="member" href="/board/write">글작성</a><br>
</body>
</html>