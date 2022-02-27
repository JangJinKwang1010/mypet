<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.loginbox{
	width:500px;
	height:400px;
	margin-left:500px;
	border-radius:10px;
}
.loginmiddle>p{
	font-size:20px;
	font-weight:bold;
	margin:5px;
	text-align:center;
}
.loginmiddle{
	border-radius:3px;
	width:70%;
	height:200px;
	border:1px solid;
	margin-top:70px;
	margin-left:75px;
}
.loginmiddle button {
		background-color:black;
		height:40px;
		color:white;
		font-weight:bold;
		font-size:20px;
		border:none;
		margin-top:30px;
		border-radius:3px;
		margin-left:140px;
		margin-top:15px;
	}
	.loginmiddle button:hover{
		color:black;
		background-color:lightgray;
	}
	.loginmiddle>.logindata1{
	width:90%;
	margin-left:18px;
	margin-top:8px;
	}
	.loginmiddle>.logindata2{
	width:90%;
	margin-left:18px;
	}
</style>
</head>
<body>
	<section class="section">
	<div class="mainbox">
		<jsp:include page="manager_commons.jsp"></jsp:include>
		<div class="loginbox">
			<div class="logintop">
			</div>
			<div class="loginmiddle">
				<p>Manager Only</p>
				<input type="text" placeholder="아이디를 입력하세요."id="id" name="id" class="form-control logindata1">
				<input type="text" placeholder="비밀번호를 입력하세요."pass="pass" name="pass" class="form-control logindata2">
				<button>로그인</button>
			</div>
		</div>
	</div>
	</section>
</body>
</html>