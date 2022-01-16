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
	.mainbox {
		width:1200px;
		display:inline-block;
		text-align:center;
		background-color:white;
	}
	.title {
		margin-top:110px;
		margin-left:100px;
		margin-bottom:60px;
		float:left;
		font-weight:bold;
		font-size:30px;
	}
	.title>span {
		margin-left:20px;
		color:gray;
		font-weight:normal;
		font-size:20px;
	}
	.mainbox2 {
		border-radius:10px;
		border:1px solid lightgray;
		display:inline-block;
		width:1000px;
		background-color:white;
		margin-bottom:100px;
		text-align:center;
	}
	.subtitle {
		margin-top:60px;
		margin-left:70px;
		float:left;
		font-weight:bold;
		font-size:25px;
		margin-bottom:-20px;
	}
	.writing_line {
		display:inline-block;
		border-top:2px solid;
		width:90%;
	}
	.mainbox2>.writing_title {
		display:inline-block;
		width:90%;
		height:40px;
	}
	.mainbox2>.writing_content {
		display:inline-block;
		margin-top:3px;
		width:90%;
		height:600px;
	}
	.post_title {
		text-align:left;
		font-weight:bold;
		font-size:20px;
		margin-left:65px;
		margin-bottom:5px;
	}
	.name {
		display:inline-block;
		float:left;
		margin-left:70px;
		font-size:13px;
	}
	.post_line {
		float:left;
		border-right:1px solid lightgray;
		height:13px;
		display:inline-block;
		margin-left:10px;
		margin-top:5px;
	}
	.post_line2 {
		float:right;
		border-right:1px solid lightgray;
		height:13px;
		display:inline-block;
		margin-right:10px;
		margin-left:10px;
		margin-top:5px;
	}
	.post_date {
		display:inline-block;
		float:left;
		margin-left:10px;
		font-size:13px;
	}
	.view {
		display:inline-block;
		float:right;
		font-size:13px;
	}
	.recommend {
		display:inline-block;
		float:right;
		font-size:13px;
	}
	.comments {
		border:1px solid lightgray;
		border-radius:10px;
		display:inline-block;
		float:right;
		font-size:13px;
		margin-right:50px;
	}
	.writing_line2 {
		display:inline-block;
		border-top:1px solid lightgray;
		width:90%;
	}
	.contentsbox {
		display:inline-block;
		border:1px solid white;
		width:90%;
		height:600px;
		margin-top:50px;
	}
	
	.top { 	text-align:right;	}
	.top>button {
		border:none;
		width:100px;
		height:50px;
		border-radius:10px;
		font-weight:bold;
		margin-top:20px;
		background-color:rgb(72,115,210);
		color:white;
		font-size:20px;
		margin-right:45px;
	}
	
	@media (min-width : 600px) {		
		.section { background-color:rgb(200,171,217); }
		.mainbox { width:1300px; }
	}
</style>
<script>
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<section class="section">
			<div class="mainbox">
			<p class="title">내 근처의 펫<span>A pet near me</span></p>
			<div class ="mainbox2 freebox">
			<div class="top">				
				<button>채팅하기</button>
			</div>
			<div class="writing_line"></div>
			<p class="post_title">저희 비숑 잠시 맡겨주실분~</p>
			<p class="name">이름</p>
			<div class="post_line"></div>
			<p class="post_date">게시한날짜</p>
			<button class="comments">채팅 0</button>
			<div class="post_line2"></div>
			<p class="recommend">관심 0</p>
			<div class="post_line2"></div>
			<p class="view">조회 4</p>
			<div class="writing_line2"></div>
			<div class="contentsbox"></div>		
			</div>
		</div>
	</section>
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>