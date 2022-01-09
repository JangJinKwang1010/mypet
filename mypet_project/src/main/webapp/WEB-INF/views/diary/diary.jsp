<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
  %>

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
	.picturebox{
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
				<p class="subtitle">자유게시판<span class="picture_diary">사진게시판</span></p>
				<div class="board">
					<table class="board2 table table-striped table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>글쓴이</th>
								<th>제목</th>
								<th>등록일</th>
								<th>추천수</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>1</th>
								<td>간식킬러</td>
								<td>강쥐귀엽죠~</td>
								<td>21/12/06</td>
								<td>3</td>
								<td>15</td>
							</tr>
							<tr>
								<th>2</th>
								<td>냥냥펀치</td>
								<td>냥이귀엽죠~</td>
								<td>21/12/06</td>
								<td>3</td>
								<td>15</td>
							</tr>
							<tr>
								<th>2</th>
								<td>냥냥펀치</td>
								<td>냥이귀엽죠~</td>
								<td>21/12/06</td>
								<td>3</td>
								<td>15</td>
							</tr>
							<tr>
								<th>2</th>
								<td>냥냥펀치</td>
								<td>냥이귀엽죠~</td>
								<td>21/12/06</td>
								<td>3</td>
								<td>15</td>
							</tr>
							<tr>
								<th>2</th>
								<td>냥냥펀치</td>
								<td>냥이귀엽죠~</td>
								<td>21/12/06</td>
								<td>3</td>
								<td>15</td>
							</tr>
							<tr>
								<th>2</th>
								<td>냥냥펀치</td>
								<td>냥이귀엽죠~</td>
								<td>21/12/06</td>
								<td>3</td>
								<td>15</td>
							</tr>
							<tr>
								<th>2</th>
								<td>냥냥펀치</td>
								<td>냥이귀엽죠~</td>
								<td>21/12/06</td>
								<td>3</td>
								<td>15</td>
							</tr>
							<tr>
								<th>2</th>
								<td>냥냥펀치</td>
								<td>냥이귀엽죠~</td>
								<td>21/12/06</td>
								<td>3</td>
								<td>15</td>
							</tr>
							<tr>
								<th>2</th>
								<td>냥냥펀치</td>
								<td>냥이귀엽죠~</td>
								<td>21/12/06</td>
								<td>3</td>
								<td>15</td>
							</tr>
							<tr>
								<th>2</th>
								<td>냥냥펀치</td>
								<td>냥이귀엽죠~</td>
								<td>21/12/06</td>
								<td>3</td>
								<td>15</td>
							</tr>
							<tr>
								<th>2</th>
								<td>냥냥펀치</td>
								<td>냥이귀엽죠~</td>
								<td>21/12/06</td>
								<td>3</td>
								<td>15</td>
							</tr>
						</tbody>
					</table>
					<div class="page">
						<nav aria-label="...">
						  <ul class="pagination pagination-sm">
						    <li class="page-item active" aria-current="page">
						      <span class="page-link">1</span>
						    </li>
						    <li class="page-item"><a class="page-link" href="#">2</a></li>
						    <li class="page-item"><a class="page-link" href="#">3</a></li>
						  </ul>
						</nav>						
					</div>
					<button class="write">글쓰기</button>
				</div>
			</div>				
		
			<div class ="mainbox2 picturebox">
				<p class="subtitle"><span class="free_diary">자유게시판</span>사진게시판</p>
				<div class="board">
					<a href="#">
						<div class="picture_div">
							<div class="picture">
								<img src="images/dog_ex1.png" width=100%; height=100%; >
							</div>
							<p class="picture_title">새로 가입했어용 <span>[5]</span></p>
							<p class="picture_name">우리집사는똥멍청이</p>
							<p class="picture_date">2022.01.09 <span>조회 55</span></p>
						</div>					
					</a>
					<a href="#">
						<div class="picture_div">
							<div class="picture">
								<img src="images/dog_ex1.png" width=100%; height=100%; >
							</div>
							<p class="picture_title">새로 가입했어용 <span>[5]</span></p>
							<p class="picture_name">우리집사는똥멍청이</p>
							<p class="picture_date">2022.01.09 <span>조회 55</span></p>
						</div>					
					</a>
					<a href="#">
						<div class="picture_div">
							<div class="picture">
								<img src="images/dog_ex2.png" width=100%; height=100%; >
							</div>
							<p class="picture_title">새로 가입했어용 <span>[5]</span></p>
							<p class="picture_name">우리집사는똥멍청이</p>
							<p class="picture_date">2022.01.09 <span>조회 55</span></p>
						</div>					
					</a>
					<a href="#">
						<div class="picture_div">
							<div class="picture">
								<img src="images/dog_ex2.png" width=100%; height=100%; >
							</div>
							<p class="picture_title">새로 가입했어용 <span>[5]</span></p>
							<p class="picture_name">우리집사는똥멍청이</p>
							<p class="picture_date">2022.01.09 <span>조회 55</span></p>
						</div>					
					</a>
					<a href="#">
						<div class="picture_div">
							<div class="picture">
								<img src="images/dog_ex3.png" width=100%; height=100%; >
							</div>
							<p class="picture_title">새로 가입했어용 <span>[5]</span></p>
							<p class="picture_name">우리집사는똥멍청이</p>
							<p class="picture_date">2022.01.09 <span>조회 55</span></p>
						</div>					
					</a>
					<a href="#">
						<div class="picture_div">
							<div class="picture">
								<img src="images/dog_ex3.png" width=100%; height=100%; >
							</div>
							<p class="picture_title">새로 가입했어용 <span>[5]</span></p>
							<p class="picture_name">우리집사는똥멍청이</p>
							<p class="picture_date">2022.01.09 <span>조회 55</span></p>
						</div>					
					</a>
					<a href="#">
						<div class="picture_div">
							<div class="picture">
								<img src="images/dog_ex1.png" width=100%; height=100%; >
							</div>
							<p class="picture_title">새로 가입했어용 <span>[5]</span></p>
							<p class="picture_name">우리집사는똥멍청이</p>
							<p class="picture_date">2022.01.09 <span>조회 55</span></p>
						</div>					
					</a>
					<div class="page">
						<nav aria-label="...">
						  <ul class="pagination pagination-sm">
						    <li class="page-item active" aria-current="page">
						      <span class="page-link">1</span>
						    </li>
						    <li class="page-item"><a class="page-link" href="#">2</a></li>
						    <li class="page-item"><a class="page-link" href="#">3</a></li>
						  </ul>
						</nav>						
					</div>
					<button class="write">글쓰기</button>
				</div>
			</div>	
		</div>			
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>