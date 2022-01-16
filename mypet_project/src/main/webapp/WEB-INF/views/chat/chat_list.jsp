<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet</title>
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
	section { width:800px; height:910px; }
	.title {
		background-color:rgb(72,115,210);
		color:white;
		text-align:center;
		height:40px;
		font-weight:bold;
		font-size:20px;
		padding-top:15px;
	}
	.left {
		width:300px; height:95%;
		background-color:white;
		display:inline-block; float:left;
		overflow-y: scroll; overflow-x: hidden;
	}
	.left_box {
		width:93%; height:80px;
		background-color:white;
		border-bottom:1px solid lightgray;
		border-right:1px solid lightgray;
		padding-top:20px; padding-left:20px;
	}
	.left_img {
		width:50px; height:50px;
		border:1px solid lightgray;
		border-radius:50px; display:inline-block;
		float:left;
	}
	.left_img>img { border-radius:50px; }
	.left_box>p { margin-left:10px; float:left; }
	.left_box>p:nth-child(2) { font-size:16px; font-weight:bold; }
	.left_box>p:last-child { font-size:14px; margin-top:5px; color:gray; }
	
	.center { background-color:rgb(240,240,240); width:500px; height:95%; display:inline-block; float:right; }
	.center_chat { width:100%; height:800px; overflow-y: scroll; overflow-x: hidden; }
	.center_chat>.you { float:left; width:300px; height:50px; border-radius:10px; background-color:white; margin:10px; }
	.center_chat>.me { float:right; width:300px; height:50px; border-radius:10px; background-color:white; margin:10px; }
	.center_enter { background-color:white; width:100%; height:100px; }
	.center_enter>input { width:80%; height:50px; margin:5px; border:1px solid lightgray; }
	.center_enter>button {
		width:13%; height:50px;
		float:right; margin:5px;
		border:1px solid lightgray;
	}
	
	.foot { background-color:rgb(72,115,210); width:100%; height:5.5%; float:left; }
</style>
<body>
	<section>
		<div class="title">채팅 목록</div>
		<div class="left">
			<div class="left_box">
				<div class="left_img">
					<img src="images/human2.png" width=100%; height=100%;>
				</div>	
				<p>장진광바멍똥(장진광)</p><br>
				<p>안뇽</p>			
			</div>
			<div class="left_box"></div>
			<div class="left_box"></div>
			<div class="left_box"></div>
			<div class="left_box"></div>
			<div class="left_box"></div>
			<div class="left_box"></div>
			<div class="left_box"></div>
			<div class="left_box"></div>
			<div class="left_box"></div>
			<div class="left_box"></div>
		</div>
		<div class="center">
			<div class="center_chat">
				<div class="you"></div>
				<div class="me"></div>
				<div class="me"></div>
				<div class="me"></div>
				<div class="you"></div>
				<div class="me"></div>
				<div class="me"></div>
				<div class="me"></div>
				<div class="me"></div>
				<div class="me"></div>
				<div class="me"></div>
				<div class="me"></div>
				<div class="me"></div>
				<div class="me"></div>
			</div>
			<div class="center_enter">
				<input type="text" class="form-control">
				<button>전송</button>
			</div>
		</div>
		<div class="foot"></div>
	</section>
</body>
</html>