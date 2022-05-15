<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<title>Mypet</title>
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
		font-size:12px;
		color:red;
		float:right;
		margin:15px 10px 0 0;
	}
	.p3 {
		font-size:12px;
		color:red;
		float:left;
	}
	.personalinf3 {
		border:1px solid lightgray;
		display:inline-block;
		width:100%;
		background-color:rgb(250,250,250);
		margin: 30px 0;
	}
	.personalinf3 div {
		border:1px solid lightgray;
	}
	.inf2 {
		width:180px;
		height:60px;
		margin:15px 0 0 10px;
		display:inline-block;
		float:left;		
		background-color:white;
	}
	.personalinf3 .inf1 {
		width:120px;
		height:60px;
		margin:15px 0 0 10px;
		display:inline-block;
		float:left;
		background-color:white;
	}
	.personalinf3 .inf3 {
		width:80px;
		height:60px;
		margin:15px 0 0 10px;
		display:inline-block;
		float:left;
		background-color:white;
	}
	.personalinf3 .inf4 {
		width:220px;
		height:60px;
		margin:15px 0 0 10px;
		display:inline-block;
		float:left;
		background-color:white;
	}	
	#img { display:none; }
	.personalinf3 .inf5 {
		width:100px;
		height:60px;
		margin:15px 0 0 10px;
		display:inline-block;
		float:left;
		border:none;
	}
	.personalinf3 .inf5>div {
		display:inline-block;
		margin-top:15px;
		border:none;
		float:left;
		font-size:14px;
	}
	.personalinf3 .inf5>div.inf5_text { margin-left:5px; }
	.personalinf3 .inf5>div>p { margin-top:3px; }
	.personalinf3 .inf5>div>img { cursor:pointer; }
	.personalinf3 .inf5>div.inf5_x { float:right; margin-right:-10px; }
	.personalinf3 .inf5>div.inf5_x>img { margin-top:3px; }
	
	.inf7 {
		width:610px;
		height:60px;
		margin:15px 0 0 10px;
		display:inline-block;
		float:left;
	} 
	.upload {
		border:none;
		width:20%;
		height:50px;
		border-radius:10px;
		font-weight:bold;
		margin-top:50px;
		background-color:rgb(72,115,210);
		color:white;
		font-size:20px;
		margin-bottom:110px;
	}
	 .personalinf3 input,.personalinf3 select {
		border:none;
		height:30px;
		font-size:14px;
	}
    .personalinf3 label{
		font-size:12px;
		float:left;
		margin:5px 0 5px 10px;
	}
	.personalinf3>section {
		width:100%; height:50%;
	}
	.add {
		background-color:rgb(245,245,245);
		width:100%;
		height:50px;
		border:none;
		border-top:1px solid lightgray;
		margin-top: 30px;
	} 
</style>
<script>
	$(document).ready(function() {
		
		$(document).on("click",".check",function(){ 
			if ($(this).attr("id") == "black") {
				$(this).attr("id", "blue"); 
				$(this).attr("src", "images/blue_check.png");
				$(this).parent().parent().prev().children("input").attr("disabled", true);
				$(this).parent().parent().prev().children("input").val("");
			} else {
				$(this).attr("id", "black"); 
				$(this).attr("src", "images/black_check.png");
				$(this).parent().parent().prev().children("input").removeAttr("disabled"); 				
			}
		 });
		
		$(".add").click(function() {
			if($(".category").val() == "선택") {
				alert("반려동물을 선택해주세요");
				$(".category").focus();
			} else if ($(".kind").val() == "") {
				alert("품종을 입력해주세요");
				$(".kind").focus();
			} else if ($(".bulk").val() == "선택") {
				alert("크기를 선택해주세요");
				$(".bulk").focus();
			} else if ($(".startdate").val() == "") {
				alert("입양날짜를 선택해주세요");
				$(".startdate").focus();
			} else if ( ($(".check").attr("id") == "black") &&  ($(".enddate").val() == "") ) {
				alert("양육종료날짜를 선택해주세요");
				$(".enddate").focus();
			} else {
				var form = $("#form")[0];  
				var formData = new FormData(form);				 
				$.ajax({
			        url:"mypage_career_add_proc.do",
			        type:"post",
			        data: formData,
			        contentType: false,
			        processData: false,
			        success:function(result){
			       		if (result) {
			       			alert("경력 등록이 완료되었습니다");
			       			opener.document.location.reload();
       		        		window.close(); //창 닫기	
			       		} else {
			       			alert("경력 등록에 실패하였습니다");
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
<div class="personalinf">
	<p class="p1">경력 상세정보</p>
</div>
<div class="personalinf3">
<form id="form" name= "addform" autocomplete="off"  >
<section class="add_section">
	<div class="inf1">
		<label>반려동물 선택</label>
		<select class="form-select category" name="category" >
			<option value="선택">선택</option>
			<option value="강아지">강아지</option>
			<option value="고양이">고양이</option>
		</select>
	</div>
	<div class="inf2">
		<label>품종</label>
		<input type="text" class="form-control kind" name="kind" >
	</div>
	<div class="inf3">
		<label>크기</label>
		<select class="form-select bulk" name="bulk">
			<option value="선택">선택</option>
			<option value="소형">소형</option>
			<option value="중형">중형</option>
			<option value="대형">대형</option>
		</select>
	</div>
	<div class="inf4">
		<label>입양날짜</label>
		<input type="date" class="form-control startdate" name="startdate">
	</div>
	<div class="inf4">
		<label>양육종료날짜</label>
		<input type="date" class="form-control enddate"  id="end_date" name="enddate">
	</div>
	<div class="inf5">
		<div><img src="images/black_check.png" width=25px; height=25px; class="check" id="black"></div>
		<div class="inf5_text"><p>양육중</p></div>
	</div>
</section>
<button class="add" type="button">추가 등록</button>
</form>
</div>	
</body>
</html>