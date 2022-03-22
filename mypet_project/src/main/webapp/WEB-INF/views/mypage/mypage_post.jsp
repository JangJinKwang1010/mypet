<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery-3.6.0.min.js"></script>
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
		width:65%;
		display:inline-block;
		border:1px solid lightgray;
		border-radius:30px;
		margin-bottom:100px;
	}
	.title2 {
		margin:100px 0;
		margin-left:100px;
		float:left;
		font-weight:bold;
		font-size:30px;
	}
</style>
<script>
	
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<section class="section">
		<div class="mainbox">
			<jsp:include page="mypage_commons.jsp"></jsp:include>
			<div class="main postmanager">
				<p class="title2">게시물 관리<span></span></p>
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
							<td>장진광</td>
							<td>냥이귀엽죠~</td>
							<td>21/12/06</td>
							<td>3</td>
							<td>15</td>
						</tr>
						<tr>
							<th>2</th>
							<td>장진광</td>
							<td>냥이귀엽죠~</td>
							<td>21/12/06</td>
							<td>3</td>
							<td>15</td>
						</tr>
						<tr>
							<th>3</th>
							<td>장진광</td>
							<td>냥이귀엽죠~</td>
							<td>21/12/06</td>
							<td>3</td>
							<td>15</td>
						</tr>
						<tr>
							<th>4</th>
							<td>장진광</td>
							<td>냥이귀엽죠~</td>
							<td>21/12/06</td>
							<td>3</td>
							<td>15</td>
						</tr>
						<tr>
							<th>5</th>
							<td>장진광</td>
							<td>냥이귀엽죠~</td>
							<td>21/12/06</td>							
							<td>3</td>
							<td>15</td>
						</tr>
						<tr>
							<th>6</th>
							<td>장진광</td>
							<td>냥이귀엽죠~</td>
							<td>21/12/06</td>
							<td>3</td>
							<td>15</td>
						</tr>
						<tr>
							<th>7</th>
							<td>장진광</td>
							<td>냥이귀엽죠~</td>
							<td>21/12/06</td>
							<td>3</td>
							<td>15</td>
						</tr>
						<tr>
							<th>8</th>
							<td>장진광</td>
							<td>냥이귀엽죠~</td>
							<td>21/12/06</td>
							<td>3</td>
							<td>15</td>
						</tr>
						<tr>
							<th>9</th>
							<td>장진광</td>
							<td>냥이귀엽죠~</td>
							<td>21/12/06</td>
							<td>3</td>
							<td>15</td>
						</tr>
						<tr>
							<th>10</th>
							<td>장진광</td>
							<td>냥이귀엽죠~</td>
							<td>21/12/06</td>
							<td>3</td>
							<td>15</td>
						</tr>
					</tbody>
				</table>			
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>