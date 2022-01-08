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
.title>span {
	margin-left:20px;
	color:gray;
	font-weight:normal;
	font-size:20px;
}
.joinbox {
	border:1px solid white;
	width:90%;
	display:inline-block;
	margin-top:50px;
}
.joinbox ul {
	list-style:none;
	text-align:left;
	margin-top:30px;
}
.joinbox label {
	font-weight:bold;
}
#addr { width:40%; }
.joinbox input{
	width:100%;
	height:35px;
	margin-left:3px;
	margin-top:3px;
}
.ad{
	border:1px solid rgb(0,128,255);
	margin-top:5px;
	margin-left:10px;
	width:85px;
	height:35px;
	border-radius:10px;
	font-weight:bold;
	background-color:white;
	font-size:14px;
	color:rgb(0,128,255);
}
.ad:hover{
	background-color:rgb(0,128,255);
	border:none;
	color:white;
}
.pass_change{
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
.pass_change:hover{
	background-color:rgb(0,128,255);
	border:none;
	color:white;
}
.joinbox form>button{
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
.joinbox form>button:hover{
	background-color:rgb(0,68,130);
	color:white;
}
.passmsg { color:gray;}

@media (min-width : 600px) {
	.mainbox { border:1px solid lightgray; border-radius:30px; margin-top:50px; padding-bottom:40px; margin-bottom:50px; }
	.joinbox { background-color:rgb(245,245,245); text-align:center; }
	.joinbox input { display:inline-block; }
	.joinbox ul { width:90%; display:inline-block; }
	.joinbox form>button { margin-bottom:20px; }
}

@media (max-width : 500px) {
	.mainbox { width:85%; margin-bottom:50px; }
	.title { margin-left:0; }
	.joinbox { width:100%; }
	.joinbox input { height:40px; }
	.joinbox form>button { width:50%; }
}
</style>
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<section class="section">
		<div class="mainbox">
			<p class="title">마이페이지<span>My Page</span></p>
			<div class="joinbox">
				<form name= "joinform" action= "join_proc.do" method="post"  autocomplete="off" >
					<ul>						
						<li><label>아이디</label></li>
						<li><input type="text" value="${session_id}" class="form-control" readonly></li>
					</ul>
					<ul>
						<li><label>비밀번호</label></li>						
						<li><input type="text" value="비공개" class="form-control" readonly></li>
						<li><button type="button" class="pass_change">비밀번호 변경</button></li>
					</ul>
					<ul>
						<li><label>이름</label></li>
						<li><input type="text" value="${session_name}" class="form-control" readonly></li>
					</ul>
					<ul>
						<li><label>휴대폰 번호</label></li>
						<li><input type="text" value="010-1212-1212" class="form-control" readonly></li>
					</ul>
					<ul>
						<li><label>이메일 주소</label></li>
						<li><input type="text" value="test2@naver.com" class="form-control"></li>
					</ul>
					<ul>
						<li><label>주소</label></li>
						<li><input type="text" placeholder="주소" name="addr1" class="form-control " id="addr1" onclick="addr()" readonly></li>						<li><input type="text" placeholder="상세 주소" name="addr2" class="form-control " id="addr2" ></li>
						<li><button type="button" class="ad" onclick="addr()">주소변경</button></li>
					</ul>
					<button type="button" class="join_btn">수정완료</button>
				</form>
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>