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
		/* 비밀번호 - 비밀번호 확인 체크 */
		$("#cpass").blur(function() {
			if ($("#pass").val() != $("#cpass").val() ) { //비밀번호와 비밀번호 확인이 같지 않으면~
				$(".passmsg").text("비밀번호가 동일하지 않습니다.").css("color","red");
				$("#cpass").val("").focus();
			} else { //비밀번호와 비밀번호 확인이 같으면~
				$(".passmsg").text("비밀번호가 동일합니다.").css("color","blue");
			}
		});
		
		$(".change_btn").click(function() {
			if ($("#pass").val() == "") {
				alert("비밀번호를 입력해주세요");
				$("#pass").focus();
			} else if ($("#cpass").val() == "") {
				alert("비밀번호 확인을 입력해주세요");
				$("#cpass").focus();
			} else {
				$.ajax({
	                   url:"pass_change_proc.do",
	                   type:"post",
	                   data: {
	                	   	pass:$("#pass").val(),
	                	   	id:"${vo.id}"
	                   }, 
	                   success:function(result){
		   		       		if (result) {
			   		       		alert("비밀번호가 변경되었습니다");
		   		       		} else {
		   		       			alert("비밀번호가 변경되지 않았습니다");	
		   		       		}
		   		       	location.replace('index.do');
	   		       		}
	                });  
			}
		});
	})
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<section class="section">
		<div class="mainbox id_pass">
			<p class="title"><span class="id_span">아이디 찾기</span>비밀번호 찾기</p>
			<div class="findbox">
				<form name= "passchange" action= "pass_change_proc.do" method="post"  autocomplete="off" >
					<ul>
						<li><label>새비밀번호</label></li>
						<li><input type="password" placeholder="비밀번호" name="pass" class="form-control" id="pass"></li>
					</ul>
					<ul>
						<li><label>비밀번호확인</label></li>
						<li><input type="password" placeholder="비밀번호확인" name="cpass" class="form-control" id="cpass"></li>
						<li class="passmsg">비밀번호 확인을 위해 다시 한번 입력 해주세요.</li>
					</ul>
					<button type="button" class="change_btn">확인</button>
				</form>
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>