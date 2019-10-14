<%@page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@page import="com.java.board.bean.ListBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
</style>
<style>
	
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
	<%
		List<ListBean> list = (List<ListBean>)request.getAttribute("list");		
	%>
		$("#no")[0].value = "<%=list.get(0).getNo()%>"
		$("#title")[0].value = "<%=list.get(0).getTitle()%>"
		$("#txt")[0].value = "<%=list.get(0).getTxt()%>"
		
		$(".update").on("click",function(){
			var no = document.getElementsByName("no")[0].value;
			var title = document.getElementsByName("title")[0].value;
			var txt = document.getElementsByName("txt")[0].value;
			console.log("REQ :",no,title,txt);
			$.ajax({
			    url: "/n_update", 
			    data: { no: no, title : title, txt : txt}, 
			    type: "POST",  
			    dataType: "json"
			})
			.done(function(json) {
			    location.href="/notice";
			})
			.always(function() {
			    alert("요청이 완료되었습니다!");
			    location.href="/notice";

			});
		});
		
		$(".delete").on("click", function(){
			var no = document.getElementsByName("no")[0].value;
			var title = document.getElementsByName("title")[0].value;
			var txt = document.getElementsByName("txt")[0].value;
			$.ajax({
			    url: "/n_delete", 
			    data: { no: no, title : title, txt : txt}, 
			    type: "POST",
			})
			.done(function(json) {
			    location.href="/notice";
			})
			.always(function() {
			    alert("요청이 완료되었습니다!");
			    location.href="/notice";
			});
		});
	});

	
	
	
</script>
</head>
<body>
	<div class="all">
		<div id="login-form">
			<div class="pd">
				<div >
					<label >번  호 : </label> 
					<input type="text" name="no" id="no" class="no" >
				</div>
				
				
							
				<form id="" action="/" method="post" enctype="multipart/form-data">
					
					<div class="marginbt">
						<label>제 목</label> 
						<input name="title" id="title" type="text"  required="required" placeholder="글 제목을 입력하세요." />
					</div>
					<div>
						<label class="width10">내 용</label>
						<textarea name="txt" id="txt" rows="5" 
							placeholder="글 내용을 입력하세요." required="required" style="width: 100%;"></textarea>
					</div>
					<button id="update" name="update" class="update">수 정</button>
					<button id="delete" name="delete" class="delete">삭 제</button>
					
				</form>
				
			</div>
		</div>
	</div>
</body>
</html>