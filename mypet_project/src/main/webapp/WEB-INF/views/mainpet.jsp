<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3e8fa4fd6bbcee08087de03a2b386eba&libraries=services"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<style>
	.top_box{
		height:50px;
		text-align:center;
		font-weight:bold;
		font-size:20px;
	}
	.middle_box{
		border:1px solid lightgray;
		border-radius:5px;
		height:370px;
	}
	.box1{
		border:1px solid lightgray;
		border-radius:5px;
		width:200px;
		height:200px;
		margin-top:5px;
		margin-left:5px;
		display:inline-block;
	}
	.box2{
		border:1px solid lightgray;
		border-radius:5px;
		width:265px;
		height:200px;
		margin-top:5px;
		margin-right:5px;
		display:inline-block;
		float:right;
	}
	.box3{
		border:1px solid lightgray;
		border-radius:5px;
		width:474px;
		height:100px;
		margin-top:5px;
		margin-left:5px;
	}
	.p1{
		font-weight:bold;
		margin-top:4px;
		margin-bottom:3px;
		margin-left:5px;
	}
	.p1 span{
		font-size:13px;
		font-weight:normal;
	}
	.bottom_box{
	text-align:center;
	}
	.bottom_box>.btn {
		border:none;
		width:100px;
		height:35px;
		border-radius:10px;
		font-weight:bold;
		background-color:rgb(168,199,123);
		color:white;
		font-size:20px;
		margin-top:8px;
	}
	.bottom_box>.btn:hover{
		background-color:rgb(109,141,61);
		color:white;
	}
	</style>
</head>
<body>
	<div class="top_box">
		<p>대표 반려동물 선택</p>
	</div>
	<div class="middle_box">
		<div class="box1"></div>
		<div class="box2">
			<p class="p1">이름<br><span>숑숑이</span></p>
			<p class="p1">품종<br><span>숑숑이</span></p>
			<p class="p1">크기<br><span>숑숑이</span></p>
			<p class="p1">생년월일<br><span>숑숑이</span></p>
		</div>
		<div class="box3">
			<p class="p1">특이사항<br><span>숑숑이</span></p>
		</div>
		<div class="bottom_box">
		<button class="btn">등록</button>
		</div>
	</div>
</body>
</html>