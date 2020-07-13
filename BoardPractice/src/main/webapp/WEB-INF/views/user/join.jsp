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
	
	// 중복체크 후 확인 된 아이디를 저장할 변수
	var checkedId = "";
	
	// 아이디 중복체크 
	function idCheck() {
		
		$.ajax({
            type : 'post',
            url : 'idCheck',
            data : {
            	id : $('#id').val()
            },
            dataType : 'json',
            success : function(data){
                alert(data.message);
                if(data.result == "success") {
                	checkedId = $('#id').val()
                }
            },
        });
	}
	
	//폼체크
	function formCheck() {
	 
		if($('#id').val() == "") {
			alert("아이디를 입력해주세요.");
			$('#id').focus();
			return;
		} else if($('#id').val() != checkedId || checkedId == "") {
			alert("아이디 중복체크를 해주세요");
			$('#id').focus();
			return;
		} else if($('#password').val() == "") {
			alert("비밀번호를 입력해주세요.");
			$('#password').focus();
			return;
		} else if($('#password').val().length < 4) {
			alert("비밀번호는 4글자 이상이어야 합니다.");
			$('#password').focus();
			return;
		} else if($('#password').val() != $('#passwordCheck').val()) {
			alert("비밀번호를 확인해주세요.");
			$('#password').focus();
			return;
		} else if($('#name').val() == "") {
			alert("이름을 입력해주세요.");
			$('#name').focus();
			return;
		} 
	
		joinDo();
	}
	
	// 회원가입
	function joinDo() {
 		 $.ajax({
	            type : 'post',
	            url : 'joinDo',
	            data : $("#joinForm").serialize(),
	            dataType : 'json',
	            success : function(data){
	                alert(data.result);
	                window.location.replace("/user/login");
	            },
	        });
	}
	
</script>
</head>
<body>
	로그인 화면
	<form id="joinForm">
		ID : <input type="text" name="id" id="id" size="10">
		<input type="button" name="e" id="e" value="중복체크" onclick="idCheck()"><br>
		password : <input type="password" name="password" id="password" size="10"><br>
		password check : <input type="password" name="passwordCheck" id="passwordCheck"  size="10"><br>
		name : <input type="text" name="name" id="name" size="10"><br>
	</form>
	 <input type="button" onclick="formCheck()" value="회원가입">
	<a href="/">HOME</a>
</body>
</html>