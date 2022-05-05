<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet 관리자</title>
<style>
	section {
		text-align:center;
	}
	.box {
		border:1px solid gray;
		width:450px;
		height:400px;
		display:inline-block;
		text-align:left;
	}
	.rightbox{
		width:198px;
		height:305px;
		border-left:1px solid lightgray;
		float:right;
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
	}
	.box2{
		width:251px;
		height:50px;
		border-bottom:1px solid lightgray;
	}
	.box3 {
		width:450px;
		height:10px;
	}
	label{
		margin-left:5px;
		font-size:14px;
		font-weight:bold;
	}
	.box p{
		margin-left:5px;
		margin-top:3px;
		font-size:14px;
	}
</style>
</head>
<body>
<section>
	<p style="font-size:18px;"><b>STAFF ONLY</b></p>
	<div class="box">
		<div class="rightbox">
			<div class="picture">
			<img src="images/human2.png" width=100%; height=100%;>
			</div>
			<div class="namebox">
				<label>이름</label>
				<p>${vo.name }</p>
			</div>
			<button>회원삭제</button>
		</div>	
		<div class="category box2">
			<label>가입일자</label>
			<p>${vo.mdate }</p>
		</div>	
		<div class="kind box2">
			<label>회원아이디</label>
			<p>${vo.id }</p>
		</div>	
		<div class="bulk box2">
			<label>이메일</label>
			<p>${vo.email }</p>
		</div>	
		<div class="startdate box2">
			<label>휴대폰번호</label>
			<p>${vo.hp }</p>
		</div>	
		<div class="gender box2">
			<label>성별</label>
			<c:if test="${vo.gender eq 'male' }">
				<p>남자</p>
			</c:if>
			<c:if test="${vo.gender eq 'female' }">
				<p>여자</p>
			</c:if>
		</div>	
		<div class="birth box2">
			<label>생년월일</label>
			<p>${vo.birth }</p>
		</div>	
		<div class="coment box3">
			<label>주소</label>
			<p>${vo.addr1} ${vo.addr2 }</p>
		</div>	
	</div>
</section>
</body>
</html>