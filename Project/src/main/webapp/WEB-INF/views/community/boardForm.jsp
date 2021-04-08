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
.removePic{
width:75.9px;
margin:1px;
}
</style>
</head>
<body>
	<form action="insertBoard" method="post" enctype="multipart/form-data">
		<div class="wrap">
			<h2>게시글 등록하기</h2>
			<hr>
			<input type="hidden" name="memberPic" value="${user.memberPic }"/>
			<input type="hidden" name="clubNum" value="2"/><!-- ${board.clubNum}으로 가져오는건가?? -->
			<input type="hidden" name="memberNum" value="${user.memberNum}"/>
			<input type="hidden" name="boardPic" value=""/>
			
			<!-- <input type="text" class="form-control" id="title"
				placeholder="제목을 입력해주세요." name="title"> -->
			
			<input type="text" id="memberNickname" name="memberNickname" value="작성자 : ${user.memberNickname }" readonly/>
			
			<textarea name="boardContent" id="content" ></textarea>
            <input id="picFile" type="file" name="boardPhoto" value="${board.boardPic }" />
             				<!-- 이미지 미리보기 영역  -->
				<div id="imgViewArea" style="margin-top:10px; display:none;">
					<img id="imgArea" style="width:200px; height:100px;" onerror="imgAreaError()"/></div>
           	<button type="button" class="removePic" onclick="removePic();">파일삭제</button>
			<button type="submit" id="submitBtn">등록하기</button><br/>
	<div class="submit"><a href="getCommunity">글 목록 가기</a></div>
		<hr></div>
	</form>
<script>
CKEDITOR.replace("content", {height:300, resize_enabled:false});

//등록한 사진 삭제하는 버튼
removePic = function(){
    $('.removePic').click(function(){
	$("#picFile").val("");
}
    )}
    

$("#picFile").change(function() {
	if(  $("#picFile").val() == '' ) {
		$('#imgArea').attr('src' , '');  
	}
	$('#imgViewArea').css({ 'display' : '' });
	readURL(this);
});


//미리보기 에러시 
function imgAreaError(){
$('#imgViewArea').css({ 'display' : 'none' });
} 

</script>
</body>
</html>