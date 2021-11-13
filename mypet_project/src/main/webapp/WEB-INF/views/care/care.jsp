<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Mypet</title>
<style>
section {
	text-align:center;
}
.mainbox {
	width:1200px;
	display:inline-block;
	margin-top:50px;
	text-align:center;
}
.title {
	margin-top:60px;
	margin-left:100px;
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
.information {
	width:1000px;
	height:210px;
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
.personalinf2 {
	border:1px solid lightgray;
	background-color:rgb(250,250,250);
	display:inline-block;
	width:1000px;
	height:165px;
	margin-bottom:30px;
}
.personalinf2>div {
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
}
.inf6,.inf7 {
	width:180px;
	height:60px;
	margin:15px 0 0 10px;
	display:inline-block;
	float:left;
}
.inf8 {
	width:420px;
	height:60px;
	margin:15px 0 0 10px;
	display:inline-block;
	float:left;
} 
.information>button {
	border:1px solid;
	width:80px;
	height:35px;
	border-radius:10px;
	font-weight:bold;
	margin-top:50px;
}
.information>button:hover {
	background-color:rgb(147,196,228);
	color:white;
}
.personalinf2 input{
	border:none;
	height:30px;
}
.personalinf2 label{
	font-size:9px;
	float:left;
	margin:5px 0 5px 10px;
}
.personalinf2 select{
	border:none;
	height:30px;
	font-size:14px;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<section>
		<div class="mainbox">
			<p class="title">������ ���<span>Register as a caregiver</span></p>
			<div class="information">
				<div class="personalinf">
					<p class="p1">��������</p>
					<p class="p2">*�ʼ��Է� �����Դϴ�.
				</div>
				<div class="personalinf2">
						<div class="inf1">
							<label>�̸�</label>
							<input type="text" class="form-control">
						</div>
						<div class="inf2">
							<label>�������</label>
							<input type="text" class="form-control">
						</div>
						<div class="inf3">
							<label>����</label>
							<select class="form-select">
								<option>����</option>
								<option>����</option>
							</select>
						</div>
						<div class="inf4">
							<label>�̸���</label>
							<input type="text" class="form-control">
						</div>
						<div class="inf5">
							<label>����</label>
						</div>
						<div class="inf6">
							<label>��ȭ��ȣ</label>
							<input type="text" class="form-control">
						</div>
						<div class="inf7">
							<label>�޴�����ȣ</label>
							<input type="text" class="form-control">
						</div>
						<div class="inf8">
							<label>�ּ�</label>
						</div>
				</div>
				
				<div class="personalinf">
					<p class="p1">��»���</p>
				</div>
				<div class="personalinf2">
						<div class="inf1">
							<label>�ݷ����� ����</label>
							<select class="form-select">
								<option>������</option>
								<option>�����</option>
							</select>
						</div>
						<div class="inf2">
							<label>ǰ��</label>
							<input type="text" class="form-control">
						</div>
						<div class="inf3">
							<label>ũ��</label>
							<select class="form-select">
								<option>����</option>
								<option>����</option>
								<option>����</option>
							</select>
						</div>
						<div class="inf4">
							<label>�Ծ糯¥</label>
						</div>
				</div>				
				<button>����ϱ�</button>				
			</div>			
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>