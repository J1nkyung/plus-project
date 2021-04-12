<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>

	<c:if test="${requestScope['javax.servlet.error.status_code'] == 400}">
			 <h2>400 : 잘못된 요청입니다.</h2> 
	</c:if>
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 404}"> 
			<h2> 404 : 요청하신 페이지를 찾을 수 없습니다.</h2>
	</c:if> 
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
			 <h2>500 : 서버에 오류가 발생하여 요청을 수행할 수 없습니다.</h2> 
	</c:if>
	

	<a href="${path}/main">메인으로 돌아가기</a>
</body>
</html>