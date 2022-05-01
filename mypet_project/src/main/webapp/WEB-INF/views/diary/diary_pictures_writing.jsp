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
	.file_div {
		display:inline-block;
		width:90%;
		margin-top:10px;
	}
	.add_div {
		width:90%;
		text-align:right;
		display:inline-block;
	}
	.add_btn {
		border:1px solid lightgray;
		background-color:gray;
		color:white;
		width:80px; height:30px;
		margin-top:10px;
	}
	@media (min-width : 600px) {		
		.section { background-color:rgb(247,179,42); }
		.mainbox { width:1300px; }
	}
</style>
<script>
	$(document).ready(function() {
		var num = 1;
		
		$(".add_btn").click(function() {
			var html = "<div class='file_div"+ num + "' style='margin-top:10px;'>";
			html += "<input type='file' class='form-control pfile"+ num +"' name='pfile" + num + "'>";
			html += "<input type='text' class='form-control ptag" + num + "' placeholder='태그를 입력해주세요'></div>";
			$(".file_div").append(html);
			
			num = num+1;
			
		});
		
		$(".writing_button").click(function() {
			$(".true_pfile").val($(".pfile").val());
			$(".true_ptag").val($(".ptag").val());
			
			for (var i=0; i<num-1; i++) {				
				$(".true_ptag").val($(".true_ptag").val()+"@"+$(".ptag"+[i+1]).val()); 
			};
			
			 var form = $("#form")[0];  
		     var formData = new FormData(form);
						
			$.ajax({
		        url:"pictures_upload.do",
		        type:"post",
		        enctype:"multipart/form-data", 
		        data: formData,
		        contentType: false,
		        processData: false,
		        success:function(result){
		       		if (result) {
		       			alert("글 등록이 완료되었습니다");
		       			location.replace('diary_pictures.do');
		       		} else {
		       			alert("글 등록에 실패하였습니다");		     
		       			location.reload();
		       		}
		       	},		
		    });
			
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
						<option>사진게시판</option>
					</select>
					<input type="text" class="writing_title form-control" placeholder="제목을 입력해주세요." name="ptitle">
					<div class="file_div">
						<input type="file" class="form-control pfile0" name="pfile0">
						<input type="text" class="form-control ptag" placeholder="태그를 입력해주세요">
					</div>
					<div class="add_div"><button type = "button" class="add_btn">+추가</button></div>
					<button type="button" class="writing_button">글쓰기</button>
				</div>
			<input type="hidden" class="true_ptag" name="true_ptag" >
			</form>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>