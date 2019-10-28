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
	
		// 글작성자만 수정,삭제
		if("<%=id%>" != "${view.id}") {
			$('.oneself').remove();
		}
	});
	// 게시글 삭제
	function deleteDo(bId) {
		
		 $.ajax({
	            type : 'post',
	            url : 'deleteDo',
	            data : {
	            	bId : bId
	            },
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
	게시판 상세보기	<br>
	
	<a href="/">HOME</a>
	<a href="list">게시판</a><br>
	
	<table width="500" border="1">
		<tr>
			<td>${view.bId}</td>
			<td>${view.id}</td>
			<td>${view.name}</td>
			<td>${view.title}</td>
			<td>${view.content}</td>
		</tr>
	</table>
	
	<a class="oneself" href="modify?bId=${view.bId}">수정하기</a>
	<a class="oneself" style="cursor:pointer" onclick="deleteDo(${view.bId})">삭제하기</a>
</body>
</html>