<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!--${pageContext.request.contextPath}" 이게 web-app을 가리킨다!!!!!   -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- 그래서 path 써주고 그 아래 소스 파일 이름 지정해주면 된다 ! 이건 진경언니가 준거 !   -->

    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <title>포인트결제창</title>
    <style>
    
    </style>
</head>
<body>
    <div class="pointContainer">
    	<form method="post" action="applyOnePayClubPayment" > <!-- 컨트롤러 이동 -->
    		<input type="hidden" name="clubNum" value="${cvoSend.clubNum }">
    		<input type="hidden" name="memberNum" value="${user.memberNum }">
    		<input type="hidden" id="clubLeader" name="clubLeader" value="${cvoSend.clubLeader}">
    		
	        <h2>PLUS 더하기+</h2>
		    <P>나의 재능을 더해보세요!</P>
		    <h2>모임정보</h2>
		    
		    <c:set var="totalPoint" value="0" /><!-- 기본 변수 선언 -->
		   <%--  <c:forEach items="${cvo}" var="cvoSend"> --%>
	    		<p>${cvoSend.clubName } - ${cvoSend.clubFee }원</p>
	    		<c:set var="totalPoint" value="${totalPoint + cvoSend.clubFee }" />
	    	<%-- </c:forEach> --%>
		    
		    <h2>결제포인트</h2>
		    <p>${totalPoint }</p>
		    <input type="hidden" name="totalFee" value="${totalPoint }" >
		    
		    <input type="submit" id="payBtn" value="결제하기" onclick="clickAlert()">
	    </form>
    </div>     
     <script src="${path}/resources/js/jquery-1.12.4.min.js"></script> 
    <script>

     
     if('${msg}' != ''){
         alert('${msg}');
     }
     
    </script>
</body>
</html>