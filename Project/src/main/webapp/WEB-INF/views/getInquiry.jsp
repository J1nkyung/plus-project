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
<style>
body {
	font-family: 'NanumSquare', sans-serif;
	margin-left: 40px;
}
</style>

</head>
<body>

	<h2>1:1 문의</h2>
	<br />


	<table border="1" width="70%" height="200">
		<div class="container">
			<div class="post">
			<tr height="50">
				<th><center>제목</center></th>
				<td style="text-indent:20px">${inquiry.inquiryTitle}</td>
			</tr>	
			<tr height="50">
				<th><center>닉네임</center></th>
				<td style="text-indent:20px">${inquiry.memberNickname}</td>
			</tr>
			<tr height="50">
				<th><center>이메일</center></th>
				<td style="text-indent:20px">${inquiry.memberEmail}</td>
			</tr>
			<tr height="50">
				<th><center>카테고리</center></th>
				<td style="text-indent:20px;">${inquiry.inquiryType}</td>
			</tr>	
			<tr height="50">
				<th><center>문의일자</center></th>
				<fmt:parseDate var="parseRegDate" value="${inquiry.inquiryRegDate}"
						pattern="yyyy-MM-dd" />
					<fmt:formatDate var="resultRegDt" value="${parseRegDate}"
						pattern="yyyy-MM-dd" />
					<td style="text-indent:20px;">${resultRegDt}</td>
			</tr>
			<tr height="50">
				<th><center>내용</center></th>
				<td style="text-indent:20px;">${inquiry.inquiryContent}</td>
			</tr>
				</div>
			</div>
		</div>
	</table>

</body>
</html>