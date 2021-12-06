<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<style>
.section {
	text-align:center;
}
.mainbox {
	width:1200px;
	display:inline-block;
	margin-top:50px;
	text-align:center;
}
.title {
	margin-top:60px;
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
.mainbox2{
	display:inline-block;
	width:1200px;
}
.subtitle {
	margin-top:60px;
	margin-left:130px;
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
.board{
	border:1px solid lightgray;
	display:inline-block;
	width:1000px;
	height:500px;	
}
.pagenum{
	display:inline-block;
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
								<th>3</th>
								<td>엄준식</td>
								<td>엄</td>
								<td>21/12/06</td>
								<td>3</td>
								<td>15</td>
							</tr>
						</tbody>
					</table>
					<button type="button" class="btn btn-outline-success">이전 페이지</button>
					<p class="pagenum"><1></p>
					<button type="button" class="btn btn-outline-success">다음 페이지</button>
				</div>
			</div>				
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>