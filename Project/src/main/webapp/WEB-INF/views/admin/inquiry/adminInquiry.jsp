
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
<link rel="stylesheet" href="${path}/resources/css/admin-aside.css">
<!-- font -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
	integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu"
	crossorigin="anonymous">
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
	position: absolute;
	left: 25%;
	width: 70%;
	height: 100vh;
	padding-top:30px;
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
	margin-top: 40px;
	position: absolute;
	left: 37%;
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
#gomain{
color:white; 
font-size:12px;
padding-top:30px;
}
</style>
<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
}
.nav-item {
	font-size: 13px;
	padding: 0px;
	padding-left: 35px;
}
</style>


<body>
	<div class="Container">
		<div class="Content">
			<h4>1:1 문의 내역</h4>

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
									<th>문의번호</th>
									<th>카테고리</th>
									<th>제목</th>
									<th>닉네임</th>
									<th>문의날짜</th>
									<th>답변상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="inquiry" items="${adminInquiryList}">
									<tr>
										<td>${inquiry.inquiryNum}</td>
										<td>${inquiry.inquiryType}</td>
										<td><a
											href="${path}/getAdminInquiry?inquiryNum=${inquiry.inquiryNum}"
											class="inquiry-title">${inquiry.inquiryTitle}</a></td>
										<td>${inquiry.memberNickname}</td>
										<fmt:parseDate var="parseRegDate"
											value="${inquiry.inquiryRegDate}" pattern="yyyy-MM-dd" />
										<fmt:formatDate var="resultRegDt" value="${parseRegDate}"
											pattern="yyyy-MM-dd" />
										<td class="text-center">${resultRegDt}</td>
										<td class="text-center">
										<c:if test="${inquiry.inquiryState eq '처리중'}">
										<button type="button" class="btn btn-outline-primary btn-sm" disabled style="width: 70px">${inquiry.inquiryState}</button>
										</c:if>
										<c:if test="${inquiry.inquiryState eq '답변완료'}">
										<button type="button" class="btn btn-primary btn-sm" disabled style="width: 70px">${inquiry.inquiryState}</button>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
							<!--  사이드 바 추가 -->
					<nav class="navbar navbar-expand-md navbar-light">
						<div class="col-lg-3 sidebar fixed-top">
							<button class="navbar-toggler ml-auto mb-2 bg-light"
								type="button" data-toggle="collapse" data-target="#sidebar">
								<span class="navbar-toggle-icon"></span>
							</button>
							<div class="collapse navbar-collapse" id="sidebar">
								<div class="container-fluid">
									<div class="row">
										<!-- sidebar -->
										<a href="#"
											class="navbar-brand text-white text-center d-block mx-auto py-3 mb-4">ADMIN
											PAGE</a>
										<!--  <div class="bottom-border pb-3"> -->
										<img class="rounded-circle mr-3"
											src="${path}/resources/img/admin.jpg" alt="" width="200px"
											height="200px">

									</div>
									<div class="navcontent">
										<ul class="navbar-nav flex-column mt-4">
									
											<!-- 회원 관리 -->
											<li class="nav-item"><a href="memberListPage"
												class="nav-link text-white p-3 mb-2 sidebar-link">
													<i class="fas fa-users-cog text-white fa-lg mr-3"></i>회원 관리
											</a></li>
											<!-- 모임 관리 -->
											<li class="nav-item"><a href="adminClub"
												class="nav-link text-white p-3 mb-2 sidebar-link"> <i
													class="fas fa-plus text-white fa-lg mr-3"></i>모임 관리
											</a></li>

											<!-- 문의 관리 -->
											<li class="nav-item"><a href="adminInquiry"
												class="nav-link text-white p-3 mb-2 sidebar-link"> <i
													class="fas fa-question-circle text-white fa-lg mr-3"></i>문의
													관리
											</a></li>
											<!-- 공지 관리 -->
											<li class="nav-item"><a href="announce"
												class="nav-link text-white p-3 mb-2 sidebar-link"> <i
													class="fas fa-question-circle text-white fa-lg mr-3"></i>공지
													관리
											</a></li>
											<!-- 결제내역 관리 -->
											<li class="nav-item"><a href="adminPay"
												class="nav-link text-white p-3 mb-2 sidebar-link"> <i
													class="fas fa-coins text-white fa-lg mr-3"></i>결제내역 관리
											</a></li>
											<!-- 관리자 차트 -->
											<li class="nav-item"><a href="adminChart"
												class="nav-link text-white p-3 mb-2 sidebar-link"> <i
													class="fas fa-question-circle text-white fa-lg mr-3"></i>차트
													관리
											</a></li>
												<p id="gomain"><a href="main"><i class="fas fa-home"></i> 메인으로 가기 </a></p>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</nav>
					
					<!-- pagenation -->
					<div id="pageArea">

						<ul class="paging">

							<%-- <c:if test="${pageMakerAdmin.prev}"> --%>
								<li><a class="span"
									href="adminInquiry${pageMakerAdmin.makeQuery(pageMakerAdmin.startPage - 1)}">◀</a></li>
							<%-- </c:if> --%>

							<c:forEach begin="${pageMakerAdmin.startPage}"
								end="${pageMakerAdmin.endPage}" var="idx">
								<li><a href="adminInquiry${pageMakerAdmin.makeQuery(idx)}"><span
										class="span">${idx}</span></a></li>
							</c:forEach>

							<%-- <c:if test="${pageMakerAdmin.next && pageMakerAdmin.endPage > 0}"> --%>
								<li><a class="span"
									href="adminInquiry${pageMakerAdmin.makeQuery(pageMakerAdmin.endPage + 1)}">▶</a></li>
							<%-- </c:if> --%>
						</ul>

					</div>
					<!-- pageArea -->
				</form>
			</div>
			<!-- wrapper -->

		</div>
	</div>


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
	<script>
	window.onload = function(){
		selectNav();
	}

	function selectNav(){ 
		// 지금 접속해있는 주소 얻어서 now에 넣어줌
		var now = window.location.href;
		// className이 ()인 값을 nav에 넣어줌
			var nav = document.getElementsByClassName("nav-link text-white p-3 mb-2 sidebar-link");
		// 주소에 포함되어야 하는 단어 배열로 선언
			var arr = ["member", "adminClub", "adminInquiry", "announce", "adminPay", "adminChart"];
		

		//기본 nav 요소는 for문으로 돌려서 각 단어가 포함된 페이지의 해당 요소에curr 클래스를 추가해준다 
			for (var i = 0; i < arr.length; i++) {
				if(now.includes(arr[i])){
			nav[i].setAttribute("class", "nav-link text-white p-3 mb-2 sidebar-link current");
				}
			}
		
	}

	</script>
</body>

</html>
