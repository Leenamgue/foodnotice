<%@page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@page import="com.java.board.bean.ListBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판글쓰기</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">

</style>
<style>
        .dn{
            display: none;
        }
        body,html{
                margin: 0;
                padding: 0;
            }
        .all {
            width: 100%;
            height: 850px;
           

        }
        .bkimg{
            height: 150px;
            background-image: url(pp1.jpg);
            background-size: 100% 350px;
        }
        
        .mg10{
        	padding: 15px 20px;
        	margin:0 20%;
        }
        
        .pd {
        	padding: 15px 20px;
        }
        
        .nav1 {
            width: 100%;
            height: 50px;
            box-sizing: border-box;
            display: block;
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
        .nav2{
        
        }
        
        
        .nav1 ul {
            list-style: none;
            margin: 0;
            padding: 0;
            vertical-align: baseline;
            color: black;
        }
        li {
            float: left;
            padding: 5px 10px;
        }
        .content {
            height: 90px;
            width: 100%;
            background-color: white;            
        }
        
        .resultbox {
            width: 100%;
            height: 650px;
            border: 1px solid black;
            background-color: aliceblue;
        }
        .box1{
            height: 100%;
            width: 470px; 
            background-color: aquamarine;
            display: inline-block;
            overflow-y: auto;
        }
        .box2{
        	height:100%;
        	width: calc( 100% - 470px  );
        	background-color: yellow;
        	display: inline-block;
        	float:right;
            
        }
        li{
        	list-style: none;
        	margin:0px;
        	padding:0px;
        }

        .main {
            height: 200px;
            background-color: azure;
        }


        input {
                width: 100%;
                height:30px;
                font-size:20px;

        }
        form::after{
          clear: both;
        }
        a {
          text-decoration: none;
          color: black;
        }
        span{
        	overflow:hidden;
        }
    
        
        
        @media only screen and (max-width:780px){
          .imgbox img {
            width: 400px;
            height: 400px;
          }
          
          .all {
            height: 750px;
          }
        }        
        .search {
        	background: url(https://s3-ap-northeast-1.amazonaws.com/dcicons/new/images/web/common/search@2x.png) no-repeat left;
        	height:60px; 
        	width:80%;
        	padding-left: 80px;
        	border: 0px; 
     		
        }
        @media only screen and (max-width:1024px){
            .non {
                display: none;
            }
            .bkimg h2{
                display: none;
            }

        }
</style>
<script>
	$(document).ready(function(){
		$("form").submit(function(e){
			e.preventDefault();
			var tf = document.getElementsByClassName("textForm");
			for(var i=0; i<tf.length; i++){
				if(tf[i].value ==""){
					alert("글을 입력하시오");
					return;
				} 
			}
			$("form")[0].submit();
		});
	});

	function back() {
		location.href = "/";
	}
	
	var dt = new DataTransfer();
	function formList() {
		console.log(dt);
	}
	
	}
	
	
</script>
</head>
<body >
	<div class="all">
		<div class="bkimg">
			<div class="pd">			
				<form id="login-form" action="/insert" method="post" enctype="multipart/form-data">
					<div class="marginbt">
						<label class="width10">제 목</label> 
						<input name="title" type="text"	 placeholder="글 제목을 입력하세요." />
					</div>
					<div class="marginbt">
						<label class="width10">내 용</label>
						<textarea name="txt" id="txt" rows="5" "
							placeholder="글 내용을 입력하세요." required="required" style="width:100%"></textarea>
					</div>
					
					<div class="line">
						<input type="submit" name="add" class="add" value="저장">
					</div>
				</form>
			</div>
		</div>	
	</div>
</body>
</html>