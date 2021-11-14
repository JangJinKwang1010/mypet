<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet</title>
<style>
	.section {
	text-align:center;
}
.mainbox {
	width:1200px;
	display:inline-block;
	margin-top:50px;
	text-align:center;
}
.title {
	margin-top:60px;
	margin-left:100px;
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
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<section class="section">
		<div class="mainbox">
			<p class="title">돌보미 등록<span>Register as a caregiver</span></p>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>