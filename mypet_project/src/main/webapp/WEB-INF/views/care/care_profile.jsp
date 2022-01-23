<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="js/jquery-3.6.0.min.js"></script>
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
		text-align:center;
	}
	#img { margin-top:15px; }
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
<script>
$(document).ready(function() {
	var img_name;
	var img_src;
	$("#file").change(function(e){
			img_name = this.files[0].name;
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result); 
				img_src = e.target.result;
			}
			reader.readAsDataURL(this.files[0]);
		
	});
	
	$(".ok").click(function() {
		opener.document.getElementById('text').style.display = "none";
		opener.document.getElementById('*').style.display = "none";
		opener.document.getElementById('img').style.display = "block";
		opener.document.getElementById('img').src = img_src;
		window.close(); //창 닫기
	});
	

});

</script>
<body>
<section>
	<p>사진 등록</p>
	<input type="file" class="form-control" name="file" id="file">
	<div>
		<img id="img" src="images/image.png" width=90%; height=90%; >
	</div>
	<button class="ok" >선택</button>
</section>
</body>
</html>