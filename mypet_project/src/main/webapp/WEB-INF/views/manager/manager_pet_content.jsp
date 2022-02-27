<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.box{
		border:1px solid;
		width:450px;
		height:450px;
	}
	.rightbox{
		width:198px;
		height:305px;
		border-left:1px solid;
		float:right;
		border-bottom:1px solid;
	}
	.rightbox>button{
		font-weight:bold;
		font-size:15px;
		width:100%;
		height:50px;
		color:white;
		background-color:black;
		border:none;
	}
	.rightbox>button:hover{
		color:black;
		background-color:lightgray;
	}
	.picture{
		width:198px;
		height:203px;
		border-bottom:1px solid;
	}
	.box2{
		width:251px;
		height:50px;
		border-bottom:1px solid;
	}
	.box3{
		width:450px;
		height:140px;
	}
	.box label{
		margin-left:5px;
		font-size:12px;
		font-weight:bold;
	}
	.box p{
		margin-left:5px;
		margin-top:-1px;
		font-size:15px;
	}
</style>
</head>
<body>
	<p>staff only</p>
	<div class="box">
		<div class="rightbox">
			<div class="picture">
			<img src="images/qltyd.png" width=100%; height=100%;>
			</div>
			<button>펫삭제</button>
		</div>	
		<div class="category box2">
			<label>분류</label>
			<p>강아지</p>
		</div>	
		<div class="kind box2">
			<label>품종</label>
			<p>비숑</p>
		</div>	
		<div class="bulk box2">
			<label>크기</label>
			<p>소형견</p>
		</div>	
		<div class="startdate box2">
			<label>입양날자</label>
			<p>2022년1월1일</p>
		</div>	
		<div class="gender box2">
			<label>성별</label>
			<p>여자</p>
		</div>	
		<div class="birth box2">
			<label>생년월일</label>
			<p>2021년12월1일</p>
		</div>	
		<div class="coment box3">
			<label>특이사항</label>
			<p>호흡기질환이 있어요.</p>
		</div>	
	</div>
</body>
</html>