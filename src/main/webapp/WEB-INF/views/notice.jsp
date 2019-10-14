<%@page import="com.java.board.bean.ListBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
        <script>
        function write(){
		
		location.href = "/n_write";
		}
		</script>
		<style>
		html, body {
			margin: 0;
			padding: 0;
		}
		
		section {
		text-align: center;
		
		}
		
		table {
			width: 100%;
			border:1px solid black;
			border-collapse:collapse;
			border-spacing:0;
			
		}
		th {
			border:1px solid black;
		}
		
		
		table thead td {
			background-color: #FFFF00;
			border:1px solid black;
		}
		
		#edit {
			float: right;
		}
		
		
		tbody tr {
			background-color: #f7f7ff;
			border:1px solid black;
		}
		tbody tr td {
	    border: 1px solid black;
	    text-align: center;
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
</head>

<body>
    <div class="all">
         <div class="bkimg">         	
                <div class="mg10">
                     <div class="nav1">
                           <ul class="ul1">
                                <img style="float: left;width: 70px;" src="/resources/img/go1.gif">	                        	
                                <li onclick="location.href='/'" style="cursor: pointer; font-size:2em;font-family: 'Hi Melody', cursive; ">야먹자</li>
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
        		<div class="button">  
           	    	<a href="/n_write" style="float:right"><button type="button">글 작성</button></a>
        		</div>
        	</div>             		
                              
        </div>
        <div class="mg10">
        	
            <div class="resultbox">
                <div class="">
             <table>
                <thead>
                    <tr>
                        <th style="width: 10%;">번  호</th>
                        <th>제  목</th>
                        <th>내  용</th>
                        <th>작성자</th>                         
                    </tr>
                </thead>
                <tbody>
                    <%
                    List<ListBean> list = (List<ListBean>) request.getAttribute("list");
                    System.out.println(list);
						if(list == null){
							System.out.println("없다");
						} else {
							for(int i = 0; i < list.size(); i++){
					%>
								
								<tr onclick="location.href='/notice/?req=<%=list.get(i).getNo()%>'">							     
							      <td style="text-align: center;"><%=list.get(i).getNo()%></td>
							      <td><%=list.get(i).getTitle() %></td>
							      <td><%=list.get(i).getTxt() %></td>
							      <th>작성자</th>  							      
							    </tr>
							    
					<%
							}
						}
					%>
					</tbody>
            	</table>          	
                	
                	
                	                
                </div>
                
            </div>    
        </div>
    </div>				
</body>
</html>


