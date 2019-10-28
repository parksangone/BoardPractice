<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
	//글수정 
	function modifyDo() {
		 $.ajax({
            type : 'post',
            url : 'modifyDo',
            data : $("#modifyForm").serialize(),
            dataType : 'json',
            success : function(data){
                alert(data.result);
                window.location.replace("view?bId=${view.bId}");
            },
        });
	}	
</script>
</head>
<body>
	게시판 수정
	<a href="list">게시판</a><br>
	<form id="modifyForm">
		<input type="hidden" name="bId" value="${view.bId}">
		제목 : <input type="text" name="title" size="50" value="${view.title}"><br>
		내용 : <textarea style="resize:none" name="content" cols="50" rows="10">${view.content}</textarea><br>
	</form>
	 <input type="button" onclick="modifyDo()" value="수정">
</body>
</html>