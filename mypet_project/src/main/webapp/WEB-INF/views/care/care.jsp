<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
  %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		display:inline-block;
		text-align:center;
		background-color:white;	
	}
	.title {
		margin-top:110px;
		float:left;
		font-weight:bold;
		font-size:30px;
		margin-left:100px;
	}
	.title>span {
		margin-left:20px;
		color:gray;
		font-weight:normal;
		font-size:20px;
	}
	.information {
		width:1000px;
		margin-top:40px;
		text-align:center;
		display:inline-block;
	}
	.personalinf {
		width:100%;
		height:40px;
		float:left;
	}
	.p1 {
		font-size:20px;
		font-weight:bold;
		float:left;
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
	.personalinf2 {
		border:1px solid lightgray;
		display:inline-block;
		width:1000px;
		height:165px;
		margin-bottom:30px;
		background-color:rgb(250,250,250);
	}
	.personalinf3 {
		border:1px solid lightgray;
		display:inline-block;
		width:1000px;
		margin-bottom:30px;
		background-color:rgb(250,250,250);
	}
	.personalinf2>div, .personalinf3 div {
		border:1px solid lightgray;
	}
	.personalinf2 .inf1,.inf2 {
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
	.personalinf2 .inf3 {
		width:140px;
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
	.personalinf2 .inf4 {
		width:270px;
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
	.personalinf2 .inf5 {
		width:150px;
		height:138px;
		margin:15px 10px 0 0;
		display:inline-block;
		float:right;
		cursor:pointer;
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
	
	.personalinf2 .inf6 {
		width:180px;
		height:60px;
		margin:15px 0 0 10px;
		display:inline-block;
		float:left;
	}	
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
	.noupload {
		border:none;
		width:20%;
		height:50px;
		border-radius:10px;
		font-weight:bold;
		margin-top:50px;
		background-color:lightgray;
		color:white;
		font-size:20px;
		margin-bottom:110px;
	}
	.upload:hover {
		background-color:rgb(0,68,130);
		color:white;
	}
	.personalinf2 input,.personalinf2 select, .personalinf3 input,.personalinf3 select {
		border:none;
		height:30px;
		font-size:14px;
	}
	.personalinf2 label, .personalinf3 label{
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
		margin-top:10px;
	}
	.nouploaddiv {
		background-color:white;
		border:1px solid lightgray;
		position:absolute;
		left:700px;
		margin-top:-100px;
		padding:10px;
		font-size:14px;
		display:none;
	}
	.nouploaddiv>span {
		font-size:13px; color:blue;
	}

	@media (min-width : 600px) {		
		.section { background-color:rgb(147,196,228); }
		.mainbox { width:1300px; }
	}
</style>
<script>
	$(document).ready(function() {
		var name1 = "add_category";
		var name2 = "add_kind";
		var name3 = "add_bulk";
		var name4 = "add_startdate";
		var name5 = "add_enddate";
 		var num = 1;
		
		$(".add").click(function() {
			
			var html = "<section><div class='inf1'>";
			html += "<label>반려동물 선택</label>";
			html += "<p class='p3'>*</p>";
			html += "<select class='form-select "+name1+num+"'>";
			html += "<option>선택</option><option value='강아지'>강아지</option><option value='고양이'>고양이</option></select></div>";
			html += "<div class='inf2'>";
			html += "<label>품종</label>";
			html += "<p class='p3'>*</p>";
			html += "<input type='text' class='form-control "+name2+num+"'>";
			html += "</div>";
			html += "<div class='inf3'>";
			html += "<label>크기</label>";
			html += "<p class='p3'>*</p>";
			html += "<select class='form-select "+name3+num+"'>";
			html += "<option>선택</option><option>소형</option><option>중형</option><option>대형</option></select></div>";
			html += "<div class='inf4'>";
			html += "<label>입양날짜</label>";
			html += "<input type='date' class='form-control "+name4+num+"'>";
			html += "</div>";
			html += "<div class='inf4'>";
			html += "<label>양육종료날짜</label>";
			html += "<input type='date' class='form-control "+name5+num+"' id = 'end_date'>";
			html += "</div>";
			html += "<div class='inf5'>";
			html += "<div><img src='images/black_check.png' width=25px; height=25px; class='check' id='black'></div>";
			html += "<div class='inf5_text'><p>양육중</p></div>";
			html += "<div class='inf5_x'><img src='images/cross.png' width=20px; height=20px; class='close'></div>"
			html += "</div></section>";
						
			$(".add_section").append(html);	
			
			num = num+1;		
			
		});			
		
		$(".care_profile").click(function() {
	          var url = "profile.do";
	          var name = "popup test";
	          var option = "width = 500, height = 500, top = 150, left = 500, location = no"
	          window.open(url, name, option);
	      });
		
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
		
		$(document).on("click", ".close", function() {
			$(this).parent().parent().parent().remove();
			num = num-1;
		});
		
		$(".upload").click(function() {
			$(".true_category").val($(".category").val());
			$(".true_kind").val($(".kind").val());
			$(".true_bulk").val($(".bulk").val());
			$(".true_startdate").val($(".startdate").val());
			$(".true_enddate").val($(".enddate").val());
			
			for (var i=0; i<num-1; i++) {				
				$(".true_category").val($(".true_category").val()+","+$(".add_category"+[i+1]).val());
				$(".true_kind").val($(".true_kind").val()+","+$(".add_kind"+[i+1]).val()); 
				$(".true_bulk").val($(".true_bulk").val()+","+$(".add_bulk"+[i+1]).val()); 
				$(".true_startdate").val($(".true_startdate").val()+","+$(".add_startdate"+[i+1]).val()); 
				$(".true_enddate").val($(".true_enddate").val()+","+$(".add_enddate"+[i+1]).val()); 
			};			
			
			 var form = $("#form")[0];  
		     var formData = new FormData(form);
					     
			$.ajax({
		        url:"care_upload.do",
		        type:"post",
		        enctype:"multipart/form-data", 
		        data: formData,
		        contentType: false,
		        processData: false,
		        success:function(result){
		       		if (result) {
		       			alert("돌보미 등록이 완료되었습니다");
		       		} else {
		       			alert("돌보미 등록에 실패하였습니다");		       		 
		       		}
		       		location.reload();
		       	},		
		    });
		});
		
		$(".noupload").hover(function(){
			$(".nouploaddiv").css("display","block");
	    }, function() {
	    	$(".nouploaddiv").css("display","none");
	    });
			
		
	});
	
	
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<section class="section">
		<div class="mainbox">
			<p class="title">돌보미 등록<span>Register as a caregiver</span></p>
			<div class="information">
				<div class="personalinf">
					<p class="p1">인적사항</p>
					<p class="p2">*필수입력 정보입니다.
				</div>				
				<form id="form" name="care"  >
				<div class="personalinf2" id="append">				
						<div class="inf1">
							<label>이름</label>
							<p class="p3">*</p>
							<input type="text" class="form-control" value="${vo.name }" name="name" readonly>
						</div>
						<div class="inf2">
							<label>생년월일</label>
							<p class="p3">*</p>
							<input type="text" class="form-control" value="${vo.birth1 }년 ${vo.birth2}월 ${vo.birth3}일" name="birth" readonly>
						</div>
						<div class="inf3">
							<label>성별</label>
							<p class="p3">*</p>
							<select class="form-select" disabled >
								<c:if test="${vo.gender eq 'male' }">
									<option selected>남자</option>
									<option>여자</option>
								</c:if>
								<c:if test="${vo.gender eq 'female' }">
									<option>남자</option>
									<option selected>여자</option>
								</c:if>
							</select>
							<input type="text" name="gender" value="${vo.gender }" style="display:none;">
						</div>
						<div class="inf4">
							<label>이메일</label>
							<p class="p3">*</p>
							<input type="text" class="form-control" value="${vo.email }" name="email" readonly>
						</div>
						<div class="inf5 care_profile">
							<label id="text">사진</label>
							<p id="별" class="p3">*</p>
							<img id="img" width=100%; height=100%;>
						</div>
						<div class="inf6">
							<label>휴대폰번호</label>
							<p class="p3">*</p>
							<input type="text" class="form-control" value="${vo.hp }" name="hp" readonly>
						</div>
						<div class="inf7">
							<label>주소</label>
							<p class="p3">*</p>
							<input type="text" class="form-control" value="${vo.addr1} ${vo.addr2 }" name="addr" readonly>
						</div>
				</div>
				
				<div class="personalinf">
					<p class="p1">경력사항</p>
				</div>
				<div class="personalinf3">
					<section class="add_section">
						<div class="inf1">
							<label>반려동물 선택</label>
							<p class="p3">*</p>
							<select class="form-select category" name="category" >
								<option value="선택">선택</option>
								<option value="강아지">강아지</option>
								<option value="고양이">고양이</option>
							</select>
						</div>
						<div class="inf2">
							<label>품종</label>
							<p class="p3">*</p>
							<input type="text" class="form-control kind" name="kind" >
						</div>
						<div class="inf3">
							<label>크기</label>
							<p class="p3">*</p>
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
					<button class="add" type="button">+ 추가</button>
				</div>				
				<c:if test="${val eq 0 }">
					<button class="upload" type="button">등록하기</button>					
				</c:if>
				<c:if test="${val eq 1 }">
					<button class="noupload" type="button" >등록하기</button>	
					<div class="nouploaddiv">이미 등록된 회원입니다<br><span>수정은 마이페이지에서 가능합니다</span></div>	
				</c:if>	
				<input type="hidden" class="true_category" name="true_category" >
				<input type="hidden" class="true_kind" name="true_kind" >
				<input type="hidden" class="true_bulk" name="true_bulk" >
				<input type="hidden" class="true_startdate" name="true_startdate" >
				<input type="hidden" class="true_enddate" name="true_enddate" >
				</form>			
			</div>			
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>