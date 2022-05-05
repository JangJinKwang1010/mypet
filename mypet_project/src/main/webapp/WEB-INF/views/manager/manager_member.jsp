<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet 관리자</title>
<script src="js/jquery-3.6.0.min.js"></script>
<style>

	.memberbox{
		width:800px;
		height:600px;
		border:1px solid gray;
		margin-left:400px;
		margin-bottom:100px;
	}
	.memberlist{
		text-align:center;
		width:100%;
	}
	.memberlist>thead>tr {
		background-color:lightgray;
	}

</style>
<script>
	$(document).ready(function(){
		$(".member_content").click(function() {
			var id = $(this).attr("id");
		    var url = "manager_member_content.do?id="+id;
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
		<jsp:include page="manager_header.jsp"></jsp:include>
		<jsp:include page="manager_commons.jsp"></jsp:include>
		<div class="memberbox">
					<table class="memberlist">
						<thead style="border-bottom:1px solid gray; ">
							<tr>
								<th>번호</th>
								<th>아이디</th>
								<th>이름</th>
								<th>가입일자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var = "vo"  items="${list}"  >
								<tr class="member_content" style="border-bottom:1px solid lightgray;" id="${vo.id }">
									<td>${vo.rno }</td>
									<td>${vo.id }</td>
									<td>${vo.name }</td>
									<td>${vo.mdate }</td>
								</tr>
							</c:forEach>
				</table>
		</div>
	</div>
	</section>
</body>
</html>