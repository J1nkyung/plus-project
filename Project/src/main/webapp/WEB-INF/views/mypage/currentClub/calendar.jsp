<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link rel="stylesheet" href="${path}/resources/css/calenderMain.css">
<script src="${path}/resources/js/calendar.js"></script>
<script>
	var datee = new Date(); //오늘날짜 지목
	var clubList = '${clubList}';
	var scheduleList = [];

	/*밑에 주석 필요없음 
		 <c:forEach var="list" items="${clubList}" varStatus="status">
			scheduleList = [
				clubName = '${list.clubName}',
				clubStartDate = '${list.clubStartDate}',
				clubEndDate = '${list.clubEndDate}' 
			]
		</c:forEach>*/
			
 	document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth'
        // timeGridWe3ek,timeGridDay,listMonth  이거 넣으면 주간 , 일간 관리 가능
      },
      initialDate: datee,
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      selectable: true,
      events:setInfo()
    });

    calendar.render();
  });
  
  
function setInfo() {
	var clubList = '${clubList}';
	var scheduleList = new Array();
	
	<c:forEach var="list" items="${clubList}" varStatus="status">
		var schedule = new Object(); 
		var colorCode = '#' + Math.round(Math.random() * 0xffffff).toString(16);
		schedule.title = '${list.clubName}';
		schedule.start = '${list.clubStartDate}';
		/* schedule.end = '${list.clubEndDate}'; */
		schedule.backgroundColor = colorCode;
		
		scheduleList.push(schedule); 
	</c:forEach>
	
	return scheduleList;
}

</script>
<style>

  body #calendar {
    width: 55%;
    margin: 5% 10%;
    padding: 0;
    font-size: 13px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <div id='calendar'>
  </div>

</body>
</html>
