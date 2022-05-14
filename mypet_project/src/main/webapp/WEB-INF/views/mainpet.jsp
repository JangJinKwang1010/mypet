<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet</title>
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<style>
	section { text-align:center; background-color:rgb(240,240,240); }
	.top_box{
		height:50px;
		text-align:center;
		font-weight:bold;
		font-size:20px;
		display:inline-block;
		margin-top:20px;
	}
	.middle_box{
		border:1px solid lightgray;
		border-radius:5px;
		height:370px;
		width:450px;
		display:inline-block;
		margin-top:10px;
		background-color:white;
		margin-bottom:30px;
	}
	.box1{
		border:1px solid lightgray;
		border-radius:5px;
		width:212px;
		height:210px;
		margin-top:5px;
		margin-left:7px;
		display:inline-block;
		float:left;
		background-color:white;
	}
	.box2{
		border:1px solid lightgray;
		border-radius:5px;
		width:213px;
		height:210px;
		margin-top:5px;
		margin-right:7px;
		display:inline-block;
		float:right;
		text-align:left;
		background-color:white;
	}
	.box3{
		border:1px solid lightgray;
		border-radius:5px;
		width:435px;
		height:100px;
		margin-top:5px;
		margin-left:7px;
		text-align:left;
		float:left;
		background-color:white;
	}
	.p1{
		font-weight:bold;
		margin-top:4px;
		margin-bottom:3px;
		margin-left:5px;
	}
	.p1 span{
		font-size:13px;
		font-weight:normal;
	}
	.bottom_box{
	text-align:center;
	}
	.bottom_box>.btn {
		border:none;
		width:100px;
		height:35px;
		border-radius:10px;
		font-weight:bold;
		background-color:rgb(168,199,123);
		color:white;
		font-size:20px;
		margin-top:8px;
	}
	.bottom_box>.btn:hover{
		background-color:rgb(109,141,61);
		color:white;
	}
	.carousel-control-prev-icon { margin-right:50px; }
	.carousel-control-next-icon { margin-left:50px; }
	</style>
<script>
	$(document).ready(function() {
		$(".btn").click(function() {
			var pid = $(this).attr("id");
			
			var con_test = confirm("대표 반려동물로 등록하시겠습니까?"); 
        	if(con_test == true){ 
        		$.ajax({
    		        url:"rpet_update.do",
    		        type:"post",
    		        data: {pid:pid},
    		        success:function(result){			
    		        	if (result) {
    		        		alert("대표 반려동물이 등록되었습니다");
        		        	opener.document.location.reload();
        		        	window.close(); //창 닫기	
    		        	} else {
    		        		alert("대표 반려동물 등록이 실패하였습니다");
    		        		location.reload();
    		        	}	        	
    		       	},		
    		    });
        		
        	}
			
		});
	});
</script>
</head>
<body>
<section>
		<div class="top_box">
			<p>대표 반려동물 선택</p>
		</div>
		<div id="demo" class="carousel slide" data-ride="carousel"> 
		<div class="carousel-inner"> <!-- 슬라이드 쇼 --> 
		<c:forEach var = "vo"  items="${list}"  begin="0" end="0">
			<div class="carousel-item active"> <!--가로--> 
				<div class="middle_box">
					<div class="box1"><img src="upload/${vo.psfile }" width=100%; height=100%;></div>
					<div class="box2">
						<p class="p1">이름<br><span>${vo.pname }</span></p>
						<p class="p1">품종<br><span>${vo.kind }</span></p>
						<p class="p1">크기<br><span>${vo.bulk }</span></p>
						<p class="p1">생년월일<br><span>${vo.pbirth }</span></p>
					</div>
					<div class="box3">
						<p class="p1">특이사항<br><span>${vo.pcomment }</span></p>
					</div>
					<div class="bottom_box">
					<button class="btn" id="${vo.pid }">등록</button>
					</div>
				</div>	
			</div> 
		</c:forEach>
		<c:forEach var = "vo"  items="${list}"  begin="1" end="${fn:length(list)-1}">
		<div class="carousel-item"> 
			<div class="middle_box">
					<div class="box1"><img src="upload/${vo.psfile }" width=100%; height=100%;></div>
					<div class="box2">
						<p class="p1">이름<br><span>${vo.pname }</span></p>
						<p class="p1">품종<br><span>${vo.kind }</span></p>
						<p class="p1">크기<br><span>${vo.bulk }</span></p>
						<p class="p1">생년월일<br><span>${vo.pbirth }</span></p>
					</div>
					<div class="box3">
						<p class="p1">특이사항<br><span>${vo.pcomment }</span></p>
					</div>
					<div class="bottom_box">
					<button class="btn"  id="${vo.pid }">등록</button>
					</div>
				</div>	
		 </div>
		 </c:forEach> 
		</div>
		</div>
		 <c:if test="${fn:length(list) ne 1 }">
			 <a class="carousel-control-prev" href="#demo" data-slide="prev"> 
			 	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			  <!-- <span>Previous</span> --> 
			  </a> 
			  <a class="carousel-control-next" href="#demo" data-slide="next"> 
			  	<span class="carousel-control-next-icon" aria-hidden="true"></span>
			   <!-- <span>Next</span> -->
			   </a> <!-- / 화살표 버튼 끝 -->
	   	</c:if>
		
	</section>	
</body>
</html>