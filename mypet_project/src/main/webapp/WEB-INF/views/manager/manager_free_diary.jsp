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

.freebox{
	width:800px;
	height:600px;
	border:1px solid gray;
	margin-left:400px;
	margin-bottom:100px;
	overflow:scroll;
}
.freelist{
	text-align:center;
	width:100%;
}
.freelist>thead>tr {
		background-color:lightgray;
}
.delete {
	border:1px solid lightgray;
	border-radius:10px;
	margin:5px 0;
}
.free_content:hover { text-decoration:underline; cursor:pointer;}

</style>
<script>
	$(document).ready(function(){
		$(".delete").click(function() {
			var fid = $(this).attr("id");
			var con_test = confirm("선택한 글을 삭제하시겠습니까?"); 
        	if(con_test == true){ 
        		$.ajax({
    		        url:"manager_free_delete.do",
    		        type:"post",
    		        data: {fid:fid},
    		        success:function(){			       		  
    		        	location.reload();
    		       	},		
    		    });
        		
        	}
		});
})
	
</script>
</head>
<body>
	<section class="section">
	<div class="box">
		<jsp:include page="manager_header.jsp"></jsp:include>
		<jsp:include page="manager_commons.jsp"></jsp:include>
		<div class="freebox">
			<table class="freelist">
				<thead style="border-bottom:1px solid; ">
							<tr>
								<th width=100px;>번호</th>
								<th width=450px;>제목</th>
								<th width=100px>글쓴이</th>
								<th width=100px>등록일</th>
								<th width=100px;>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var = "vo"  items="${list}"  >
								<tr  style="border-bottom:1px solid lightgray;" >
									<td>${vo.rno }</td>
									<td  onclick="window.open('diary_free_contents.do?fid=${vo.fid}')" class="free_content">${vo.ftitle }</td>
									<td>${vo.id }</td>
									<td>${vo.fdate }</td>
									<td><button type="button" class="delete" id="${vo.fid }">삭제</button></td>
								</tr>
							</c:forEach>
						</tbody>
			</table>
		</div>
	</div>
	</section>
</body>
</html>