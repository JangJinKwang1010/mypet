<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <c:set var="pageNumber" value='${pageNumber}' />
<c:set var="targetpage" value='${targetpage}' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<link href="css/page.css" rel="stylesheet">
<title>Mypet</title>
<style>
	.section {
		text-align:center;
		background-color:rgb(226,143,173);
	}
	.mainbox {
		width:1300px;
		display:inline-block;
		text-align:center;
		background-color:white;
	}
	.main {
		width:65%; height:600px;
		display:inline-block;
		border:1px solid lightgray;
		border-radius:30px;
		margin-bottom:100px;
	}
	.title2 {
		margin:100px 0 0 0;
		margin-left:100px;
		float:left;
		font-weight:bold;
		font-size:30px;
		display:inline-block;
	}
	.btn_div {
		margin:160px 0 300px 0;
		border:1px solid lightgray;
		text-align:left;
		background-color:rgb(249,249,249);
		height:50px;
		width:100.3%;
		margin-left:-1px;
	}
	.btn_div>div {
		display:inline-block;
		margin:0;
		height:100%;
		padding:12px 10px;
		cursor:pointer;
	}
	.btn_div>div:first-child { border-right:1px solid lightgray; color:rgb(245,137,123); font-weight:bold; }
	.btn_div>div:last-child { margin-left:-5px;}
	
	table { width:100%; text-align:center;}
	thead>tr { border-bottom:1px solid lightgray; height:40px; color:rgb(71,71,71); }
	thead>tr>th { padding-top:7px; }
	tbody>tr { border-bottom:1px solid lightgray; height:30px; font-size:14px; }
	tbody>tr>td { padding-top:4px; }
	
	.btitle:hover { text-decoration:underline; cursor:pointer; }
	
	.delete { border:2px solid lightgray; background-color:rgb(240,240,240); margin:5px; }
</style>
<script>
function selectAll(selectAll)  {
	  const checkboxes = document.getElementsByName('check');	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<section class="section">
		<div class="mainbox">
			<jsp:include page="mypage_commons.jsp"></jsp:include>
			<div class="main postmanager">
				<p class="title2">게시물 관리</p>
					<div class="btn_div">
						<div onclick="location.href='mypage_post.do' ">내가 쓴 글</div>
						<div onclick="location.href='mypage_comment.do' ">내가 쓴 댓글</div>
						<table>
						<thead>
							<tr>
								<th><input type="checkbox"  onclick='selectAll(this)' value='selectall'></th>
								<th>제목</th>
								<th>날짜</th>
								<th>댓글수</th>
								<th>조회수</th>
								<th>좋아요</th>
								<th>싫어요</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${empty list }">
							<tr>
								<td colspan = 7>작성된 게시글이 없습니다</td>
							</tr>
						</c:if>
						<c:forEach var = "vo"  items="${list}"  >
								<tr>
									<td><input type="checkbox" name='check'  style="width:30px;"></td>
									<td class="btitle" style="width:300px; color:rgb(53,128,187); " onclick="location.href='diary_free_contents.do?fid=${vo.fid}' ">${vo.ftitle }</td>
									<td style="width:200px;">${vo.fdate }</td>
									<td>${vo.c_count }</td>
									<td>${vo.fhit }</td>
									<td>${vo.fheart }</td>
									<td>${vo.fnheart }</td>
								</tr>	
						</c:forEach>						
						</tbody>
						</table>
					<button type="button"  class="delete">삭제</button>
					</div>
					<div class="page">
						<nav aria-label="...">
							<ul class = "pagination" style="margin: 0 auto;">
							<%	
								String pageNumber = String.valueOf(pageContext.getAttribute("pageNumber"));
								int startPage = (Integer.parseInt(pageNumber) / 10) *10 + 1; 
								if(Integer.parseInt(pageNumber) % 10 == 0) startPage -= 10;
								int targetPage = Integer.parseInt(String.valueOf(pageContext.getAttribute("targetpage")));
								if(startPage != 1) {
							%>
								<li><a href="mypage_post.do?pnum=<%= startPage -1 %>"><span><</span></a></li>
							<%
								} else {
							%>
								<li><span style="color: gray;"><</span></li>
							<%
								}
								for(int i = startPage; i < Integer.parseInt(pageNumber); i++) {
							%>
								<li><a href="mypage_post.do?pnum=<%= i %>" style="color: #000000;"><%= i %></a></li>
							<%
								}
							%>
								<li class="active_page" ><a href="mypage_post.do?pnum=<%= pageNumber %>" style="background-color: #337ab7;color: #ffffff;"><%= pageNumber %></a></li>
							<%
								for(int i = Integer.parseInt(pageNumber) + 1; i <= targetPage + Integer.parseInt(pageNumber); i++) {
									if(i < startPage +10) {
							%>
								<li><a href="mypage_post.do?pnum=<%= i %>" style="color: #000000;"><%= i %></a></li>
							<%
									}
								}
								if(targetPage + Integer.parseInt(pageNumber) > startPage + 9){
							%>
								<li><a href="mypage_post.do?pnum=<%= startPage + 10 %>" style= "color: #000000;"><span>></span></a></li>
							<%
								} else {
							%>
								<li><span style="color: gray;">></span></li>
							<%		
								}
							%>
							</ul>	
						</nav>			
					</div>
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>