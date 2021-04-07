<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:set var="path" value="${pageContext.request.contextPath}" />

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
			<div class="header">공지사항</div>
			<div class="desc">알려드릴 소식이 있어요</div>
		</div>
	</div>

	<div class="notimenu">
		<div class="notisubmenu">
			<a href="">공지사항</a> <a href="faq">자주묻는질문</a>
		</div>
	</div>

	<div id="announce">
		<c:forEach var="announce" items="${announceList}">
			<button class="accordion">
				<!-- <div class="question"></div> -->
				${announce.announceTitle}
			</button>
			<div class="panel">
					<fmt:parseDate var="parseRegDate"
						value="${announce.announceRegDate}" pattern="yyyy-MM-dd" />
					<fmt:formatDate var="resultRegDt" value="${parseRegDate}"
						pattern="yyyy-MM-dd" />
					<span>${resultRegDt}</span><br />
					<p style="white-space:pre;">${announce.announceContent}</p>
				<c:if test="${user.memberNum eq 1}">
					 <form action="deleteAnnounce" method="post" style="display:inline-block; float:right; margin-right:20px; margin-bottom:20px">
		   			 <input type="hidden" value="${announce.announceNum}" name="announceNum">
		  			  <a href="deleteAnnounce"><button type="submit" class="btn btn-danger" id="deleteBtn">삭제 </button></a>
		   			 </form>
		  
		   			 <form action="updateForm" method="post" style="float:right; margin-right:10px; margin-bottom:20px">
		   			 <input type="hidden" value="${announce.announceTitle}" name="announceTitle">
		   			 <input type="hidden" value="${announce.announceContent}" name="announceContent">
		   			 <input type="hidden" value="${announce.announceNum}" name="announceNum">
		  			  <a href="updateForm"><button type="submit" class="btn btn-primary" id="editBtn">수정 </button></a>
		   			 </form>
	   			 </c:if>
			</div>
			
			
		</c:forEach></div>
	
	<br>
	<c:if test="${user.memberNum eq 1}">
	<div class="announce-write" style="margin-bottom:40px; float:center;">
		<form action="insertAnnounce" method="post">
		<button type="submit" class="btn btn-primary pull-right"><a href="announceForm">글 등록하기</a></button>
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

</body>
</html>
