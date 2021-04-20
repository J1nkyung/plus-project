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
    <style >
       #payBtn{
	     padding:5px;
	     width:70px;
	     height : 40px;
	     background-color : #001eff;
	     color: white;
	     border-style : none;
	     border-radius : 3px;
  		 }
    </style>
</head>
<body>
    <div class="pointContainer">
    	<h2>PLUS 더하기+</h2>
	    <P>나의 재능을 더해보세요!</P>
	    <h2>모임정보</h2>
	    
	    <c:set var="totalPoint" value="0" /> <!-- 기본 변수 선언 -->
	   	<p>${cvoSend.clubName } 💰  ${cvoSend.clubFee } P</p>
	   	<c:set var="totalPoint" value="${totalPoint + cvoSend.clubFee }" />
	    
	    <h2>결제포인트</h2>
	    <p>${totalPoint } P</p>
	    
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
               if( ${user.memberPoint } < ${totalPoint }){
                   alert('포인트가 부족합니다. 마이페이지 내에서 충전가능합니다.');
                   opener.parent.location.reload();
                   window.close()   
                }else{ 
                   alert("결제가 완료되었습니다. 모임은 마이페이지에서 확인해주세요.");
                   opener.parent.location.reload();
                   window.close();
                }
            }
        });

    });
     
     
     
    </script>
</body>
</html>