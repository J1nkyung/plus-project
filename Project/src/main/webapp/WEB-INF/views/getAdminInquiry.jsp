<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>나의 문의 사항</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<!-- font -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<style>
body {
	font-family: 'NanumSquare', sans-serif;
	margin-left: 40px;
}
.content-data {
	padding:30px;
}
tr {
	height:50;}
td {
	padding-left:20px;
}
</style>

</head>
<body>
<div class="wrapper">
<center>
	<h2>문의 상세보기</h2>
	<hr>


	<table border="1" width="70%" height="200">
		<div class="container">
			<div class="post">
				<tr>
					<th width="10%"><center>제목</center></th>
					<td>${adminInquiry.inquiryTitle}</td>
				</tr>	
				<tr>
					<th width="10%"><center>닉네임</center></th>
					<td>${adminInquiry.memberNickname}</td>
				</tr>
				<tr>
					<th><center>이메일</center></th>
					<td>${adminInquiry.memberEmail}</td>
				</tr>
				<tr>
					<th><center>카테고리</center></th>
					<td>${adminInquiry.inquiryType}</td>
				</tr>	
				<tr>
					<th><center>문의일자</center></th>
					<fmt:parseDate var="parseRegDate" value="${adminInquiry.inquiryRegDate}"
							pattern="yyyy-MM-dd" />
						<fmt:formatDate var="resultRegDt" value="${parseRegDate}"
							pattern="yyyy-MM-dd" />
						<td style="padding-left:20px;">${resultRegDt}</td>
				</tr>
				<tr>
					<th><center>내용</center></th>
					<td class="content-data" style="white-space:pre;">${adminInquiry.inquiryContent}</td>
				</tr>
			</div>
		</div>
	</table>
	
	<hr>
	
	<form action="deleteAdminInquiry.do" method="post" style="display:inline-block;">
	<input type="hidden" value="${adminInquiry.inquiryNum}" name="inquiryNum">
	<a href="deleteAdminInquiry.do"><button type="submit" class="btn btn-danger" id="deleteBtn">삭제</button></a>
	</form>
	<form action="answerInquiry.do" method="post" style="display:inline-block;">
	<input type="hidden" value="${adminInquiry.inquiryNum}" name="inquiryNum">
	<a href="inquiryAnswerForm.jsp"><button type="submit" class="btn btn-primary" id="answerBtn">답변 작성</button></a>
	</form>
	<!-- <a href="inquiryEditForm.jsp"><button type="submit" class="btn btn-primary" id="editBtn">수정</button></a> -->
	
	<a href="adminInquiry.do"><button type="submit" class="btn btn-primary" id="listBtn">문의 목록</button></a>
	
	
	

</center>
</div>

<script>
		$(document).ready(function(){
			$("#deleteBtn").on("click", function(){
				alert("문의가 정상적으로 삭제되었습니다");
			});
		});
</script>

</body>
</html>