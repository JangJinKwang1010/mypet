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
	}
	.title2 {
		margin:100px 0 0 0;
		margin-left:100px;
		float:left;
		font-weight:bold;
		font-size:30px;
		display:inline-block;
	}
	.pet_div {
		width:100%;
		float:left;
		margin:40px 0;
	}
	.pet_dtl {
		border:1px solid lightgray;
		border-radius:10px;
		width:90%; 
		height:60px;
		margin:10px 20px;
		display:inline-block;
		text-align:center;
	}
	.heart {
		position:relative;
		cursor:pointer;
		float:right;
	}
	.p_title {
		text-align:left;
		font-size:20px;
		font-weight:bold;
		margin:10px;
	}
	.p_title>.logo {
		font-size:13px;
		font-weight:normal;
		background-color:gray;
		color:white;
		border-radius:4px;
		margin:5px;
		padding:3px;
	}
	.p_title>.text {
		font-size:17px;
		font-weight:normal;
		margin-left:10px;
	}
</style>
<script>
 $(document).ready(function() {
	 $(".heart").click(function() {			
		 var nid = $(this).attr("id");
				$.ajax({
	                type: "post",
	                url: "near_heart_delete.do",             
	                data:{nid:nid},
	                dataType: 'json',
	                success: function (result) {
	                	if (result) {
		                	location.reload();	                		
	                	} else {
	                		alert("Error");
	                	}
	                },
	           });
			
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
				<p class="title2">좋아요 관리</p>
				<div class="pet_div">
				<c:forEach var = "vo"  items="${list}"  > 
					<div class="pet_dtl">
						<p class="p_title" ><span class="logo">강아지</span>[${vo.kind }]<span class="text">${vo.title }</span>
							<img src="images/heart_after.png"  class="heart" width=40px; height=40px; id="${vo.nid }" name="after" >
						</p>						
					</div>
				</c:forEach>
				<c:if test="${fn:length(list) eq 0}">
					<div class="pet_div" style="margin-top:60px; margin-bottom:10px;"><p>등록된 좋아요가 없습니다.</p></div>
				</c:if>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>