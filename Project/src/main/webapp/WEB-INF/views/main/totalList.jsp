<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/totalList.css">


<!-- 부트 스트랩 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- 나눔폰트 -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

<title>더하기+ 같이해서 더 가치있는 모임</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>

<body>

<from role="form" method="get">

	<!--------------상세검색 영역--------------->
	<div class="jumbotron">
	<div class="search">
			<h3>
				<b>🔎 상세 검색 </b>
			</h3>
			<hr class="my-4">

				<select name="searchType">
						<option value="t"
							<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>전체</option>
						<option value="n"
							<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>모임명</option>
						<option value="l"
							<c:out value="${scri.searchType eq 'l' ? 'selected' : ''}"/>>리더명</option>
						<option value="c"
							<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
						<option value="h"
							<c:out value="${scri.searchType eq 'h' ? 'selected' : ''}"/>>해시태그</option>
					</select> <input type="text" name="keyword" id="keywordInput" size="40"
						value="${scri.keyword}" />
					<button id="searchBtn" type="button">검색</button>
					<script>
					

      $(function(){
        $('#searchBtn').click(function() {
          self.location = "totalList" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>	
    </div>
</div>

	<%-- <input type="hidden" name="userLatitude"
		value='<c:out value="${pageMaker.cri.userLatitude}"/>'>
	<input type="hidden" name="userLongitude"
		value='<c:out value="${pageMaker.cri.userLongitude}"/>'>
	</form> --%>



	<!----------------더하기 리스트------------------>
	<section class="gallery-block ca
		rds-gallery">
		<div class="gallery-container">

			<section class="gallery-block cards-gallery">
				<div class="gallery-container">

					<div class="row">
						<c:forEach items="${list}" var="club" varStatus="status" begin="0"
							end="19">
							<div class="col-md-6 col-lg-3">
								<div class="card border-0 transform-on-hover">

									<a class="lightbox"
										href='getClub.do?clubNum=<c:out value="${club.clubNum}" />'>
										<img id="clubmainpic"
										src="${path}/resources${club.clubMain_pic}"
										onerror="this.onerror=null; this.src='${path}/resources/img/img1.jpg'" />

									</a>
									<div class="card-bodyarea">
										<div class=spanspace>
											<span class="badge" id="onoff">${club.clubOnOff}</span> <span
												class="badge" id="freq">${club.clubFreq}</span>

										</div>
										<div class=clubtitle>
											<a class=clubtitle
												href='getClub.do?clubNum=<c:out value="${club.clubNum}" />'>
												${club.clubName} </a>
										</div>
										<div class=subtitle>
											<i class="fas fa-heart"> ${club.clubHeart}</i>

										</div>

										<!-- 더하기 상세 정보 -->
										<p class="text-muted card-text">

											<c:set var="today" value="<%=new java.util.Date()%>" />
											<fmt:formatDate var="today" value="${today}"
												pattern="yyyyMMdd" />
											<fmt:formatDate var="shutDay" value="${club.clubShutDate}"
												pattern="yyyyMMdd" />
											<fmt:formatDate var="startDay" value='${club.clubStartDate}'
												pattern="yyyy-MM-dd" />
											<fmt:formatDate var="endDay" value='${club.clubEndDate}'
												pattern="yyyyMMdd" />
											<span class="period">📅 ${club.clubStartDate} ~
												${club.clubEndDate}</span></br> <span class="shutdown"> 🔒 모집
												마감까지 D - <c:out value="${shutDay-today}" />
											</span></br> <span class="person">현재<b> ${club.clubCurnum}</b> /
												${club.clubMax}명 참여중!
											</span></br>

										</p>
									</div>
								</div>
							</div>
						</c:forEach>
			</section>
		<!-- -페이징 버튼-  -->
			
						 <div id="pageArea">
						  <ul class="paging">
						    	<li ><a class="span" href="totalList${pageMaker.makeSearch(pageMaker.startPage - 1)}">◀</a></li>
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						    	<li><a href="totalList${pageMaker.makeSearch(idx)}"><span class="span" >${idx}</span></a></li>
						    </c:forEach>
						
						    	<li><a class="span" href="totalList${pageMaker.makeSearch(pageMaker.endPage + 1)} ">▶</a></li>
						  </ul>
					 </div>

		</div>

		<script src="https://kit.fontawesome.com/831a4ab0db.js"
			crossorigin="anonymous"></script>


</body>
</html>