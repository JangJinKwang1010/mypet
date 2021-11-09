<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet</title>
<style>
section { text-align:center; }
.logo {
	text-align:center;
	display:inline-block;
}
.logo>div {
	display:inline-block;
}
.indexname{	
	width:715px;
	height:500px;
	text-align:center;
}
.indexcat {
	float:right;
}
.indexdog {
	float:left;
}
.loginbox {
	margin-top:20px;
	display:inline-block;
	border:1px solid lightgray;
	border-radius:20px;
	width:70%;
	height:90%;
}
.loginboxhigh{
	background-color:rgb(245,245,245);
	border-top-left-radius:20px;
	border-top-right-radius:20px;
	width:100%;
	height:25%;
}
.loginboxhigh>p{
	font-size:40px;
	font-weight:bold;
	display:inline-block;
	float:left;
	margin: 25px;
}
.loginboxhigh>a{
	border:2px solid black;
	border-radius:30px;
	background-color:white;
	float:right;
	padding:10px 15px;
	margin:35px;
	font-weight:bold;
	text-decoration:none;
	color:black;
}
.loginboxhigh>a:hover{
	color:white;
	background-color:rgb(72,115,210);
}
.loginboxmiddle{
	text-align:center;
	width:100%;
	height:70%;
}
.login{
	display:inline-block;
	width:80%;
	height:200px;
	background-color:rgb(245,245,245);
	margin-top:30px;
}
#id{
	background-image:url("http://localhost:9000/mypet/images/usericon.png");
	background-position:5px center;
	background-repeat:no-repeat;
}
#pass{
	background-image:url("http://localhost:9000/mypet/images/passicon.png");
	background-position:5px center;
	background-repeat:no-repeat;
}
.login ul{
	list-style:none;
}
.login input{
	border:none;
	width:80%;
	height:45px;
	margin-top: 10px;
	padding-left:40px;
}
.login li:first-child input{
	margin-top:20px;
}
.login a{
	text-decoration:underline;
	float:right;
	margin:15px 40px;
	
}
.loginboxmiddle button{
	background-color:rgb(72,115,210);
	width:20%;
	height:50px;
	color:white;
	font-weight:bold;
	font-size:20px;
	border:none;
	margin-top:30px;
}
.banner{
	width:100%;
	height:250px;
	background-image:url("http://localhost:9000/mypet/images/banner.png");
	margin-top:250px;
	text-align:center;
}
.banner>div{
	position:relative;
	width:300px;
	height:300px;
	display:inline-block;
	border:1px solid lightgray;
	bottom:200px;
	background-color:white;
	margin:0 5px;
	border-radius:30px;
}
.banner>div>img{
	width:80px;
	height:80px;
	margin-top:20px;
}
.banner>div>p{
	font-weight:bold;
	font-size:20px;
	margin-top:5px;
}
.bannermenu1:hover{
	background-color:rgb(147,196,228);
	color:white;
}
.bannermenu2:hover{
	background-color:rgb(168,199,123);
	color:white;
}
.bannermenu3:hover{
	background-color:rgb(200,171,217);
	color:white;
}
.bannermenu4:hover{
	background-color:rgb(247,179,42);
	color:white;
}
</style>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<div class="logo">
		<div class="indexdog">
			<img src="images/indexdog.jpg" width=400px; height=500px;>
		</div>
		<div class="indexname">
			<div class="loginbox">
				<div class="loginboxhigh">
					<p>로그인</p>
					<a href="http://localhost:9000/mypet/join.do">회원가입</a>
				</div>
				<div class="loginboxmiddle">
					<form>
						<div class="login">
							<ul>
								<li>
									<input type="text" placeholder="아이디를 입력하세요."id="id">
								</li>
								<li>
									<input type="password" placeholder="비밀번호를 입력하세요."id="pass">
								</li>
							</ul>
							<a>아이디/비밀번호 찾기</a>
						</div>
					<button>로그인</button>
					</form>
				</div>
			</div>
		</div>
		<div class="indexcat">
			<img src="images/indexcat.jpg" width=400px; height=500px;>
		</div>
		<div class="banner">	
			<div class="bannermenu1">
				<img src="http://localhost:9000/mypet/images/bannericon1.png">
				<p>돌보미 등록</p>
			</div>
			<div class="bannermenu2">
				<img src="http://localhost:9000/mypet/images/bannericon4.png">
				<p>펫 등록</p>
			</div>
			<div class="bannermenu3">
				<img src="http://localhost:9000/mypet/images/bannericon3.png">
				<p>내 근처의 펫</p>
			</div>
			<div class="bannermenu4">
				<img src="http://localhost:9000/mypet/images/bannericon2.png">
				<p>펫 일기</p>
			</div>
		</div>
	</div>
</section>
</body>
</html>