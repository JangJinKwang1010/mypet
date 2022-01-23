<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My pet</title>
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
		display:inline-block;
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
		float:center;
		border:none;
		width:20%;
		height:50px;
		border-radius:10px;
		font-weight:bold;
		margin-top:20px;
		background-color:rgb(72,115,210);
		color:white;
		font-size:20px;
		margin-bottom:25px;		
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
</style>
<script>
$(document).ready(function() {
	
	var mapContainer = document.getElementById('map');
	var mapOptions = {

		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};
	var map = new kakao.maps.Map(mapContainer, mapOptions);		
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	geocoder.addressSearch("${addr}", function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">내 주소 위치</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});	
	

});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<section class="section">
		<div class="back">
			<p class="title">내 근처의 펫<span>A pet near me</span></p>
			<div id="map"></div>
			<div class="list">
				<div onclick="location.href='near_contents.do' ">
					<p class="p_title"><span class="logo">강아지</span>[비숑]<span class="text">저희 비숑 잠시 맡겨주실 분을 구합니다</span></p>
					<p class="option">
						<span><img src="images/paw.png">경력 1년이상</span>
						<span><img src="images/calendar.png">2021/11/13 - 2021/12/31</span>
					</p>
					<p class="user">qoolp79(장**)</p>
				</div>
				<div>
					<p class="p_title"><span class="logo">강아지</span>[비숑]<span class="text">저희 비숑 잠시 맡겨주실 분을 구합니다</span></p>
					<p class="option">
						<span><img src="images/paw.png">경력 1년이상</span>
						<span><img src="images/calendar.png">2021/11/13 - 2021/12/31</span>
					</p>
					<p class="user">qoolp79(장**)</p>
				</div>
				<div>
					<p class="p_title"><span class="logo">강아지</span>[비숑]<span class="text">저희 비숑 잠시 맡겨주실 분을 구합니다</span></p>
					<p class="option">
						<span><img src="images/paw.png">경력 1년이상</span>
						<span><img src="images/calendar.png">2021/11/13 - 2021/12/31</span>
					</p>
					<p class="user">qoolp79(장**)</p>
				</div>
				<div>
					<p class="p_title"><span class="logo">강아지</span>[비숑]<span class="text">저희 비숑 잠시 맡겨주실 분을 구합니다</span></p>
					<p class="option">
						<span><img src="images/paw.png">경력 1년이상</span>
						<span><img src="images/calendar.png">2021/11/13 - 2021/12/31</span>
					</p>
					<p class="user">qoolp79(장**)</p>
				</div>
				<button onclick="location.href='near_writing.do'" class="writing_button">글쓰기</button>
			</div>
		</div>
	</section>
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>