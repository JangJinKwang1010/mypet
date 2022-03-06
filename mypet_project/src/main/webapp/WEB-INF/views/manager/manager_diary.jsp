<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<style>

.petbox{
	width:800px;
	height:600px;
	border:1px solid;
	margin-left:400px;
}
.petlist{
	text-align:center;
}
.pet_content img{
	width:20px;
	height:20px;
}

</style>
<script>
	$(document).ready(function(){
		$(".pet_content").click(function() {
	    var url = "manager_pet_content.do";
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
		<div class="petbox">
			<table class="petlist">
				<thead style="border-bottom:1px solid; ">
							<tr>
								<th width=100px;>번호</th>
								<th width=150px;>제목</th>
								<th width=200px>글쓴이</th>
								<th width=200px>등록일</th>
								<th width=150px;>삭제</th>
							</tr>
						</thead>
						<tbody>
							<tr class="pet_content" style="border-bottom:1px solid lightgray;">
								<th>1</th>
								<td>우리강쥐보세요</td>
								<td>이아이</td>
								<td>2022.02.22</td>
								<td><img src='images/cross.png'></td>
							</tr>
			</table>
		</div>
	</div>
	</section>
</body>
</html>