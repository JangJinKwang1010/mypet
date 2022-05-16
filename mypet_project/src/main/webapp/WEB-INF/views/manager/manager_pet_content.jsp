<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet관리자</title>
<script src="js/jquery-3.6.0.min.js"></script>
<style>
	section {
		text-align:center;
	}
	.box {
		border:1px solid gray;
		width:450px;
		height:400px;
		display:inline-block;
		text-align:left;
	}
	.rightbox{
		width:198px;
		height:305px;
		border-left:1px solid lightgray;
		float:right;
	}
	.rightbox>button{
		font-weight:bold;
		font-size:15px;
		width:100%;
		height:52px;
		color:white;
		background-color:black;
		border:none;
	}
	.rightbox>button:hover{
		color:black;
		background-color:lightgray;
	}
	.namebox{
		width:100%;
		height:50px;
		border:none;
	}
	.picture{
		width:198px;
		height:203px;
	}
	.box2{
		width:251px;
		height:50px;
		border-bottom:1px solid lightgray;
	}
	.box3 {
		width:450px;
		height:10px;
	}
	label{
		margin-left:5px;
		font-size:14px;
		font-weight:bold;
	}
	.box p{
		margin-left:5px;
		margin-top:3px;
		font-size:14px;
	}
</style>
</head>
<script>
	$(document).ready(function() {
		
		$(".delete").click(function() {
			var con_test = confirm("선택한 펫을 삭제하시겠습니까?"); 
        	if(con_test == true){ 
        		$.ajax({
    		        url:"manager_pet_delete.do",
    		        type:"post",
    		        data: {pid:"${vo.pid}"},
    		        success:function(){			       		  
    		        	opener.document.location.reload();
    		        	window.close(); //창 닫기		
    		       	},		
    		    });
        		
        	}
		});
		
	});
</script>
<body>
<section>
	<p style="font-size:18px;"><b>STAFF ONLY</b></p>
	<div class="box">
		<div class="rightbox">
			<div class="picture">
			<img src="upload/${vo.psfile }" width=100%; height=100%;>
			</div>
			<div class="namebox">
				<label>이름</label>
				<p>${vo.pname }</p>
			</div>
			<button type="button" class="delete">펫삭제</button>
		</div>	
		<div class="category box2">
			<label>분류</label>
			<p>${vo.category }</p>
		</div>	
		<div class="kind box2">
			<label>품종</label>
			<p>${vo.kind }</p>
		</div>	
		<div class="bulk box2">
			<label>크기</label>
			<p>${vo.bulk }</p>
		</div>	
		<div class="startdate box2">
			<label>입양날짜</label>
			<p>${vo.startdate }</p>
		</div>	
		<div class="gender box2">
			<label>성별</label>
			<p>${vo.pgender }</p>
		</div>	
		<div class="birth box2">
			<label>생년월일</label>
			<p>${vo.pbirth }</p>
		</div>	
		<div class="coment box3">
			<label>특이사항</label>
			<p>${vo.pcomment }</p>
		</div>	
	</div>
</section>
</body>
</html>