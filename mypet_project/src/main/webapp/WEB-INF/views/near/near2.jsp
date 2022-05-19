<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet</title>
<script src="js/jquery-3.6.0.min.js"></script>
<style>
	.back { background-color:white; width:1300px; display:inline-block; text-align:center; }
	.section { background-color:rgb(200,171,217); margin-bottom:-6px;}
	.list { margin-bottom:50px; }
	.section { text-align:center; }
	.back>.title {
		margin-top:110px;
		float:left;
		font-weight:bold;
		font-size:30px;
		margin-left:100px;
	}
	.menu {
		margin-top:170px;
		float:left;
		margin-left:-300px;
		font-size:20px;
		color:black;
		cursor:pointer;
	}
	.span { 
		margin-top:170px;
		float:left;
		font-weight:bold; 
		margin-left:-250px;
		font-size:20px;
		color:rgb(72,115,210); 
	}	
	.title>span {
		margin-left:20px;
		color:gray;
		font-weight:normal;
		font-size:20px;
	}
	.writing_button {
		float:right;
		border:none;
		width:20%;
		height:50px;
		border-radius:10px;
		font-weight:bold;
		margin-top:180px;
		margin-right:50px;
		background-color:rgb(72,115,210);
		color:white;
		font-size:20px;
		cursor:pointer;
	}
    .main {
    	margin-top:80px;
    	margin-bottom:20px;
    	width:85%;
    	display:inline-block;
    }
    .box {
    	border:1px solid lightgray;
    	border-radius:10px; 
    	width:250px;
    	height:140px;
    	display:inline-block;
    	margin:10px;
    	cursor:pointer;
    }
    .box img { 
    	width:10px; height:10px;
		opacity:0.5; margin-right:5px; 
		float:left;
		margin-top:5px;
	}
    .logo {
    	font-size:13px;
		font-weight:normal;
		background-color:gray;
		color:white;
		border-radius:4px;
		padding:3px;
		float:left;
		margin-right:5px;
		margin:10px 10px 0 10px;
    }
    .p_title {
    	font-weight:bold;
    	float:left;
    	margin-top:10px;
    }
    .text {
    	text-align:left;
    	margin-top:45px;
    	padding-left:30px;
    	font-size:13px;
    }
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
	.more_div { display:none; }
</style>
<script>
	$(document).ready(function() {
		$('#more_btn').hover(function() {
		 	$("#more_img").attr("src", "images/btn.png");
		}, function(){
			$("#more_img").attr("src", "images/btn2.png");
		});
	
		$("#more_btn").click(function() {
			
			if (${fn:length(list)-1} <= 3) {
				alert("마지막 페이지입니다");
			} else if ($( ".more_div" ).css( "display" ) == "inline-block") {
				alert("마지막 페이지입니다");
			} else {
				$(".more_div").css("display","inline-block");
			}
			
		
		});
	});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<section class="section">
		<div class="back">
			<p class="title">내 근처의 펫<span>A pet near me</span></p>
			<p class="menu" onclick="location.href='near.do' ">구인</p><span class="span" onclick="location.href='near2.do' ">구직</span>
			<button onclick = "location.href='near_writing2.do'" class="writing_button">글쓰기</button>
			<div class="main">
			<c:forEach var = "vo"  items="${list}"  begin="0" end="3">
				<div class="box" onclick="location.href='near_contents2.do?nid=${vo.nid2}' " >
					<span class="logo">${vo.kind }</span><p class="p_title">${vo.title }</p>
					<div class="text">
						<p><img src="images/id.png">${vo.id }</p>
						<p><img src="images/email2.png">${vo.email }</p>
						<p><img src="images/paw.png">경력 ${vo.work }</p>
						<p><img src="images/map.png">${vo.addr }</p>
					</div>
				</div>
				</c:forEach>
				<c:forEach var = "vo"  items="${list}" begin="4" end="${fn:length(list)-1}" >		
				<div class="box more_div" onclick="location.href='near_contents2.do?nid=${vo.nid}' " >
					<span class="logo">강아지</span><p class="p_title">${vo.title }</p>
					<div class="text">
						<p><img src="images/id.png">${vo.id }</p>
						<p><img src="images/email2.png">${vo.email }</p>
						<p><img src="images/paw.png">경력 ${vo.work }</p>
						<p><img src="images/map.png">${vo.addr }</p>
					</div>
				</div>
				</c:forEach>				
				<div>
				<button type="button" class="btn_style" id="more_btn">more
					<img src="images/btn2.png" id="more_img">
				</button>
			</div>
			</div>		
		</div>
	</section>
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>