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
</head>
<body>
    <div class="pointContainer">
    	<h2>PLUS 더하기+</h2>
	    <P>나의 재능을 더해보세요!</P>
	    <h2>모임정보</h2>
	    
	    <c:set var="totalPoint" value="0" /> <!-- 기본 변수 선언 -->
	   	<p>${cvoSend.clubName } - ${cvoSend.clubFee }원</p>
	   	<c:set var="totalPoint" value="${totalPoint + cvoSend.clubFee }" />
	    
	    <h2>결제포인트</h2>
	    <p>${totalPoint }</p>
	    
	    <input type="button" id="payBtn" value="결제하기" />
    </div>     
     <script src="${path}/resources/js/jquery-1.12.4.min.js"></script> 
    <script>
    
    $("#payBtn").on("click", function() {
    	$.ajax({
            type: "post",
            url: "applyOnePayClubPayment",
            data: {
               clubNum:'${cvoSend.clubNum }',
               memberNum:'${user.memberNum }',
               clubLeader:'${cvoSend.clubLeader}',
               totalFee:'${totalPoint }'
            },
               success: function (data) {
               console.log(data);
               alert("모임 신청이 완료되었습니다.");
               window.close();
            }
        });
    	
    	/*setTimeout(function() {
            opener.parent.location.reload(); //팝업창을 닫으면서 부모창을 새로고침하는 방법
            window.close();
     	}, 1000);*/
    });
     
     /*if('${msg}' != ''){
    	 confirm('${msg}' ) { 
    		 location="getPaymentList";
             return true;
    	 }else{
             return false;
         }
     }*/
     
     
    </script>
</body>
</html>