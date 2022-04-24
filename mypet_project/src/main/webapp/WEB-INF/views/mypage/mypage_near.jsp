<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
          <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery-3.6.0.min.js"></script>
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
		margin:100px 0;
		margin-left:100px;
		float:left;
		font-weight:bold;
		font-size:30px;
	}
		.list {
		width:90%;
		display:inline-block;
		margin-top:30px;
		background-color:white;
	}
	.list>div {
		display:inline-block;
		width:100%; height:150px;
		border:1px solid lightgray;
		border-radius:5px;
		margin-bottom:10px;
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
	.option { text-align:left; margin:15px 40px; font-size:14px; }
	.option img {
		width:10px; height:10px;
		opacity:0.5; margin-right:5px; 
	}
	.option>span {
		margin-right:20px;
	}
	.user { text-align:left; margin:15px 30px; font-size:15px; }
	  .btn_style {
		width:65px;
		background-color:white;
		border:2px solid lightgray;
		border-radius:50px;
		padding:10px;
		color:lightgray;
		font-size:15px;
		font-weight:bold;
		text-align:center;
		margin:20px 0;
		cursor:pointer;
	}
	.btn_style:hover {
		border:2px solid #4fa9de;
		color:#4fa9de;
	}
	
	.more_div1 { display:inline-block; }
	.more_div2 { display:none; }
</style>
<script>
$(document).ready(function() {
	var flag = false;
	
	$('#more_btn').hover(function() {
	 	$("#more_img").attr("src", "images/btn.png");
	}, function(){
		$("#more_img").attr("src", "images/btn2.png");
	});

	$("#more_btn").click(function() {
		$(".more_div2").css("display","inline-block");
		
		if (flag) {
			alert("마지막 페이지입니다");
		}

		flag = true;
				
	});
})
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<section class="section">
		<div class="mainbox">
			<jsp:include page="mypage_commons.jsp"></jsp:include>
			<div class="main postmanager">
				<p class="title2">내 근처의 펫<span></span></p>
			<div class="list">
			<c:if test="${!empty list}">
				<c:forEach var = "vo"  items="${list}"  begin="0" end="2">
					<div onclick="location.href='near_contents.do?nid=${vo.nid}' " class="more_div1">
						<p class="p_title" ><span class="logo">${vo.category }</span>[${vo.kind }]<span class="text">${vo.title }</span></p>
						<p class="option">
							<span><img src="images/paw.png">경력 ${vo.work }</span>
							<span><img src="images/calendar.png">${vo.startdate } ~ ${vo.enddate }</span>
						</p>
						<p class="user">${vo.id }(${vo.name }**)</p>
					</div>
				</c:forEach>
				<c:forEach var = "vo"  items="${list}" begin="3" end="${fn:length(list)-1}" >		
					<div onclick="location.href='near_contents.do?nid=${vo.nid}' " class="more_div2">
						<p class="p_title" ><span class="logo">${vo.category }</span>[${vo.kind }]<span class="text">${vo.title }</span></p>
						<p class="option">
							<span><img src="images/paw.png">경력 ${vo.work }</span>
							<span><img src="images/calendar.png">${vo.startdate } ~ ${vo.enddate }</span>
						</p>
						<p class="user">${vo.id }(${vo.name }**)</p>
					</div>
				</c:forEach>
			</c:if>
			</div>
			<div>
				<button type="button" class="btn_style" id="more_btn">more
					<img src="images/btn2.png" id="more_img">
				</button>
			</div>
		</div>			
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>