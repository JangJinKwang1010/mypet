<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="js/jquery-3.6.0.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
</head>
<style>	
html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video {
        margin: 0;
        padding: 0;
        border: 0;
        font-size:100%;
        vertical-align: baseline;
        background: transparent;
}
.menu1 li {
	display:inline-block;
	margin-right:30px;
	padding: 5px 0;
}
	
	.mainbox2 {
		display:inline-block;
		width:200px; height:500px;
		background-color:white;
		float:left;
	}
	.left_div {
		display:inline-block;
		width:100px;
		float:left;
		text-align:left;
		margin-top:50px; 
		margin-left:50px;
	}
	.left_div>p {
		font-weight:bold;
		font-size:23px;
	}
	.left_div ul { 
	list-style:none; 
	}
	.title_ul {
		margin-top:30px;
		font-size:18px;
		font-weight:bold;
		border-bottom:1px solid;
		width:100px;
		padding:10px 0;
		margin-bottom:10px;
	}
	.menu_ul li {
		margin:5px 0;
		font-size:15px;
	}
	.menu_ul a { text-decoration:none; color:gray; }
	.menu_ul a:hover { text-decoration:underline; }
</style>
<script>

</script>
<body>
	
	<div class ="mainbox2">
		<div class="left_div">
			<ul class="title_ul">
				<li>회원관리</li>
			</ul>
			<ul class="menu_ul">
				<a href="manager_member.do" ><li>일반회원관리</li></a>
			</ul>
			<ul class="title_ul">
				<li>펫관리</li>
			</ul>
			<ul class="menu_ul">
				<a href="manager_pet.do"><li>펫관리</li></a>
			</ul>
			<ul class="title_ul">
				<li>게시물관리</li>
			</ul>
			<ul class="menu_ul">
				<a href="manager_near.do"><li>내 근처의 펫</li></a>
				<a href="manager_diary.do"><li>펫 일기</li></a>
			</ul>		
		</div>			
	</div>
</body>
</html>