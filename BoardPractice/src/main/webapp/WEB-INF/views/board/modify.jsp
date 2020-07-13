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

		modifyDo();
	}

	//글수정 
	function modifyDo() {
		 $.ajax({
            type : 'post',
            url : 'modifyDo',
            data : $("#modifyForm").serialize(),
            dataType : 'json',
            success : function(data){
                alert(data.result);
                window.location.replace("/board/view?bId=${view.bId}");
            },
        });
	}	
</script>
</head>
<body>
	게시판 수정 
	<a href="/">HOME</a>
	<a href="/board/list">게시판</a><br><br><br>
	<form id="modifyForm">
		<input type="hidden" name="bId" value="${view.bId}">
		<input type="text" id="title" name="title" size="50" value="${view.title}"  placeholder="제목을 입력해주세요."><br><br>
		<textarea style="resize:none" id="content" name="content" cols="50" rows="10"  placeholder="내용을 입력해주세요.">${view.content}</textarea><br>
	</form>
	 <input type="button" onclick="formCheck()" value="수정">
</body>
</html>