<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('.login').on('click',function(e){
		e.preventDefault();
		var id = $('#id').val();
		var password = $('#password').val();
		if(id == ""){
			alert("아이디를 입력해주세요");
			 $('#id').focus();
			 return;
		}else if(password == ""){
			alert("비밀번호를 입력해주세요");
			$('#password').focus();
			return;
		}else {
			document.form1.method="post";
			document.form1.action="/";
			document.form1.submit();
		}
	});
});
</script>
 <style type="text/css">
        body,html  { margin:0; padding: 0; }

        body{
            font-family: "맑은 고딕";
            font-size: 0.75em;
            color: #333;
        }
        #login-form{
            width:300px;
            margin:10% auto;
            border: 1px solid black;
            border-radius: 5px;
            padding: 15px;
            
             
        }
        #login-form input, #login-form label{
             display:block;
        }
        #login-form label{
             margin-top: 10px;
        }

        #login-form input{
             margin-top: 20px;
        }
        #login-form input[type='image']{
             margin: 10px auto;
        }
        input {
            width: 100%;
            height: 40px;
            border-radius: 10px;
            
            border: 1px solid #d1d3e2; 

	       appearance:none; /* 인풋내 그림자 제거 */ 
        }
        button {
            background: red;
            border: 1px solid white !important;
            height: 45px; 
            width:100%;
            border-radius: 10px;
            margin-top: 20px;
        }
        
    </style>
</head>
<body>


<form id="login-form" name="form1" method="POST">
	<c:if test="${msg == 'failure'}">
	<div style="text-align: center;color: red;bottom: -200px;position: relative;">아이디와 비밀번호가 맞지않습니다.</div>
	</c:if>
	<h2 style="text-align: center">로그인</h2>
	<input type="text" name="id" id="id" placeholder="아이디">
	<input type="password" name="password" id="password" placeholder="비밀번호">
	<button  class="login" style="margin-top: 50px;">로그인</button>
	<button formaction="/signIn" >회원가입</button>
</form>


</body>
</html>