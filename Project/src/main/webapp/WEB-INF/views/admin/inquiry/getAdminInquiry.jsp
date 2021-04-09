<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>나의 문의 사항</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

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
<!-- font -->
<link rel="stylesheet" type="text/css"
   href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>
body {
   font-family: 'NanumSquare';
}
/* .content-data {
   padding:30px;
   white-space:pre;
}
tr {
   height:50;}
td {
   padding-left:20px;
}

.wrapper{
   margin : 0 auto;
} */
.Content {
	position: absolute;
	left: 25%;
	width: 70%;
	height: 100vh;
	padding-top:50px;
}

tbody {
border-top:2px gray solid;
}
th {
background-color:#eee;
border-bottom:1px #bbb solid;
padding-left:15px;
padding-right:15px;
}
tr td {
height:45px;
border:1px #bbb solid;
border-right:1px #bbb solid;
padding-left:15px;
}

.content {
height: auto;
white-space:pre;
padding-left:15px;
padding-right:15px;
padding-top:15px;
padding-bottom:15px;
}
.nav-item {
	font-size: 13px;
	padding: 0px;
	padding-left: 35px;
}
#gomain{
color:white; 
font-size:12px;
padding-top:30px;
}
a{
  text-decoration: none;
}
.btn-primary{
postion:absolute !important;
right:0%;


}
/* .contentanswer{
width:300px;} */
#listBtn{
postion:absolute;
right:10%;

}

</style>


</head>
<body>
<div class="Content">
<!-- new 게시판 양식 -->
 <table class="board_view" style="border:1px solid #ccc" width="90%" >

   <h2>문의 상세보기</h2>
        <colgroup>
            <col width="15%">
            <col width="35%">
            <col width="15%">
            <col width="*">
        </colgroup>
         
        <tbody>
            <tr>
                <th>제목</th>
                <td>${adminInquiry.inquiryTitle}</td>
                <th>작성시간</th>
                <fmt:parseDate var="parseRegDate" value="${adminInquiry.inquiryRegDate}"
                     pattern="yyyy-MM-dd" />
                  <fmt:formatDate var="resultRegDt" value="${parseRegDate}"
                     pattern="yyyy-MM-dd" />
                <td>${resultRegDt}</td>
                
            </tr>
            <tr>
                <th>작성자</th>
                <td>${adminInquiry.memberNickname}</td>
                <th>이메일</th>
                <td>${adminInquiry.memberEmail}</td>
            </tr>
            <tr class="content">
                <th>내용</th>
                <td colspan="3" style="white-space:pre-line"> ${adminInquiry.inquiryContent}</td>
            </tr>
        </tbody>
    </table>
  

   <br/><br/>
<c:set var="inquiryAnswer" value="${adminInquiry.inquiryAnswer}" />

<c:if test="${not empty inquiryAnswer}">
   <h2>답변</h2>
   <table style="border:1px solid #ccc">
   
   <table border="1" width="90%" height="auto">
   <tr>
    <th>답변 날짜</th>
    <fmt:parseDate var="parseRegDate" value="${adminInquiry.inquiryRegDate}" pattern="yyyy-MM-dd" />
   <fmt:formatDate var="resultRegDt" value="${parseRegDate}" pattern="yyyy-MM-dd" />
   <td><c:out value="${resultRegDt}"/></td>
    </tr>
    <tr>
    <th>답변 내용</th>
    <td class="content"><c:out value="${adminInquiry.inquiryAnswer}"/></td>
    </tr>
    </table>
    </table>
    <hr>
</c:if>
<c:if test="${empty inquiryAnswer}">
<form action="answerInquiryForm" method="post" style="display:inline-block;">
   <input type="hidden" value="${adminInquiry.inquiryNum}" name="inquiryNum">
   <input type="hidden" value="${adminInquiry.memberNum}" name="memberNum">
   <input type="hidden" value="${adminInquiry.inquiryContent}" name="inquiryContent">
   <input type="hidden" value="${adminInquiry.memberNickname}" name="memberNickname">
   <div class="answerbtn">
 
   <a href="answerInquiryForm"><button type="submit" class="btn btn-primary " id="answerBtn">답변 작성</button></a>
   </div>
   </form>
</c:if>&nbsp;
   <form action="deleteAdminInquiry" method="post" style="display:inline-block;">
   <input type="hidden" value="${adminInquiry.inquiryNum}" name="inquiryNum">
   <a href="deleteAdminInquiry">
   <button type="submit" class="btn btn-danger" id="deleteBtn">삭제</button>
   </form>
   
   <!-- <a href="inquiryEditForm.jsp"><button type="submit" class="btn btn-primary" id="editBtn">수정</button></a> -->
   
   <a href="adminInquiry"><button type="submit" class="btn btn-primary" id="listBtn">문의 목록</button></a>
   

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
												class="nav-link text-white p-3 mb-2 sidebar-link current">
													<i class="fas fa-users-cog text-white fa-lg mr-3"></i>회원 관리
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
													class="fas fa-question-circle text-white fa-lg mr-3"></i>공지
													관리
											</a></li>
											<!-- 결제내역 관리 -->
											<li class="nav-item"><a href="adminPay"
												class="nav-link text-white p-3 mb-2 sidebar-link"> <i
													class="fas fa-coins text-white fa-lg mr-3"></i>결제내역 관리
											</a></li>
											<!-- 관리자 차트 -->
											<li class="nav-item"><a href="adminChart"
												class="nav-link text-white p-3 mb-2 sidebar-link"> <i
													class="fas fa-question-circle text-white fa-lg mr-3"></i>차트
													관리
											</a></li>
	<p id="gomain"><a href="main"><i class="fas fa-home"></i> 메인으로 가기 </a></p>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</nav>
</div>

</div>
<!-- </div> -->

<script>
      $(document).ready(function(){
         $("#deleteBtn").on("click", function(){
            alert("문의가 정상적으로 삭제되었습니다");
         });
      });
      
</script>

</body>
</html>
