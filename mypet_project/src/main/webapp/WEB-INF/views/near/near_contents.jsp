<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3e8fa4fd6bbcee08087de03a2b386eba&libraries=services"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<style>
	.section { text-align:center; }
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
		background-color:white;
		margin-bottom:100px;
		text-align:center;
	}
	.subtitle {
		margin-top:60px;
		margin-left:70px;
		float:left;
		font-weight:bold;
		font-size:25px;
		margin-bottom:-20px;
	}
	.writing_line {
		display:inline-block;
		border-top:2px solid;
		width:90%;
	}
	.mainbox2>.writing_title {
		display:inline-block;
		width:90%;
		height:40px;
	}
	.mainbox2 .logo {
		font-size:13px;
		font-weight:normal;
		background-color:gray;
		color:white;
		border-radius:4px;
		margin:5px;
		padding:3px;
	}
	.mainbox2>.writing_content {
		display:inline-block;
		margin-top:3px;
		width:90%;
		height:600px;
	}
	.post_title {
		text-align:left;
		font-weight:bold;
		font-size:20px;
		margin-left:65px;
		margin-bottom:5px;
	}
	.name {
		display:inline-block;
		float:left;
		margin-left:70px;
		font-size:13px;
	}
	.post_line {
		float:left;
		border-right:1px solid lightgray;
		height:13px;
		display:inline-block;
		margin-left:10px;
		margin-top:5px;
	}
	.post_line2 {
		float:right;
		border-right:1px solid lightgray;
		height:13px;
		display:inline-block;
		margin-right:10px;
		margin-left:10px;
		margin-top:5px;
	}
	.post_date {
		display:inline-block;
		float:left;
		margin-left:10px;
		font-size:13px;
	}
	.view {
		display:inline-block;
		float:right;
		font-size:13px;
	}
	.recommend {
		display:inline-block;
		float:right;
		font-size:13px;
	}
	.comments {
		border:1px solid lightgray;
		border-radius:10px;
		display:inline-block;
		float:right;
		font-size:13px;
		margin-right:50px;
	}
	.writing_line2 {
		display:inline-block;
		border-top:1px solid lightgray;
		width:90%;
	}
	.contentsbox {
		display:inline-block;
		border:1px solid white;
		width:90%;
		height:600px;
		margin-top:50px;
	}
	
	.top { 	text-align:right;	}
	.top>button {
		border:none;
		width:100px;
		height:50px;
		border-radius:10px;
		font-weight:bold;
		margin-top:20px;
		background-color:rgb(72,115,210);
		color:white;
		font-size:20px;
		margin-right:45px;
	}
	.top>img {
		position:relative;
		top:10px;
		right:5px;
		cursor:pointer;
	}
	
	#textarea {
		width:95%; height:500px;
		background-color:white;
		border:none;
	}
	
	.button {
		text-align:left;
		width:80%;
		margin-top:-80px;
		margin-left:150px;		
		margin-bottom:50px;
	}
	.delete {
		border:1px solid lightgray;
		background-color:lightgray;
		width:100px; height:40px; 
		border-radius:5px;
		color:white;
	}
	.update {
		border:1px solid lightgray;
		background-color:gray;
		width:100px; height:40px; 
		border-radius:5px;
		color:white;
	}
	.end {
		border:1px solid lightgray;
		background-color:rgb(116,104,128);
		width:100px; height:40px; 
		border-radius:5px;
		color:white;
	}
	
	@media (min-width : 600px) {		
		.section { background-color:rgb(200,171,217); }
		.mainbox { width:1300px; }
	}
</style>
<script>
	$(document).ready(function() {
		$("#heart").click(function() {
			var name = $("#heart").attr("name");
			if (name == "before") {
				$(this).attr("src", "images/heart_after.png");
				$(this).attr("name", "after");
				
				$.ajax({
	                type: "post",
	                url: "near_heart_upload.do",             
	                data:{nid:"${vo.nid}"},
	                dataType: 'json',
	                success: function (result) {
	                	if (result) {
		                	location.reload();	                		
	                	} else {
	                		alert("Error");
	                	}
	                },
	           }); 
				
			} else {
				$(this).attr("src", "images/heart_before.png");
				$(this).attr("name", "before");
				
				$.ajax({
	                type: "post",
	                url: "near_heart_delete.do",             
	                data:{nid:"${vo.nid}"},
	                dataType: 'json',
	                success: function (result) {
	                	if (result) {
		                	location.reload();	                		
	                	} else {
	                		alert("Error");
	                	}
	                },
	           }); 
			}
		});
		
		
		$(".delete").click(function() {
			if (confirm("게시물을 삭제하시겠습니까?")) {	
				$.ajax({
	                type: "post",
	                url: "near_delete.do",             
	                data:{nid:"${vo.nid}"},
	                dataType: 'json',
	                success: function (result) {
	                	alert("게시물이 삭제되었습니다");
	                	location.replace("near.do");
	                },
	           }); 
			} 
		});
		
		$(".end").click(function(){
			if (confirm("게시물을 마감처리 하시겠습니까?")) {	
				$.ajax({
	                type: "post",
	                url: "near_end.do",             
	                data:{nid:"${vo.nid}"},
	                dataType: 'json',
	                success: function (result) {
	                	alert("게시물이 마감되었습니다");
	                	location.replace("near.do");
	                },
	           }); 
			} 
		});
		
		
		$(".chat").click(function() {
			var id = $(".chat").attr("id");
			var url = "chat_list.do?id="+id;
	        var name = "popup test";
	        var option = "width = 815, height = 1000, top = 200, left = 350, location = no"
	        window.open(url, name, option);
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
				<c:if test="${ vo.id ne session_id}">	
				<div class="top">	
					<c:if test="${heart eq 'f' }">
						<img src="images/heart_before.png" width=40px; height=40px; id="heart" name="before" >
					</c:if>
					<c:if test="${heart eq 't' }">	
						<img src="images/heart_after.png" width=40px; height=40px; id="heart" name="after" >
					</c:if>
						<button type="button" id="${vo.id }" class="chat">채팅하기</button>
				</div>
				</c:if>
				<div class="writing_line"></div>
				<p class="post_title"><span class="logo">${vo.category }</span>${vo.title }</p>
				<p class="name">${vo.id }</p>
				<div class="post_line"></div>
				<p class="post_date">${vo.startdate }</p>
				<button class="comments">채팅 0</button>
				<div class="post_line2"></div>
				<p class="recommend">관심 ${count }</p>
				<div class="post_line2"></div>
				<p class="view">조회 ${vo.hit }</p>
				<div class="writing_line2"></div>
				<div class="contentsbox">
					<textarea disabled style="resize: none;" id="textarea">${vo.content }</textarea>					
				</div>						
			</div>
			<c:if test="${ vo.id eq session_id}">
			<div class="button">
				<button type="button" class="delete">삭제</button>
				<button type="button" class="update" onclick="location.href='near_update.do?nid=${vo.nid}' ">수정</button>
				<button type="button" class="end">마감</button>
			</div>
			</c:if>
		</div>
	</section>
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>