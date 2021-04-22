<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>모임 관리</title>
</head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, shrink-to-fit=no">


<!-- font -->
<link rel="stylesheet" type="text/css"
   href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
<link rel="stylesheet" href="${path}/resources/css/admin-aside.css">

<!-- themify icon -->
<!-- fontawesome CSS -->
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
   integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu"
   crossorigin="anonymous">
<link rel="stylesheet" href="${path}/resources/css/reviewList.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/adminClub.css">
<script type="text/javascript"
   src="${path}/resources/js/jquery-1.12.4.min.js"></script>

<body>
   <div class="Container">
      <div class="Content">
         <h4>모임 관리</h4>

         <div id="tableWrapper">
               <div id="block">
                  <table class="useInfo">
                     <thead>
                        <tr>

                           <th>카테고리</th>
                           <th>모임이름</th>
                           <th>모임장</th>
                           <th>시작일</th>
                           <th>종료일</th>
                           <th>ON/OFF</th>
                           <th>모임구분</th>
                           <th>삭제</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach var="club" items="${adminClubList}">
                           <tr>

                              <td>${club.clubCategory}</td>
                              <td><a href="${path}/getClub?clubNum=${club.clubNum}">
                                    <div class="clubname">${club.clubName}</div>
                              </a></td>
                              <td><div class="clubleader">${club.clubLeader}</div></td>
                              <fmt:parseDate var="parseRegDate"
                                 value="${club.clubStartDate}" pattern="yyyy-MM-dd" />
                              <fmt:formatDate var="resultRegDt" value="${parseRegDate}"
                                 pattern="yyyy-MM-dd" />
                              <td class="text-center">${resultRegDt}</td>
                              <fmt:parseDate var="parseRegDate" value="${club.clubEndDate}"
                                 pattern="yyyy-MM-dd" />
                              <fmt:formatDate var="resultRegDt" value="${parseRegDate}"
                                 pattern="yyyy-MM-dd" />
                              <td class="text-center">${resultRegDt}</td>

                              <c:if test="${club.clubOnOff eq '온라인'}">
                                 <td class="text-center">
                                 <button type="button" class="btn btn-warning btn-sm" style="width: 50px; font-weight: bold;">ON</button></td>
                              </c:if>
                              <c:if test="${club.clubOnOff eq '오프라인'}">
                                 <td class="text-center">
                                 <button type="button" class="btn btn-info btn-sm" style="width: 50px; font-weight: bold;">OFF</button></td>
                              </c:if>

                              <c:if test="${club.clubKind eq 1}">
                                 <td class="text-center">
                                 <button type="button" class="btn btn-primary btn-sm" style="width: 60px; font-weight: bold;">가치+</button></td>
                              </c:if>
                              <c:if test="${club.clubKind eq 2}">
                                 <td class="text-center">
                                 <button type="button" class="btn btn-success btn-sm" style="width: 60px; font-weight: bold;">도움+</button></td>
                              </c:if>
                                 <td class="text-center">
                                    <form action="deleteAdminClub" method="post">
                                          <input type="hidden" name="clubNum" value="${club.clubNum}"/>
                                             <button type="submit" class="btn btn-danger btn-sm"
                                                id="delBtn" style="width: 50px; font-weight: bold;">
                                                삭제
                                                <!-- <a href="${path}/deleteAdminClub?clubNum=${club.clubNum}">삭제</a> -->
                                             </button>
                                    </form> 
                                 </td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>`
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

                     <%-- <c:if test="${pageMakerClub.prev}"> --%>
                     <li><a class="span"
                        href="adminClub${pageMakerClub.makeQuery(pageMakerClub.startPage - 1)}">◀</a></li>
                     <%-- </c:if> --%>

                     <c:forEach begin="${pageMakerClub.startPage}"
                        end="${pageMakerClub.endPage}" var="idx">
                        <li><a href="adminClub${pageMakerClub.makeQuery(idx)}"><span
                              class="span">${idx}</span></a></li>
                     </c:forEach>

                     <%-- <c:if test="${pageMakerClub.next && pageMakerClub.endPage > 0}"> --%>
                     <li><a class="span"
                        href="adminClub${pageMakerClub.makeQuery(pageMakerClub.endPage + 1)}">▶</a></li>
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
      $(document).ready(function() {

         $(function() {
            $(document).on('click', '#delBtn', function() {
               if (confirm("모임을 삭제하시겠습니까?") == true) {
               } else {
                  return false;
               }
            })
         });
      })
 
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
   </script>

</body>

</html>