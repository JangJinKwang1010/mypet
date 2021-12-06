<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My pet</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3e8fa4fd6bbcee08087de03a2b386eba"></script>
<script src="http://localhost:9000/mypet/js/jquery-3.6.0.min.js"></script>
<style>
	section { text-align:center; }
	#map {
		border:1px solid lightgray;
		width:1200px; height:500px;
		display:inline-block; 		
		margin-top:50px;
	}
	
	.list {
		width:1200px;
		display:inline-block;
		margin-top:30px;
	}
	.list>div {
		display:inline-block;
		width:100%; height:150px;
		border:1px solid lightgray;
		border-radius:5px;
		margin-bottom:10px;
	}
	.title {
		text-align:left;
		font-size:20px;
		font-weight:bold;
		margin:10px;
	}
	.title>.logo {
		font-size:13px;
		font-weight:normal;
		background-color:gray;
		color:white;
		border-radius:4px;
		margin:5px;
		padding:3px;
	}
	.title>.text {
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
	.user { text-align:left; margin:15px 30px; font-size:15px; }
</style>
<script>
$(document).ready(function() {
	var mapContainer = document.getElementById('map');
	var mapOptions = {

		center: new kakao.maps.LatLng(${vo.latitude}, ${vo.longitude}),
		level: 3
	};
	var map = new kakao.maps.Map(mapContainer, mapOptions);		
	

});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<section>
		<div id="map"></div>
		<div class="list">
			<div>
				<p class="title"><span class="logo">강아지</span>[강아지] 비숑<span class="text">저희 비숑 잠시 맡겨주실 분을 구합니다</span></p>
				<p class="option">
					<span><img src="http://14.47.84.2:9000/mypet/images/paw.png">경력 1년이상</span>
					<span><img src="http://14.47.84.2:9000/mypet/images/calendar.png">2021/11/13 - 2021/12/31</span>
				</p>
				<p class="user">qoolp79(장**)</p>
			</div>
			<div>
				<p class="title"><span class="logo">강아지</span>[강아지] 비숑<span class="text">저희 비숑 잠시 맡겨주실 분을 구합니다</span></p>
				<p class="option">
					<span><img src="http://14.47.84.2:9000/mypet/images/paw.png">경력 1년이상</span>
					<span><img src="http://14.47.84.2:9000/mypet/images/calendar.png">2021/11/13 - 2021/12/31</span>
				</p>
				<p class="user">qoolp79(장**)</p>
			</div>
			<div>
				<p class="title"><span class="logo">강아지</span>[강아지] 비숑<span class="text">저희 비숑 잠시 맡겨주실 분을 구합니다</span></p>
				<p class="option">
					<span><img src="http://14.47.84.2:9000/mypet/images/paw.png">경력 1년이상</span>
					<span><img src="http://14.47.84.2:9000/mypet/images/calendar.png">2021/11/13 - 2021/12/31</span>
				</p>
				<p class="user">qoolp79(장**)</p>
			</div>
			<div>
				<p class="title"><span class="logo">강아지</span>[강아지] 비숑<span class="text">저희 비숑 잠시 맡겨주실 분을 구합니다</span></p>
				<p class="option">
					<span><img src="http://14.47.84.2:9000/mypet/images/paw.png">경력 1년이상</span>
					<span><img src="http://14.47.84.2:9000/mypet/images/calendar.png">2021/11/13 - 2021/12/31</span>
				</p>
				<p class="user">qoolp79(장**)</p>
			</div>
		</div>
	</section>
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>