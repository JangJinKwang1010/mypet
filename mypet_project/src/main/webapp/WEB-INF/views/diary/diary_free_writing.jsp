<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		margin-bottom:-20px;
	}
	.writing_line{
		display:inline-block;
		border-top:1px solid;
		width:90%;
		}
	.mainbox2>.writing_select{
		display:inline-block;
		width:90%;
		height:40px;
	}
	.mainbox2>.writing_title{
		display:inline-block;
		width:90%;
		height:40px;
	}
	.mainbox2>.writing_content{
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
		.section { background-color:rgb(247,179,42); }
		.mainbox { width:1300px; }
	}
</style>
<script>
	$(document).ready(function() {
		$(".writing_button").click(function() {
			if($(".writing_title").val() == "") {
				alert("제목을 입력해주세요");
				$(".writing_title").focus();
			} else if ($(".writing_content").val() == "") {
				alert("내용을 입력해주세요");
				$(".writing_content").focus();
			} else {
				 var form1 = $("#form").serialize();
			     
					$.ajax({
				        url:"free_upload.do",
				        type:"post",
				        data: form1,
				        success:function(result){
				       		if (result) {
				       			alert("글이 등록되었습니다");
				       			location.replace('diary.do');
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
			<p class="title">펫 일기<span>Pet Diary</span></p>
			<form autocomplete="off"  id="form">
				<div class ="mainbox2 freebox">
					<p class="subtitle">글쓰기</p>
					<div class="writing_line"></div>
					<select class="writing_select form-select">
						<option>자유게시판</option>
					</select>
					<input type="text" class="writing_title form-control" placeholder="제목을 입력해주세요." name="ftitle">
					<textarea class="writing_content form-control" placeholder="내용을 입력해주세요." name="fcontent"></textarea>
					<button type="button" class="writing_button">글쓰기</button>
				</div>
			</form>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>