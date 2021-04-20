<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ 수정</title>

<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
   href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

<style>
body {
   font-family: 'NanumSquare', sans-serif;
   /* margin-left: 40px; */
}
.faq-wrap {
   width:750px;
   display:flex;
   flex-direction:column;
   margin:0 auto;
}
#faqTitle {
   width: 750px;
   margin-bottom: 7px;
   margin-top:7px;
}

textarea {
   width: 750px;
   height: 400px;
   resize: none;
   margin-bottom: 10px;
   border: 1px solid #dddddd;
}

#editBtn {
   width: 750px;
   height: 50px;
   border: 0;
   outline: 0;
   color: white;
   background-color: #001eff;
   margin-top: 10px;
   border-radius:5px;
   
}

.back-to-list {
   margin-left:675px;
}
</style>
</head>
<body>
   <form action="updateFaq" method="post">
      <div class="faq-wrap">
         <h2>FAQ 수정</h2>
         <hr>
         <div class="faq-category">
            <label for="exampleFormControlSelect2">카테고리 선택</label>
            <select   name="faqCategory" id="id_select" class="form-control" style="width:200px">
               <option value="회원관련" <c:if test="${updateFaq.faqCategory == '회원관련'}">selected</c:if>>회원관련</option>
               <option value="모임관련" <c:if test="${updateFaq.faqCategory == '모임관련'}">selected</c:if>>모임관련</option>
               <option value="결제문의" <c:if test="${updateFaq.faqCategory == '결제문의'}">selected</c:if>>결제문의</option>
               <option value="기타문의" <c:if test="${updateFaq.faqCategory == '기타문의'}">selected</c:if>>기타문의</option>
            </select>
         </div>
         <input type="hidden" name="faqNum" value="${updateFaq.faqNum}">
         <input type="text" class="form-control" id="faqTitle" name="faqTitle" value="${updateFaq.faqTitle}">
         <textarea name="faqContent" style="white-space:pre-line;">${updateFaq.faqContent}</textarea>
         
         <button type="submit" id="editBtn">수정하기</button><br/>
         <a class="back-to-list" href="faq">글 목록 가기</a>
      </div>
   </form>
   
   <hr>

</body>
</html>












