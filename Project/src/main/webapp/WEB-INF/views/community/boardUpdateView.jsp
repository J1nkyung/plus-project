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


#BtnUp {
	width: 700px;
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
.removePic, .removeOldPic{
width:120px;
margin:1px;
}
#notiTxt:focus{
outline:none;
}
#notiTxt{
border:none;
margin:10px 0;
background-color:#ebf0f3;
padding:2px;
}
</style>
</head>
<body>
	<form name="updateForm" enctype="multipart/form-data">
		<div class="wrap">
			<h2>게시글 수정하기</h2>
			<hr>
			<input type="hidden" name="boardNum" value="${update.boardNum }">
			<input type="hidden" name="memberPic" value="${update.memberPic }"/>


			 
			<input type="hidden" name="clubNum" value="${update.clubNum}"/>
			<input type="hidden" name="memberNum" value="${update.memberNum}"/>
			
			<input type="text" id="memberNickname" name="memberNickname" value="작성자 : ${update.memberNickname }" readonly/>
			
			<textarea name="boardContent" id="content">${update.boardContent}</textarea>
             
            <img style="width:200px; height:100px;" id="oldPicSrc" src="${path }/resources${update.boardPic }" onerror="this.style.display='none';"> 
             <figcaption>기존 이미지</figcaption>
            <input type="hidden" name="boardPhoto" id="oldPic" value="${update.boardPic }"> 
            <button type="button" class="removeOldPic" onclick="removeOldPic();">기존파일삭제</button>
            			<input type="text" value=" 새로운 이미지 업로드 시 기존 이미지는 사라집니다" id="notiTxt" readonly>
				<div id="imgViewArea" style="margin-top:10px; display:none;">
					<img id="imgArea" style="width:200px; height:100px;" onerror="imgAreaError()"/></div>
            <input id="picFile" type="file" name="boardPhoto" />
            <button type="button" class="removePic" onclick="removePic();">현재파일삭제</button>
             <!---->
			<button type="button" id="BtnUp">저장하기</button><br/>
	<div class="submit"><a href="getCommunity?clubNum=${update.clubNum }">글 목록 가기</a></div>
		<hr></div>
	</form>
<script>
CKEDITOR.replace("content", {height:300, resize_enabled:false});


//등록한 사진 삭제하는 버튼
removePic = function(){
    $('.removePic').click(function(){
	$("#picFile").val("");
	document.getElementById("imgArea").src = "";
	}
)}
removeOldPic = function(){
    $('.removeOldPic').click(function(){
	$("#oldPic").val("");
	document.getElementById("imgArea").src = "";
	document.getElementById("oldPicSrc").src = "";
	}
)}


$(document).ready(function(){
	
	
	
	var formObj = $("form[name='updateForm']");
	
	console.log(formObj);
	
		$("#BtnUp").on("click", function(){
			formObj.attr("method", "post");
			formObj.attr("action", "updateViewPost");
			
		formObj.submit();
		
		alert('성공적으로 수정했습니다');
		})
		
	});
 
    
// 모임 프로필 이미지 미리보기 
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#imgArea').attr('src', e.target.result); 
		}
		reader.readAsDataURL(input.files[0]);
	}
}

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