<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/reviewList.css">
<script type="text/javascript"
   src="${path}/resources/js/jquery-1.12.4.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<title>1:1 문의</title>
</head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
<!-- font -->
<link rel="stylesheet" type="text/css"
   href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<!-- fontawesome CSS -->
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
   integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu"
   crossorigin="anonymous">
<link rel="stylesheet" href="${path}/resources/css/admin-aside.css">
<link rel="stylesheet" href="${path}/resources/css/adminPayment.css">

<body>
   <div class="Container">
      <div class="Content">
         <h4>결제 관리</h4>
         <br>
      
         <!-- search -->
         <div id="tableWrapper">
            <form role="form" method="get" id="form">



               <div id="block">
                  <table class="useInfo">
                     <thead>
                        <tr>
                           <th>결제내역번호</th>
                           <th>회원번호</th>
                           <th>닉네임</th>
                           <th>모임이름</th>
                           <th>결제금액</th>
                           <th>거래일시</th>
                           <th>내역유형</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach var="payment" items="${adminPayList}">
                           <tr>
                              <td class="text-center">${payment.payNum}</td>
                              <td class="text-center">${payment.memberNum}</td>
                              <td class="text-center">${payment.memberNickname}</td>
                              <td>${payment.clubName}</td>
                              <td class="text-center">${payment.payAmount}</td>
                              <fmt:parseDate var="parseRegDate" value="${payment.payDate}"
                                 pattern="yyyy-MM-dd" />
                              <fmt:formatDate var="resultRegDt" value="${parseRegDate}"
                                 pattern="yyyy-MM-dd" />
                             <%--  ${resultRegDt} + " (" + ${payment.payTime} +")" --%>
                             <td class="text-center"><fmt:formatDate value="${payment.payDate}"  
                             pattern="yyyy-MM-dd" /> (${payment.payTime })</td>
                              <c:if test="${payment.payMethod eq '포인트충전'}">
                                 <td class="text-center"><button type="button"
                                       class="btn btn-primary btn-sm" disabled style="width: 70px">충전</button></td>
                              </c:if>
                              <c:if test="${payment.payMethod eq '포인트사용'}">
                                 <td class="text-center"><button type="button"
                                       class="btn btn-danger btn-sm" disabled style="width: 70px">사용</button></td>
                              </c:if>
                              <c:if test="${payment.payMethod eq '포인트입금'}">
                                 <td class="text-center"><button type="button"
                                       class="btn btn-info btn-sm" disabled style="width: 70px">입금</button></td>
                              </c:if>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>

               <!--  사이드 바 추가 -->
               <nav class="navbar navbar-expand-md navbar-light">
                  <div class="col-lg-3 sidebar fixed-top">
                     <button class="navbar-toggler ml-auto mb-2 bg-light"
                        type="button" data-toggle="collapse" data-target="#sidebar">
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
                                       class="fas fa-question-circle text-white fa-lg mr-3"></i>문의
                                       관리
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

               <!-- pagenation -->
               <div id="pageArea">

                  <ul class="paging">

                     <%--    <c:if test="${pageMakerPay.prev}"> --%>
                     <li><a class="span"
                        href="adminPay${pageMakerPay.makeQuery(pageMakerPay.startPage - 1)}">◀</a></li>
                     <%-- </c:if> --%>

                     <c:forEach begin="${pageMakerPay.startPage}"
                        end="${pageMakerPay.endPage}" var="idx">
                        <li><a href="adminPay${pageMakerPay.makeQuery(idx)}"><span
                              class="span">${idx}</span></a></li>
                     </c:forEach>

                     <%-- <c:if test="${pageMakerPay.next && pageMakerPay.endPage > 0}"> --%>
                     <li><a class="span"
                        href="adminPay${pageMakerPay.makeQuery(pageMakerPay.endPage + 1)}">▶</a></li>
                     <%-- </c:if> --%>
                  </ul>

               </div>
               <!-- pageArea -->
            </form>
         </div>
         <!-- wrapper -->

      </div>
   </div>

   <!-- end of table -->
   <script>
      window.onload = function() {
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

      }
      $(function() {
         $('#searchBtn').click(
               function() {
                  self.location = "memberList" + '${pmem.makeQuery(1)}'
                        + "&searchType="
                        + $("select option:selected").val()
                        + "&keyword="
                        + encodeURIComponent($('#keywordInput').val());
               });
      });
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
