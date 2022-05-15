<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
</head>
<style>		
	.personalinf {
		width: 100%;
		height: 40px;
		float: left;
		text-align:center;
	}	
	.p1 {
		font-size: 20px;
		font-weight: bold;
		margin:20px 0;
	}	
	.p2 {
		font-size: 12px;
		color: red;
		float: right;
		margin: 15px 10px 0 0;
	}	
	.p3 {
		font-size: 12px;
		color: red;
		float: left;
	}	
	.p4 {
		font-size: 12px;
		color: red;
		float: right;
		margin: 15px 10px 0 0;
	}		
	.personalinf3 {
		border: 1px solid lightgray;
		background-color: rgb(250, 250, 250);
		display: inline-block;
		width: 1000px;
		margin: 30px 0;
	}	
	.inf1, .inf2 {
		width: 180px;
		height: 60px;
		margin: 15px 0 0 10px;
		display: inline-block;
		float: left;	
		background-color: white;
		border: 1px solid lightgray;		
	}	
	.inf3 {
		width: 140px;
		height: 60px;
		margin: 15px 0 0 10px;
		display: inline-block;
		float: left;	
		background-color: white;
		border: 1px solid lightgray;
	}	
	.inf4 {
		width: 270px;
		height: 60px;
		margin: 15px 0 0 10px;
		display: inline-block;
		float: left;	
		background-color: white;
		border: 1px solid lightgray;
	}	
	.inf5 {
		width: 150px;
		height: 138px;
		margin: 15px 10px 0 0;
		display: inline-block;
		float: right;
		background-color: white;
		border: 1px solid lightgray;
		cursor:pointer;
	}	
	#img, #img1, .img {
		display: none;
	}	
	.inf6, .inf7 {
		width: 180px;
		height: 60px;
		margin: 15px 0 0 10px;
		display: inline-block;
		float: left;
		background-color: white;
		border: 1px solid lightgray;
	}		
	.inf8 {
		width: 977px;
		height: 60px;
		margin: 15px 0 0 10px;
		display: inline-block;
		float: left;
		background-color: white;
		border: 1px solid lightgray;
	}	
	.inf9 {
		width: 930px;
		height: 60px;
		margin: 15px 0 0 10px;
		display: inline-block;
		float: left;
		background-color: white;
		border: 1px solid lightgray;
	}	
	.upload {
		border: none;
		width: 20%;
		height: 50px;
		border-radius: 10px;
		font-weight: bold;
		margin-top: 50px;
		background-color: rgb(72, 115, 210);
		color: white;
		font-size: 20px;
		margin-bottom: 110px;
	}	
	.upload:hover {
		background-color: rgb(0, 68, 130);
		color: white;
	}	
	.personalinf3 input, .personalinf3 select {
		border: none;
		height: 30px;
		font-size: 14px;
	}	
	.personalinf3 label {
		font-size: 12px;
		float: left;
		margin: 5px 0 5px 10px;
	}	
	.personalinf3 section {
		width: 100%;
		height: 50%;
	}	
	.add {
		background-color: rgb(245, 245, 245);
		width: 100%;
		height: 50px;
		border: none;
		border-top: 1px solid lightgray;
		margin-top: 30px;
	}
	
</style>
<script>
	$(document).ready(function() {
		$(".pet_profile2").click(function() {
	        var url = "pet_profile.do?num="+$(this).attr("id");
	        var name = "popup test2";
	        var option = "width = 500, height = 800, top = 150, left = 500, location = no"
	        window.open(url, name, option);
	    });
		
		
		$(".add").click(function() {
			if($("#category1").val() == "선택") {
				alert("반려동물을 선택해주세요");
				$("#category1").focus();
			} else if ($("#kind1").val() == "") {
				alert("품종을 입력해주세요");
				$("#kind1").focus();
			} else if ($("#bulk1").val() == "선택"){
				alert("크기를 선택해주세요");
				$("#bulk1").focus();
			} else if($("#startdate1").val() == "") {
				alert("입양날짜를 선택해주세요");
				$("#startdate1").focus();
			} else if ($("#name1").val() == "") {
				alert("이름을 입력해주세요");
				$("#name1").focus();
			} else if ($("#kg1").val() == "") {
				alert("몸무게를 입력해주세요");
				$("#kg1").focus();
			} else if ($("#gender1").val() == "선택") {
				alert("성별을 선택해주세요");
				$("#gender1").focus();
			} else if ($("#birth1").val() == "") {
				alert("생년월일을 선택해주세요");
				$("#birth1").focus();
			} else if ($("#comment1").val() == "") {
				alert("특이사항을 입력해주세요");
				$("#comment1").focus();
			} else {
				 var form = $("#form")[0];  
				 var formData = new FormData(form);
				 
				$.ajax({
			        url:"mypage_pet_add_proc.do",
			        type:"post",
			        enctype:"multipart/form-data", 
			        data: formData,
			        contentType: false,
			        processData: false,
			        success:function(result){
			       		if (result) {
			       			alert("펫 등록이 완료되었습니다");
			       			opener.document.location.reload();
        		        	window.close(); //창 닫기	
			       		} else {
			       			alert("펫 등록에 실패하였습니다");
				       		location.reload();
			       		}
			       	},		
			    });
			}
		});
	});
</script>
<body>
<div class="personalinf">
	<p class="p1">반려동물 상세정보</p>
</div>
<form id="form" name= "addform" autocomplete="off"  >
<div class="personalinf3" id="append2">
	<section class="add_section">
		<div class="inf1">
			<label>반려동물 선택</label>
			<select class="form-select" id="category1" name="category">
				<option value="선택">선택</option>
				<option value="강아지">강아지</option>
				<option value="고양이">고양이</option>
			</select>
		</div>
		<div class="inf2">
			<label>품종</label>
			<input type="text" class="form-control" id="kind1" name="kind" >
		</div>
		<div class="inf3">
			<label>크기</label>
			<select class="form-select" id="bulk1" name="bulk">
				<option value="선택">선택</option>
				<option value="소형">소형</option>
				<option value="중형">중형</option>
				<option value="대형">대형</option>
			</select>
		</div>
		<div class="inf4">
			<label>입양날짜</label> <input type="date" class="form-control" id="startdate1" name="startdate">
		</div>
		<div class="inf5 pet_profile2" id="1">
			<p id="별1" class="p3" style="display:none">*</p>
			<label id="text1">사진</label>
			<img id="img1" width=100%; height=100%; name="file1">
		</div>
		<div class="inf6">
			<label>이름</label> <input type="text" class="form-control" id="name1" name="pname">
		</div>
		<div class="inf7">
			<label>몸무게</label> <input type="text" class="form-control" id="kg1" name="pkg" placeholder="kg문자를 포함하여 입력해주세요">
		</div>
		<div class="inf3">
			<label>성별</label>
			<select class="form-select" id="gender1" name="pgender">
				<option value="선택">선택</option>
				<option value="수컷">수컷</option>
				<option value="암컷">암컷</option>
			</select>
		</div>
		<div class="inf4">
			<label>생년월일</label> <input type="date" class="form-control" id="birth1" name="pbirth">
		</div>
		<div class="inf8">
			<label>특이사항</label> <input type="text"	placeholder="예)알레르기, 털 길이, 산책 선호 등" class="form-control" id="comment1" name="pcomment">
		</div>
	</section>
	<button type="button" class="add">추가 등록</button>
</div>
</form>
</body>
</html>