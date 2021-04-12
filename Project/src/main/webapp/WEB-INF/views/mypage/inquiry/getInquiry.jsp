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

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<!-- font -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>
body {
	font-family: 'NanumSquare', sans-serif;
	/* margin-left: 40px; */
}
/* .content-data {
	padding:30px;
}
tr {
	height:50;}
td {
	padding-left:20px;
}
.wrap {
    width: 100%;
    height: 1000px;
    position: relative;
    display: flex;
    padding-left: 300px;
    padding-top: 50px;
    } */
.Content {
	position: absolute;
	left: 30%;
	width: 70%;
	height: 100vh;
	padding-top:50px;
}
tbody {
border-top:2px #5266b7 solid;
}
th {
background-color:#001eff12;
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
 <table class="board_view" style="border:1px solid #ccc; width:90%;" >

   <h4>문의 상세보기</h4>
        <colgroup>
            <col width="15%">
            <col width="35%">
            <col width="15%">
            <col width="*">
        </colgroup>
         
        <tbody>
            <tr>
                <th>제목</th>
                <td>${inquiry.inquiryTitle}</td>
                <th>문의일자</th>
                <fmt:parseDate var="parseRegDate" value="${inquiry.inquiryRegDate}"
                     pattern="yyyy-MM-dd" />
                  <fmt:formatDate var="resultRegDt" value="${parseRegDate}"
                     pattern="yyyy-MM-dd" />
                <td>${resultRegDt}</td>
                
            </tr>
            <tr>
                <th>작성자</th>
                <td>${inquiry.memberNickname}</td>
                <th>이메일</th>
                <td>${inquiry.memberEmail}</td>
            </tr>
            <tr>
            	<th>카테고리</th>
            	<td colspan="3">${inquiry.inquiryType}</td>
          	</tr>
            <tr class="content">
                <th>내용</th>
                <td colspan="3" style="white-space:pre-line">${inquiry.inquiryContent}</td>
            </tr>
        </tbody>
    </table>
  

   <br/><br/>
 <!-- new version --> 
   <c:set var="inquiryAnswer" value="${inquiry.inquiryAnswer}" />

<c:if test="${not empty inquiryAnswer}">
	<h4>답변</h4>
	<table style="border:1px solid #ccc; width:90%; height:auto;">
	<!-- <table border="1" width="70%" height="auto"> -->
	<tr>
	<th>답변일자</th>
		<fmt:parseDate var="parseRegDate" value="${inquiry.inquiryRegDate}" pattern="yyyy-MM-dd" />
   <fmt:formatDate var="resultRegDt" value="${parseRegDate}" pattern="yyyy-MM-dd" />
   <td><c:out value="${resultRegDt}"/></td>
	</tr>
	<tr>
	<th>답변 내용</th>
	<td class="content"><c:out value="${inquiry.inquiryAnswer}"/></td>
	</tr>
    </table>
</c:if>
<c:if test="${empty inquiryAnswer}">
<form action="editInquiryForm" method="post" style="display:inline-block;">
    <input type="hidden" value="${inquiry.inquiryNum}" name="inquiryNum">
	<input type="hidden" value="${inquiry.memberNum}" name="memberNum">
	<input type="hidden" value="${inquiry.inquiryType}" name="inquiryType">
	<input type="hidden" value="${inquiry.inquiryTitle}" name="inquiryTitle">
	<input type="hidden" value="${inquiry.inquiryContent}" name="inquiryContent">
	<input type="hidden" value="${inquiry.inquiryState}" name="inquiryState">
    <a href="editInquiryForm" style="display:inline-block;"><button type="submit" class="btn btn-primary" id="editBtn">수정</button></a>
    </form>
</c:if>&nbsp;
<hr>
    <form action="deleteInquiry" method="post" style="display:inline-block;">
    <input type="hidden" value="${inquiry.inquiryNum}" name="inquiryNum">
    <a href="deleteInquiry"><button type="submit" class="btn btn-danger" id="deleteBtn">삭제</button></a>
    </form>
   

    <a href="inquiry"><button type="submit" class="btn btn-primary" id="listBtn">문의 목록</button></a>
 </center>
 <!-- new version end --> 
   

<script>
        $(document).ready(function(){
            $("#deleteBtn").on("click", function(){
                alert("문의가 정상적으로 삭제되었습니다");
            });
        });
</script>
</body>
</html>