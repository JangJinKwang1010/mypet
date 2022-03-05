<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet</title>
<script src="js/jquery-3.6.0.min.js"></script>
<style>
.section {
	text-align: center;
	background-color: rgb(168, 199, 123);
}

.mainbox {
	width: 1300px;
	display: inline-block;
	text-align: center;
	background-color: white;
}

.title {
	margin-top: 110px;
	margin-left: 100px;
	float: left;
	font-weight: bold;
	font-size: 30px;
}

.title>span {
	margin-left: 20px;
	color: gray;
	font-weight: normal;
	font-size: 20px;
}

.information {
	width: 1000px;
	margin-top: 40px;
	text-align: center;
	display: inline-block;
}

.personalinf {
	width: 100%;
	height: 40px;
	float: left;
}

.p1 {
	font-size: 20px;
	font-weight: bold;
	float: left;
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

.personalinf2 {
	border: 1px solid lightgray;
	background-color: rgb(250, 250, 250);
	display: inline-block;
	width: 1000px;
	height: 165px;
	margin-bottom: 30px;
}

.personalinf3 {
	border: 1px solid lightgray;
	background-color: rgb(250, 250, 250);
	display: inline-block;
	width: 1000px;
	margin-bottom: 30px;
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

.personalinf2 .inf7 {
	width: 610px;
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

.information>button {
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

.information>button:hover {
	background-color: rgb(0, 68, 130);
	color: white;
}

.personalinf2 input, .personalinf2 select, .personalinf3 input,
	.personalinf3 select {
	border: none;
	height: 30px;
	font-size: 14px;
}

.personalinf2 label, .personalinf3 label {
	font-size: 12px;
	float: left;
	margin: 5px 0 5px 10px;
}

.personalinf3>section {
	width: 100%;
	height: 50%;
}

.add {
	background-color: rgb(245, 245, 245);
	width: 100%;
	height: 50px;
	border: none;
	border-top: 1px solid lightgray;
	margin-top: 10px;
}

.inf9_x { float:right; position:relative; border:none; bottom:40px; left:40px; cursor:pointer; }

@media ( max-width : 500px) {
	.information {
		float: left;
		margin-left: 20px;
	}
	.personalinf>.p2 {
		float: left;
		margin-left: 165px;
	}
	.personalinf>.p4 {
		float: left;
		margin-left: 90px;
	}
	.personalinf2 {
		float: left;
		width: 342px;
		height: 400px;
	}
	.personalinf2>.inf1 {
		width: 150px;
	}
	.personalinf2>.inf2 {
		width: 160px;
	}
	.personalinf2>.inf4 {
		width: 170px;
	}
	.personalinf2>.inf5 {
		float: left;
		margin-left: 10px;
	}
	.personalinf2>.inf6 {
		width: 150px;
	}
	.personalinf2>.inf7 {
		width: 150px;
	}
	.personalinf2>.inf8 {
		float: left;
		width: 320px;
	}
	.personalinf3 {
		float: left;
		width: 342px;
		height: 440px;
	}
	.personalinf3 .inf1 {
		width: 130px;
	}
	.personalinf3 .inf3 {
		width: 130px;
	}
	.personalinf3 .inf4 {
		width: 180px;
	}
	.personalinf3 .inf5 {
		float: left;
		margin-left: 10px;
	}
	.personalinf3 .inf6 {
		width: 150px;
	}
	.personalinf3 .inf7 {
		width: 150px;
	}
	.personalinf3 .inf8 {
		width: 320px;
	}
	.title {
		margin-left: 50px;
	}
}
</style>
<script>
	$(document).ready(function() {
		var name1 = "add_category";
		var name2 = "add_kind";
		var name3 = "add_bulk";
		var name4 = "add_startdate";
		var name5 = "add_name";
		var name6 = "add_kg";
		var name7 = "add_cgender";
		var name8 = "add_cbirth"
 		var num = 2;
 		
		$(".add").click(	function() {
						var html = "<section>";
						html += "<div class='inf1'>";
						html += "<label>반려동물 선택</label>";
						html += "<p class='p3'>*</p>";
						html += "<select class='form-select'>";
						html += "<option>선택</option><option>강아지</option><option>고양이</option></select></div>";
						html += "<div class='inf2'>";
						html += "<label>품종</label>";
						html += "<p class='p3'>*</p>";
						html += "<input type='text' class='form-control' id='kind"+ num + "'>";
						html += "</div>";
						html += "<div class='inf3'>";
						html += "<label>크기</label>";
						html += "<p class='p3'>*</p>";
						html += "<select class='form-select'>";
						html += "<option>선택</option><option>소형</option><option>중형</option><option>대형</option></select></div>";
						html += "<div class='inf4'>";
						html += "<label>입양날짜</label>";
						html += "<input type='date' class='form-control'>";
						html += "</div>"
						html += "<div class='inf5 pet_profile2' id='" + num + "'>";
						html += "<label id='text" + num + "'>사진</label>";
						html += "<p id='별"+num+"' class='p3'>*</p>";
						html += "<img class='img' id='img"+ num +"'width=100%; height=100%;>";
						html += "</div>";					
						html += "<div class='inf6'>";
						html += "<label>반려동물 생년월일</label>";
						html += "<input type='text' class='form-control'>";
						html += "</div>";
						html += "<div class='inf7'>";
						html += "<label>몸무게</label>";
						html += "<input type='text' class='form-control'>";
						html += "</div>";
						html += "<div class='inf3'>";
						html += "<label>성별</label><select class='form-select'>";
						html += "<option value='선택'>선택</option><option value='수컷'>수컷</option>";
						html +=	"<option value='암컷'>암컷</option></select>	</div>";
					    html += "<div class='inf4'><label>생년월일</label> <input type='text' class='form-control'>	</div>";
						html += "<div class='inf9'>";
						html += "<label>특이사항</label>";
						html += "<input type='text' placeholder='예)알레르기, 털 길이, 산책 선호 등' class='form-control'>";
						html += "<div class='inf9_x'><img src='images/cross.png' width=20px; height=20px; class='close' id='"+num+ "'></div></div></section>";

						$(".add_section").append(html);
						
						num = num+1;		
						
						
						$(".pet_profile2").click(function() {
					        var url = "pet_profile.do?num="+$(this).attr("id");
					        var name = "popup test";
					        var option = "width = 500, height = 500, top = 150, left = 500, location = no"
					        window.open(url, name, option);
					    });

		});
	
	$(".pet_profile").click(function() {
        var url = "profile.do";
        var name = "popup test";
        var option = "width = 500, height = 500, top = 150, left = 500, location = no"
        window.open(url, name, option);
    });
	
	$(".pet_profile2").click(function() {
        var url = "pet_profile.do?num="+$(this).attr("id");
        var name = "popup test";
        var option = "width = 500, height = 800, top = 150, left = 500, location = no"
        window.open(url, name, option);
    });
	
	$(document).on("click", ".close", function() {
		var file_name = "pfile" + $(this).attr("id");
		$(this).parent().parent().parent().remove();
		document.getElementById(file_name).remove();
	});
	
	
	
});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<section class="section">
		<div class="mainbox">
			<p class="title">
				펫 등록<span>Register as a pets</span>
			</p>
			<div class="information">
				<div class="personalinf">
					<p class="p1">인적사항</p>
					<p class="p2">*필수입력 정보입니다.
				</div>
				<div class="personalinf2"  id="append">
					<div class="inf1">
						<label>이름</label>
						<p class="p3">*</p>
						<input type="text" class="form-control" value="${vo.name }"
							readonly>
					</div>
					<div class="inf2">
						<label>생년월일</label>
						<p class="p3">*</p>
						<input type="text" class="form-control"
							value="${vo.birth1 }년 ${vo.birth2}월 ${vo.birth3}일" readonly>
					</div>
					<div class="inf3">
						<label>성별</label>
						<p class="p3">*</p>
						<select class="form-select" disabled>
							<c:if test="${vo.gender eq 'male' }">
								<option selected>남자</option>
								<option>여자</option>
							</c:if>
							<c:if test="${vo.gender eq 'female' }">
								<option>남자</option>
								<option selected>여자</option>
							</c:if>
						</select>
					</div>
					<div class="inf4">
						<label>이메일</label> <input type="text" class="form-control"
							value="${vo.email }" readonly>
					</div>
					<div class="inf5 pet_profile">
						<label id="text">사진</label>
						<p id="별" class="p3">*</p>
						<img id="img" width=100%; height=100%;>
					</div>
					<div class="inf6">
						<label>휴대폰번호</label>
						<p class="p3">*</p>
						<input type="text" class="form-control" value="${vo.hp }"
							name="hp" readonly>
					</div>
					<div class="inf7">
						<label>주소</label>
						<p class="p3">*</p>
						<input type="text" class="form-control"
							value="${vo.addr1} ${vo.addr2 }" name="addr" readonly>
					</div>
				</div>

				<div class="personalinf">
					<p class="p1">반려동물 상세정보</p>
					<p class="p4">*필수입력 정보입니다.</p>
				</div>
				<div class="personalinf3" id="append2">
					<section class="add_section">
						<div class="inf1">
							<label>반려동물 선택</label>
							<p class="p3">*</p>
							<select class="form-select">
								<option>선택</option>
								<option>강아지</option>
								<option>고양이</option>
							</select>
						</div>
						<div class="inf2">
							<label>품종</label>
							<p class="p3">*</p>
							<input type="text" class="form-control" id="kind1" >
						</div>
						<div class="inf3">
							<label>크기</label>
							<p class="p3">*</p>
							<select class="form-select">
								<option>선택</option>
								<option>소형</option>
								<option>중형</option>
								<option>대형</option>
							</select>
						</div>
						<div class="inf4">
							<label>입양날짜</label> <input type="date" class="form-control">
						</div>
						<div class="inf5 pet_profile2" id="1">
							<label id="text1">사진</label>
							<p id="별1" class="p3">*</p>
							<img id="img1" width=100%; height=100%;>
						</div>
						<div class="inf6">
							<label>이름</label> <input type="text" class="form-control">
						</div>
						<div class="inf7">
							<label>몸무게</label> <input type="text" class="form-control">
						</div>
						<div class="inf3">
							<label>성별</label>
							<select class="form-select">
								<option>선택</option>
								<option>수컷</option>
								<option>암컷</option>
							</select>
						</div>
						<div class="inf4">
							<label>생년월일</label> <input type="text" class="form-control">
						</div>
						<div class="inf8">
							<label>특이사항</label> <input type="text"
								placeholder="예)알레르기, 털 길이, 산책 선호 등" class="form-control">
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