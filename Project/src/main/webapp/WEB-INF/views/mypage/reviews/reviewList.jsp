<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!--${pageContext.request.contextPath}" 이게 web-app을 가리킨다!!!!!   -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- JSTL 날짜 형식 바꾸는 태그 라이브러리 , 노션가면 주소 있음  
	fmt:formatDate : Date 형을 받아서 원하는 포멧으로 날짜 형태를 변경시켜 준다.-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 그래서 path 써주고 그 아래 소스 파일 이름 지정해주면 된다 ! 이건 진경언니가 준거 !   -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>모임리뷰리스트</title> 
<link rel="stylesheet" href="${path}/resources/css/reviewList.css">
<style>
@charset "UTF-8";

.reviewContainer{
     margin: 0;
     width: 1140px;
     margin-bottom : 30%;
     margin-left :  5%;
 }

 .reviewTab {
     padding: 10px;    
     background: #ffffff;
     margin-bottom: 50%;
     }
     
 .btnReview{
     text-decoration:none;
 }

 .tabBox{
     display: flex;
     width: 69%;
     height: 150px;
     border: 2px solid #eee;
     margin-bottom: 20px;
     box-shadow: 0.5px 0.5px 0.5px 0.5px #8299d841;
 }

 .clubPic{
     width: 170px; 
     height: 120px;  
     border-radius: 2px 5px 5px 5px;
     margin:13px 30px 20px 30px ;
     box-shadow: 1px 1px 1px  #8299d879;
     
 }

 .title_text{
     width: 600px; 
     margin:1px 25px 12px 25px ;
     text-align: left;
      padding-top: 20px;
 }

 .reviewBtn{
    padding-top: 50px;
	padding-right: 3%;
 }

 /* 탭 css */
 section {
     display: none;
     padding: 20px 0 0;
     border-top: 1px solid  #8299d82f;}

 input {
       display: none;}

 label {
     display: inline-block;
     padding: 15px 25px;
     font-weight: 600;
     color:  #007bff;
     border: 1px solid transparent;
     font-size: 20px;
     }

 label:hover {
     color: #2C2C96;
     cursor: pointer;}


 .tabs input:checked + label {
       color: #555;
       border: 1px solid #ddd;
       border-top: 2px solid #2e9cdf;
       border-bottom: 3px solid red;
       }

 .reviewTab #tab1:checked ~ #ReviewContent1,
 .reviewTab #tab2:checked ~ #ReviewContent2 {
     display: block;}


 .reviewBtn button {
     border-style: none;
   }
   
 #noReviewBox{
 	width: 69%;
 	height : 150px;
    border: 2px solid #eee;
    box-shadow: 0.5px 0.5px 0.5px 0.5px #8299d841;
 	padding: 5.9%;
 	font-size : 20px;
 	text-align : center;
 }
 
 .h4, h4 {
    padding-top: 3%;
}


.aTagg{
	text-decoration-line : none;
	color : black;
}

.pTag{
	line-height :2px;
}
.btnCss{
	width:130px;
	height:55px; 
	font-size: 19px; 
	font-weight:700;
	color:#fff;
	background-color : #007BFF;
	border-radius : 5px;
	padding-right: 2%;
}

</style>
</head>
<body>	
		<div class="reviewContainer">
		    <div class="reviewTab" style="text-align:left" >
		        <input class="tabs" id="tab1" type="radio" name="tabs" checked>
		        <label for="tab1">작성가능한 리뷰</label>
		        <input class="tabs" id="tab2" type="radio" name="tabs">
		        <label for="tab2">내가 작성한 리뷰</label>
		   
		        <section id="ReviewContent1" style="margin-bottom:20px;">
		        <c:if test="${ empty selectNotReview }">
		        	<p id="noReviewBox">작성 가능한 리뷰가 없습니다! ⛳ <p></c:if>
		        <c:forEach var="noRvw" items="${selectNotReview}">
		                <!-- float left -->
		                <div>
		                    <div class="tabBox" >		
			                       <img class="clubPic" src="${path}/resources${noRvw.clubMain_pic}"
     								 onerror="this.onerror=null; this.src='${path}/resources/img/goal.PNG'" />
		                    
		                       <div class="title_text">
		                       <a href="getClub?clubNum=${noRvw.clubNum }" class="aTagg" ></a>
		                            <h4 title="모임타이틀 ">${noRvw.clubName}</h4>
									<fmt:formatDate value="${noRvw.startDate}" var="startDateFmt" pattern="yyyy-MM-dd hh:mm"/>
									<fmt:formatDate value="${noRvw.endDate}" var="endDateFmt" pattern="yyyy-MM-dd hh:mm"/>
		                            <p>📆모임기간 :</p>
		                            <p class="pTag">${startDateFmt} ~ ${endDateFmt }</p>
		                       </div>
		                       <div class="reviewBtn">
		                       		<form id="frm" name="frm" action="showReviewForm.do">
		                      	 		<input name="clubNum" type="hidden" value="${noRvw.clubNum}"/>
		                      	 		<input name="memberNum" type="hidden" value="${noRvw.memberNum}"/>
					                       <button class="btnCss">
					                       		후기작성
					                       </button>
			                       	</form>
		                       </div>
		                    </div>
		                </div>
		        </c:forEach>
		        </section>
		        <section id="ReviewContent2" style="margin-bottom:20px;">
		         <c:if test="${ empty selectOkayReview }">
		        	<p id="noReviewBox">작성한 리뷰가 없습니다! ⛳ <p></c:if>
		        <c:forEach var="okayRvw" items="${selectOkayReview}">
		                <!-- float left -->
		                <div>
		                    <div class="tabBox" >
		                       <img class="clubPic" src="${path}/resources${okayRvw.clubMain_pic}"
     								 onerror="this.onerror=null; this.src='${path}/resources/img/goal.PNG'" />
		                    
		                        <div class="title_text">
		                        <a href="getClub?clubNum=${okayRvw.clubNum }" class="aTagg"></a>
		                             <h4 title="모임타이틀">${okayRvw.clubName}</h4>
		                            <fmt:formatDate value="${okayRvw.startDate}" var="startDateFmt2" pattern="yyyy-MM-dd hh:mm"/>
									<fmt:formatDate value="${okayRvw.endDate}" var="endDateFmt2" pattern="yyyy-MM-dd hh:mm"/>
		                            <p>📆모임기간 :</p>
		                            <p class="pTag">${startDateFmt2} ~ ${endDateFmt2 }</p>
		                        </div>
		                        <div class="reviewBtn">
			                        <form id="frm" name="frm" action="readReview.do">
			                        	<input name="clubNum" type="hidden" value="${okayRvw.clubNum}"/>
		                      	 		<input name="memberNum" type="hidden" value="${okayRvw.memberNum}"/>
					                       <button class="btnCss">
					                       		리뷰보기
					                       </button>
			                        </form>
		                        </div>
		                     </div>
		                </div>
		        </c:forEach>
		        </section> 
		    </div>        
		</div>
</body>
</html>
