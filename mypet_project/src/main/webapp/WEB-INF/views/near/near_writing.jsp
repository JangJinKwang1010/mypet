<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypet</title>
<script src="js/jquery-3.6.0.min.js"></script>
<style>
	.section {
		text-align:center;
	}
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
		background-color:rgb(245,245,245);
		margin-bottom:100px;
	}
	.subtitle {
		margin-top:60px;
		margin-left:70px;
		float:left;
		font-weight:bold;
		font-size:25px;
		margin-bottom:-10px;
	}
	.writing_line{
		display:inline-block;
		border-top:1px solid;
		width:90%;
		}
	.mainbox2>.pet_select{
		display:inline-block;
		width:31%;
		height:40px;
		margin:3px 0 1px 0;
	}
	.mainbox2>.date{
		display:inline-block;
		width:27%;
		height:40px;
		margin:3px 0 1px 0;
	}
	.mainbox2>.writing_title{
		display:inline-block;
		width:90%;
		height:40px;
	}
	.mainbox2>.writing_content{
		display:inline-block;
		margin-top:3px;
		width:90%;
		height:600px;
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
	}`
	.writing_button:hover {
		background-color:rgb(0,68,130);
		color:white;
	}
	@media (min-width : 600px) {		
		.section { background-color:rgb(200,171,217); }
		.mainbox { width:1300px; }
	}
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
		<section class="section">
		<div class="mainbox">
			<p class="title">내 근처의 펫<span>A pet near me</span></p>
			<div class ="mainbox2 freebox">
				<p class="subtitle">글쓰기</p>
				<div class="writing_line"></div>
				<select class="pet_select form-select">
					<option>펫 선택</option>
					<option>강아지</option>
					<option>고양이</option>
				</select>
				<select class="pet_select form-select">
					<option>경력 선택</option>
					<option>1년 이하</option>
					<option>2년</option>
					<option>3년</option>
					<option>4년</option>
					<option>5년 이상</option>
				</select>
				<input type="date" class="date form-control">
				<input type="text" class="writing_title form-control" placeholder="제목을 입력해주세요.">
				<textarea class="writing_content form-control" placeholder="내용을 입력해주세요."></textarea>
				<button class="writing_button">글쓰기</button>
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>