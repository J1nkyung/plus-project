<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%-- <%@ include file="../include/header.jsp" %> --%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자주 묻는 질문</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/faq.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

</head>
<body>
	<div class="visual-box">
		<div class="visual-box-in">
			<!-- <h2>자주묻는질문</h2> -->
			<div class="header">자주 묻는 질문</div>
			<div class="desc">가장 궁금해하시는 질문들을 모아보았어요</div>
		</div>
	</div>

	<div class="notimenu">
		<div class="notisubmenu">
			<a href="announce">공지사항</a> <a href="">자주묻는질문</a>
		</div>
	</div>

	<div id="faq">
		<c:forEach items="${faqList}" var="faq">
			<button class="accordion">
				<!-- <div class="question"></div> -->
				${faq.faqTitle}
			</button>

			<div class="panel">
				<span>>&nbsp;&nbsp;&nbsp;FAQ&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;${faq.faqCategory}</span><br />
				<br />
				<p>${faq.faqContent}</p>
				<c:if test="${user.memberNum eq 1}">
					<form action="deleteFaq" method="post"
						style="display: inline-block; float: right; margin-right: 20px; margin-bottom: 20px">
						<input type="hidden" value="${faq.faqNum}" name="faqNum">
						<a href="deleteFaq"><button type="submit"
								class="btn btn-danger" id="deleteBtn">삭제</button></a>
					</form>

					<form action="editFaqForm" method="post"
						style="float:right; margin-right:10px; margin-bottom:20px">
						<%-- <input type="hidden" value="${faq.faqTitle}" name="faqTitle"> --%>
						<%-- <input type="hidden" value="${faq.faqContent}" name="faqContent"> --%>
						<input type="hidden" value="${faq.faqNum}" name="faqNum">
						<input type="hidden" value="${faq.faqCategory}" name="faqCategory">
						<a href="editFaqForm"><button type="submit"
								class="btn btn-primary" id="editBtn">수정</button></a>
					</form>
				</c:if>
			</div>
		</c:forEach>

	</div>
	<br>

	<c:if test="${user.memberNum eq 1}">
	<div class="faq-write" style="margin-bottom:40px; float:center;">
		<form action="insertFaq" method="post">
		<button type="submit" class="btn btn-primary pull-right"><a href="faqForm">글 등록하기</a></button>
		</form>
	</div>
	</c:if>

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
	<%-- 	<%@ include file="../include/footer.jsp" %> --%>
</body>

</html>