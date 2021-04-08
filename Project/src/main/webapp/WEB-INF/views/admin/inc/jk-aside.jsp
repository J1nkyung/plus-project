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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="${path}/resources/css/comm-aside.css">

<!-- themify icon -->
<link rel="stylesheet" type="text/css"
	href="${path}/resources/icon/themify-icons/themify-icons.css">

</style>
<title>Plus! My page</title>
</head>
<body>
	<div class="wrap">
	  <div class="sidebar fixed-top">
         <div class="bottom-border sidebarContent">
            <img class="clubMainpic"
               src="${path}/resources/img/avatar-6.jpg" alt="" width="280px"
               height="200px">

                      
                      <div class="navbar-nav flex-column">
                         <div class="tr nav-link p-3">
                            <span class="clubName">${club.clubName }보노보노는 그만! ppt 만들기</span>
                         </div>
                         
                         <div class="tr nav-link p-3">
                            <span class="th">활동 기간</span><br/>
                            <span class="td">${club.clubStartDate} ${club.clubEndDate}2021/01/01 ~ 2021/05/31</span>
                         </div>
                         <div class="tr nav-link p-3 Member">
                            <span class="th">활동중인 멤버</span><br/>
                            <div id="currMem">
                               <div class="memberThumb"></div>
                               <div class="memberNickname"></div>
                            </div>
                         </div>
                         
                         
                      </div><!-- navbar-nav 끝 -->
               </div><!-- bottom-border 끝 -->
           </div> 
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>