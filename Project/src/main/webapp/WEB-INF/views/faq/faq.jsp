<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="../include/header.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자주 묻는 질문</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/faq.css">

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
			<a href="announce.do">공지사항</a>
			<a href="">자주묻는질문</a>
		</div>
	</div>

	<div id="faq">
	<c:forEach items="${faqList}" var="faq">
		<button class="accordion">
			<div class="question"></div>
			${faq.faqTitle}
		</button>

		<div class="panel">
			<span>>&nbsp;&nbsp;&nbsp;FAQ&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;${faq.faqCategory}</span><br/><br/>
			<p>${faq.faqContent}</p>
		</div>
		</c:forEach>

		<!-- <button class="accordion">
			<div class="question"></div>
			회원 탈퇴는 어떻게 하나요?
		</button>
		<div class="panel">
			<p>faq내용2</p>
		</div>
		<button class="accordion">
			<div class="question"></div>
			집에 가고 싶습니다
		</button>

		<div class="panel">
			<p>
				테스트 내용입니다 조금 길게 적어넣어야 하는데 할말이 없어 복붙합니다<br /> 테스트 내용입니다 조금 길게 적어넣어야
				하는데 할말이 없어 복붙합니다<br /> 테스트 내용입니다 조금 길게 적어넣어야 하는데 할말이 없어 복붙합니다<br />
				테스트 내용입니다 조금 길게 적어넣어야 하는데 할말이 없어 복붙합니다<br /> 테스트 내용입니다 조금 길게 적어넣어야
				하는데 할말이 없어 복붙합니다<br /> 테스트 내용입니다 조금 길게 적어넣어야 하는데 할말이 없어 복붙합니다<br />
			</p>
		</div> -->
	</div>
	<br>
	<div class="faq-submit">
		<a href="${path }/faqForm.jsp">글 등록하기</a><br/>
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
	<%@ include file="../include/footer.jsp" %>
</body>

</html>