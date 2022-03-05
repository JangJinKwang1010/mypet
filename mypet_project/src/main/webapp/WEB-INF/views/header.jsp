<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Insert title here</title>
<!-- <script src="js/jquery-3.6.0.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<style>
html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video {
        margin: 0;
        padding: 0;
        border: 0;
        font-size:100%;
        vertical-align: baseline;
        background: transparent;
}
.menu1 {
	background-color:rgb(245,245,245);
}
.menu2 {
border-bottom:1px solid lightgray;
}
.menu1 li {
	display:inline-block;
	margin-right:30px;
	padding: 5px 0;
}
.menu1 a,.menu2 a {
	color:black;
}
.menu1 a:hover,.menu2 a:hover {
	color:rgb(147,196,228);
}
.menu1 ul {
	text-align:right;
}
.menu2 li {
	display:inline-block;
	margin:0 30px;
	font-size:20px;
	font-weight:bold;
	padding:20px 0px;
}
.menu2 ul {
	text-align:center;
}
@media (min-width:600px) {
	.m-menu1, .m-menu2 { display:none; }
}
@media (max-width : 500px) {
	.menu1 { display:none; }
	.m-menu1 { height:60px; background-color:rgb(72,115,210); }
	.m-menu1 p { color:white; font-weight:bold; padding:5px; font-size:30px; float:left; margin-left:85px; }
	.m-menu1 img { width:45px; height:45px; float:left; margin:5px; }
	.m-menu1 li { 
		margin-top:3px; 
		display:inline-block;
		margin-right:30px;
		padding: 5px 0;
	}
	.m-menu1 a.logout { color:white; float:right; }
	
	.menu2 { display:none; }
	.m-menu2 { display:none; width:300px; height:2100px; background-color:rgb(250,250,250); border:1px solid lightgray; position:absolute; top:0; z-index:999; }
	.m-menu2 img { width:45px; height:45px; float:right; margin:5px; }
	.m-menu2 ul { margin-top:40px; padding:20px 0; }
	.m-menu2 a:first-child>li { border-top:1px solid lightgray; } 
	.m-menu2 li { padding:20px; width:100%; background-color:white; border-bottom:1px solid lightgray; }
	.m-menu2 a { color:black; text-decoration:none; font-size:20px; }
} 
</style>
<script>
	$(document).ready(function() {
		$(".open").click(function() {
			$(".m-menu2").css("display","block");
		});
		
		$(".closed").click(function() {
			$(".m-menu2").css("display","none");
		});
		
		$(".care, .pet").click(function() {
			$.ajax({
                url:"login_check.do",
                type: "post",
                dataType: 'json',
              success:function(result){
                	if (result) {
                		
                	} else {
                		alert("로그인 후 이용부탁드립니다");
                	}
                },                   
             });  
		});	
		
	});
</script>
</head>
<body>
	<div class="menu1">
		<ul>			
			<c:if test = "${empty session_id }">
				<a class="home" href="index.do"><li>HOME</li></a>
			</c:if>
			<c:if test = "${!empty session_id }">
				<a class="home" href="index.do"><li>HOME</li></a>
				<a href="logout.do"><li>로그아웃</li></a>
			</c:if>			
		</ul>		
	</div>
	<div class="m-menu1">
		<img class="open" src="images/m-menu.png">	
		<a href="index.do"><p>Mypet</p></a>	
		<c:if test = "${!empty session_id }">
			<a class="logout" href="logout.do"><li>로그아웃</li></a>
		</c:if>
	</div>
	<div class="menu2">
		<ul>
			<a href="care.do" class="care"><li>돌보미 등록</li></a>
			<a href="pet.do" class="pet"><li>펫 등록</li></a>
			<a href="near.do"><li>내 근처의 펫</li></a>
			<a href="diary.do"><li>펫 일기</li></a>
			<a href="mypage.do"><li>마이페이지</li></a>
		</ul>
	</div>	
	<div class="m-menu2">
		<img class="closed" src="images/m-menu.png">	
		<ul>
			<a href="care.do" class="care"><li>돌보미 등록</li></a>
			<a href="pet.do" class="pet"><li>펫 등록</li></a>
			<a href="near.do"><li>내 근처의 펫</li></a>
			<a href="diary.do"><li>펫 일기</li></a>
			<a href="mypage.do"><li>마이페이지</li></a>
		</ul>
	</div>
</body>
</html>