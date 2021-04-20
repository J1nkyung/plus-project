 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Loading..</title>
</head>
<body>

  <c:if test="${kind eq 'main'}">
  <form action="${path}/main" id="gpsForm" method="get">    
    	<input type="hidden" name="memberLatitude" >    
    	<input type="hidden" name="memberLongitude">
   </form>
 </c:if>
   <c:if test="${kind eq 'normal'}">
  <form action="${path}/normal" id="gpsForm" method="get">    
    	<input type="hidden" name="memberLatitude" >    
    	<input type="hidden" name="memberLongitude">
   </form>
 </c:if>
   <c:if test="${kind eq 'expert'}">
  <form action="${path}/expert" id="gpsForm" method="get">    
    	<input type="hidden" name="memberLatitude" >    
    	<input type="hidden" name="memberLongitude">
   </form>
 </c:if>

     <!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
    /* 사용자의 현재 위치를 비동기 전송하는 방식*/
    function whereami() {
    	console.log("where?")
        var options = {
            enableHighAccuracy: true,
            maximumAge: 30000,    
            timeout: 15000    // 15초 이상 기다리지 않는다.
        }
        if(navigator.geolocation) // geolocation로 위치를 요청한다.
            navigator.geolocation.getCurrentPosition(success, error, options);
        else
        	//실패 시 오류 메세지를 출력한다.
        function error(e) {
        console.log(e);
        }
        // geolocation 요청이 성공하면 이 함수가 호출된다.
        function success(pos) {
            console.log(pos); // [디버깅] Position 객체 내용 확인
            // 항상 가져올 수 있는 필드들이다. timestamp는 coords 객체 내부에 있지 않고,
            // 외부에서 가져오는 필드라는 점에 주의하다.
            var msg = "당신은 " +
                new Date(pos.timestamp).toLocaleString() + "에 " +
                " 위도 " + pos.coords.latitude +
                " 경도 " + pos.coords.longitude + "에서 "+
                " 약 " + pos.coords.accuracy + " 미터 떨어진 곳에 있습니다.";
                latitude = pos.coords.latitude;
                longitude = pos.coords.longitude;
                console.log(latitude, longitude);
                 //수집한 위도, 경도 좌표의 값을 넣는다.
                $("input[name='memberLatitude']").val(latitude);
                $("input[name='memberLongitude']").val(longitude);
                // 정보 위치를 출력해본다.
                console.log(msg);
        }
    }
    whereami();
    let formObj = $("#gpsForm");
    
    setTimeout(function() {
    	console.log("form submit!")
    	formObj.submit();	  
    	}, 1000);    //1초의 시간 간격을 두고 위도, 경도 값을 보낸다.
           
    </script>
</body>
</html>