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

</style>


</head>
<body>
<!-- new 게시판 양식 -->
 <table class="board_view" style="border:1px solid #ccc" >

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
                <td colspan="3">
                   ${adminInquiry.inquiryContent}
                </td>
            </tr>
        </tbody>
    </table>
  

	<br/><br/>
<c:set var="inquiryAnswer" value="${adminInquiry.inquiryAnswer}" />

<c:if test="${not empty inquiryAnswer}">
	<h2>답변</h2>
	<table style="border:1px solid #ccc">
	
	<table border="1" width="60%" height="auto">
	<tr>
    <th>답변 날짜</th>
    <fmt:parseDate var="parseRegDate" value="${adminInquiry.inquiryRegDate}" pattern="yyyy-MM-dd" />
	<fmt:formatDate var="resultRegDt" value="${parseRegDate}" pattern="yyyy-MM-dd" />
	<td style="text-indent:20px;"><c:out value="${resultRegDt}"/></td>
    </tr>
    <tr>
 	<th>답변 내용</th>
    <td class="content"><c:out value="${adminInquiry.inquiryAnswer}"/></td>
    </tr>
    </table>
    <hr>
</c:if>
<c:if test="${empty inquiryAnswer}">
<form action="answerInquiryForm" method="post" style="display:inline-block;">
	<input type="hidden" value="${adminInquiry.inquiryNum}" name="inquiryNum">
	<input type="hidden" value="${adminInquiry.memberNum}" name="memberNum">
	<input type="hidden" value="${adminInquiry.inquiryContent}" name="inquiryContent">
	<input type="hidden" value="${adminInquiry.memberNickname}" name="memberNickname">
	<a href="answerInquiryForm"><button type="submit" class="btn btn-primary" id="answerBtn">답변 작성</button></a>
	</form>
</c:if>&nbsp;
	<form action="deleteAdminInquiry" method="post" style="display:inline-block;">
	<input type="hidden" value="${adminInquiry.inquiryNum}" name="inquiryNum">
	<a href="deleteAdminInquiry">
	<button type="submit" class="btn btn-danger" id="deleteBtn">삭제</button>
	</form>
	
	<!-- <a href="inquiryEditForm.jsp"><button type="submit" class="btn btn-primary" id="editBtn">수정</button></a> -->
	
	<a href="adminInquiry"><button type="submit" class="btn btn-primary" id="listBtn">문의 목록</button></a>
	

	
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
