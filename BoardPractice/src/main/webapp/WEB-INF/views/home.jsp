<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<%	
	// 세션에서 사용자 정보 받아오기
	String id = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
	String loginStatus = (String) session.getAttribute("loginStatus");
%>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
	$(document).ready(function () {
		// 로그인상태일때 
		if("<%=loginStatus%>" == "YES") {
			$('.nonMember').remove();
		} else { // 비로그인 일 때
			$('.member').remove();
		}
	});
	
	// 로그아웃
	function logOut() {
		 $.ajax({
	            type : 'post',
	            url : 'user/logOutDo',
	            dataType : 'json',
	            success : function(data){
	                window.location.reload();
	            },
	        });
		location.reload();
	}
</script>
</head>
<body>
<a class="member" style="cursor:pointer" onclick="logOut()">로그아웃</a> 
<a class="nonMember" href="user/login">로그인</a> 
<a class="nonMember" href="user/join">회원가입</a><br>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href="board/list">게시판</a><br>
<a href="test">테스트</a> 
</body>
</html>
