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
		var number = Math.floor(Math.random() * 100000) + 100000;
        if(number>100000){ number = number - 10000; }
        $("#text").val(number);      /* 난수로 생성된 인증번호를 hidden name : text 에 숨긴다 */  
		
		
		$(".pass_span").click(function(){
			$(".pass_find").css("display","inline-block");
			$(".id_find").css("display","none");
		});
		
		$(".id_span").click(function(){
			$(".id_find").css("display","inline-block");
			$(".pass_find").css("display","none");
		});
		
		
		$(".id_find_check").click(function() {
			if ($("#name").val() == "") {
				alert("이름을 입력해주세요");
				$("#name").focus();
			} else if ($("#email").val() == "") {
				alert("이메일을 입력해주세요");
				$("#email").focus();
			} else {
				$.ajax({
	                   url:"id_find_check.do",
	                   type:"post",
	                   data: {
	                	 	name:$("#name").val(),
	                	 	email:$("#email").val()
	                   }, 
	                   success:function(result){
		   		       		if (result) {
			   		       		var con_test = confirm("해당 이메일로 인증번호를 발송하시겠습니까?");        
			   		          	if(con_test == true){   
			   		               $.ajax({
			   		                   url:"sendEmail.do",
			   		                   type:"post",
			   		                   data: {
			   		                	 	email: $("#email").val(),
			   		                        text: $("#text").val()
			   		                   }, 
			   		                 success:function(){
			   		                   alert("해당 이메일로 인증번호를 발송했습니다");
			   		                   $(".number").focus();
			   		                 },                   
			   		                }); 
			   		          	}
		   		       		} else {
		   		       			alert("일치하는 정보가 없습니다");		 
		   		       			$("#name").val("");
		   		       			$("#email").val("");
		   		       		}	   		       		
	                   }
	                });  
			}
		});
		
		$(".pass_find_check").click(function() {
			if ($("#id").val() == "") {
				alert("아이디를 입력해주세요");
				$("#id").focus();
			} else if ($("#p_name").val() == "") {
				alert("이름을 입력해주세요");
				$("#p_name").focus();
			} else if ($("#p_email").val() == "") {
				alert("이메일을 입력해주세요");
				$("#p_email").focus();
			} else {
				$.ajax({
	                   url:"pass_find_check.do",
	                   type:"post",
	                   data: {
	                	   	id:$("#id").val(),
	                	 	name:$("#p_name").val(),
	                	 	email:$("#p_email").val()
	                   }, 
	                   success:function(result){
		   		       		if (result) {
			   		       		var con_test = confirm("해당 이메일로 인증번호를 발송하시겠습니까?");        
			   		          	if(con_test == true){   
			   		               $.ajax({
			   		                   url:"sendEmail.do",
			   		                   type:"post",
			   		                   data: {
			   		                	 	email: $("#p_email").val(),
			   		                        text: $("#text").val()
			   		                   }, 
			   		                 success:function(){
			   		                   alert("해당 이메일로 인증번호를 발송했습니다");
			   		                   $(".p_number").focus();
			   		                 },                   
			   		                });  
			   		          	}
		   		       		} else {
		   		       			alert("일치하는 정보가 없습니다");		 
		   		       			$("#id").val("");
		   		       			$("#p_name").val("");
		   		       			$("#p_email").val("");
		   		       		}
	   		       		}
	                });  
			}
		});
		
		$(".id_find_btn").click(function() {
			if ($(".number").val() == "") {
				alert("인증번호를 입력해주세요");
				$(".number").focus();
			} else if ($("#text").val() != $(".number").val()) {
				alert("인증번호가 일치하지 않습니다");
				$(".number").val("").focus();
			} else {
				idfindform.submit();
			}
		});
		
		$(".pass_find_btn").click(function() {
			if ($(".p_number").val() == "") {
				alert("인증번호를 입력해주세요");
				$(".p_number").focus();
			} else if ($("#text").val() != $(".p_number").val()) {
				alert("인증번호가 일치하지 않습니다");
				$(".p_number").val("").focus();
			} else {
				passfindform.submit();
			}
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
				<form name= "idfindform" action= "id_find_proc.do" method="post"  autocomplete="off" >
					<ul>
						<li><label>이름</label></li>
						<li><input type="text" placeholder="이름" name="name" class="form-control" id="name"></li>
					</ul>
					<ul>						
						<li><label>본인확인 이메일로 찾기</label></li>
						<li><input type="text" placeholder="이메일 주소" name="email" class="form-control " id="email"></li>
						<li><button type="button" class="id_check id_find_check"" >인증번호받기</button></li>
						<li><input type="text" placeholder="인증번호" name="number" class="form-control number"></li>
					</ul>
					<button type="button" class="find_btn id_find_btn">다음</button>
				</form>
			</div>
		</div>
		<div class="mainbox pass_find">
			<p class="title"><span class="id_span">아이디 찾기</span>비밀번호 찾기</p>
			<div class="findbox">
				<form name= "passfindform" action= "pass_find_proc.do" method="post"  autocomplete="off" >					
					<ul>
						<li><label>아이디</label></li>
						<li><input type="text" placeholder="아이디" name="id" class="form-control" id="id"></li>
					</ul>
					<ul>
						<li><label>이름</label></li>
						<li><input type="text" placeholder="이름" name="name" class="form-control" id="p_name"></li>
					</ul>
					<ul>						
						<li><label>본인확인 이메일로 찾기</label></li>
						<li><input type="text" placeholder="이메일 주소" name="email" class="form-control " id="p_email"></li>
						<li><button type="button" class="id_check pass_find_check">인증번호받기</button></li>
						<li><input type="text" placeholder="인증번호" name="number" class="form-control p_number"></li>
					</ul>
					<button type="button" class="join_btn pass_find_btn">다음</button>
					<input type="hidden" id="text">
				</form>
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>