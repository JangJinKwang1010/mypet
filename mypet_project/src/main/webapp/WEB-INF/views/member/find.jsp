<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery-3.6.0.min.js"></script>
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
	cursor:pointer;
}
.title>.pass_span {
	margin-left:20px;
	color:gray;
	font-weight:normal;
	font-size:30px;
}
.title>.id_span {
	margin-right:20px;
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
	text-align:left;
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
.id_check{
	border:1px solid rgb(0,128,255);
	margin-top:5px;
	margin-left:10px;
	width:110px;
	height:35px;
	border-radius:10px;
	font-weight:bold;
	background-color:white;
	font-size:14px;
	color:rgb(0,128,255);

}
.id_check:hover{
	background-color:rgb(0,128,255);
	border:none;
	color:white;
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
<script>
	$(document).ready(function(){
		$(".pass_span").click(function(){
			$(".pass_find").css("display","inline-block");
			$(".id_find").css("display","none");
		});
		
		$(".id_span").click(function(){
			$(".id_find").css("display","inline-block");
			$(".pass_find").css("display","none");
		});
	})
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<section class="section">
		<div class="mainbox id_find">
			<p class="title">아이디 찾기<span class="pass_span">비밀번호 찾기</span></p>
			<div class="findbox">
				<form name= "findform" action= "find_proc.do" method="post"  autocomplete="off" >
					<ul>
						<li><label>이름</label></li>
						<li><input type="text" placeholder="이름" name="name" class="form-control" id="name"></li>
					</ul>
					<ul>						
						<li><label>본인확인 이메일로 찾기</label></li>
						<li><input type="text" placeholder="이메일 주소" name="email" class="form-control " id="email"></li>
						<button type="button" class="id_check">인증번호받기</button>
						<li><input type="text" placeholder="인증번호" name="number" class="form-control"></li>
					</ul>
					<button type="button" class="find_btn">다음</button>
				</form>
			</div>
		</div>
		<div class="mainbox pass_find">
			<p class="title"><span class="id_span">아이디 찾기</span>비밀번호 찾기</p>
			<div class="findbox">
				<form name= "findform" action= "find_proc.do" method="post"  autocomplete="off" >
					<ul>
						<li><label>이름</label></li>
						<li><input type="text" placeholder="이름" name="name" class="form-control" id="name"></li>
					</ul>
					<ul>
						<li><label>아이디</label></li>
						<li><input type="text" placeholder="아이디" name="id" class="form-control" id="id"></li>
					</ul>
					<ul>						
						<li><label>본인확인 이메일로 찾기</label></li>
						<li><input type="text" placeholder="이메일 주소" name="email" class="form-control " id="email"></li>
						<button type="button" class="id_check">인증번호받기</button>
						<li><input type="text" placeholder="인증번호" name="number" class="form-control"></li>
					</ul>
					<button type="button" class="join_btn">다음</button>
				</form>
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>