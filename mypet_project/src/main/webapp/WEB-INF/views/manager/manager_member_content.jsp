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
		height:52px;
		color:white;
		background-color:black;
		border:none;
	}
	.rightbox>button:hover{
		color:black;
		background-color:lightgray;
	}
	.namebox{
		width:100%;
		height:50px;
		border:none;
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
			<img src="images/player.png" width=100%; height=100%;>
			</div>
			<div class="namebox">
				<label>이름</label>
				<p>숑숑이</p>
			</div>
			<button>회원삭제</button>
		</div>	
		<div class="category box2">
			<label>회원번호</label>
			<p>1</p>
		</div>	
		<div class="kind box2">
			<label>회원아이디</label>
			<p>test3</p>
		</div>	
		<div class="bulk box2">
			<label>이메일</label>
			<p>test3@naver.com</p>
		</div>	
		<div class="startdate box2">
			<label>휴대폰번호</label>
			<p>01012341234</p>
		</div>	
		<div class="gender box2">
			<label>성별</label>
			<p>남자</p>
		</div>	
		<div class="birth box2">
			<label>생년월일</label>
			<p>1998년12월12일</p>
		</div>	
		<div class="coment box3">
			<label>주소</label>
			<p>충청남도 천안시 서북구 성환읍</p>
		</div>	
	</div>
</body>
</html>