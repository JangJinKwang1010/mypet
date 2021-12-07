<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/address.js"></script>
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
.joinbox li>button{
	border:1px solid rgb(0,128,255);
	margin-top:5px;
	margin-left:10px;
	width:80px;
	height:35px;
	border-radius:10px;
	font-weight:bold;
	background-color:white;
	font-size:14px;
	color:rgb(0,128,255);
}
.joinbox li>button:hover{
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
<script>
var id_result = 0; // 중복확인 했는지 체크하기 위한 변수

	$(document).ready(function() {
		$(".join_btn").click(function() {
			if ($("#id").val() == "" ) {
				alert("아이디를 입력해주세요");
				$("#id").focus();
			} else if ($("#pass").val() == "") {
				alert("비밀번호를 입력해주세요");
				$("#pass").focus();
			} else if ($("#cpass").val() == "") {
				alert("비밀번호 확인을 입력해주세요");
				$("#cpass").focus();
			} else if ($("#name").val() == "") {
				alert("이름을 입력해주세요");
				$("#name").focus();
			} else if ($("#hp").val() == "") {
				alert("휴대폰 번호를 입력해주세요");
				$("#hp").focus();
			} else if ($("#email").val() == "") {
				alert("이메일 주소를 입력해주세요");
				$("#eamil").focus();
			} else if ($("#addr1").val() == "") {
				alert("주소를 입력해주세요");
				$("#addr1").focus();
			} else if ($("#addr2").val() == "") {
				alert("상세 주소를 입력해주세요");
				$("#addr2").focus();				
			} else if(id_result == 0) {
				alert("아이디 중복확인 버튼을 클릭해주세요");
				$(".id_check").focus();
			} else {
				joinform.submit();				
			}
		});
		
		/* 비밀번호 - 비밀번호 확인 체크 */
		$("#cpass").blur(function() {
			if ($("#pass").val() != $("#cpass").val() ) { //비밀번호와 비밀번호 확인이 같지 않으면~
				$(".passmsg").text("비밀번호가 동일하지 않습니다.").css("color","red");
				$("#cpass").val("").focus();
			} else { //비밀번호와 비밀번호 확인이 같으면~
				$(".passmsg").text("비밀번호가 동일합니다.").css("color","blue");
			}
		});
		
		/** 중복확인 **/
		$(".id_check").click(function() {
			var id = $("#id").val();
			if($("#id").val() == "") {
				alert("아이디를 입력해주세요");
				$("#id").focus();
			} else {
				$.ajax({
			        url:"id_check.do",
			        type:"post",
			        data: {
			     	 	 id: id,
			        }, 
			        dataType:"json",
			      success:function(result){
			      		if (result) { //true이면 사용 가능 아이디
			      			alert("사용 가능한 아이디입니다");
			      			id_result = 1;
			      			$("#pass").focus();
			      		} else { //false이면 이미 존재하는 아이디
			      			alert("이미 존재하는 아이디입니다.")
			      			$("#id").val("").focus(); 
			      		}
			        },
			        
			     });  
			}
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
				<form name= "joinform" action= "join_proc.do" method="post"  autocomplete="off" >
					<ul>
						<li><label>아이디</label></li>
						<li><input type="text" placeholder="아이디" name="id" class="form-control" id="id"></li>
						<li><button type="button" class="id_check">중복확인</button></li>
					</ul>
					<ul>
						<li><label>비밀번호</label></li>
						<li><input type="password" placeholder="비밀번호" name="pass" class="form-control" id="pass"></li>
					</ul>
					<ul>
						<li><label>비밀번호 확인</label></li>
						<li><input type="password" placeholder="비밀번호 확인" class="form-control" id="cpass"></li>
						<li class="passmsg">비밀번호 확인을 위해 다시 한번 입력 해 주세요.</li>
					</ul>
					<ul>
						<li><label>이름</label></li>
						<li><input type="text" placeholder="이름" name="name" class="form-control" id="name"></li>
					</ul>
					<ul>
						<li><label>휴대폰 번호</label></li>
						<li><input type="text" placeholder="휴대폰 번호(-제외)" name="hp" class="form-control" id="hp"></li>
					</ul>
					<ul>
						<li><label>이메일 주소</label></li>
						<li><input type="text" placeholder="이메일 주소" name="email" class="form-control " id="email"></li>
					</ul>
					<ul>
						<li><label>주소</label></li>
						<li><input type="text" placeholder="주소" name="addr1" class="form-control " id="addr1"></li>
						<li><input type="text" placeholder="상세 주소" name="addr2" class="form-control " id="addr2"></li>
						<li><button type="button" onclick="addr()">주소검색</button></li>
					</ul>
					<button type="button" class="join_btn">가입완료</button>
				</form>
			</div>
		</div>
	</section>
</body>
</html>