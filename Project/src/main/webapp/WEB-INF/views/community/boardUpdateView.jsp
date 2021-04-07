<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>글쓰기</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="${path}/resources/ckeditor/ckeditor.js"></script>

<style>
body {
	font-family: 'NanumSquare', sans-serif;
}

header {
	height: 50px;
	margin-bottom: 20px;
}

.wrap {
	width: 710px;
	display: flex;
	flex-direction: column;
	margin: 0 auto;
}

#memberNickname{
border:none;
margin-bottom:10px;
}
#memberNickname:focus{
outline: -webkit-focus-ring-color auto 0px;
}


#submitBtn {
	width: 710px;
	height: 50px;
	border: 0;
	outline: 0;
	color: white;
	background-color: #001eff;
	margin-top: 30px;
}
.submit a {
float:right;
}
</style>
</head>
<body>
	<form name="updateForm" role="form" action="updateView" method="post">
		<div class="wrap">
			<h2>게시글 수정하기</h2>
			<hr>
			<input type="hidden" name="boardNum" value="${update.boardNum }">
			<input type="hidden" name="memberPic" value="${update.memberPic }"/>
			<input type="hidden" name="boardRegDate" value="${update.boardRegDate }"/>
			<input type="hidden" name="clubNum" value="2"/>
			<input type="hidden" name="memberNum" value="3"/>
			
			<!-- <input type="text" class="form-control" id="title"
				placeholder="제목을 입력해주세요." name="title"> -->
			
			<input type="text" id="memberNickname" name="memberNickname" value="작성자 : ${update.memberNickname }" readonly/>
			
			<textarea name="boardContent" id="content">${update.boardContent}</textarea>
			<button type="submit" id="BtnUp">저장하기</button><br/>
	<div class="submit"><a href="getCommunity">글 목록 가기</a></div>
		<hr></div>
	</form>
<script>
CKEDITOR.replace("content", {height:300, resize_enabled:false});

</script>
</body>
</html>