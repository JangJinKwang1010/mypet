<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dddddd</title>
<script src="js/jquery-3.6.0.min.js"></script>
<style>
	section{
		width:494px;
		height:294px;
		background-image:url("/mypet/images/infobackground.png");
	}
 	.photo{
 		border:1px solid lightgray;
 		width:120px;
 		height:120px;
 		margin-top:3px;
 		margin-left:3px;
 		display:inline-block;
 		float:left;

 	}
 		.info{
 			border:1px solid white;
 			width: 280px;
 			height:120px;
 			margin-top:3px;
 			margin-left:20px;
 			display:inline-block;
 			float:left;
 		}
 		.p1{
 			font-weight:bold;
 			font-size:15px;
 			margin-top:4px;
 			margin-bottom:2px;
 		}
 		.p2 {
 			font-size:14px;
 			margin-top:2px;
 			margin-bottom:2px;
 		}
 		.p3{
 			font-size:13px;
 			margin-top:2px;
 			margin-bottom:2px;
 		}
 		.career{
 			width:412px;
 			height:150px;
 			float:left;
 			margin-top:10px;
 			margin-left:3px;
 		}
 		.paw{
 			width:10px;
 			height:10px;
 			padding:3px;
 		}
 		.p3{
 			margin-top:3px;
 			margin-bottom:3px;
 		}
</style>
<body>
<section>
	<div class="photo">
		<img src="upload/${vo.sfile }" width=100%; height=100%;>
	</div>
	<div class="info">
		<p class="p1">이름</p>
		<p class="p2">${vo.name }</p>
		<p class="p1">이메일</p>
		<p class="p2">${vo.email }</p>
	</div>
	<div class="career">
		<p class="p1">경력</p>
		<c:forEach var = "vo"  items="${list}" >
			<c:if test="${vo.enddate eq null }">
				<p class="p3"><img class="paw" src="images/paw.png">[${vo.category }]   ${vo.kind }		${vo.bulk }			${vo.startdate } ~ 양육중</p>
			</c:if>
			<c:if test="${vo.enddate ne null }">
				<p class="p3"><img class="paw" src="images/paw.png">[${vo.category }]   ${vo.kind }		${vo.bulk }			${vo.startdate } ~ ${vo.enddate }</p>
			</c:if>
		</c:forEach>
	</div>
</section>
</body>
</html>