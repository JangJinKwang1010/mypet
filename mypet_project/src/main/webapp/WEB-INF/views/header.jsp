<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.menu1{
	background-color:rgb(245,245,245);
}
.menu2{
border-bottom:1px solid lightgray;
}
.menu1 li{
	display:inline-block;
	margin-right:30px;
	padding: 5px 0;
}
.menu1 a,.menu2 a{
	color:black;
}
.menu1 a:hover,.menu2 a:hover{
	color:rgb(147,196,228);
}
.menu1 ul{
	text-align:right;
}
.menu2 li{
	display:inline-block;
	margin:0 30px;
	font-size:20px;
	font-weight:bold;
	padding:20px 0px;
}
.menu2 ul{
	text-align:center;
}

</style>

</head>

<body>
	<div class="menu1">
		<ul>
			<a href="http://localhost:9000/mypet/index.do"><li>HOME</li></a>
		</ul>
	</div>
	<div class="menu2">
		<ul>
			<a href="http://localhost:9000/mypet/care.do"><li>돌보미 등록</li></a>
			<li>펫 등록</li>
			<li>내 근처의 펫</li>
			<li>펫 일기</li>
			<li>마이페이지</li>
		</ul>
	</div>
</body>
</html>