
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 수정</title>

<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
   href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

<style>
body {
   font-family: 'NanumSquare', sans-serif;
   /* margin-left: 40px; */
}
.announce-wrap {
   width:750px;
   display:fles;
   flex-direction:column;
   margin:0 auto;
}
#announceTitle {
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
   <form action="updateAnnounce" method="post">
      <div class="announce-wrap">
         <h2>공지사항 수정</h2>
         <hr>
         <input type="hidden" name="announceNum" value="${updateAnnounce.announceNum}">
         <input type="text" class="form-control" id="announceTitle" name="announceTitle" value="${updateAnnounce.announceTitle}">
         <textarea name="announceContent" style="white-space:pre-line;">${updateAnnounce.announceContent}</textarea>
         
         <button type="submit" id="editBtn">수정하기</button>
         <a class="back-to-list" href="announce">글 목록 가기</a>
      </div>
   </form>
   <hr>

</body>
</html>









