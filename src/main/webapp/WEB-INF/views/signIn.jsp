<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
<style>
 .dn{
  display:none;
 }
 body,html  { margin:0; padding: 0; }

        body{
            font-family: "맑은 고딕";
            font-size: 0.75em;
            color: #333;
        }
        #login-form{
            width:600px;
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
        .btn {
            background: red;
            border: 1px solid white !important; 
        }
        .signInLeft {
        	width:100%;
        }
        .signInLeft input {
        	width:70%
        }
        .signInLeft button {
        	width:27%;
        	float: right;
   			margin-top: -45px;
        }
        
        input {
            
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
<script>
$(document).ready(function(){
	var id_check = false;
	var pass_check = false;
	$('#cancel').on('click' , function(e){
		e.preventDefault();
		document.form1.method = "GET";
		document.form1.action = "/";
		document.form1.submit();
	});
	//회원가입 예외 처리 - 아이디 중복검사 비밀번호 재확인
	$('#signIn').off().on('click' , function(e){
		e.preventDefault();
		console.log($('#id').val());
		if(!id_check){
			alert("아이디를 중복 확인해주세요");
			return;
		}
		
		if($('#id').val() == ""){
			alert("아이디를 입력해 주세요!!");
			$('#id').focus();
			return;
		}else if($('#password').val() == ""){
			alert("비밀번호를 입력해주세요!!");
			$('#password').focus();
			return;
		}else if($('#passwordCheck').val() == ""){
			alert("비밀번호를 재입력해주세요!!");
			$('#passwordCheck').focus();
			return;
		}
		if(!pass_check) {
	        alert("비밀번호가 일치 하지 않습니다.");
	        return;
	    }
		document.form1.method = "POST";
		document.form1.action = "/signIn/check";
		document.form1.submit(); 
	});
	//아이디 중복검사 체크
	$('#id_check').on('click', function(e){
		e.preventDefault();
		if($('#id').val() == ""){
			alert("아이디를 입력해 주세요!!");
			return;
		}
		
		var data = { id : $('#id').val() }
		$.ajax({ 
			url: "/id_check", 
			data: data, 
			method:"POST", 
			dataType: "json", 
			success : function(data){
				var str = JSON.parse(data);
				 $( '#id_true' ).addClass( 'dn' );
				 $( '#id_false' ).addClass( 'dn' );
				if(!str){
				 $( '#id_true' ).removeClass( 'dn' );
				 id_check = true;
				}else if (str){
				 $('#id_false').removeClass( 'dn' );
				 id_check = false;
				}	
			}
		});
	});
	/* 	 keyup paste */
	//비밀번호1, 비밀번호2 일치 여부
	$("#passwordCheck, #password").on("change", function() {
	    $('#pass_false').addClass( 'dn' );
	    $('#pass_true').addClass( 'dn' );
		var password = $('#password').val(); 
	    var passwordcheck = $('#passwordCheck').val(); 	
	    if(password == passwordcheck) {
	    	$('#pass_true').removeClass( 'dn' );
	    	pass_check = true;
	        return;
	    }else {
	    	$('#pass_false').removeClass( 'dn' );
	    	pass_check = false;
	    }
	});	
});


</script>

</head>
<body>
<div class="signInForm">
<form id="login-form" name="form1">
	<div class="signInMark">아이디 : </div>
		<div class="signInLeft">
		<input id="id" type="text" name="id" placeholder="아이디">
		<button id="id_check">중복검사</button>
	 </div>	
	<div style="color:red" class="dn" id="id_false" >아이디를 사용중이거나 탈퇴한 아이디 입니다.</div>
	<div style="color:green" class="dn" id="id_true" >사용 가능한 아이디합니다.</div>
	<div class="signInMark">비밀번호 : </div>
		<div class="signInLeft">
		<input id="password" type="password"name="password">
	</div>
	<div class="signInMark">비밀번호 확인:</div>
	<div class="signInLeft">
		<input id="passwordCheck" type="password"name="passwordcheck">
	</div>
	<div style="color:green" class="dn" id="pass_true" >비밀번호가 일치 합니다</div>
	<div style="color:red" class="dn" id="pass_false" >비밀번호가 다릅니다. 다시 입력해주세요</div>	
	<div class="signInMark">이메일 : </div>	<div class="signInLeft">
		<input id="email" type="email"name="email">
	</div>
	<div class="signInMark">핸드폰번호 :</div>
	<div class="signInLeft"><input id="phone" type="text"name="phone"></div>
	<button id="signIn" name="signIn" >회원가입</button>
	<button id="cancel" name="cancel">취소</button>
</form>
</div>
</body>
</html>