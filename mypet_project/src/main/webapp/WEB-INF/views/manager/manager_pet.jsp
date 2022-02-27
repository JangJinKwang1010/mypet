<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.petbox{
	width:800px;
	height:600px;
	border-radius:10px;
	border:1px solid;
	margin-left:400px;
}



</style>
</head>
<body>
	<section class="section">
	<div class="box">
		<jsp:include page="manager_commons.jsp"></jsp:include>
		<div class="petbox">
			<table class="petlist">
				<thead style="border-bottom:1px solid; ">
							<tr>
								<th width=150px;>　번호</th>
								<th width=200px;>분류</th>
								<th width=200px>품종</th>
								<th width=150px>펫이름</th>
								<th width=150px;>회원이름</th>
							</tr>
						</thead>
			</table>
		</div>
	</div>
	</section>
</body>
</html>