<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
</style>
</head>
<body>
				<div class="left_div">
					<ul class="title_ul">
						<li>회원정보</li>
					</ul>
					<ul class="menu_ul">
						<a href="mypage_update.do" ><li>개인정보수정</li></a>
						<a href="pass_change.do" ><li>비밀번호변경</li></a>
						<a href="membership_withdrawal.do"><li>회원탈퇴</li></a>
					</ul>
					
					<ul class="title_ul">
						<li>이용현황</li>
					</ul>
					<ul class="menu_ul">
						<a href=""><li>내 근처의 펫</li></a>
						<a href="#"><li>게시물 관리</li></a>
					</ul>	
</body>
</html>