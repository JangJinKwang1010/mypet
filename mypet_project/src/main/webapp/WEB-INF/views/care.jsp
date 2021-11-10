<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
section{
	text-align:center;
}
.mainbox{
	border:1px solid lightgray;
	width:65%;
	height:1000px;
	display:inline-block;
	margin-top:50px;
	}
.title{
	margin-top:60px;
	margin-left:100px;
	float:left;
	font-weight:bold;
	font-size:30px;
}
.information{
	border:1px solid lightgray;
	width:100%;
	height:210px;
	float:left;
	margin-top:40px;
}
.personalinf{
	border:1px solid lightgray;
	width:100%;
	height:40px;
	float:left;
}
.p1{
	font-size:20px;
	font-weight:bold;
	float:left;
}
.p2{
	font-size:12px;
	color:red;
	float:right;
	margin:15px 10px 0 0;
}
.personalinf2{
	border:1px solid lightgray;
	width:100%;
	height:165px;
	float:left;
}
.inf1,.inf2{
	border:1px solid;
	width:180px;
	height:60px;
	margin:15px 0 0 10px;
	display:inline-block;
	float:left;
}
.inf3{
	border:1px solid;
	width:100px;
	height:60px;
	margin:15px 0 0 10px;
	display:inline-block;
	float:left;
}
.inf4{
	border:1px solid;
	width:270px;
	height:60px;
	margin:15px 0 0 10px;
	display:inline-block;
	float:left;
}
.inf5{
	border:1px solid;
	width:130px;
	height:130px;
	margin:15px 40px 0 0;
	display:inline-block;
	float:right;
}
.inf6,.inf7{
	border:1px solid;
	width:180px;
	height:60px;
	margin:15px 0 0 10px;
	display:inline-block;
	float:left;
}
.inf8{
	border:1px solid;
	width:380px;
	height:60px;
	margin:15px 0 0 10px;
	display:inline-block;
	float:left;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<div class="mainbox">
			<p class="title">돌보미 등록</p>
			<div class="information">
				<div class="personalinf">
					<p class="p1">인적사항</p>
					<p class="p2">*필수입력 정보입니다.
				</div>
				<div class="personalinf2">
						<div class="inf1">
						
						</div>
						<div class="inf2">
						
						</div>
						<div class="inf3">
						
						</div>
						<div class="inf4">
						
						</div>
						<div class="inf5">
						
						</div>
						<div class="inf6">
						
						</div>
						<div class="inf7">
						
						</div>
						<div class="inf8">
						
						</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>