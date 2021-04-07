<<<<<<< HEAD
=======
<<<<<<< HEAD
<<<<<<< HEAD
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
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/mypage-aside.css">

    <!-- themify icon -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/icon/themify-icons/themify-icons.css">
    <!-- fontawesome CSS -->
  <!--   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous"> -->
    
<title>Plus! My page</title>
</head>
<body>
	<!-- navbar -->
    <nav class="navbar navbar-expand-md navbar-light">
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
   


    <!— Optional JavaScript —>
    <!— jQuery first, then Popper.js, then Bootstrap JS —>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>
=======
>>>>>>> e7608280895d9fd2dfe2abf9ce350ac13feeabc3
=======
>>>>>>> 7161a5136ca54c2e0afd159888505446f1d6024c
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
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/mypage-aside.css">

    <!-- themify icon -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/icon/themify-icons/themify-icons.css">
    <!-- fontawesome CSS -->
  <!--   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous"> -->
    
<title>Plus! My page</title>
</head>
<body>
	<!-- navbar -->
    <nav class="navbar navbar-expand-md navbar-light">
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
   


    <!— Optional JavaScript —>
    <!— jQuery first, then Popper.js, then Bootstrap JS —>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
<<<<<<< HEAD
</html>
=======
</html>
=======
>>>>>>> c23af9c53536feee8c6057763d4e40d9595fca1d
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
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/mypage-aside.css">

    <!-- themify icon -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/icon/themify-icons/themify-icons.css">
    <!-- fontawesome CSS -->
  <!--   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous"> -->
    
<title>Plus! My page</title>
<<<<<<< HEAD
<style>
	.wrap{

   position: relative;
   display:flex;
   	}
</style>
</head>
<body>
   <!-- navbar -->
   <div class="wrap">
=======
</head>
<body>
	<!-- navbar -->
>>>>>>> c23af9c53536feee8c6057763d4e40d9595fca1d
    <nav class="navbar navbar-expand-md navbar-light">
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
<<<<<<< HEAD
                            <a href="getCurrentClubList" class="nav-link text-white p-3 mb-2 sidebar-link current">
=======
                            <a href="memberUpdate" class="nav-link text-white p-3 mb-2 sidebar-link current">
>>>>>>> c23af9c53536feee8c6057763d4e40d9595fca1d
                                <i class="fas fa-user text-white fa-lg mr-3"></i>마이페이지
                            </a>
                        </li>
                        <!-- Heart -->
                        <li class="nav-item">
<<<<<<< HEAD
                            <a href="getHeartList" class="nav-link text-white p-3 mb-2 sidebar-link">
=======
                            <a href="getHeartList.do" class="nav-link text-white p-3 mb-2 sidebar-link">
>>>>>>> c23af9c53536feee8c6057763d4e40d9595fca1d
                                <i class="fas fa-heart text-white fa-lg mr-3"></i>찜하기
                            </a>
                        </li>
                        <!-- Calendar -->
                        <li class="nav-item">
<<<<<<< HEAD
                            <a href="getClubDate" class="nav-link text-white p-3 mb-2 sidebar-link">
=======
                            <a href="#" class="nav-link text-white p-3 mb-2 sidebar-link">
>>>>>>> c23af9c53536feee8c6057763d4e40d9595fca1d
                                <i class="fas fa-calendar text-white fa-lg mr-3"></i>캘린더
                            </a>
                        </li>
                        <!-- Point -->
                        <li class="nav-item">
<<<<<<< HEAD
                            <a href="getPaymentList" class="nav-link text-white p-3 mb-2 sidebar-link">
=======
                            <a href="getPaymentList.do" class="nav-link text-white p-3 mb-2 sidebar-link">
>>>>>>> c23af9c53536feee8c6057763d4e40d9595fca1d
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
<<<<<<< HEAD
                            <a href="inquiry" class="nav-link text-white p-3 mb-2 sidebar-link">
=======
                            <a href="inquiry?memberNum=${user.memberNum}" class="nav-link text-white p-3 mb-2 sidebar-link">
>>>>>>> c23af9c53536feee8c6057763d4e40d9595fca1d
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
<<<<<<< HEAD
  
=======
   

>>>>>>> c23af9c53536feee8c6057763d4e40d9595fca1d

    <!— Optional JavaScript —>
    <!— jQuery first, then Popper.js, then Bootstrap JS —>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
<<<<<<< HEAD
</html>
=======
</html>
>>>>>>> bf56ef1 (no message)
<<<<<<< HEAD
>>>>>>> e7608280895d9fd2dfe2abf9ce350ac13feeabc3
=======
>>>>>>> c23af9c53536feee8c6057763d4e40d9595fca1d
>>>>>>> 7161a5136ca54c2e0afd159888505446f1d6024c
