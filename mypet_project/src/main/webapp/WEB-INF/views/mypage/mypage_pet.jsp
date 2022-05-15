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
		margin:100px 0 40px 0;
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
		width:250px; height:300px;
		margin:10px 20px;
		display:inline-block;
		text-align:center;
	}
	.pet_img {
		border:1px solid lightgray;
		width:200px; height:150px;
		display:inline-block;
		margin-top:20px;
	}
	.pet_dtl b { font-size:13px; }
	.pet_dtl p { font-size:12px; }
	
	.add { 
		float:right; margin:20px 40px;
		border:1px solid lightgray;
		background-color:rgb(255,237,237);
		width:100px; height:40px;
		border-radius:10px;
	}
	
	.delete, .update {
		border:1px solid lightgray;
		margin:10px 0;
		font-size:13px;
		border-radius:10px;
	}
	.career_div {
		text-align:left;
		border-bottom:1px solid lightgray;
		width:90%; height:50px;
		padding:10px;	
		display:inline-block;
		margin:10px 0;
	}
</style>
<script>
	$(document).ready(function() {
		$(".add").click(function() {
		    var url = "mypage_pet_add.do";
		    var name = "popup test";
		    var option = "width = 1000, height = 400, top = 150, left = 300, location = no"
		    window.open(url, name, option);
		});
		
		
		$(".delete").click(function() {
			var pid = $(this).attr("id");
			var con_test = confirm("반려동물을 삭제하시겠습니까?"); 
        	if(con_test == true){ 
        		$.ajax({
    		        url:"mypage_pet_delete.do",
    		        type:"post",
    		        data: {pid:pid},
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
				<p class="title2">펫 관리</p>
				<c:forEach var = "vo"  items="${list}"  >
				<div class="pet_div">
					<div class="pet_dtl">
						<div class="pet_img"><img src="upload/${vo.psfile }" width=100%; height=100%;></div>
						<p><b>이름</b> ${vo.pname }(${vo.pgender })</p>
						<p><b>[${vo.category }] 품종</b> ${vo.kind }</p>
						<p><b>크기</b> ${vo.bulk } ${vo.pkg }</p>
						<p><b>생일</b> ${vo.pbirth }</p>
						<button type="button" class="delete" id="${vo.pid }">삭제</button>
						<button type="button" class="update" id="${vo.pid }">수정</button>
					</div>
				</div>
				</c:forEach>	
				<c:if test="${fn:length(list) eq 0}">
					<div class="career_div">등록된 경력사항이 없습니다</div>
				</c:if>	
				<div><button type="button" class="add" >추가</button></div>	
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>