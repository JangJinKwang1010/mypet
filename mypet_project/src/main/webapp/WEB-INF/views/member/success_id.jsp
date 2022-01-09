<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section {
	width:100%;
	text-align:center;
}
.mainbox {
	width:65%;
	display:inline-block;
}
.title {
	margin-top:60px;
	margin-left:100px;
	float:left;
	font-weight:bold;
	font-size:30px;
}
.title>.pass_span {
	margin-left:20px;
	color:gray;
	font-weight:normal;
	font-size:30px;
}
.findbox {
	border:1px solid white;
	width:90%;
	display:inline-block;
	margin-top:50px;
}
.findbox ul {
	list-style:none;
	text-align:center;
	margin-top:30px;
}
.findbox label {
	font-weight:bold;
}
.findbox input{
	width:100%;
	height:35px;
	margin-left:3px;
	margin-top:3px;
}

.findbox form>button{
	background-color:rgb(0,89,171);
	width:20%;
	height:50px;
	color:white;
	font-weight:bold;
	font-size:20px;
	border:none;
	border-radius:10px;
	margin-top:50px;
}
.findbox form>button:hover{
	background-color:rgb(0,68,130);
	color:white;
}
.passmsg { color:gray;}
.pass_find{
	display:none;
}

@media (min-width : 600px) {
	.mainbox { border:1px solid lightgray; border-radius:30px; margin-top:50px; padding-bottom:40px; margin-bottom:50px; }
	.findbox { background-color:rgb(245,245,245); text-align:center; }
	.findbox input { display:inline-block; }
	.findbox ul { width:90%; display:inline-block; }
	.findbox form>button { margin-bottom:20px; }
}

@media (max-width : 500px) {
	.mainbox { width:85%; margin-bottom:50px; }
	.title { margin-left:0; }
	.findbox { width:100%; }
	.findbox input { height:40px; }
	.findbox form>button { width:50%; }
}
</style>

</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<section class="section">
		<div class="mainbox id_find">
			<p class="title">아이디 찾기<span class="pass_span">비밀번호 찾기</span></p>
			<div class="findbox">
				<form name= "findform" action= "find_proc.do" method="post"  autocomplete="off" >
					<ul>
						<li><label>보유 계정</label></li>
						<li>고객님의 아이디는 @@@@3432 입니다.</li>
					</ul>
					<button type="button" class="find_btn" onclick="location.href='index.do'">로그인</button>
				</form>
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>