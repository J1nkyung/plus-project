<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*, java.text.*"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<title>더하기 통계차트</title>
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<script type="text/javascript"
   src="${path}/resources/js/jquery-1.12.4.min.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
<link rel="stylesheet" href="${path}/resources/css/admin-aside.css">

<!-- font -->
<link rel="stylesheet" type="text/css"
   href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<!-- fontawesome CSS -->
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
   integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu"
   crossorigin="anonymous">

<style>
#chart_div {
   margin-left: 140px;
}

body {
   padding-top: 30px;
   font-family: 'NanumSquare', sans-serif;
   margin-left: 40px;
}

a {
   color: inherit;
}

a:hover {
   text-decoration: none;
}

.Container {
   margin: 0;
   width: 1140px;
}

.Content {
   /* padding: 40px 60px;
   height: 100vh; */
   position: absolute;
   left: 25%;
   width: 70%;
   height: 100vh;
}

#block {
   border: 1px solid rgba(189, 186, 186, 0.829);
   border-radius: 2%;
   min-height: 443.2px;
}
</style>
<style type="text/css">
li {
   list-style: none;
   float: left;
   padding: 6px;
}

.nav-item {
   font-size: 13px;
   padding: 0px;
   padding-left: 35px;
}

.navbar-light .navbar-nav .nav-link {
   margin: 0;
   padding: 5px;
}

#gomain {
   color: white;
   font-size: 12px;
   padding-top: 30px;
}
</style>
<style>
.card-counter {
   box-shadow: 2px 2px 10px #DADADA;
   margin: 5px;
   padding: 20px 10px;
   background-color: #fff;
   height: 100px;
   border-radius: 5px;
   transition: .3s linear all;
}

.card-counter:hover {
   box-shadow: 4px 4px 20px #DADADA;
   transition: .3s linear all;
}

.card-counter.primary {
   background-color: #96aae0;
   color: #FFF;
}

.card-counter.danger {
   background-color: #e8a9bc;
   color: #FFF;
}

.card-counter.success {
   background-color: #f2c3aa;
   color: #FFF;
}

.card-counter.info {
   background-color: #92d4c1;
   color: #FFF;
}

.card-counter i {
   font-size: 4em;
   opacity: 0.2;
   float: left;
}

.card-counter .count-numbers {
   position: absolute;
   right: 40px;
   top: 20px;
   font-size: 28px;
   display: block;
}

.card-counter .count-name {
   position: absolute;
   right: 35px;
   top: 65px;
   font-style: italic;
   text-transform: capitalize;
   opacity: 0.85;
   display: block;
   font-size: 15px;
}

.cardrow {
   display: flex;
   flex-wrap: wrap;
   /* margin-right: 0px;
    margin-left: 0px; */
}
</style>


<!--Load the AJAX API-->
<script type="text/javascript"
   src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
/*   google.charts.load("current", {packages:['corechart']}); */
      google.charts.load('current', {'packages':['corechart']});
      google.charts.load('current', {'packages':['bar']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);
     google.charts.setOnLoadCallback(drawChart2);
     google.charts.setOnLoadCallback(drawStuff2);
      google.charts.setOnLoadCallback(drawStuff);
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
                       'width': 900,
                       'height':550,
                       colors :['#c9dcff', '#9dbefc', '#72a1f7', '#3f76d4']};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
      
      function drawChart2() {
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
            ['날짜', '일일가입자수', '방문자수'],
            [ thisWeek[6],  ${getJoin_6}, ${getVisit_6}],
            [ thisWeek[5],  ${getJoin_5}, ${getVisit_5}],
            [ thisWeek[4],  ${getJoin_4}, ${getVisit_4}],
            [ thisWeek[3],  ${getJoin_3}, ${getVisit_3}],
            [ thisWeek[2],  ${getJoin_2}, ${getVisit_2}],
            [ thisWeek[1],  ${getJoin_1}, ${getVisit_1}],
            [ thisWeek[0],  ${getJoinToday}, ${adminTodayVisit}]
          ]);

          
          var options = {
            title: '더하기 일일 가입자수/방문자수 추이' + ' (' + currentDate + '까지 최근 7일 통계)',
            curveType: 'function',
            legend: { position: 'bottom' },
            'width':900,
            'height':400
          };

          var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

          chart.draw(data, options);
      }
   
      
       function drawStuff2() {
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
                    ['', '일일 포인트 충전 매출액'],
                    [ thisWeek[6],  ${getPay_6}],
                    [ thisWeek[5],  ${getPay_5}],
                    [ thisWeek[4],  ${getPay_4}],
                    [ thisWeek[3],  ${getPay_3}],
                    [ thisWeek[2],  ${getPay_2}],
                    [ thisWeek[1],  ${getPay_1}],
                    [ thisWeek[0],  ${getPayToday}]
                  ]);

               var options = {
                 width: 800, 
                legend: { position: 'top' },
                 chart: {
                   title: '더하기 일일 매출 추이',
                   subtitle: ' (' + currentDate + '까지 최근 7일 통계)' },
                /*  axes: {
                   x: {
                     0: { side: 'top', label: 'white to move'} // Top x-axis.
                   }
                 }, */
                 bar: { groupWidth: "90%" }
               }; 

               var chart = new google.charts.Bar(document.getElementById('top_x_div'));
               // Convert the Classic options to Material options.
               chart.draw(data, google.charts.Bar.convertOptions(options));
             }

          function drawStuff() {
            var data = new google.visualization.arrayToDataTable([
              ['모임카테고리', '온라인', '오프라인'],
              ['학습', ${getOnStudy}, ${getOffStudy}],
              ['습관', ${getOnHabit}, ${getOffHabit}],
              ['운동', ${getOnExcer}, ${getOffExcer}],
              ['취미', ${getOnHobby}, ${getOffHobby}]
            ]);

            var options = {
              width: 800,
              chart: {
                title: '모임카테고리별 온오프라인 비율'
              },
              bars: 'horizontal', // Required for Material Bar Charts.
              series: {
                0: { axis: 'distance' }, // Bind series 0 to an axis named 'distance'.
                1: { axis: 'brightness' } // Bind series 1 to an axis named 'brightness'.
              },
              axes: {
                x: {
                  distance: {label: '개설모임수'}, // Bottom x-axis.
                  brightness: {side: 'top'/* , label: '모임수' */} // Top x-axis.
                }
              }
            };

          var chart = new google.charts.Bar(document.getElementById('dual_x_div'));
          chart.draw(data, options);
        };
  
    </script>
</head>

<body>
   <!--  사이드 바 추가 -->
   <nav class="navbar navbar-expand-md navbar-light">
      <div class="col-lg-3 sidebar fixed-top">
         <button class="navbar-toggler ml-auto mb-2 bg-light" type="button"
            data-toggle="collapse" data-target="#sidebar">
            <span class="navbar-toggle-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="sidebar">
            <div class="container-fluid">
               <div class="row">
                  <!-- sidebar -->
                  <a href="#"
                     class="navbar-brand text-white text-center d-block mx-auto py-3 mb-4">ADMIN
                     PAGE</a>
                  <!--  <div class="bottom-border pb-3"> -->
                  <img class="rounded-circle mr-3"
                     src="${path}/resources/img/admin.jpg" alt="" width="200px"
                     height="200px">

               </div>
               <div class="navcontent">
                  <ul class="navbar-nav flex-column mt-4">

                     <!-- 회원 관리 -->
                     <li class="nav-item"><a href="memberListPage"
                        class="nav-link text-white p-3 mb-2 sidebar-link"> <i
                           class="fas fa-users-cog text-white fa-lg mr-3"></i>회원 관리
                     </a></li>
                     <!-- 모임 관리 -->
                     <li class="nav-item"><a href="adminClub"
                        class="nav-link text-white p-3 mb-2 sidebar-link"> <i
                           class="fas fa-plus text-white fa-lg mr-3"></i>모임 관리
                     </a></li>

                     <!-- 문의 관리 -->
                     <li class="nav-item"><a href="adminInquiry"
                        class="nav-link text-white p-3 mb-2 sidebar-link"> <i
                           class="fas fa-question-circle text-white fa-lg mr-3"></i>문의 관리
                     </a></li>
                     <!-- 공지 관리 -->
                     <li class="nav-item"><a href="announce"
                        class="nav-link text-white p-3 mb-2 sidebar-link"> <i
                           class="far fa-flag text-white fa-lg mr-3"></i>공지 관리
                     </a></li>
                     <!-- 결제내역 관리 -->
                     <li class="nav-item"><a href="adminPay"
                        class="nav-link text-white p-3 mb-2 sidebar-link"> <i
                           class="fas fa-coins text-white fa-lg mr-3"></i>결제내역 관리
                     </a></li>
                     <!-- 관리자 차트 -->
                     <li class="nav-item"><a href="adminChart"
                        class="nav-link text-white p-3 mb-2 sidebar-link"> <i
                           class="fas fa-chart-line text-white fa-lg mr-3"></i>차트 관리
                     </a></li>
                     <p id="gomain">
                        <a href="main"><i class="fas fa-home"></i> 메인으로 가기 </a>
                     </p>
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </nav>

   <div class="Content">
      <%
         Date date = new Date();
      SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy/MM/dd");
      String strdate = simpleDate.format(date);
      %>

      <div class="analysisCard">
         <div class="cardrow">

            <div class="col-sm-3">
               <div class="card-counter danger">
                  <i class="fa fa-ticket"></i> <span class="count-numbers">${adminTodayVisit}</span>
                  <span class="count-name"><%=strdate%> 방문자</span>
               </div>
            </div>

            <div class="col-sm-3">
               <div class="card-counter primary">
                  <i class="fa fa-mouse-pointer" style="margin-left: 20px;"></i> <span
                     class="count-numbers">${adminTotalVisit}</span> <span
                     class="count-name">총 방문자</span>
               </div>
            </div>

            <div class="col-sm-3">
               <div class="card-counter info">
                  <i class="fa fa-users"></i> <span class="count-numbers">${adminChart}</span>
                  <span class="count-name">회원수</span>
               </div>
            </div>

            <div class="col-sm-3">
               <div class="card-counter success">
                  <i class="fa fa-plus"></i> <span class="count-numbers">${adminClubListCount}</span>
                  <span class="count-name">개설 모임 수</span>
               </div>
            </div>
         </div>
      </div>

      <br />



      <center>

         <div id="curve_chart"></div>
         <div id="chart_div"></div>
         <div id="top_x_div" style="width: 900px; height: 400px;"></div><br><br><br>
         <div id="dual_x_div" style="width: 900px; height: 400px;"></div>
      </center>
   </div>
   <script>
   window.onload = function(){
        selectNav();
     }
      function selectNav() {
         // 지금 접속해있는 주소 얻어서 now에 넣어줌
         var now = window.location.href;
         // className이 ()인 값을 nav에 넣어줌
         var nav = document
               .getElementsByClassName("nav-link text-white p-3 mb-2 sidebar-link");
         // 주소에 포함되어야 하는 단어 배열로 선언
         var arr = [ "ListPage", "adminClub", "adminInquiry", "announce",
               "adminPay", "adminChart" ];

         //기본 nav 요소는 for문으로 돌려서 각 단어가 포함된 페이지의 해당 요소에curr 클래스를 추가해준다 
         for (var i = 0; i < arr.length; i++) {
            if (now.includes(arr[i])) {
               nav[i]
                     .setAttribute("class",
                           "nav-link text-white p-3 mb-2 sidebar-link current");
            }
         }

      };
   </script>
   <!-- Optional JavaScript -->
   <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
      integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
      crossorigin="anonymous"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
      integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
      crossorigin="anonymous"></script>
   <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
      integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
      crossorigin="anonymous"></script>
   <!--    <script src="js/script.js"></script> -->
</body>
</html>