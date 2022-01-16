<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/summernote/summernote-lite.js"></script>
<script src="js/summernote/lang/summernote-ko.KR.js"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<link href="css/summernote/summernote-lite.css" rel ="stylesheet">

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
	.mainbox2>.writing_title{
	display:inline-block;
	width:90%;
	height:40px;
	}
	.mainbox2 form>.writing_content{
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
	}
	.writing_button:hover {
		background-color:rgb(0,68,130);
		color:white;
	}
	.editor{
	display:inline-block;
	}
	@media (min-width : 600px) {		
		.section { background-color:rgb(247,179,42); }
		.mainbox { width:1300px; }
	}
</style>
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: 100,             // 최소 높이
			  maxHeight: 200,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
		});
	});
</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
		<section class="section">
		<div class="mainbox">
			<p class="title">펫 일기<span>Pet Diary</span></p>
			<div class ="mainbox2 freebox">
				<p class="subtitle">글쓰기</p>
				<div class="writing_line"></div>
				<input type="text" class="writing_title form-control" placeholder="제목을 입력해주세요.">
				<div id="editor"></div>
				<form method="post">
					<textarea class="writing_content form-control" id="summernote" name="editordata"></textarea>
				</form>
				<button class="writing_button">글쓰기</button>
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>