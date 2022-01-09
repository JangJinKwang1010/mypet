<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	.title {
		margin-top:110px;
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
	.mainbox2 {
		display:inline-block;
		width:100%; height:500px;
		background-color:white;
	}
	.left_div {
		display:inline-block;
		width:250px;
		float:left;
		text-align:left;
		margin-top:50px; 
		margin-left:50px;
	}
	.left_div>p {
		font-weight:bold;
		font-size:23px;
	}
	.left_div ul { list-style:none; }
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
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

	<section class="section">
		<div class="mainbox">
			<p class="title">마이페이지<span>My page</span></p>
			<div class ="mainbox2">
				<div class="left_div">
					<ul class="title_ul">
						<li>회원정보</li>
					</ul>
					<ul class="menu_ul">
						<a href="" ><li>개인정보수정</li></a>
						<a href="" ><li>비밀번호변경</li></a>
						<a href="#"><li>회원탈퇴</li></a>
					</ul>
					
					<ul class="title_ul">
						<li>이용현황</li>
					</ul>
					<ul class="menu_ul">
						<a href=""><li>내 근처의 펫</li></a>
						<a href="#"><li>게시물 관리</li></a>
					</ul>		
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>