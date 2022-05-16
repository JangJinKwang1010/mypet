<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet 관리자</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="js/jquery-3.6.0.min.js"></script>
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
		border:1px solid lightgray;
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
<script>
	$(document).ready(function() {
		$(".login").click(function() {
			if($(".logindata1").val() == "admin" && $(".logindata2").val() == "admin") {
				location.href = 'manager_member.do';
			} else {
				alert("관리자 로그인 실패");
				$(".logindata2").val("");
				$(".logindata1").val("").focus();
			}
		});
	});
</script>
</head>
<body>
	<section class="section">
	<div class="mainbox">
		<jsp:include page="manager_header.jsp"></jsp:include>
		<div class="loginbox">
			<div class="logintop">
			</div>
			<div class="loginmiddle">
				<p>Manager Only</p>
				<input type="text" placeholder="아이디를 입력하세요."id="id" name="id" class="form-control logindata1">
				<input type="password" placeholder="비밀번호를 입력하세요." id="pass" name="pass" class="form-control logindata2">
				<button type="button" class="login">로그인</button>
			</div>
		</div>
	</div>
	</section>
</body>
</html>