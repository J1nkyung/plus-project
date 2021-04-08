<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page import="com.project.plus.domain.InquiryVO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 
     <!-- Bootstrap CSS -->
 <!--     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
     integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="${path}/resources/css/mypage-aside.css">

    <!-- themify icon -->
    <%-- <link rel="stylesheet" type="text/css" href="${path}/resources/icon/themify-icons/themify-icons.css"> --%>
    <!-- fontawesome CSS -->
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${path}/resources/css/myplusedit.css">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Plus! My page</title>
<style>
/* 진경 추가 */
.wrap {
   width: 100%;
   height: 1000px;
   position: relative;
   display:flex;
}

.sidebar {
   position: sticky;
   width: 300px;
   height: 100vh;
   background-position: center;
   background-repeat: no-repeat;
   background-size: cover;
}

</style>
</head>
<body>
<!-- 진경 수정  -->
<div class="wrap">
	  <div class="sidebar fixed-top">
         <div class="bottom-border sidebarContent">
                    <a href="#" class="navbar-brand text-white text-center d-block mx-auto py-3 mb-4">MY PAGE</a>
                     <div class="bottom-border pb-3">
                         <img class="rounded-circle mr-3" src="${path}/resources/img/avatar-6.jpg" alt="" width="200px" height="200px">
                         <div class="user-name">이름(나중에 처리하실 곳)</div>
                         <button>설정 🔑<button>
                     </div>
                     <ul class="navbar-nav flex-column mt-4">
                        <!-- Mypage -->
                        <li class="nav-item">
                            <a href="getCurrentClubList" class="nav-link text-white p-3 mb-2 sidebar-link current"> 
                                <i class="fas fa-user text-white fa-lg mr-3"></i>마이페이지
                             </a> 
                        </li>
                        <!-- Heart -->
                        <li class="nav-item">
                            <a href="getHeartList.do" class="nav-link text-white p-3 mb-2 sidebar-link">
                                <i class="fas fa-heart text-white fa-lg mr-3"></i>찜하기
                            </a>
                        </li>
                        <!-- Calendar -->
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white p-3 mb-2 sidebar-link">
                                <i class="fas fa-calendar text-white fa-lg mr-3"></i>캘린더
                            </a>
                        </li>
                        <!-- Point -->
                        <li class="nav-item">
                            <a href="getPaymentList.do" class="nav-link text-white p-3 mb-2 sidebar-link">
                                <i class="fas fa-coins text-white fa-lg mr-3"></i>포인트
                            </a>
                        </li>
                        <!-- Review -->
                        <li class="nav-item">
                            <a href="getReviewList.do" class="nav-link text-white p-3 mb-2 sidebar-link">
                                <i class="fas fa-pencil-alt text-white fa-lg mr-3"></i>리뷰작성
                            </a>
                        </li>
                        <!-- 1:1 Inquiry -->
                        <li class="nav-item">
                            <a href="inquiry?memberNum=${user.memberNum}" class="nav-link text-white p-3 mb-2 sidebar-link">
                                <i class="fas fa-question-circle text-white fa-lg mr-3"></i>1:1문의
                            </a>
                        </li>


                     </ul><!-- navbar-nav 끝 -->
               </div><!-- bottom-border 끝 -->
           </div> 

	<!-- navbar -->
<%--     <nav class="navbar navbar-expand-md navbar-light">
        <button class="navbar-toggler ml-auto mb-2 bg-light" type="button" data-toggle="collapse" data-target="#sidebar">
            <span class="navbar-toggle-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="sidebar">
            <div class="container-fluid">
                <div class="row">
                    <!-- sidebar -->
                    <div class="col-lg-3 sidebar fixed-top">
                     <a href="#" class="navbar-brand text-white text-center d-block mx-auto py-3 mb-4">MY PAGE</a>
                     <div class="bottom-border pb-3">
                         <img class="rounded-circle mr-3" src="${path}/resources/img/avatar-6.jpg" alt="" width="200px" height="200px">
                         <div class="user-name">이름(나중에 처리하실 곳)</div>
                         <button>설정 🔑<button>
                     </div>
                     <ul class="navbar-nav flex-column mt-4">
                        <!-- Mypage -->
                        <li class="nav-item">
                            <a href="memberUpdate?memberNum=${user.memberNum }" class="nav-link text-white p-3 mb-2 sidebar-link current">
                            <a href="getCurrentClubList" class="nav-link text-white p-3 mb-2 sidebar-link current">
                            <a href="memberUpdate" class="nav-link text-white p-3 mb-2 sidebar-link current">
                                <i class="fas fa-user text-white fa-lg mr-3"></i>마이페이지
                            </a>
                        </li>
                        <!-- Heart -->
                        <li class="nav-item">
                            <a href="getHeartList.do" class="nav-link text-white p-3 mb-2 sidebar-link">
                                <i class="fas fa-heart text-white fa-lg mr-3"></i>찜하기
                            </a>
                        </li>
                        <!-- Calendar -->
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white p-3 mb-2 sidebar-link">
                                <i class="fas fa-calendar text-white fa-lg mr-3"></i>캘린더
                            </a>
                        </li>
                        <!-- Point -->
                        <li class="nav-item">
                            <a href="getPaymentList.do" class="nav-link text-white p-3 mb-2 sidebar-link">
                                <i class="fas fa-coins text-white fa-lg mr-3"></i>포인트
                            </a>
                        </li>
                        <!-- Review -->
                        <li class="nav-item">
                            <a href="getReviewList.do" class="nav-link text-white p-3 mb-2 sidebar-link">
                                <i class="fas fa-pencil-alt text-white fa-lg mr-3"></i>리뷰작성
                            </a>
                        </li>
                        <!-- 1:1 Inquiry -->
                        <li class="nav-item">
                            <a href="inquiry?memberNum=${user.memberNum}" class="nav-link text-white p-3 mb-2 sidebar-link">
                                <i class="fas fa-question-circle text-white fa-lg mr-3"></i>1:1문의
                            </a>
                        </li>


                     </ul>

                    </div> 
                    <!-- end of sidebar -->
                    

                </div>
            </div>
        </div>
        
        <!-- middle section -->
        
        <!-- end of middle section -->
    </nav>
    --%>
</body>
</html>