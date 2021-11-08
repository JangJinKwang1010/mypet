<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet</title>
<script src="http://localhost:9000/mypet/js/jquery-3.6.0.min.js"></script>
<style>
section {
	width:100%;
	text-align:center;
}
.mainbox{
	border:1px solid white;
	width:65%;
	height:1000px;
	display:inline-block;

}
.title{
	margin-top:60px;
	margin-left:100px;
	float:left;
	font-weight:bold;
	font-size:30px;
}
.title>span{
	margin-left:20px;
	color:gray;
	font-weight:normal;
	font-size:20px;
}
.joinbox{
	border:1px solid white;
	width:80%;
	height:800px;
	display:inline-block;
	margin-top:50px;
}
.joinbox ul{
	list-style:none;
	text-align:left;
	margin-top:30px;
}
.joinbox label{
	font-weight:bold;
}
.joinbox input{
	width:100%;
	height:30px;
	margin-left:3px;
	margin-top:3px;
}
.joinbox li>button{
	border:1px solid;
	margin-top:5px;
	margin-left:10px;
	width:80px;
	height:35px;
	border-radius:10px;
	font-weight:bold;
}
.joinbox li>button:hover{
	background-color:rgb(147,196,228);
	color:white;
}
.joinbox form>button{
	border:1px solid;
	width:80px;
	height:35px;
	border-radius:10px;
	font-weight:bold;
	margin-top:50px;
}
.joinbox form>button:hover{
	background-color:rgb(147,196,228);
	color:white;
}
.pass1 {
	color:gray;
}
</style>
<script>
	$(document).ready(function() {
		$(".join_btn").click(function() {
			joinform.submit();
		});
	});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<section>
		<div class="mainbox">
			<p class="title">회원가입<span>Sign up</span></p>
			<div class="joinbox">
				<form name= "joinform" action= "join_proc.do" method="post">
					<ul>
						<li><label>아이디</label></li>
						<li><input type="text" placeholder="아이디" name="id"></li>
						<li><button>중복확인</button></li>
					</ul>
					<ul>
						<li><label>비밀번호</label></li>
						<li><input type="text" placeholder="비밀번호" name="pass"></li>
					</ul>
					<ul>
						<li><label>비밀번호 확인</label></li>
						<li><input type="text" placeholder="비밀번호 확인"></li>
						<li class="pass1">비밀번호 확인을 위해 다시 한번 입력 해 주세요.</li>
					</ul>
					<ul>
						<li><label>이름</label></li>
						<li><input type="text" placeholder="이름" name="name"></li>
					</ul>
					<ul>
						<li><label>전화 번호</label></li>
						<li><input type="text" placeholder="전화 번호" name="hp"></li>
					</ul>
					<ul>
						<li><label>이메일 주소</label></li>
						<li><input type="text" placeholder="이메일 주소" name="email"></li>
					</ul>
					<button type="button" class="join_btn">가입완료</button>
				</form>
			</div>
		</div>
	</section>
</body>
</html>