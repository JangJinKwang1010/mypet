<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet</title>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<style>
	section {
		text-align:center;
		height:300px;
	}
	section button {
		margin-top:150px;
		background-color:white;
		border:1px solid lightgray;
		border-radius:10px;
		padding:10px;
	}
</style>
<script>
$(document).ready(function() {	
	
	function getLocation() {
		  if (navigator.geolocation) { // GPS를 지원하면
		    navigator.geolocation.getCurrentPosition(function(position) {
		    	$(".latitude").val(position.coords.latitude);
		    	$(".longitude").val(position.coords.longitude);
		    	
		    	near.submit();
		    }, function(error) {
		      console.error(error);
		    }, {
		      enableHighAccuracy: true,
		      maximumAge: 0,
		      timeout: Infinity
		    });
		  } else {
		    alert('GPS를 지원하지 않습니다');
		  }
	};
	
	$(".gps_btn").click(function() {
		getLocation();
	});
});
</script>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<section>
		<form name="near" action="near.do" method="post">
			<input type="hidden" class="latitude" name="latitude">
			<input type="hidden" class="longitude" name="longitude">
			<button type="button" class="gps_btn">내 위치 찾기</button>
		</form>
	</section>	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>