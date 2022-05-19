<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet</title>
<script src="js/jquery-3.6.0.min.js"></script>
<style>
	.section {
		text-align:center;
	}
	.mainbox {
		width:1200px;
		display:inline-block;
		text-align:center;
		background-color:white;
	}
	.title {
		margin-top:110px;
		margin-left:100px;
		margin-bottom:60px;
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
		border-radius:10px;
		border:1px solid lightgray;
		display:inline-block;
		width:1000px;
		background-color:rgb(245,245,245);
		margin-bottom:100px;
	}
	.subtitle {
		margin-top:60px;
		margin-left:70px;
		float:left;
		font-weight:bold;
		font-size:25px;
		margin-bottom:-10px;
	}
	.writing_line{
		display:inline-block;
		border-top:1px solid;
		width:90%;
		}
	.mainbox2 .pet_select{
		display:inline-block;
		height:40px;
		margin:3px 0 1px 0;
	}
	.mainbox2 .date{
		display:inline-block;
		width:27%;
		height:40px;
		margin:3px 0 1px 0;
	}
	.mainbox2 .writing_title{
		display:inline-block;
		width:90%;
		height:40px;
	}
	.mainbox2 .writing_content{
		display:inline-block;
		margin-top:3px;
		width:90%;
		height:600px;
	}
	.writing_button {
		float:center;
		border:none;
		width:20%;
		height:50px;
		border-radius:10px;
		font-weight:bold;
		margin-top:20px;
		background-color:rgb(72,115,210);
		color:white;
		font-size:20px;
		margin-bottom:25px;		
	}`
	.writing_button:hover {
		background-color:rgb(0,68,130);
		color:white;
	}
	@media (min-width : 600px) {		
		.section { background-color:rgb(200,171,217); }
		.mainbox { width:1300px; }
	}
</style>
<script>
	$(document).ready(function() {
		$(".writing_button").click(function() {
			 if ($("#work").val() == "선택") {
				alert("경력을 선택해주세요");
				$("#work").focus();
			} else if ($("#title").val() == "") {
				alert("제목을 입력해주세요");
				$("#title").focus();
			} else if ($("#content").val() == "") {
				alert("내용을 입력해주세요");
				$("#content").focus();
			} else {
			    var form1 = $("#form").serialize();
			     
				$.ajax({
			        url:"near_upload2.do",
			        type:"post",
			        data: form1,
			        success:function(result){
			       		if (result) {
			       			alert("글이 등록되었습니다");
			       			location.replace('near2.do');
			       		} else {
			       			alert("글이 등록되지 않았습니다");		       
			       			location.reload();
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
		<section class="section">
		<div class="mainbox">
			<p class="title">내 근처의 펫<span>A pet near me</span></p>
			<div class ="mainbox2 freebox">
				<p class="subtitle">글쓰기</p>
				<div class="writing_line"></div>
				<form id="form">		
				<select class="pet_select form-select" style="width:90%" name="kind" id="kind">
					<option value="선택">펫 선택</option>
					<option value="강아지">강아지</option>
					<option value="고양이">고양이</option>
					</select>	
				<select class="pet_select form-select" style="width:90%" name="work" id="work">
					<option value="선택">경력 선택</option>
					<option value="1년">1년</option>
					<option value="2년">2년</option>
					<option value="3년">3년</option>
					<option value="4년">4년</option>
					<option value="5년 이상">5년 이상</option>
				</select>
				<input type="text" class="writing_title form-control" placeholder="제목을 입력해주세요." name="title" id="title">
				<textarea class="writing_content form-control" placeholder="내용을 입력해주세요." name="content" id="content"></textarea>
				<button type="button" class="writing_button">글쓰기</button>
				</form>
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>