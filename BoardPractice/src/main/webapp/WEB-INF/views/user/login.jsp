<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	
	// 폼체크
	function formCheck() {
		 
		if($('#id').val() == "") {
			alert("아이디를 입력해주세요.");
			$('#id').focus();
			return;
		} else if($('#password').val() == "") {
			alert("비밀번호를 입력해주세요.");
			$('#password').focus();
			return;
		}
		
		loginDo();
	}
	
	// 로그인
	function loginDo() {
 		 $.ajax({
	            type : 'post',
	            url : 'loginDo',
	            data : $("#loginForm").serialize(),
	            dataType : 'json',
	            success : function(data){
	                alert(data.message);
	                if(data.result == "success") {
	                	 window.location.replace("/");
	                }
	            },
	        });
	}
	
</script>
</head>
<body>
	로그인 화면
	<form id="loginForm">
		ID : <input type="text" id="id" name="id" size="10"><br>
		password : <input type="password" id="password" name="password" size="10"><br>
	</form>
	 <input type="button" onclick="formCheck()" value="로그인">
	
</body>
</html>