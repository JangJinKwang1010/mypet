<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		    var form1 = $("#form").serialize();
					     
			$.ajax({
		        url:"near_update_upload.do",
		        type:"post",
		        data: form1,
		        success:function(result){
		       		if (result) {
		       			alert("글이 수정되었습니다");
		       			location.replace('near.do');
		       		} else {
		       			alert("글이 수정되지 않았습니다");		       
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
			<p class="title">내 근처의 펫<span>A pet near me</span></p>
			<div class ="mainbox2 freebox">
				<p class="subtitle">글쓰기</p>
				<div class="writing_line"></div>
				<form id="form">
				<select class="pet_select form-select" style="width:21%" name="kind">
					<c:if test="${vo.kind eq '비숑'}">
						<option value="비숑/강아지" selected>비숑</option>
						<option value="페르시안고양이/고양이">페르시안고양이</option>
					</c:if>
					<c:if test="${vo.kind eq '페르시안고양이'}">
						<option value="비숑/강아지" >비숑</option>
						<option value="페르시안고양이/고양이" selected>페르시안고양이</option>
					</c:if>
				</select>
				<select class="pet_select form-select" style="width:41%" name="work">
					<c:if test="${vo.work eq '1년 이하'}">
						<option value="1년 이하" selected>1년 이하</option>
						<option value="2년 이상">2년 이상</option>
						<option value="3년 이상">3년 이상</option>
						<option value="4년 이상">4년 이상</option>
						<option value="5년 이상">5년 이상</option>
					</c:if>
					<c:if test="${vo.work eq '2년 이상'}">
						<option value="1년 이하">1년 이하</option>
						<option value="2년 이상" selected>2년 이상</option>
						<option value="3년 이상">3년 이상</option>
						<option value="4년 이상">4년 이상</option>
						<option value="5년 이상">5년 이상</option>
					</c:if>
					<c:if test="${vo.work eq '3년 이상'}">
						<option value="1년 이하" >1년 이하</option>
						<option value="2년 이상">2년 이상</option>
						<option value="3년 이상" selected>3년 이상</option>
						<option value="4년 이상">4년 이상</option>
						<option value="5년 이상">5년 이상</option>
					</c:if>
					<c:if test="${vo.work eq '4년 이상'}">
						<option value="1년 이하" >1년 이하</option>
						<option value="2년 이상">2년 이상</option>
						<option value="3년 이상" >3년 이상</option>
						<option value="4년 이상" selected>4년 이상</option>
						<option value="5년 이상">5년 이상</option>
					</c:if>
					<c:if test="${vo.work eq '5년 이상'}">
						<option value="1년 이하" >1년 이하</option>
						<option value="2년 이상">2년 이상</option>
						<option value="3년 이상" >3년 이상</option>
						<option value="4년 이상">4년 이상</option>
						<option value="5년 이상" selected>5년 이상</option>
					</c:if>
				</select>
				<input onfocus="(this.type = 'date')" value="${vo.enddate }" class="date form-control" placeholder="마감일자" name="enddate">
				<input type="text" class="writing_title form-control" placeholder="제목을 입력해주세요." name="title" value="${vo.title }">
				<textarea class="writing_content form-control" placeholder="내용을 입력해주세요." name="content" >${vo.content }</textarea>
				<button type="button" class="writing_button">수정</button>
				<input type="hidden" name="nid" value="${vo.nid }">
				</form>
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>