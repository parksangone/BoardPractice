<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%	
	//세션에서 사용자 정보 받아오기
	String id = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
	String loginStatus = (String) session.getAttribute("loginStatus");
%>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	
	$(document).ready(function () {
		// 사용자 아이디, 이름 세팅
		$('#id').val('<%=id%>');
		$('#name').val('<%=name%>');
	});
	
	//폼체크
	function formCheck() {
	 
		if($('#title').val() == "") {
			alert("제목을 입력해주세요.");
			$('#title').focus();
			return;
		} else if($('#content').val() == "") {
			alert("내용을 입력해주세요");
			$('#content').focus();
			return;
		}
	
		writeDo();
	}
	
	
	// 글작성 
	function writeDo() {
 		 $.ajax({
	            type : 'post',
	            url : 'writeDo',
	            data : $("#writeForm").serialize(),
	            dataType : 'json',
	            success : function(data){
	                alert(data.result);
	                window.location.replace("/board/list");
	            },
	        });
	}
</script>
</head>
<body>
	게시판 글 작성 <br>
	<a href="/">HOME</a>
	<a href="/board/list">게시판</a><br>
	<form id="writeForm">
		<input type="hidden" id="id" name="id"><br>
		<input type="hidden" id="name" name="name"><br>
		<input type="text" id="title" name="title" size="50" placeholder="제목을 입력해주세요."><br><br>
		<textarea style="resize:none" id="content" name="content" cols="50" rows="10" placeholder="내용을 입력해주세요."></textarea><br>
	</form>
	 <input type="button" onclick="formCheck()" value="글작성">
</body>
</html>