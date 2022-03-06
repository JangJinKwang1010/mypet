<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
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
	
	
	
    .wrap .info { z-index:-999; width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 13px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {}
    .info .link {color: #5085BB;}
    
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
	
	geocoder.addressSearch("${addr}", function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
 

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});
	
	var main = document.createElement('div');
	main.style.cssText = 'position: absolute; left: 0;bottom: 40px;  width:290px; height:120px; ';
	var content = document.createElement('div');		
	content.style.cssText = 'border:1px solid lightgray; overflow: auto; width:290px; height:120px; background-color:white; margin-left: -144px;text-align: left; font-size: 12px;font-family: "Malgun Gothic", dotum, "돋움", sans-serif;line-height: 1.5;';
	main.appendChild(content);
	var overlay;
	
	<c:forEach var = "vo"  items="${mlist}" varStatus="status">			
		
		geocoder.addressSearch("${vo.addr}", function(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		       var coords  = new kakao.maps.LatLng(result[0].y, result[0].x);
		       <c:if test="${vo.category eq '고양이'}">
		       		var imageSrc = "images/cat_maker.png"; // 마커이미지의 주소입니다    		    	   
		      </c:if>
		      <c:if test="${vo.category eq '강아지'}">
		    		var imageSrc = "images/dog_maker.png"; // 마커이미지의 주소입니다     		    	   
	     	  </c:if>		
		       var imageSize = new kakao.maps.Size(64, 69); // 마커이미지의 크기입니다
		       var imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		         
			   // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			   var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		       
			   var content2 = document.createElement('div');			   
			   content2.innerHTML =  '<div class="info">' + 
	            '        <div class="title" id="title">' + 
	            '            ${vo.addr}' +
	            '        </div>' + 
	            '        <div class="body">' + 
	            '            <div class="img">' +
	            '                <img src="upload/${vo.vo.psfile}" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="desc">' + 
	            '                <div class="ellipsis">[${vo.vo.category}] ${vo.vo.kind}</div>' + 
	            '                <div class="jibun ellipsis">${vo.vo.pname}(${vo.vo.pgender}) ${vo.vo.pbirth}년</div>' + 
	            '                <div><a href="near_contents.do?nid=${vo.nid}" target="_blank" class="link">게시물 보기</a></div>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>';  
	            content.appendChild(content2);
	            
	            var content3 = document.createElement('div');
	            content3.style.cssText = 'position: absolute; left: 0;bottom: -10px; width: 22px;height: 12px;background: url("https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png")';
	            main.appendChild(content3);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords,
	            image: markerImage // 마커이미지 설정 
	        });
	        
		     // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	        kakao.maps.event.addListener(marker, 'click', function() {
	        	overlay  = new kakao.maps.CustomOverlay({
			            content: main,
			            map: map,
			            position: marker.getPosition()       
			        });
	            overlay.setMap(map);	            
	        }); 		   
		     
		    var close = document.createElement('div');
		    close.style.cssText = ' position: absolute; bottom:120px; left:-144px;width: 290px;height: 25px; background-color:rgb(230,230,230); border:1px solid lightgray; '
	        var closeBtn = document.createElement('div');
	        closeBtn.style.cssText = ' margin:5px; float:right;color: #888;width: 17px;height: 17px;background: url("https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png")';
	        // 닫기 이벤트 추가
	        closeBtn.onclick = function() {
	            overlay.setMap(null);
	        };
	        close.appendChild(closeBtn)
	        content.insertBefore(close, content.firstChild);
		       	     
		    
		     
		  }	 

		    
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
			<div class="list">
			<c:if test="${!empty list}">
				<c:forEach var = "vo"  items="${list}"  begin="0" end="2">
					<div onclick="location.href='near_contents.do?nid=${vo.nid}' " class="more_div1">
						<p class="p_title" ><span class="logo">강아지</span>[${vo.kind }]<span class="text">${vo.title }</span></p>
						<p class="option">
							<span><img src="images/paw.png">경력 ${vo.work }</span>
							<span><img src="images/calendar.png">${vo.startdate } ~ ${vo.enddate }</span>
						</p>
						<p class="user">${vo.id }(${vo.name }**)</p>
					</div>
				</c:forEach>
				<c:forEach var = "vo"  items="${list}" begin="3" end="${fn:length(list)-1}" >		
					<div onclick="location.href='near_contents.do?nid=${vo.nid}' " class="more_div2">
						<p class="p_title" ><span class="logo">강아지</span>[${vo.kind }]<span class="text">${vo.title }</span></p>
						<p class="option">
							<span><img src="images/paw.png">경력 ${vo.work }</span>
							<span><img src="images/calendar.png">${vo.startdate } ~ ${vo.enddate }</span>
						</p>
						<p class="user">${vo.id }(${vo.name }**)</p>
					</div>
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