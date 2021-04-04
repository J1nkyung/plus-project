<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);
	  google.charts.setOnLoadCallback(drawChart2);
      
      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Club');
        data.addColumn('number', 'count');
        data.addRows([
          ['학습', 200],
          ['습관', 100],
          ['운동', 90],
          ['취미', 70]
        ]);

        // Set chart options
        var options = {'title':'우리 회원들이 무슨 모임을 만들었는지 살펴봅시다',
                       'width':500,
                       'height':350};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
      
      function drawChart2() {
          var data = google.visualization.arrayToDataTable([
            ['날짜', '일일가입자수', '방문자수'],
            ['2021-03-21',  20, 300],
            ['2021-03-22',  12, 150],
            ['2021-03-23',  8, 70],
            ['2021-03-24',  19, 200],
            ['2021-03-25',  8, 100],
            ['2021-03-26',  7, 90],
            ['2021-03-27',  12, 80]
          ]);

          var options = {
            title: '더하기 가입자수 및 방문자수 추이',
            curveType: 'function',
            legend: { position: 'bottom' },
            'width':1000,
            'height':750
          };

          var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

          chart.draw(data, options);
      }
    </script>
  </head>

  <body>
  
 	총 회원 수 : ${adminChart}<br/>
    <div id="curve_chart"></div>
    <div id="chart_div"></div>
  </body>
</html>