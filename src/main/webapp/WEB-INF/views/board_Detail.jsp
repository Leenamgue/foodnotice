<%@page import="com.java.board.bean.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.dn_1 .dn_2 {
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
</head>
<body>

<%
	BoardBean user = (BoardBean) request.getAttribute("info");
%>
<!--게시판 내용 있을 때  -->
<% if(user.getNo() != null){ %>
<div class="dn_1" >
<form id="login-form" method="POST">
	<h1>제목  <input  name="title" value = "<%=user.getTitle() %>"> </h1> 
	    작성자 <%=request.getAttribute("id")%>
	<hr>
	<h2>내용</h2>
	 <input  name="content" value = "<%=user.getContent() %>">
	<hr>
	<h2>내용2</h2>
	 <input  name="subcontent" value = "<%=user.getSubcontent() %>">
	<hr>
	<h2>첨부파일</h2>
	<input type="file" enctype="multipart/form-data" multiple="multiple"><br><hr>
	<button type="submit" formaction="/update" name="no" value="<%=user.getNo()%>">작성</button>
	<button type="submit" formaction="/delete" name="no" value="<%=user.getNo()%>">삭제</button><br>
</form>
</div>
<% } %>
<!--게시판 내용 없을 때 -->
<% if(user.getNo() == null){ %>
<div class="dn_1">
<form id="login-form" method="POST">
<h1>제목  <input  name="title" > </h1> 
    작성자 <%=request.getAttribute("id")%>
<hr>
<h2>내용</h2>
 <input  name="content" value = "">
<hr>
<h2>내용2</h2>
 <input  name="subcontent" value = "">
<hr>
<button type="submit" formaction="/insert" name="no" >작성</button>
<button type="submit" formaction="/board" name="no" >뒤로</button><br>
</form>
</div>
<% } %>


</body>
</html>