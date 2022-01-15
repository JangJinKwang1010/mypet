<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

	<section class="section">
		<div class="mainbox">
			<jsp:include page = "mypage_commons.jsp"></jsp:include>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>