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
	}
	.personalinf3 {
		border:1px solid lightgray;
		display:inline-block;
		width:1000px;
		margin-bottom:30px;
	}
	.personalinf2>div, .personalinf3 div {
		border:1px solid lightgray;
		background-color:white;
	}
	.inf1,.inf2 {
		width:180px;
		height:60px;
		margin:15px 0 0 10px;
		display:inline-block;
		float:left;
	}
	.inf3 {
		width:140px;
		height:60px;
		margin:15px 0 0 10px;
		display:inline-block;
		float:left;
	}
	.inf4 {
		width:270px;
		height:60px;
		margin:15px 0 0 10px;
		display:inline-block;
		float:left;
	}
	.inf5 {
		width:150px;
		height:138px;
		margin:15px 10px 0 0;
		display:inline-block;
		float:right;
		cursor:pointer;
	}
	.inf6 {
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
	.information>button {
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
	.information>button:hover {
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

	@media (min-width : 600px) {		
		.section { background-color:rgb(147,196,228); }
		.mainbox { width:1300px; }
	}
</style>
<script>
	$(document).ready(function() {
		$(".add").click(function() {
			var html = "<section>";
			html += "<div class='inf1'>";
			html += "<label>반려동물 선택</label>";
			html += "<p class='p3'>*</p>";
			html += "<select class='form-select'>";
			html += "<option>강아지</option><option>고양이</option></select></div>";
			html += "<div class='inf2'>";
			html += "<label>품종</label>";
			html += "<p class='p3'>*</p>";
			html += "<input type='text' class='form-control'>";
			html += "</div>";
			html += "<div class='inf3'>";
			html += "<label>크기</label>";
			html += "<p class='p3'>*</p>";
			html += "<select class='form-select'>";
			html += "<option>소형</option><option>중형</option><option>대형</option></select></div>";
			html += "<div class='inf4'>";
			html += "<label>입양날짜</label>";
			html += "<input type='date' class='form-control'>";
			html += "</div></section>";
			
			$(".add_section").append(html);
			
		});
		
		$(".inf5").click(function() {
			 var url = "care_profile.do";
	         var name = "popup test";
	         var option = "width = 500, height = 500, top = 150, left = 500, location = no"
	         window.open(url, name, option);
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
				<div class="personalinf2">
						<div class="inf1">
							<label>이름</label>
							<p class="p3">*</p>
							<input type="text" class="form-control" value="${vo.name }"  readonly>
						</div>
						<div class="inf2">
							<label>생년월일</label>
							<p class="p3">*</p>
							<input type="text" class="form-control" value="${vo.birth1 }년 ${vo.birth2}월 ${vo.birth3}일" readonly>
						</div>
						<div class="inf3">
							<label>성별</label>
							<p class="p3">*</p>
							<select class="form-select" disabled>
								<c:if test="${vo.gender eq 'man' }">
									<option selected>남자</option>
									<option>여자</option>
								</c:if>
								<c:if test="${vo.gender eq 'woman' }">
									<option>남자</option>
									<option selected>여자</option>
								</c:if>
							</select>
						</div>
						<div class="inf4">
							<label>이메일</label>
							<p class="p3">*</p>
							<input type="text" class="form-control" value="${vo.email }" readonly>
						</div>
						<div class="inf5">
							<label>사진</label>
							<p class="p3">*</p>
							<img id="img" width=100%; height=100%;>
						</div>
						<div class="inf6">
							<label>휴대폰번호</label>
							<p class="p3">*</p>
							<input type="text" class="form-control" value="${vo.hp }" readonly>
						</div>
						<div class="inf7">
							<label>주소</label>
							<p class="p3">*</p>
							<input type="text" class="form-control" value="${vo.addr1} ${vo.addr2 }" readonly>
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
							<select class="form-select">
								<option>강아지</option>
								<option>고양이</option>
							</select>
						</div>
						<div class="inf2">
							<label>품종</label>
							<p class="p3">*</p>
							<input type="text" class="form-control">
						</div>
						<div class="inf3">
							<label>크기</label>
							<p class="p3">*</p>
							<select class="form-select">
								<option>소형</option>
								<option>중형</option>
								<option>대형</option>
							</select>
						</div>
						<div class="inf4">
							<label>입양날짜</label>
							<input type="date" class="form-control">
						</div>
					</section>
					<button class="add">+ 추가</button>
				</div>				
				<button>등록하기</button>				
			</div>			
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>