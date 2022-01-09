<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
</head>
<style>
	section { text-align:center; }
	p {
		font-weight:bold;
		font-size:20px;
		margin:20px 0;
	}
	div {
		display:inline-block;
		border:1px solid lightgray;
		border-radius:5px;
		width:80%;
		height:300px;
		margin-top:10px;
	}
	button {
		border:none;
		width:20%;
		height:50px;
		border-radius:10px;
		font-weight:bold;
		margin-top:15px;
		background-color:rgb(72,115,210);
		color:white;
		font-size:20px;
	}
	button:hover {
		background-color:rgb(0,68,130);
		color:white;
	}
</style>
<body>
<section>
	<p>사진 등록</p>
	<input type="file" class="form-control" name="file">
	<div>
		미리보기
	</div>
	<button>선택</button>
</section>
</body>
</html>