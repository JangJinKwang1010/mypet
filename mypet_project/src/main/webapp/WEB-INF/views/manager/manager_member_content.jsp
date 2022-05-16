<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet 관리자</title>
<script src="js/jquery-3.6.0.min.js"></script>
<style>
	section {
		text-align:center;
	}
	.box {
		border:1px solid gray;
		width:450px;
		height:500px;
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
	.paw{
 			width:10px;
 			height:10px;
 			padding:3px;
 		}
</style>
</head>
<script>
	$(document).ready(function() {
		
		$(".delete").click(function() {
			var con_test = confirm("선택한 회원을 삭제하시겠습니까?"); 
        	if(con_test == true){ 
        		$.ajax({
    		        url:"manager_member_delete.do",
    		        type:"post",
    		        data: {id:"${vo.id}"},
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
			<img src="images/human2.png" width=100%; height=100%;>
			</div>
			<div class="namebox">
				<label>이름</label>
				<p>${vo.name }</p>
			</div>
			<button type="button" class="delete" >회원삭제</button>
		</div>	
		<div class="category box2">
			<label>가입일자</label>
			<p>${vo.mdate }</p>
		</div>	
		<div class="kind box2">
			<label>회원아이디</label>
			<p>${vo.id }</p>
		</div>	
		<div class="bulk box2">
			<label>이메일</label>
			<p>${vo.email }</p>
		</div>	
		<div class="startdate box2">
			<label>휴대폰번호</label>
			<p>${vo.hp }</p>
		</div>	
		<div class="gender box2">
			<label>성별</label>
			<c:if test="${vo.gender eq 'male' }">
				<p>남자</p>
			</c:if>
			<c:if test="${vo.gender eq 'female' }">
				<p>여자</p>
			</c:if>
		</div>	
		<div class="birth box2">
			<label>생년월일</label>
			<p>${vo.birth }</p>
		</div>	
		<div class="coment box3">
			<label>주소</label>
			<p>${vo.addr1} ${vo.addr2 }</p>
			<label>경력사항</label>
			<c:if test="${empty list }">
				<p>경력사항이 없습니다</p>
			</c:if>
			<c:forEach var = "vo"  items="${list}" >
			<c:if test="${vo.enddate eq null }">
				<p class="p3"><img class="paw" src="images/paw.png">[${vo.category }]   ${vo.kind }		${vo.bulk }			${vo.startdate } ~ 양육중</p>
			</c:if>
			<c:if test="${vo.enddate ne null }">
				<p class="p3"><img class="paw" src="images/paw.png">[${vo.category }]   ${vo.kind }		${vo.bulk }			${vo.startdate } ~ ${vo.enddate }</p>
			</c:if>
			</c:forEach>
		</div>	
	</div>
</section>
</body>
</html>