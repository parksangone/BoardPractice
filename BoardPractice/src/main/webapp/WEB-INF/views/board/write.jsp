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
	
	// 글작성 
	function writeDo() {
 		 $.ajax({
	            type : 'post',
	            url : 'writeDo',
	            data : $("#writeForm").serialize(),
	            dataType : 'json',
	            success : function(data){
	                alert(data.result);
	                window.location.replace("list");
	            },
	        });
	}
	
</script>
</head>
<body>
	게시판 글 작성 <br>
	
	<form id="writeForm">
		<input type="hidden" id="id" name="id" size="10"><br>
		<input type="hidden" id="name" name="name" size="10"><br>
		제목 : <input type="text" name="title" size="50"><br>
		내용 : <textarea style="resize:none" name="content" cols="50" rows="10"></textarea><br>
	</form>
	 <input type="button" onclick="writeDo()" value="글작성">
</body>
</html>