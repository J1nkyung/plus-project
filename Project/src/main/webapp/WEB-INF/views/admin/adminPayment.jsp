<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/reviewList.css">
<script type="text/javascript"
	src="${path}/resources/js/jquery-1.12.4.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<title>1:1 문의</title>
</head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

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

a {
	color: inherit;
}

a:hover {
	text-decoration: none;
}

.Container {
	margin: 0;
	width: 1140px;
}

.Content {
	padding: 40px 60px;
	height: 100vh;
}

#tableWrapper {
	width: 85%;
	height: 415.550px;
}

#block {
	border: 1px solid rgba(189, 186, 186, 0.829);
	border-radius: 2%;
	min-height: 443.2px;
}

#tableWrapper table {
	width: 100%;
	border-collapse: collapse;
}

#tableWrapper table th {
	text-align: center;
	background-color: grey;
	height: 19.6px;
	padding: 13px;
	background-color: #001eff;
	color: white;
}

#tableWrapper table td {
	text-align: center;
	padding: 7px;
	max-height: 17px;
}

#pageArea {
	margin: 0 auto;
	position: relative;
}

.paging {
	margin-top: 10px;
	position: absolute;
	left: 45%;
}

.paging>li {
	list-style: none;
	float: left;
	padding: 6px 1px;
}

.span {
	padding: 6px 12px;
	border: 1px solid lightgray;
}

#info, .paging>li :hover {
	text-decoration: none;
}

#keywordInput {
	display: inline;
}

.search {
	float: right;
	margin-bottom: 3px;
	margin-right: 3px;
}

#searchType {
	height: 24px;
}
</style>
<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>

<body>
	<div class="Container">
		<div class="Content">
			<h1>결제 관리</h1>

			<div id="tableWrapper">
				<form role="form" method="get" id="form">

					<div id="block">
						<table class="useInfo">
							<thead>
								<tr>
									<th>결제내역번호</th>
									<th>회원번호</th>
									<th>닉네임</th>
									<th>모임이름</th>
									<th>결제금액</th>
									<th>결제일시</th>
									<th>내역유형</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="payment" items="${adminPayList}">
									<tr>
										<td class="text-center">${payment.payNum}</td>
										<td class="text-center">${payment.memberNum}</td>
										<td class="text-center">${payment.memberNickname}</td>
										<td>${payment.clubName}</td>
										<td class="text-center">${payment.payAmount}</td>
										<fmt:parseDate var="parseRegDate" value="${payment.payDate}"
											pattern="yyyy-MM-dd" />
										<fmt:formatDate var="resultRegDt" value="${parseRegDate}"
											pattern="yyyy-MM-dd" />
										<td class="text-center">${resultRegDt}</td>
										<c:if test="${payment.payMethod eq '포인트충전'}">
											<td class="text-center"><button type="button"
													class="btn btn-primary btn-sm" style="width: 70px">충전</button></td>
										</c:if>
										<c:if test="${payment.payMethod eq '포인트사용'}">
											<td class="text-center"><button type="button"
													class="btn btn-danger btn-sm" style="width: 70px">사용</button></td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- pagenation -->
					<div id="pageArea">

						<ul class="paging">

							<c:if test="${pageMakerPay.prev}">
								<li><a class="span"
									href="adminPay${pageMakerPay.makeQuery(pageMakerPay.startPage - 1)}">◀</a></li>
							</c:if>

							<c:forEach begin="${pageMakerPay.startPage}"
								end="${pageMakerPay.endPage}" var="idx">
								<li><a href="adminPay${pageMakerPay.makeQuery(idx)}"><span
										class="span">${idx}</span></a></li>
							</c:forEach>

							<c:if test="${pageMakerPay.next && pageMakerPay.endPage > 0}">
								<li><a class="span"
									href="adminPay${pageMakerPay.makeQuery(pageMakerPay.endPage + 1)}">▶</a></li>
							</c:if>
						</ul>

					</div>
					<!-- pageArea -->
				</form>
			</div>
			<!-- wrapper -->

		</div>
	</div>

	<!-- end of table -->



	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
	<script src="js/script.js"></script>
</body>

</html>
</body>
</html>