<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
  %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <c:set var="pageNumber" value='${pageNumber}' />
<c:set var="targetpage" value='${targetpage}' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<style>
	.section {
		text-align:center;
	}
	.mainbox {
		width:1200px;
		display:inline-block;
		text-align:center;
		background-color:white;
	}
	.title {
		margin-top:110px;
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
	.mainbox2 {
		display:inline-block;
		width:1200px;
		background-color:white;
	}
	.subtitle {
		margin-top:60px;
		margin-left:70px;
		float:left;
		font-weight:bold;
		font-size:20px;
		cursor:pointer;
	}
	.subtitle>.picture_diary {
		margin-left:20px;
		color:gray;
		font-weight:normal;
		font-size:20px;
	}
	.subtitle>.free_diary {
		margin-right:20px;
		color:gray;
		font-weight:normal;
		font-size:20px;
	}
	.board {
		border-top:1px solid lightgray;
		display:inline-block;
		width:1100px;
	}
	.board td:nth-child(2):hover { text-decoration:underline; }
	.board a{
		text-decoration:none;
	}
	.board>table { font-size:14px; }
	.pagenum {
		display:inline-block;
	}
	.page { text-align:center; }
	.page>nav { display:inline-block; }
	.write {
		float:right;
		border:none;
		width:20%;
		height:50px;
		border-radius:10px;
		font-weight:bold;
		margin-top:50px;
		background-color:rgb(72,115,210);
		color:white;
		font-size:20px;
		margin-bottom:110px;		
	}
	.write:hover {
		background-color:rgb(0,68,130);
		color:white;
	}
	.picturebox {
		display:none;
	}
	.picture_div {
		width:200px;
		height:280px;
		display:inline-block;
		color:black;
		margin-top:15px; 
	}
	.picture {
		border:1px solid lightgray;
		width:200px;
		height:200px;
		display:inline-block;
		border-radius:5px;
	}
	.picture_div p { text-align:left; }
	.pictrue_title {
		font-weight:bold;
	}
	.picture_title>span { color:red; }
	.picture_title:hover { text-decoration:underline; }
	.picture_name, .picture_date { color:gray; font-size:14px; }
	
	.pagination {
	  display: inline-block;
	  padding-left: 0;
	  margin: 20px 0;
	  border-radius: 4px;
	}
	.pagination > li {
	  display: inline;
	}
	.pagination > li > a,
	.pagination > li > span {
	  position: relative;
	  float: left;
	  padding: 6px 12px;
	  margin-left: -1px;
	  line-height: 1.42857143;
	  color: #337ab7;
	  text-decoration: none;
	  background-color: #fff;
	  border: 1px solid #ddd;
	}
	.pagination > li:first-child > a,
	.pagination > li:first-child > span {
	  margin-left: 0;
	  border-top-left-radius: 4px;
	  border-bottom-left-radius: 4px;
	}
	.pagination > li:last-child > a,
	.pagination > li:last-child > span {
	  border-top-right-radius: 4px;
	  border-bottom-right-radius: 4px;
	}
	.pagination > li > a:hover,
	.pagination > li > span:hover,
	.pagination > li > a:focus,
	.pagination > li > span:focus {
	  z-index: 2;
	  color: #23527c;
	  background-color: #eee;
	  border-color: #ddd;
	}
	
	@media (min-width : 600px) {		
		.section { background-color:rgb(247,179,42); }
		.mainbox { width:1300px; }
	}
	@media (max-width : 500px) {
		.mainbox { width:85%; margin-bottom:100px; }
		.mainbox2, .board { width:100%; }
		.title, .mainbox2>p { margin-left:0; }
		.board>table { font-size:12px; }
	}
</style>
<script>
	$(document).ready(function(){
		$(".picture_diary").click(function(){
			$(".picturebox").css("display","inline-block");
			$(".freebox").css("display","none");
		});
		
		$(".free_diary").click(function(){
			$(".freebox").css("display","inline-block");
			$(".picturebox").css("display","none");
		});
	})
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
		<section class="section">
		<div class="mainbox">
			<p class="title">펫 일기<span>Pet Diary</span></p>
			<div class ="mainbox2 freebox">
				<p class="subtitle">자유게시판<span class="picture_diary" onclick="location.href='diary_pictures.do'">사진게시판</span></p>
				<div class="board">
					<table class="board2 table table-hover">
						<thead style="border-bottom:1px solid; ">
							<tr>
								<th>번호</th>
								<th width=650px;>제목</th>
								<th>글쓴이</th>
								<th width=150px;>등록일</th>
								<th width=60px;>추천수</th>
								<th width=60px;>조회수</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var = "vo"  items="${free_list}"  >
							<tr onclick="location.href='diary_free_contents.do?fid=${vo.fid}'" style="border-bottom:1px solid lightgray;">
								<th>${vo.rno }</th>
								<td>${vo.ftitle }<span style="color:red"><c:if test="${vo.c_count ne 0 }"> [${vo.c_count }]</c:if></span></td>
								<td>${vo.id }</td>
								<td>${vo.fdate }</td>
								<td>${vo.fheart }</td>
								<td>${vo.fhit }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
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
								<li><a href="diary_free.do?pnum=<%= startPage -1 %>"><span><</span></a></li>
							<%
								} else {
							%>
								<li><span style="color: gray;"><</span></li>
							<%
								}
								for(int i = startPage; i < Integer.parseInt(pageNumber); i++) {
							%>
								<li><a href="diary_free.do?pnum=<%= i %>" style="color: #000000;"><%= i %></a></li>
							<%
								}
							%>
								<li class="active_page" ><a href="diary_free.do?pnum=<%= pageNumber %>" style="background-color: #337ab7;color: #ffffff;"><%= pageNumber %></a></li>
							<%
								for(int i = Integer.parseInt(pageNumber) + 1; i <= targetPage + Integer.parseInt(pageNumber); i++) {
									if(i < startPage +10) {
							%>
								<li><a href="diary_free.do?pnum=<%= i %>" style="color: #000000;"><%= i %></a></li>
							<%
									}
								}
								if(targetPage + Integer.parseInt(pageNumber) > startPage + 9){
							%>
								<li><a href="diary_free.do?pnum=<%= startPage + 10 %>" style= "color: #000000;"><span>></span></a></li>
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
					<button class="write" onclick="location.href='diary_free_writing.do' ">글쓰기</button>
				</div>
			</div>	
		</div>			
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>