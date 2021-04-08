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
<<<<<<< HEAD

<!-- themify icon -->
<link rel="stylesheet" type="text/css"
	href="${path}/resources/icon/themify-icons/themify-icons.css">
<!-- fontawesome CSS -->
<!--   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous"> -->
>>>>>>> e5f52f68f1821ff056aaf83f11e501cbbd56ee02
<link rel="icon" type="image/png" href="http://example.com/myicon.png"> 
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
   width: 300px;
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
   /* background-color:lightgrey; */
   text-align:center;
   margin:0 10px 5px 10px;
   border-bottom:1px solid lightgrey;
   border-radius:5%;
}


.clubName{
   font-size:20pt;
   font-weight:bold;
}
.clubName a:hover{
   font-size:20pt;
   font-weight:bold;
text-decoration:none;
color:#001eff;
border-radius:5%;
}
.th{
   font-size:14pt;
   font-weight:bold;
}
.tm{
/* height:24px;
width:auto; */
display:block;
padding:16px 0 0 0;
text-align:center;
}
.Member{
   min-height:150px; 
      display:flex;
   margin:10px 16px;
   padding:0 16px 16px 16px;
   
}
.memberThumb{
   height:50px;
   width:50px;
   border-radius:50%;
   display:block;
}
.memberNickname{
width:auto;
height:auto;
font-size:12px;
}
#viewMine{
background-color:#001eff;
color:white;
border-radius:5px;
border-style:none;
padding:5px 20px;
}

#viewMine a:hover{
color:white;
text-decoration:none;
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
                            <span class="clubName"><a href="${path}/getCommunity?clubNum=${club.clubNum }">${club.clubName}</a></span>
                         </div>
                         
                         <div class="tr nav-link p-3">
                            <span class="th">활동 기간</span><br/>
                           <span class="td">${club.clubStartDate} ~ ${club.clubEndDate}</span>
                         </div>
                            <span class="th tm">참여중인 멤버</span>
                      <div class="tr nav-link Member">
		                        <c:forEach items="${apply}" var="applys">
                         <div id="currMem">
		                            <div class="memberThumb"><img class="memberThumb" src="${path}/resources${applys.memberPic}" onerror="this.src='${path}/resources/img/default_pic.png'"/></div>
		                             <div class="memberNickname">${applys.memberNickname }</div> 
                         </div>
		                        </c:forEach>
                      </div>
                         
                          <div class="tr nav-link p-3">
                            
                            <span class="td"><button type="submit" id="viewMine"><a href="${path}/getCommunity?clubNum=${club.clubNum }&memberNum=${user.memberNum}">내글보기</a></button></span>
                        </div>
                         
                         
                         
                      </div><!-- navbar-nav 끝 -->
               </div><!-- bottom-border 끝 -->
           </div> 
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>