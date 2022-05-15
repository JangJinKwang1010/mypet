<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<link href="css/page.css" rel="stylesheet">
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
	.main {
		width:65%; 
		display:inline-block;
		border:1px solid lightgray;
		border-radius:30px;
		margin-bottom:100px;
		text-align:center;
	}
	.title2 {
		margin:100px 0 40px 0;
		margin-left:100px;
		float:left;
		font-weight:bold;
		font-size:30px;
		display:inline-block;
	}
	.career_div {
		text-align:left;
		border-bottom:1px solid lightgray;
		width:90%; height:50px;
		padding:10px;	
		display:inline-block;
		margin:10px 0;
	}
	.update, .delete {
		float:right;
		position:relative;
		bottom:28px;
		border:1px solid lightgray; 
		margin:0 5px;
		font-size:13px;
	}
	.add { 
		float:right; margin:20px 40px;
		border:1px solid lightgray;
		background-color:rgb(255,237,237);
		width:100px; height:40px;
		border-radius:10px;
	}
</style>
<script>
 $(document).ready(function() {
	 $(".add").click(function() {
		    var url = "mypage_career_add.do";
		    var name = "popup test";
		    var option = "width = 1000, height = 300, top = 250, left = 300, location = no"
		    window.open(url, name, option);
		});
	 
	 $(".delete").click(function() {
		 var cid = $(this).attr("id");
		 var con_test = confirm("경력사항을 삭제하시겠습니까?"); 
     	if(con_test == true){ 
     		$.ajax({
 		        url:"mypage_career_delete.do",
 		        type:"post",
 		        data: {cid:cid},
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
	<jsp:include page="../header.jsp"></jsp:include>
	<section class="section">
		<div class="mainbox">
			<jsp:include page="mypage_commons.jsp"></jsp:include>
			<div class="main postmanager">
				<p class="title2">경력 관리</p>
				<c:forEach var = "vo"  items="${list}"  >
				<div class= "career_div" >
						<c:if test="${ vo.enddate ne 'null' }">
							<p><b>[${vo.category }]</b> ${vo.kind }(${vo.bulk }) ${vo.startdate } ~ ${vo.enddate }</p>
						</c:if>
						<c:if test="${ vo.enddate eq 'null' }">
							<p><b>[${vo.category }]</b> ${vo.kind }(${vo.bulk }) ${vo.startdate } ~ 양육중</p>
						</c:if>
					<button type="button" class="update"  id="${vo.cid }">수정</button>				
					<button type="button" class="delete" id="${vo.cid }">삭제</button>						
				</div>
				</c:forEach>	
				<c:if test="${fn:length(list) eq 0}">
					<div class="career_div" >등록된 경력사항이 없습니다</div>
				</c:if>			 
			<div><button type="button" class="add" >추가</button></div>	
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>