<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page import="com.project.plus.domain.InquiryVO"%>
<link rel="icon" type="image/png" href="http://example.com/myicon.png"> 


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
<style>
	
*{
       font-family:   'NanumSquare', sans-serif !important;
   
}

.wrap {
   width: 100%;
   height: 2000px;
   position: relative;
   display:flex;
}

.sidebar {
   position: sticky;
   width: 400px;
   height: 100vh;
   background-color: #f5f4f4;
   background-position: center;
   background-repeat: no-repeat;
   background-size: cover;
}

.sidebarContent{
      width: 300px;
   margin-left:100px;
   
   
}

.clubMainpic{
   margin:10px;
   border-radius:5%;
}

.tr{
   background-color:lightgrey;
   text-align:center;
   margin:0 10px 20px 10px;;
   border:1px solid lightgrey;
   border-radius:5%;
}


.clubName{
   font-size:20pt;
   font-weight:bold;
}
.th{
   font-size:14pt;
   font-weight:bold;
}

#currMem{
   min-height:200px;
}
.memberThumb{
   height:50px;
   width:50px;
   background-color:red;
   border-radius:50%;
}
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
</body>
</html>