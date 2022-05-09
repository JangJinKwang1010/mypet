<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
    <c:set var="today" value="<%=new java.util.Date()%>" />	
    <c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3e8fa4fd6bbcee08087de03a2b386eba&libraries=services"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<style>
	.section { text-align:center; }
	#map {
		border:1px solid lightgray;
		width:1200px; height:500px;
		display:inline-block; 		
		margin-top:50px;
	}	
	.back>.title {
		margin-top:110px;
		float:left;
		font-weight:bold;
		font-size:30px;
		margin-left:100px;
	}
	.title>span {
		margin-left:20px;
		color:gray;
		font-weight:normal;
		font-size:20px;
	}
	.list {
		width:1200px;
		display:inline-block;
		margin-top:30px;
		background-color:white;
	}
	.list>div {
		width:100%; height:150px;
		border:1px solid lightgray;
		border-radius:5px;
		margin-bottom:10px;
	}
	.p_title {
		text-align:left;
		font-size:20px;
		font-weight:bold;
		margin:10px;
	}
	.p_title>.logo {
		font-size:13px;
		font-weight:normal;
		background-color:gray;
		color:white;
		border-radius:4px;
		margin:5px;
		padding:3px;
	}
	.p_title>.text {
		font-size:17px;
		font-weight:normal;
		margin-left:10px;
	}
	.option { text-align:left; margin:15px 40px; font-size:14px; }
	.option img {
		width:10px; height:10px;
		opacity:0.5; margin-right:5px; 
	}
	.option>span {
		margin-right:20px;
	}
	.writing_button {
		float:right;
		border:none;
		width:20%;
		height:50px;
		border-radius:10px;
		font-weight:bold;
		margin-top:180px;
		margin-right:50px;
		background-color:rgb(72,115,210);
		color:white;
		font-size:20px;
	}
	.search_box{
		float:right;
		margin-top:30px;
		width:600px;
		height:50px;
	}
	.search_button {
		border:none;
		width:100px;
		height:35px;
		border-radius:10px;
		font-weight:bold;
		background-color:rgb(214,155,187);
		color:white;
		font-size:20px;
	}
	.search_box>.search_form{
		display:inline-block;
		width:50%;
		height:30px;
	}
	.search_box>.select_form{
		display:inline-block;
		width:120px;
		height:35px;
	}
	.user { text-align:left; margin:15px 30px; font-size:15px; }
	
	@media (min-width : 600px ) {
		.back { background-color:white; width:1300px; display:inline-block; text-align:center; }
		.section { background-color:rgb(200,171,217); }
		.list { margin-bottom:50px; }
	}
	
	@media (max-width : 500px) {
		#map { width:90%; }
		.list { width:90%; margin-bottom:50px; }
		.back>.title {  margin-left:20px; }
		.p_title { font-size:18px; }
		.p_title> .text { font-size:15px; }
		.option { font-size:12px; margin:15px; }
	}
	
    
    .btn_style {
		width:65px;
		background-color:white;
		border:2px solid lightgray;
		border-radius:50px;
		padding:10px;
		color:lightgray;
		font-size:15px;
		font-weight:bold;
		text-align:center;
		margin:20px 0;
		cursor:pointer;
	}
	.btn_style:hover {
		border:2px solid #4fa9de;
		color:#4fa9de;
	}
	
	.more_div1 { display:inline-block; }
	.more_div2 { display:none; }
	
	.end {
		border:1px solid rgb(116,104,128);
		display:inline-block;
		position:relative;
		bottom:80px; right:30px;
		float:right;
		background-color:rgb(116,104,128);
		color:white;
		border-radius:5px;
		width:80px; height:30px;
		padding-top:3px;
	}
	
	.info { margin-right:2px; margin-bottom:-2px; overflow-y:scroll; position:relative; display:inline-block; width:270px; height:105px; text-align: left; font-size: 12px; font-family: 'Malgun Gothic', dotum, '돋움'}
 	 
    .info .title {padding: 5px; height: 25px;background: #eee; border-bottom: 1px solid #ddd; width:100%; font-weight: bold;}
 	.info .body {position: relative; overflow: hidden;}
    .info .desc {position: relative; margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info .link {color: #5085BB;}
    
    .mclose {
    	position:absolute; 
    	cursor:pointer;
    	left:235px;
    	bottom:78px;
    	font-size:18px;
    	color:gray;
    }
    
</style>
<script>
$(document).ready(function() {
	
	var flag = false;
	
	var mapContainer = document.getElementById('map');
	var mapOptions = {

		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 1
	};
	var map = new kakao.maps.Map(mapContainer, mapOptions);		
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
	geocoder.addressSearch("${addr}", function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {   		    	 

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x); 
	        
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	        
	    	// 장소 검색 객체를 생성합니다
	    	var ps = new kakao.maps.services.Places(); 

	    	// 키워드로 장소를 검색합니다
	    	ps.keywordSearch('동물병원', placesSearchCB, {
	    		location : coords
	    	}); 

	    	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	    	function placesSearchCB (data, status, pagination) {
	    	    if (status === kakao.maps.services.Status.OK) {

	    	        for (var i=0; i<data.length; i++) {
	    	            displayMarker(data[i]);    
	    	        }       

	    	    } 
	    	}

	    	// 지도에 마커를 표시하는 함수입니다
	    	function displayMarker(place) {
	    		
	    		var imageSrc = "images/h-icon.png";
	    		 var imageSize = new kakao.maps.Size(30, 35); // 마커이미지의 크기입니다
	    	     var imageOption = {offset: new kakao.maps.Point(15, 39)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	    	       
	    	   // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	    	   var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	    	    
	    	    // 마커를 생성하고 지도에 표시합니다
	    	    var marker = new kakao.maps.Marker({
	    	        map: map,
	    	        position: new kakao.maps.LatLng(place.y, place.x),
	    	        image:markerImage
	    	    });

	    	    // 마커에 클릭이벤트를 등록합니다
	    	    kakao.maps.event.addListener(marker, 'click', function() {
	    	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	    	        var html = '<div style="width:250px; padding:5px; font-size:12px; text-align:center; " class="hdiv">';
	    	        html += '<p style="font-weight:bold; font-size:14px;">' +place.place_name + '</p>';	    	        
	    	        if (place.phone == "") {
	    	        	html += '<p style="position:absolute; bottom:23px; left:230px; font-size:18px; color:gray; cursor:pointer" class="close">X</p>';
	    	        } else {	    	        	
		    	        html += '<p style="position:absolute; bottom:40px; left:230px; font-size:18px; color:gray; cursor:pointer" class="close">X</p>';
	    	        }
	    	        html += '<p>' + place.address_name + '</p>';
	    	        html += '<p>' + place .phone +'</div>';
	    	        infowindow.setContent(html);
	    	        infowindow.open(map, marker);
	    	        
	    	        $(".close").click(function() {
	    	        	infowindow.close();
	    	        });
	    	        
	    	    });
	    	}

	       
	    } 
	});                                                                                                     
	
	
	<c:forEach var = "vo"  items="${alist}" varStatus="status">	

		geocoder.addressSearch("${vo.addr}", function(result, status) {
			
			var html = "<div class='info'>";		
			
			
			<c:forEach var = "mvo"  items="${mlist}" varStatus="status">	
			
				<c:forEach var = "mmvo"  items="${mvo}" varStatus="status">	
				
				
			 <c:if test="${mmvo.addr eq vo.addr}">			 			 
							
				
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
	
			       var coords  = new kakao.maps.LatLng(result[0].y, result[0].x);
			       		       
			       <c:if test="${mmvo.category eq '고양이'}">
			       		var imageSrc = "images/cat_maker.png"; // 마커이미지의 주소입니다    		    	   
			      </c:if>
			      <c:if test="${mmvo.category eq '강아지'}">
			    		var imageSrc = "images/dog_maker.png"; // 마커이미지의 주소입니다     		    	   
		     	  </c:if>		
			       var imageSize = new kakao.maps.Size(64, 69); // 마커이미지의 크기입니다
			       var imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			         
				   // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				   var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
			       		       
				   var html2 = '<div class="title" id="title">${vo.addr}</div>'+' <p class="mclose">X</p><div class="body">' 
				   + '<div class="img">' 
				   + '<img src="upload/${mmvo.vo.psfile}" width="73" height="70">' 
				   + '</div><div class="desc"><div class="ellipsis">[${mmvo.vo.category}] ${mmvo.vo.kind}</div>' 
				   + '<div class="jibun ellipsis">${mmvo.vo.pname}(${mmvo.vo.pgender}) ${mmvo.vo.pbirth}년</div>' 
				   + '<div><a href="near_contents.do?nid=${mmvo.nid}" target="_blank" class="link">게시물 보기</a></div>' 
				   + '</div></div>';  
				   
		            html += html2;
		            
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords,
		            image: markerImage // 마커이미지 설정 
		        });
		        
		        kakao.maps.event.addListener(marker, 'click', function() {	        	
		        	 infowindow.setContent(html);
		    	     infowindow.open(map, marker);	    
		    	     
		    	     $(".mclose").click(function() {
		    	        	infowindow.close();
		    	        });
		    	     
		        }); 		
		        
		     
		 	}	 
		      </c:if>
		     </c:forEach>
		     </c:forEach>
		        
	}); 	
		
	</c:forEach>
	
	
	$('#more_btn').hover(function() {
		 	$("#more_img").attr("src", "images/btn.png");
		}, function(){
			$("#more_img").attr("src", "images/btn2.png");
	});
	
	$("#more_btn").click(function() {
		$(".more_div2").css("display","inline-block");
		
		if (flag == true) {
			alert("마지막 페이지입니다");
		}
		
		flag = true;
	
	});
	
	$(".end_div").click(function() {
		alert("이미 마감된 게시글입니다");	
	});
	
	
});

</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<section class="section">
		<div class="back">
			<p class="title">내 근처의 펫<span>A pet near me</span></p>
			<button onclick = "location.href='near_writing.do'" class="writing_button">글쓰기</button>
			<div id="map"></div>
			<div class="search_box">
				<select class="form-select select_form">
				<option>제목</option>
				<option>품종</option>
				<option>제목+내용</option>
				</select>
				<input type="text" class="form-control search_form">
				<button class="search_button">검색</button>
			</div>
			<div class="list">
			<c:if test="${!empty list}">
				<c:forEach var = "vo"  items="${list}"  begin="0" end="2">
					<c:if test = "${ date > vo.enddate }">
					<div class="more_div1 end_div" >
						<p class="p_title" ><span class="logo">${vo.category }</span>[${vo.kind }]<span class="text">${vo.title }</span></p>
						<p class="option">
							<span><img src="images/paw.png">경력 ${vo.work }</span>
							<span><img src="images/calendar.png">${vo.startdate } ~ ${vo.enddate }</span>
						</p>
						<p class="user">${vo.id }(${vo.name }**)</p>					
						<div class="end">마감</div>
					</div>
					</c:if>
					<c:if test = "${ date <= vo.enddate }">
					<div onclick="location.href='near_contents.do?nid=${vo.nid}' " class="more_div1">
						<p class="p_title" ><span class="logo">${vo.category }</span>[${vo.kind }]<span class="text">${vo.title }</span></p>
						<p class="option">
							<span><img src="images/paw.png">경력 ${vo.work }</span>
							<span><img src="images/calendar.png">${vo.startdate } ~ ${vo.enddate }</span>
						</p>
						<p class="user">${vo.id }(${vo.name }**)</p>			
					</div>
					</c:if>
				</c:forEach>
				<c:forEach var = "vo"  items="${list}" begin="3" end="${fn:length(list)-1}" >		
					<c:if test = "${ date > vo.enddate }">
					<div class="more_div1 end_div" >
						<p class="p_title" ><span class="logo">${vo.category }</span>[${vo.kind }]<span class="text">${vo.title }</span></p>
						<p class="option">
							<span><img src="images/paw.png">경력 ${vo.work }</span>
							<span><img src="images/calendar.png">${vo.startdate } ~ ${vo.enddate }</span>
						</p>
						<p class="user">${vo.id }(${vo.name }**)</p>					
						<div class="end">마감</div>
					</div>
					</c:if>
					<c:if test = "${ date <= vo.enddate }">
					<div onclick="location.href='near_contents.do?nid=${vo.nid}' " class="more_div1">
						<p class="p_title" ><span class="logo">${vo.category }</span>[${vo.kind }]<span class="text">${vo.title }</span></p>
						<p class="option">
							<span><img src="images/paw.png">경력 ${vo.work }</span>
							<span><img src="images/calendar.png">${vo.startdate } ~ ${vo.enddate }</span>
						</p>
						<p class="user">${vo.id }(${vo.name }**)</p>			
					</div>
					</c:if>
				</c:forEach>
			</c:if>
			</div>
			<div>
				<button type="button" class="btn_style" id="more_btn">more
					<img src="images/btn2.png" id="more_img">
				</button>
			</div>
		</div>
	</section>
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>