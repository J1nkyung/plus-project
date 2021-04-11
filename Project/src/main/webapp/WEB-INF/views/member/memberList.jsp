<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!--${pageContext.request.contextPath}" 이게 web-app을 가리킨다!!!!!   -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 그래서 path 써주고 그 아래 소스 파일 이름 지정해주면 된다 ! 이건 진경언니가 준거 !   -->


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${path}/resources/css/reviewList.css">
<script type="text/javascript"
	src="${path}/resources/js/jquery-1.12.4.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="${path}/resources/css/admin-aside.css">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
	integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu"
	crossorigin="anonymous">
<!-- font -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<title>회원 관리</title>
<script>
	
</script>
<style>
body {
	padding-top: 30px;
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
}

#tableWrapper {
	width: 85%;
	height: 415.550px;
	padding-top: 30px;
	padding-bottom: 30px;
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
</style>
<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
}

#delBtn a:hover {
	color: white;
}

.clubname {
	width: 200px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.clubleader {
	width: 90px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.nav-item {
	font-size: 13px;
	padding: 0px;
	padding-left: 35px;
	font:NanumSquare;
}

.navbar-light .navbar-nav .nav-link {
	margin: 0;
	padding: 5px;
}

#pageArea {
	margin: 0 auto;
	position: relative;
}

.paging {
	margin-top: 40px;
	position: absolute;
	left: 40%;
}

.paging>li {
	list-style: none;
	float: left;
	padding: 6px 1px;
}

.span {
	padding: 6px 12xp;
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
.infoBtn{
border:1px solid #001eff;
border-radius:5%;
background-color:white;
}
.infoBtn:hover{
border:1px solid #001eff;
border-radius:5%;
background-color:#001eff;
opacity:0.8;
color:white;
}

.infoBtn a:hover{
color:white;
}
</style>
<script>
	$(function() {
		$('#searchBtn').click(
				function() {
					self.location = "memberListPage" + '${pmem.makeQuery(1)}'
							+ "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
				});
	});
</script>
</head>

<body>
	<div class="Container">
		<div class="Content">
			<h4>회원관리</h4>


			<div id="tableWrapper">
				<form role="form" method="get" id="form">

					<div class="search">
						<select name="searchType" id="searchType">
							<option value="null"
								<c:out value="${scmem.searchType == null ? 'selected' : ''}"/>>-----</option>
							<option value="e"
								<c:out value="${scmem.searchType eq 'e' ? 'selected' : ''}"/>>이메일</option>
							<option value="n"
								<c:out value="${scmem.searchType eq 'n' ? 'selected' : ''}"/>>이름</option>
						</select> <input type="text" size="30" name="keyword" id="keywordInput"
							value="${scmem.keyword}" />
						<button id="searchBtn" type="button">검색</button>
					</div>
					<!-- search -->
					<div id="block">
						<table class="useInfo">
							<tr>
								<th>회원번호</th>
								<th>회원Email</th>
								<th>회원이름</th>
								<th>가입일</th>
								<th>상세보기</th>
							</tr>

							<c:forEach var="list" items="${list}">
								<tr>
									<td>${list.memberNum }</td>
									<td>${list.memberEmail }</td>
									<td>${list.memberName }</td>
									<td>${list.memberJoindate }</td>
									<td><button class="infoBtn">
											<a id="info"
												href="${path}/memberUpdate?memberNum=${list.memberNum}">상세보기</a>
										</button></td>

								</tr>
							</c:forEach>
						</table>
					</div>
					<!-- block -->


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
												class="nav-link text-white p-3 mb-2 sidebar-link current">
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
					<div id="pageArea">

						<ul class="paging">


							<li><a class="span"
								href="memberListPage${pmem.makeSearch(pmem.startPage - 1)}">◀</a></li>

							<c:forEach begin="${pmem.startPage}" end="${pmem.endPage}"
								var="idx">
								<li><a href="memberListPage${pmem.makeSearch(idx)}"><span
										class="span">${idx}</span></a></li>
							</c:forEach>

							<li><a class="span"
								href="memberListPage${pmem.makeSearch(pmem.endPage + 1)}">▶</a></li>
						</ul>
					</div>
					<!-- pageArea -->
				</form>
			</div>
			<!-- wrapper -->

		</div>
	</div>
</body>
</html>