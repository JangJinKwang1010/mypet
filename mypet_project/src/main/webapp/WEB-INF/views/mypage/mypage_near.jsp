<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery-3.6.0.min.js"></script>
<title>Mypet</title>
<style>
	.section {
		text-align:center;
		background-color:rgb(226,143,173);
	}
	.mainbox {
		width:1300px;
		display:inline-block;
		text-align:center;
		background-color:white;
	}
	.main {
		width:65%;
		display:inline-block;
		border:1px solid lightgray;
		border-radius:30px;
		margin-bottom:100px;
	}
	.title2 {
		margin:100px 0;
		margin-left:100px;
		float:left;
		font-weight:bold;
		font-size:30px;
	}
		.list {
		width:90%;
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
	.user { text-align:left; margin:15px 30px; font-size:15px; }
	
</style>
<script>
	
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<section class="section">
		<div class="mainbox">
			<jsp:include page="mypage_commons.jsp"></jsp:include>
			<div class="main postmanager">
				<p class="title2">내 근처의 펫<span></span></p>
				<div class="list">
			<div>
				<p class="p_title"><span class="logo">강아지</span>[강아지] 비숑<span class="text">저희 비숑 잠시 맡겨주실 분을 구합니다</span></p>
				<p class="option">
					<span><img src="images/paw.png">경력 1년이상</span>
					<span><img src="images/calendar.png">2021/11/13 - 2021/12/31</span>
				</p>
				<p class="user">qoolp79(장**)</p>
			</div>
			<div>
				<p class="p_title"><span class="logo">강아지</span>[강아지] 비숑<span class="text">저희 비숑 잠시 맡겨주실 분을 구합니다</span></p>
				<p class="option">
					<span><img src="images/paw.png">경력 1년이상</span>
					<span><img src="images/calendar.png">2021/11/13 - 2021/12/31</span>
				</p>
				<p class="user">qoolp79(장**)</p>
			</div>
			<div>
				<p class="p_title"><span class="logo">강아지</span>[강아지] 비숑<span class="text">저희 비숑 잠시 맡겨주실 분을 구합니다</span></p>
				<p class="option">
					<span><img src="images/paw.png">경력 1년이상</span>
					<span><img src="images/calendar.png">2021/11/13 - 2021/12/31</span>
				</p>
				<p class="user">qoolp79(장**)</p>
			</div>
			<div>
				<p class="p_title"><span class="logo">강아지</span>[강아지] 비숑<span class="text">저희 비숑 잠시 맡겨주실 분을 구합니다</span></p>
				<p class="option">
					<span><img src="images/paw.png">경력 1년이상</span>
					<span><img src="images/calendar.png">2021/11/13 - 2021/12/31</span>
				</p>
				<p class="user">qoolp79(장**)</p>
			</div>
			
		</div>			
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>