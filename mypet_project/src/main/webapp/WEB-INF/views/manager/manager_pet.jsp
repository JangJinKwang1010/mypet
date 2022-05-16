<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet관리자</title>
<script src="js/jquery-3.6.0.min.js"></script>
<style>

.petbox{
	width:800px;
	height:600px;
	border:1px solid gray;
	margin-left:400px;
	margin-bottom:100px;
	overflow:scroll;
}
.petlist{
	text-align:center;
	width:100%;
}
.petlist>thead>tr {
		background-color:lightgray;
	}
	.pet_content { cursor:pointer }

</style>
<script>
	$(document).ready(function(){
		$(".pet_content").click(function() {
			var pid = $(this).attr("id");
		    var url = "manager_pet_content.do?pid="+pid;
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
		<div class="petbox">
			<table class="petlist">
				<thead style="border-bottom:1px solid; ">
							<tr>
								<th width=100px;>번호</th>
								<th width=150px;>분류</th>
								<th width=200px>품종</th>
								<th width=200px>이름</th>
								<th width=150px;>등록아이디</th>
							</tr>
						</thead>
							<c:forEach var = "vo"  items="${list}"  >
								<tr class="pet_content" style="border-bottom:1px solid lightgray;" id="${vo.pid }">
									<td>${vo.rno }</td>
									<td>${vo.category }</td>
									<td>${vo.kind }</td>
									<td>${vo.pname }</td>
									<td>${vo.id }</td>
								</tr>
							</c:forEach>
			</table>
		</div>
	</div>
	</section>
</body>
</html>