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
<link rel='stylesheet' type='text/css' href='${path}/resources/css/memberList.css'>
<title>회원 관리</title>
<script>
	
</script>
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
													class="fas fa-flag text-white fa-lg mr-3"></i>공지
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
													class="fas fa-chart-line text-white fa-lg mr-3"></i>차트
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