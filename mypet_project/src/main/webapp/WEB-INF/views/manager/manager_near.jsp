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

.nearbox{
	width:800px;
	height:600px;
	border:1px solid gray;
	margin-left:400px;
	margin-bottom:100px;
	overflow:scroll;
}
.nearlist{
	text-align:center;
	width:100%;
}
.nearlist>thead>tr {
		background-color:lightgray;
	}
.delete {
	border:1px solid lightgray;
	border-radius:10px;
	margin:5px 0;
}
.near_content:hover { text-decoration:underline; cursor:pointer;}
</style>
<script>
	$(document).ready(function(){
		$(".delete").click(function() {
			var nid = $(this).attr("id");
			var con_test = confirm("선택한 글을 삭제하시겠습니까?"); 
        	if(con_test == true){ 
        		$.ajax({
    		        url:"manager_near_delete.do",
    		        type:"post",
    		        data: {nid:nid},
    		        success:function(){			       		  
    		        	location.reload();
    		       	},		
    		    });
        		
        	}
		});
	});
	
</script>
</head>
<body>
	<section class="section">
	<div class="box">
		<jsp:include page="manager_header.jsp"></jsp:include>
		<jsp:include page="manager_commons.jsp"></jsp:include>
		<div class="nearbox">
			<table class="nearlist">
				<thead style="border-bottom:1px solid; ">
							<tr>
								<th width=100px;>번호</th>
								<th width=400px;>제목</th>
								<th width=100px>글쓴이</th>
								<th width=100px>등록일</th>
								<th width=100px;>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var = "vo"  items="${list}"  >
								<tr  style="border-bottom:1px solid lightgray;" >
									<td>${vo.rno }</td>
									<td  onclick="window.open('near_contents.do?nid=${vo.nid}')" class="near_content">${vo.title }</td>
									<td>${vo.id }</td>
									<td>${vo.startdate }</td>
									<td><button type="button" class="delete" id="${vo.nid }">삭제</button></td>
								</tr>
							</c:forEach>
						</tbody>
			</table>
		</div>
	</div>
	</section>
</body>
</html>