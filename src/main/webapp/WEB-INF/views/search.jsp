<%@page import="com.java.board.BoardBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>야 먹자</title>
<link href="https://fonts.googleapis.com/css?family=Hi+Melody&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if('<%=request.getAttribute("id")%>' != 'null'){

		$("#login").addClass("dn");
		
		
	}else{
		$("#logout").addClass("dn");
		$("#lgnin").addClass("dn");
		$("#wirte").addClass("dn");
	}
});


</script>
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
            height: 400px;
            border: 1px solid black;
            background-color: aliceblue;
        }
        .box1{
            height: 100%;
            width: 470px; 
            background-color: aquamarine;
        }
        .box2{
            
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
    
        
        
        @media only screen and (max-width:780px){
          .imgbox img {
            width: 400px;
            height: 400px;
          }
          .content {
            height: 600px;
            
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
</head>

<body>
    <div class="all">
         <div class="bkimg">
                <div class="pd">
                     <div class="nav1">
                           <ul class="ul1">
                                <img style="float: left;width: 70px;" src="/resources/img/go1.gif">	                        	
                                <li style="cursor: pointer; font-size:2em;font-family: 'Hi Melody', cursive; ">야먹자</li>
                           </ul>                                                
                           <ul class="ul3" style="float: right ">                          	
                                <form action="/logout">
                                    <li id="lgnin" style=""><%=request.getAttribute("id")%>님 </li>
                                    <button type="submit" id="logout" style="margin-top: 5px;border:1px;cursor: pointer;">로그아웃</button>
                                </form>	 	 
                                <form action="/login">
                                    <button type="submit" class="" id="login" style="margin-top: 5px;border:1px;cursor: pointer;">로그인</button>
                                </form>                          	
                           </ul>
                           <div style="clear: both"></div>
                      </div>  
                      <h2 style="color: white; text-align: center"></h2>
                </div>
        </div>
        <div class="content">              		
                <div class="mg10">
                      <input class="search" type="text" name="id" id="id" placeholder="뭐 먹을까" >
                      <button style="margin-left: -5.5px;height:66.5px;border:1px;">찾기</button>
                </div>              
        </div>
        <div class="pd">
            <div class="resultbox">
                <div class="box1"></div>      
            </div>
        </div>
    </div>				
</body>
</html>