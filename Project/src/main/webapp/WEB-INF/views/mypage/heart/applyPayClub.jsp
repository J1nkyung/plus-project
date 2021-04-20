<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <title>Document</title>
    <style>
    
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
    	<!-- <form method="post" action="applyPayClubPayment" > -->
    		<input type="hidden" name ="memberNum" value="${user.memberNum }"/>
    		<input type="hidden" name="clubNumArr" value="${clubNumArr }">
    		<input type="hidden" id="clubLeader" name="clubLeader" value="${clubLeader}">
    		
	        <h2>PLUS 더하기</h2>
		    <P>나의 재능을 더해보세요!</P>
		    <h2>모임정보</h2>
		    
		    <c:set var="totalPoint" value="0" />
		    <c:forEach items="${list }" var="list">
	    		<p> ${list.clubName }  💰  ${list.clubFee } P</p>
	    		<c:set var="totalPoint" value="${totalPoint + list.clubFee }" />
	    	</c:forEach>
		    
		    <h2>결제포인트</h2>
		    <p>${totalPoint } P</p>
		    <input type="hidden" name="totalFee" value="${totalPoint }" >
		    <input type="button" id="payBtn" value="결제하기" >
		    <!-- <input type="submit" id="payBtn" value="결제하기" onclick="clickAlert()">
	    </form> -->
    </div>     
    <script src="${path}/resources/js/jquery-1.12.4.min.js"></script> 
    <script>
    
    $("#payBtn").on("click", function() {
    	$.ajax({
            type: "post",
            url: "applyPayClubPayment",
            data: {
            	memberNum:'${user.memberNum }',
            	clubNumArr:'${clubNumArr }',
            	clubLeader:'${clubLeader}',
            	totalFee:'${totalPoint }'
            },
               success: function (data) {
               console.log(data);
               alert("결제가 완료되었습니다. 모임은 마이페이지에서 확인해주세요.");
               opener.parent.location.reload();
               window.close();
               
            }
        });
    });

     if('${msg}' != ''){
         alert('${msg}');
     }
    </script>
</body>
</html>