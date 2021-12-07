<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="http://localhost:9000/myshopping/images/pink.png">
<title>Mypet</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
</head>
<style>
	.background {	
		text-align:center;
	}
	.back_div {
		width:1000px;
		margin:100px;
		text-align:center;
		display:inline-block;
	}	
	.box {
		border-radius:5px;
		width:400px;
		display:inline-block;
		text-align:center;
	}
	.box>p {
		font-weight:bold;
		font-size:16px;
		margin:20px;
	}
	.box button {
		background-color:black;
		color:white;
		border:none;
		border-radius:4px;
		width:300px; height:50px;
	}
	@media (max-width : 500px) {
		.back_div { width:100%; margin:100px 0; }
		.box { width:100%; }
	}
</style>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<section class="background">
	<div class="back_div">
		<div class="box">
			<img src="images/check.png" width=22%; height=25%; >
			<p>회원가입이 완료 되었습니다.</p>
			<button onclick="location.href='index.do' ">로그인</button>
		</div>
	</div>
</section>

</body>
</html>