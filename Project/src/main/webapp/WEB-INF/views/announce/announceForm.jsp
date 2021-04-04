<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 등록</title>

<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

<style>
body {
	font-family: 'NanumSquare', sans-serif;
	margin-left: 40px;
}
.announce-wrap {
	width:750px;
	display:fles;
	flex-direction:column;
	margin:0 auto;
}
#announce-title {
	width: 710px;
	margin-bottom: 10px;
}

textarea {
	width: 710px;
	height: 400px;
	resize: none;
	margin-bottom: 10px;
	border: 1px solid #dddddd;
}

#announceBtn {
	width: 710px;
	height: 50px;
	border: 0;
	outline: 0;
	color: white;
	background-color: #001eff;
	margin-top: 30px;
}

.back-to-list {
	margin-top: 30px;
}
</style>
</head>
<body>
	<form action="insertAnnounce.do" method="post">
		<div class="announce-wrap">
			<h2>공지사항 등록</h2>
			<hr>
			<input type="text" class="form-control" id="announce-title"
				placeholder="제목을 입력해주세요." name="">
			<textarea></textarea>
			<button type="submit" id="announceBtn">등록하기</button>
			<br>
			<a class="back-to-list" href="announce.do">글 목록 가기</a>
		</div>
	</form>
	<hr>

</body>
</html>













