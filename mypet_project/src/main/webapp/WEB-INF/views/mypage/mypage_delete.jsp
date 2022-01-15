<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery-3.6.0.min.js"></script>
<title>Mypet</title>
<style>
	.section {
		text-align:center;
		background-color:rgb(226,143,173);
	}
	.mainbox {
		width:1300px;
		display:inline-block;
		text-align:center;
		background-color:white;
	}
	.main {
		width:65%;
		display:inline-block;
		border:1px solid lightgray;
		border-radius:30px;
		margin-bottom:100px;
	}
	.title {
		margin-top:60px;
		margin-left:100px;
		float:left;
		font-weight:bold;
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
		margin:50px 0;
	}
	.findbox form>button:hover{
		background-color:rgb(0,68,130);
		color:white;
	}
</style>
<script>
	
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<section class="section">
		<div class="mainbox">
			<jsp:include page="mypage_commons.jsp"></jsp:include>
			<div class="main id_pass">
				<p class="title">회원탈퇴</p>
				<div class="findbox">
					<form name= "findform" action= "find_proc.do" method="post"  autocomplete="off" >
						<ul>
							<li><label>회원탈퇴입력</label></li>
							<li><input type="text" value="회원탈퇴" name="pass" class="form-control" id="pass"></li>
						</ul>
						<ul>
							<li><label>회원탈퇴확인</label></li>
							<li><input type="text" placeholder="비밀번호확인" name="cpass" class="form-control" id="cpass"></li>
							<li>회원탈퇴를 위해 '회원탈퇴'를 입력 해주세요.</li>
						</ul>
						<button type="button" class="join_btn">확인</button>
					</form>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>