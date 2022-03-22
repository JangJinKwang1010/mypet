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
	.passmsg { color:gray;}
	.pass_find{
		display:none;
	}
</style>
<script>
	$(document).ready(function(){
		var pass_result = false;
		
		/* 비밀번호 - 비밀번호 확인 체크 */
		$("#cpass").blur(function() {
			if ($("#pass").val() != $("#cpass").val() ) { //비밀번호와 비밀번호 확인이 같지 않으면~
				$(".passmsg").text("비밀번호가 동일하지 않습니다.").css("color","red");
				$("#cpass").val("").focus();
				pass_result = false;
			} else { //비밀번호와 비밀번호 확인이 같으면~
				$(".passmsg").text("비밀번호가 동일합니다.").css("color","blue");
				pass_result = true;
			}
		});
		
		$(".pass_btn").click(function() {
			var pass = $("#pass").val();
			if (pass_result) {
				$.ajax({
			        url:"mypage_pass_update_proc.do",
			        type:"post",
			        data: {pass:pass},
			        success:function(result){			       		  
			       		if (result) {
			       			alert("비밀번호 변경이 완료되었습니다");
			       			alert("변경된 비밀번호로 로그인 부탁드립니다")
			       			location.replace("logout.do");
			       		} else {
			       			alert("실패되었습니다");
			       			location.reload();
			       		}			       		
			       	},		
			    });
			} else {
				alert("비밀번호가 일치하지 않습니다");
			}
		});
	})
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<section class="section">
	<div class="mainbox">
		<jsp:include page="mypage_commons.jsp"></jsp:include>
		<div class="main id_pass">
			<p class="title">비밀번호변경</p>
			<div class="findbox">
				<form autocomplete="off" >
					<ul>
						<li><label>새 비밀번호</label></li>
						<li><input type="password" placeholder="비밀번호" name="pass" class="form-control" id="pass"></li>
					</ul>
					<ul>
						<li><label>새 비밀번호확인</label></li>
						<li><input type="password" placeholder="비밀번호확인" name="cpass" class="form-control" id="cpass"></li>
						<li class="passmsg">비밀번호 확인을 위해 다시 한번 입력 해주세요.</li>
					</ul>
					<button type="button" class="pass_btn">확인</button>
				</form>
			</div>
		</div>
	</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>