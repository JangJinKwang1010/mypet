<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<style>

.memberbox{
	width:800px;
	height:600px;
	border:1px solid;
	margin-left:400px;
}
.memberlist{
	text-align:center;
}


</style>
<script>
	$(document).ready(function(){
		$(".member_content").click(function() {
	    var url = "manager_member_content.do";
	    var name = "popup test";
	    var option = "width = 500, height = 500, top = 150, left = 500, location = no"
	    window.open(url, name, option);
	});
})
	
</script>
</head>
<body>
	<section class="section">
	<div class="box">
		<jsp:include page="manager_commons.jsp"></jsp:include>
		<div class="memberbox">
			<table class="memberlist">
				<thead style="border-bottom:1px solid; ">
							<tr>
								<th width=100px;>번호</th>
								<th width=200px>회원이름</th>
								<th width=250px>회원아이디</th>
								<th width=250px;>휴대폰번호</th>
							</tr>
						</thead>
						<tbody>
							<tr class="member_content" style="border-bottom:1px solid lightgray;">
								<th>1</th>
								<td>이아이</td>
								<td>test3</td>
								<td>01012341234</td>
							</tr>
			</table>
		</div>
	</div>
	</section>
</body>
</html>