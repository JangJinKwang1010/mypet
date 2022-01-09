<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet</title>
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
	}
	.subtitle {
		margin-top:60px;
		margin-left:70px;
		float:left;
		font-weight:bold;
		font-size:20px;
	}
	.subtitle>span {
		margin-left:20px;
		color:gray;
		font-weight:normal;
		font-size:20px;
	}
	.board {
		border-top:1px solid lightgray;
		display:inline-block;
		width:1100px;
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
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
		<section class="section">
		<div class="mainbox">
			<p class="title">펫 일기<span>Pet Diary</span></p>
			<div class ="mainbox2">
				<p class="subtitle">자유게시판<span>사진게시판</span></p>
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
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>