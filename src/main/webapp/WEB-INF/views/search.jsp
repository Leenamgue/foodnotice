<%@page import="com.java.board.bean.UserInfo"%>
<%@page import="com.java.board.bean.BoardBean"%>
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
	console.log("Ba");
	<% UserInfo ui = (UserInfo) session.getAttribute("logIn");%>
	console.log(<%=(UserInfo) session.getAttribute("logIn")%>);
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
</head>

<body>
    <div class="all">
         <div class="bkimg">
                <div class="pd">
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
                      <input class="search" type="text" name="id" id="id" placeholder="뭐 먹을까" >
                      <form style="position: relative;left: 90%;top: -60px;width: 50px;">
                        		<button formaction="/search" style="margin-left: -5.5px;height:60px;border:1px">찾기</button>
                      </form>
                </div>              
        </div>
        <div class="pd">
            <div class="resultbox">
                <div class="box1">
                	<%
			 List<BoardBean> list = (List<BoardBean>) request.getAttribute("list");
		
			if(list != null){
			int size =list.size();
			for(int i = size ; i > 0 ; i--){
		%>	
		
					<div style="width:100%; height:140px;background-color: aliceblue;border-bottom: 1px solid;">
			            <div style="width:140px; height:140px;background-color: yellow;display:inline-block;" >
			            	<img style="float: left;width: 100px;padding: 20px 20px;" src="http://blogfiles.naver.net/MjAxOTA4MjBfOTUg/MDAxNTY2MjkyNDcwOTQx.iRBliszCTLEBhWnEzbh31Ra_rowHnY2IrlETZok4fXAg.D7p21fdaor9dgCKrKhdH3HgQSrwzR_yBrXa3VU_enqcg.JPEG.eul0926/24.jpg">
			            </div>
						<div style="width:313px; height:140px;background-color: yellow;display:inline-block;float:right;">
			                <div style="padding-top: 5px;margin-bottom: 5px;font-size: 24px;"><%=list.get(i-1).getNo() %>. <a href="/detail?no=<%=i %>" name="no" value="<%=list.get(i-1).getNo() %>"><%=list.get(i-1).getTitle() %></div>
			                <div style="margin-top: 15px;"><%=list.get(i-1).getContent() %></div>
			                <div style="padding-top: 5px;margin-bottom: 5px"><%=list.get(i-1).getSubcontent() %></div>
			                <div style="padding-top: 5px;margin-bottom: 5px"><%=list.get(i-1).getName() %></div>
			           </div>
			        </div>
			
		<%
			 }
			
			}
		%>                 	
                	
                	
                	                
                </div>
                
                <div class="box2">
                	<div id="map" style="width:100%;height:650px;"></div>
					
					<em>클릭한 위치에 마커가 표시됩니다!</em>
					    
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2944b746cea7eab7b6bd8e9f70d754c7"></script>
					<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
					    mapOption = { 
					        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };
					
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					
					// 지도를 클릭했을때 클릭한 위치에 마커를 추가하도록 지도에 클릭이벤트를 등록합니다
					kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
					    // 클릭한 위치에 마커를 표시합니다 
					    addMarker(mouseEvent.latLng);             
					});
					
					// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
					var markers = [];
					
					// 마커 하나를 지도위에 표시합니다 
					addMarker(new kakao.maps.LatLng(33.450701, 126.570667));
					
					// 마커를 생성하고 지도위에 표시하는 함수입니다
					function addMarker(position) {
					    
					    // 마커를 생성합니다
					    var marker = new kakao.maps.Marker({
					        position: position
					    });
					
					    // 마커가 지도 위에 표시되도록 설정합니다
					    marker.setMap(map);
					    
					    // 생성된 마커를 배열에 추가합니다
					    markers.push(marker);
					}
					
					// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
					function setMarkers(map) {
					    for (var i = 0; i < markers.length; i++) {
					        markers[i].setMap(map);
					    }            
					}
					
					// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
					function showMarkers() {
					    setMarkers(map)    
					}
					
					// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
					function hideMarkers() {
					    setMarkers(null);    
					}
					</script>
                </div>
                <p>
					    <button onclick="hideMarkers()">마커 감추기</button>
					    <button onclick="showMarkers()">마커 보이기</button>
					</p>        
            </div>
        </div>
    </div>				
</body>
</html>