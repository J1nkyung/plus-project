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
<title>모임 관리</title>
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
	padding-top:30px;
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
#tableWrapper table th:first-child {
	border-radius:10px 0px 0px 0px;
}
#tableWrapper table th:last-child {
	border-radius:0px 10px 0px 0px;
}

#tableWrapper table th {
	text-align: center;
	/* background-color: grey; */
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
#delBtn a:hover{
color:white;
}
.clubname{
	width:200px;
	white-space:nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.clubleader{
	width:90px;
	white-space:nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.btn-outline-primary {
    border-color: #A9BCF5;
    color: #A9BCF5; }
.btn-outline-primary:hover,
.btn-outline-primary:focus {
    border-color: #819FF7;
    background-color: #819FF7;
    color: #FFF; }
.btn-outline-primary:active,
.btn-outline-primary:visited,
.btn-outline-primary:active:focus,
.btn-outline-primary:active:hover {
    border-color: #CED8F6;
    background-color: #819FF7;
    color: #FFF; }
    
.btn-outline-danger {
    border-color: #E2A9F3;
    color: #E2A9F3; }
.btn-outline-danger:hover,
.btn-outline-danger:focus {
    border-color: #D0A9F5;
    background-color: #D0A9F5;
    color: #FFF; }
.btn-outline-danger:active,
.btn-outline-danger:visited,
.btn-outline-danger:active:focus,
.btn-outline-danger:active:hover {
    border-color: #F2E0F7;
    background-color: #E2A9F3;
    color: #FFF; }
</style>

<body>
	<div class="Container">
		<div class="Content">
			<h1>모임 관리</h1>

			<div id="tableWrapper">
				<form role="form" method="get" id="form">

					<div id="block">
						<table class="useInfo">
							<thead>
								<tr>
									<!-- <th>모임번호</th> -->
									<th>카테고리</th>
									<th>모임이름</th>
									<th>모임장</th>
									<th>시작일</th>
									<th>종료일</th>
									<th>ON/OFF</th>
									<th>모임구분</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="club" items="${adminClubList}">
									<tr>
										<%-- <td>${club.clubNum}</td> --%>
										<td>${club.clubCategory}</td>
										<td><a href="${path}/getClub?clubNum=${club.clubNum}"><div class="clubname">${club.clubName}</div></a></td>
										<td><div class="clubleader">${club.clubLeader}</div></td>
										<fmt:parseDate var="parseRegDate"
											value="${club.clubStartDate}" pattern="yyyy-MM-dd" />
										<fmt:formatDate var="resultRegDt" value="${parseRegDate}"
											pattern="yyyy-MM-dd" />
										<td class="text-center">${resultRegDt}</td>
										<fmt:parseDate var="parseRegDate" value="${club.clubEndDate}"
											pattern="yyyy-MM-dd" />
										<fmt:formatDate var="resultRegDt" value="${parseRegDate}"
											pattern="yyyy-MM-dd" />
										<td class="text-center">${resultRegDt}</td>

										<c:if test="${club.clubOnOff eq '온라인'}">
											<td class="text-center">
											<button type="button" class="btn btn-outline-warning btn-sm" style="width: 50px">ON</button></td>
										</c:if>
										<c:if test="${club.clubOnOff eq '오프라인'}">
											<td class="text-center">
											<button type="button" class="btn btn-outline-info btn-sm" style="width: 50px">OFF</button></td>
										</c:if>

										<c:if test="${club.clubKind eq 1}">
											<td class="text-center">
											<button type="button" class="btn btn-outline-primary btn-sm" style="width: 60px; font-weight: bold;">가치+</button></td>
										</c:if>
										<c:if test="${club.clubKind eq 2}">
											<td class="text-center">
											<button type="button" class="btn btn-outline-danger btn-sm" style="width: 60px; font-weight: bold;">도움+</button></td>
										</c:if>
										<form action="deleteAdminClub" method="post">
											<input type="hidden" name="clubNum" value="${club.clubNum}">
											<td class="text-center">
											
											<button type="submit" class="btn btn-danger btn-sm" id="delBtn" 
											style="width: 50px; font-weight: bold;">
											<a href="${path}/deleteAdminClub?clubNum=${club.clubNum }">삭제</a></button>
											
											</td>
										</form>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- pagenation -->
					<div id="pageArea">

						<ul class="paging">

							<%-- <c:if test="${pageMakerClub.prev}"> --%>
								<li><a class="span"
									href="adminClub${pageMakerClub.makeQuery(pageMakerClub.startPage - 1)}">◀</a></li>
							<%-- </c:if> --%>

							<c:forEach begin="${pageMakerClub.startPage}"
								end="${pageMakerClub.endPage}" var="idx">
								<li><a href="adminClub${pageMakerClub.makeQuery(idx)}"><span
										class="span">${idx}</span></a></li>
							</c:forEach>

							<%-- <c:if test="${pageMakerClub.next && pageMakerClub.endPage > 0}"> --%>
								<li><a class="span"
									href="adminClub${pageMakerClub.makeQuery(pageMakerClub.endPage + 1)}">▶</a></li>
							<%-- </c:if> --%>
						</ul>

					</div>
					<!-- pageArea -->
				</form>
			</div>
			<!-- wrapper -->

		</div>
	</div>
	<!-- end of table -->
	<script>
		$(document).ready(function() {
			$("#delBtn").on("click", function() {
				alert("모임이 삭제되었습니다");
			});
		});
	</script>
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