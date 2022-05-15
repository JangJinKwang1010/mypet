<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<style>	
	.title_div {
		width:100%;
		height:200px;
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
		width:200px; height:500px;
		background-color:white;
		float:left;
	}
	.left_div {
		display:inline-block;
		width:100px;
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
		 text-decoration:none; color:gray;
	}
	.menu_ul li:hover { text-decoration:underline; cursor:pointer; }
</style>
<script>
	$(document).ready(function() {
		$(".mypage_update").click(function() {
			$.ajax({
		        url:"mypage_pass_proc.do",
		        type:"post",
		        success:function(result){			       		  
		       		if (result) {
		       			location.replace("mypage_update.do"); 		
		       		} else {
		       			alert("비밀번호 확인 후 이용가능합니다");
		       		}
		       	},		
		    });
		});
		
		$(".mypage_pass").click(function() {
			$.ajax({
		        url:"mypage_pass_proc.do",
		        type:"post",
		        success:function(result){			       		  
		       		if (result) {
		       			location.replace("mypage_pass.do"); 		
		       		} else {
		       			alert("비밀번호 확인 후 이용가능합니다");
		       		}
		       	},		
		    });
		});
		
		$(".mypage_delete").click(function() {
			$.ajax({
		        url:"mypage_pass_proc.do",
		        type:"post",
		        success:function(result){			       		  
		       		if (result) {
		       			location.replace("mypage_delete.do"); 		
		       		} else {
		       			alert("비밀번호 확인 후 이용가능합니다");
		       		}
		       	},		
		    });
		});
		
		$(".mypage_near").click(function() {
			$.ajax({
		        url:"mypage_pass_proc.do",
		        type:"post",
		        success:function(result){			       		  
		       		if (result) {
		       			location.replace("mypage_near.do"); 		
		       		} else {
		       			alert("비밀번호 확인 후 이용가능합니다");
		       		}
		       	},		
		    });
		});
		
		$(".mypage_post").click(function() {
			$.ajax({
		        url:"mypage_pass_proc.do",
		        type:"post",
		        success:function(result){			       		  
		       		if (result) {
		       			location.replace("mypage_post.do"); 		
		       		} else {
		       			alert("비밀번호 확인 후 이용가능합니다");
		       		}
		       	},		
		    });
		});
		
		$(".mypage_heart").click(function() {
			$.ajax({
		        url:"mypage_pass_proc.do",
		        type:"post",
		        success:function(result){			       		  
		       		if (result) {
		       			location.replace("mypage_heart.do"); 		
		       		} else {
		       			alert("비밀번호 확인 후 이용가능합니다");
		       		}
		       	},		
		    });
		});
		
		$(".mypage_career").click(function() {
			$.ajax({
		        url:"mypage_pass_proc.do",
		        type:"post",
		        success:function(result){			       		  
		       		if (result) {
		       			location.replace("mypage_career.do"); 		
		       		} else {
		       			alert("비밀번호 확인 후 이용가능합니다");
		       		}
		       	},		
		    });
		});
		
		$(".mypage_pet").click(function() {
			$.ajax({
		        url:"mypage_pass_proc.do",
		        type:"post",
		        success:function(result){			       		  
		       		if (result) {
		       			location.replace("mypage_pet.do"); 		
		       		} else {
		       			alert("비밀번호 확인 후 이용가능합니다");
		       		}
		       	},		
		    });
		});
		
	});
</script>
<body>
	<div class="title_div"><p class="title">마이페이지<span>My page</span></p></div>
	<div class ="mainbox2">
		<div class="left_div">
			<ul class="title_ul">
				<li>회원정보</li>
			</ul>
			<ul class="menu_ul">
				<li class="mypage_update">개인정보수정</li>
				<li class="mypage_pass">비밀번호변경</li>
				<li class="mypage_delete">회원탈퇴</li>
				<li  class="mypage_career">경력 관리 </li>
				<li  class="mypage_pet">펫 관리</li>
			</ul>
			
			<ul class="title_ul">
				<li>이용현황</li>
			</ul>
			<ul class="menu_ul">
				<li  class="mypage_near">내 근처의 펫</li>
				<li class="mypage_post">게시물 관리</li>
				<li class="mypage_heart">좋아요 관리</li>
			</ul>		
		</div>			
	</div>
</body>
</html>