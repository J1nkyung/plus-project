<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>1:1 문의</title>
</head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <!-- themify icon -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/icon/themify-icons/themify-icons.css">
    <!-- font -->
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    
<style>
body {
	font-family: 'NanumSquare', sans-serif;
	margin-left:40px;
}
a {
color:inherit;
}

a:hover {
text-decoration:none;
}
th {
text-align:center;
}
.table td, .table th {
vertical-align: middle;
}
nav{
	width:300px;
}

</style>

<body>

    <section>
        <div class="container-fluid">
            <div class="row mb-5">
                <div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
                    <div class="row">
                        <div class="col-12">
                            <h3 class="text-muted text-center mb-3">결제 내역 관리</h3>
                            <table class="table bg-light">
                                <thead>
                                    <tr class="text-muted">
                                    	<th>결제내역번호</th>
                                    	<th>회원번호</th>
                                        <th>닉네임</th>
                                        <th>모임이름</th>
                                        <th>결제금액</th>
                                        <th>결제일시</th>
                                        <th>내역유형</th>
                                    </tr>
                                </thead>
                                    <c:forEach var="payment" items="${adminPayList}">
                                    
                                <tbody>
                                    <!-- table row -->
                                    <tr>
                                    	<td class="text-center">${payment.payNum}</td>
                                    	<td class="text-center">${payment.memberNum}</td>
                                        <td class="text-center">${payment.memberNickname}</td>
                                        <td>${payment.clubName}</td>
                                        <td class="text-center">${payment.payAmount}</td>
                                        <fmt:parseDate var="parseRegDate" value="${payment.payDate}" pattern="yyyy-MM-dd" />
										<fmt:formatDate var="resultRegDt" value="${parseRegDate}" pattern="yyyy-MM-dd" />
                                        <td class="text-center">${resultRegDt}</td>
                                        <c:if test="${payment.payMethod eq '포인트충전'}">
                                        <td class="text-center"><button type="button" class="btn btn-primary btn-sm" style="width:70px">충전</button></td>
                                        </c:if>
                                        <c:if test="${payment.payMethod eq '포인트사용'}">
                                        <td class="text-center"><button type="button" class="btn btn-danger btn-sm" style="width:70px">사용</button></td>
                                        </c:if>
                                   
                                    </tr>
                                </tbody>
                                </c:forEach>
                            </table>

                            <!-- pagination -->
                            <nav>
                                <ul class="pagination justify-content-center">
                                    <li class="page-item">
                                        <a href="#" class="page-link py-2 px-3">
                                            <span>&laquo;</span>
                                        </a>
                                    </li>

                                    <!-- 페이지 정보 추가 -->
                                    <li class="page-item active">
                                        <a href="#" class="page-link py-2 px-3">1</a>
                                    </li>
                                    <li class="page-item">
                                        <a href="#" class="page-link py-2 px-3">2</a>
                                    </li>
                                    <li class="page-item">
                                        <a href="#" class="page-link py-2 px-3">3</a>
                                    </li>
                                    <li class="page-item">
                                        <a href="#" class="page-link py-2 px-3">4</a>
                                    </li>

                                    <li class="page-item">
                                        <a href="#" class="page-link py-2 px-3">
                                            <span>&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                            <!-- end of pagination -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- end of table -->



    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
    <script src="js/script.js"></script>
</body>

</html>
</body>
</html>