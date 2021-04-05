<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.text.*"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>

<!--Load the AJAX API-->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
	
<script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});
      google.charts.load('current', {'packages':['bar']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);
	  google.charts.setOnLoadCallback(drawChart2);
	  google.charts.setOnLoadCallback(drawChart3);
      
      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Club');
        data.addColumn('number', 'count');
        data.addRows([
          ['학습', ${getCateStudy}],
          ['운동', ${getCateExcer}],
          ['습관', ${getCateHabit}],
          ['취미', ${getCateHobby}]
        ]);

        // Set chart options
        var options = {'title':'모임 개설 현황',
                       'width':900,
                       'height':700};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
      
      function drawChart2() {
    	  var currentDay = new Date();  
          var theYear = currentDay.getFullYear();
          var theMonth = currentDay.getMonth();
          var theDate  = currentDay.getDate();
          var theDayOfWeek = currentDay.getDay();
          
          var thisWeek = [];

          for(var i=0; i<7; i++) {
            var resultDay = new Date(theYear, theMonth, theDate - (i));
            var yyyy = resultDay.getFullYear();
            var mm = Number(resultDay.getMonth()) + 1;
            var dd = resultDay.getDate();
           
            mm = String(mm).length === 1 ? '0' + mm : mm;
            dd = String(dd).length === 1 ? '0' + dd : dd;
           
            thisWeek[i] = yyyy + '-' + mm + '-' + dd;
          }
          var data = google.visualization.arrayToDataTable([
            ['날짜', '일일가입자수'],
            [ thisWeek[6],  ${getJoin_6}],
            [ thisWeek[5],  ${getJoin_5}],
            [ thisWeek[4],  ${getJoin_4}],
            [ thisWeek[3],  ${getJoin_3}],
            [ thisWeek[2],  ${getJoin_2}],
            [ thisWeek[1],  ${getJoin_1}],
            [ thisWeek[0],  ${getJoinToday}]
          ]);

          var options = {
            title: '더하기 일일 가입자수 추이',
            curveType: 'function',
            legend: { position: 'bottom' },
            'width':900,
            'height':700
          };

          var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

          chart.draw(data, options);
      }
      
      function drawChart3() {
    	  var d = new Date(); 
    	  var currentDate = d.getFullYear() + "년 " + ( d.getMonth() + 1 ) + "월 " + d.getDate() + "일"; 

          var currentDay = new Date();  
          var theYear = currentDay.getFullYear();
          var theMonth = currentDay.getMonth();
          var theDate  = currentDay.getDate();
          var theDayOfWeek = currentDay.getDay();
          
          var thisWeek = [];

          for(var i=0; i<7; i++) {
            var resultDay = new Date(theYear, theMonth, theDate - (i));
            var yyyy = resultDay.getFullYear();
            var mm = Number(resultDay.getMonth()) + 1;
            var dd = resultDay.getDate();
           
            mm = String(mm).length === 1 ? '0' + mm : mm;
            dd = String(dd).length === 1 ? '0' + dd : dd;
           
            thisWeek[i] = yyyy + '-' + mm + '-' + dd;
          }
          
          var data = google.visualization.arrayToDataTable([
            ['날짜', '이 주의 방문자수'],
            [ thisWeek[6] , ${getVisit_6}],
            [ thisWeek[5] , ${getVisit_5}],
            [ thisWeek[4] , ${getVisit_4}],
            [ thisWeek[3] , ${getVisit_3}],
            [ thisWeek[2] , ${getVisit_2}],
            [ thisWeek[1] , ${getVisit_1}],
            [ thisWeek[0] , ${adminTodayVisit}]
          ]);
    	  

          var options = {
            chart: {
            title: '더하기 일일 방문자수 추이',
            subtitle: currentDate + ' 최근 7일 통계' },
          	'width':900,
            'height':700
          };

          var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

          chart.draw(data, google.charts.Bar.convertOptions(options));
        }
    </script>
</head>

<body>

	<%
		Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy년 MM월 dd일");
	String strdate = simpleDate.format(date);
	%>

	<h2>더하기 현재 총 회원 수 : ${adminChart}명</h2>
	<h2>더하기 총 방문자 : ${adminTotalVisit}명</h2>
	<h2><%=strdate%>
		방문자 : ${adminTodayVisit}명
	</h2>
	<div id="curve_chart"></div>
	<div id="chart_div"></div>
	<div id="columnchart_material"></div>
</body>
</html>