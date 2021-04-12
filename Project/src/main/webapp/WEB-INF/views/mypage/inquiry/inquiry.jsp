<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%-- <link rel="stylesheet" href="${path}/resources/css/reviewList.css"> --%>

<!DOCTYPE html>
<html>
<head>
<title>1:1 문의</title>
</head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript"
	src="${path}/resources/js/jquery-1.12.4.min.js"></script>

<!-- Bootstrap CSS -->
<!--  <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous"> -->
<!-- font -->
<!-- <link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"> 
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->
<style>
/* 진경 수정 */
body {
	font-family: 'NanumSquare';
}

.fixed-top {
	position: sticky;
}
/* 끝 */
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
/* li {
	list-style: none;
	float: left;
	padding: 6px;
} */
</style>

<body>


	<div class="Container">
		<div class="Content">
			<h1>1:1 문의 내역</h1>

			<div id="tableWrapper">
				<form role="form" method="get" id="form">

					<!-- 나는 일단 지금 search가 안되기 때문에.. -->
					<%-- <div class="search">
						<select name="searchType" id="searchType">
							<option value="null"
								<c:out value="${scmem.searchType == null ? 'selected' : ''}"/>>-----</option>
							<option value="e"
								<c:out value="${scmem.searchType eq 'e' ? 'selected' : ''}"/>>이메일</option>
							<option value="n"
								<c:out value="${scmem.searchType eq 'n' ? 'selected' : ''}"/>>이름</option>
						</select>
						
						<input type="text" size="30" name="keyword" id="keywordInput"
							value="${scmem.keyword}" />
						<button id="searchBtn" type="button">검색</button>
					</div>--%>
					<!-- search -->

					<div id="block">
						<table class="useInfo">
							<thead>
								<tr>
									<th>카테고리</th>
									<th>제목</th>
									<th>문의날짜</th>
									<th>답변상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="inquiry" items="${inquiryList}">
									<tr>
										<td>${inquiry.inquiryType}</td>
										<td style="text-align:left;"><a
											href="${path}/getInquiry?inquiryNum=${inquiry.inquiryNum}"
											class="inquiry-title">${inquiry.inquiryTitle}</a></td>
										<fmt:parseDate var="parseRegDate"
											value="${inquiry.inquiryRegDate}" pattern="yyyy-MM-dd" />
										<fmt:formatDate var="resultRegDt" value="${parseRegDate}"
											pattern="yyyy-MM-dd" />
										<td class="text-center">${resultRegDt}</td>
										<td class="text-center"><button type="button"
												class="btn btn-primary btn-sm" style="width: 70px">${inquiry.inquiryState}</button></td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- block -->
					<div id="pageArea">

						<ul class="paging">

							<%-- <c:if test="${pageMakerAdmin.prev}"> --%>
							<li><a class="span"
								href="inquiry${pageMakerAdmin.makeQuery(pageMakerAdmin.startPage - 1)}">◀</a></li>
							<%-- 	</c:if> --%>

							<c:forEach begin="${pageMakerAdmin.startPage}"
								end="${pageMakerAdmin.endPage}" var="idx">
								<li><a href="inquiry${pageMakerAdmin.makeQuery(idx)}"><span
										class="span">${idx}</span></a></li>
							</c:forEach>

							<%-- <c:if test="${pageMakerAdmin.next && pageMakerAdmin.endPage > 0}"> --%>
							<li><a class="span"
								href="inquiry${pageMakerAdmin.makeQuery(pageMakerAdmin.endPage + 1)}">▶</a></li>
							<%-- </c:if> --%>
						</ul>

					</div>
					<!-- pageArea -->
					
				</form>
				<div class="col-12" style="margin-left:780px; margin-top:0px;"> 
				<input type="hidden" name="memberNum" value="${user.memberNum}">
				<input type="hidden" name="inquiryType"
					value="${inquiry.inquiryType}">
				<button class="btn btn-primary pull-right">
					<a href="${path}/inquiryForm?memberNum=${user.memberNum}">문의</a>
				</button>
			 </div>
			</div>
			 
		</div>
		<!-- content -->

	</div>
	<!-- Container -->

</body>

</html>