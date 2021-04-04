<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/announce.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
</head>
<body>
	
	<div class="visual-box">
		<div class="visual-box-in">
			<!-- <h2>자주묻는질문</h2> -->
			<div class="header">공지사항</div>
			<div class="desc">알려드릴 소식이 있어요</div>
		</div>
	</div>

	<div class="notimenu">
		<div class="notisubmenu">
			<a href="">공지사항</a> <a href="faq.do">자주묻는질문</a>
		</div>
	</div>

	<div id="announce">
		<c:forEach var="announce" items="${announceList}">
			<%-- <c:forEach items="${announceTitle}" var="announce"></c:forEach> --%>
			<button class="accordion">
				<div class="question"></div>
				${announce.announceTitle }
			</button>
			<div class="panel">
				<fmt:parseDate var="parseRegDate"
					value="${announce.announceRegDate}" pattern="yyyy-MM-dd" />
				<fmt:formatDate var="resultRegDt" value="${parseRegDate}"
					pattern="yyyy-MM-dd" />

				<span>${resultRegDt}</span><br />


				<p>${announce.announceContent}</p>
				<!-- <p>몇시부터 몇시까지 안될 예정이예요</p> -->
			</div>
		</c:forEach>
		<!-- 	
		<button class="accordion">
			<div class="question"></div>
			프로젝트 넘 힘들어
		</button>

		<div class="panel">
			<p>
				테스트 내용입니다 조금 길게 적어넣어야 하는데 할말이 없어 복붙합니다<br /> 테스트 내용입니다 조금 길게 적어넣어야
				하는데 할말이 없어 복붙합니다<br /> 테스트 내용입니다 조금 길게 적어넣어야 하는데 할말이 없어 복붙합니다<br />
				테스트 내용입니다 조금 길게 적어넣어야 하는데 할말이 없어 복붙합니다<br /> 테스트 내용입니다 조금 길게 적어넣어야
				하는데 할말이 없어 복붙합니다<br /> 테스트 내용입니다 조금 길게 적어넣어야 하는데 할말이 없어 복붙합니다<br />
			</p> -->
	</div>
	<br>
	<div class="announce-submit">
		<a href="${path }/announceForm.jsp">글 등록하기</a> <!-- 일단 여기다 잠깐 빼둠 관리자 단에 들어가야함 -->
	</div>
	</div>

	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.maxHeight) {
					panel.style.maxHeight = null;
				} else {
					panel.style.maxHeight = panel.scrollHeight + "px";

				}
			});
		}
	</script>
	<%@ include file="include/footer.jsp" %>
</body>
</html>













