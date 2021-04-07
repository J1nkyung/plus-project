<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>문의 수정하기</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<style>
body {
	font-family: 'NanumSquare', sans-serif;
}

header {
	height: 50px;
	margin-bottom: 20px;
}

.inquiry-wrap {
	width: 710px;
	display: flex;
	flex-direction: column;
	margin: 0 auto;
}

.inquiry-category {
	width: 200px;
	margin-bottom: 20px;
}

#inquiry-title {
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

#inquiryBtn {
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
	<form action="editInquiry.do" method="post">
		<div class="inquiry-wrap">
			<h1>1:1문의 수정</h1>
			<hr>
			<div class="inquiry-category">
				<label for="exampleFormControlSelect2">카테고리 선택</label>
				<select	name="inquiryType" id="id_select" class="form-control">
					<option value="회원문의" <c:if test="${inquiry.inquiryType == '회원문의'}">selected</c:if>>회원문의</option>
					<option value="모임문의" <c:if test="${inquiry.inquiryType == '모임문의'}">selected</c:if>>모임문의</option>
					<option value="결제문의" <c:if test="${inquiry.inquiryType == '결제문의'}">selected</c:if>>결제문의</option>
					<option value="기타문의" <c:if test="${inquiry.inquiryType == '기타문의'}">selected</c:if>>기타문의</option>
				</select>
			</div>
			<input type="hidden" value="${inquiry.inquiryNum}" name="inquiryNum">
			<input type="text" class="form-control" id="inquiry-title"
				name="inquiryTitle" value="${inquiry.inquiryTitle}">
			<textarea name="inquiryContent" style="white-space:pre;">${inquiry.inquiryContent}</textarea>
			<button type="submit" id="inquiryBtn">수정하기</button><br/>
	  
			<div class="submit"><a href="inquiry.do">글 목록 가기</a></div>
		<hr></div>
	</form>
	
<script>

		$(document).ready(function(){

			$("#inquiryBtn").on("click", function(){
				alert("문의가 정상적으로 수정 되었습니다");
			});
			
</script>
</body>
</html>