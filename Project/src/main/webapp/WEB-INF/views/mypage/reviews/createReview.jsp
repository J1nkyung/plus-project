<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!--${pageContext.request.contextPath}" 이게 web-app을 가리킨다!!!!!   -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 그래서 path 써주고 그 아래 소스 파일 이름 지정해주면 된다 ! 이건 진경언니가 준거 !   -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="${path}/resources/js/jquery-1.12.4.js"></script>
<title>모임리뷰남기기</title>
<style>
.createContainer {
	margin: 0;
	width: 1140px;
	/* padding: 5%; */
	/* background-color: white; */
}

/*후기페이지랑 후기작성페이지를 동일한 레이아웃을 가지기 위해 div 묶어 padding 값을 주었다*/
.reviewContent {
	padding: 35px 60px;
}

/*모임div 정보 css*/
.clubInfoBox {
	display: flex;
	/* border: 2px solid #eee; */
	margin: 30px 0px 30px 0px;
	box-shadow: 0.5px 0.5px 0.5px 0.5px #8299d841;
	 padding-top: 20px;
     width: 69%;
     height: 150px;
     border: 2px solid #eee;
}

.createClubPic {
	width: 170px;
	height: 120px;
	/* border-radius: 50%;  테두리 뭐가 더 나은지 여쭤보기*/
	border-radius: 5px 5px 5px 5px;
	margin: -7px 30px 20px 30px;
	box-shadow: 1px 1px 1px #8299d879;
}

.clubTitle {
	width: 600px;
	margin: 12px 25px 12px 25px;
	text-align: left;

}
/*별점 css*/
        /* rating */
.rating-group {
   display: inline-flex;
}

.rating__icon {
   pointer-events: none;
}

.rating__input {
   position: absolute !important;
   left: -9999px !important;
}

.rating__label {
   cursor: pointer;
   padding: 0 0.1em;
   font-size: 2rem;
}

.rating__icon--star {
   color: #57B9F0;
}

.rating__icon--none {
   color: #eee;
}

.rating__input:checked ~ .rating__label .rating__icon--star {
   color: #ddd;
}

.rating-group:hover .rating__label .rating__icon--star {
   color: #57B9F0;
}

.rating__input:hover ~ .rating__label .rating__icon--star {
   color: #ddd;
}

.rating-group:hover .rating__input--none:not(:hover ) +.rating__label .rating__icon--none
   {
   color: #eee;
}
/*p 태그 서식 */
.question {
	font-size: 18px;
	font-weight: 500;
}

#addBtn {
	padding: 10px 20px;
	color: #999;
	/* background-color: #fdfdfd; */
	border: 0;
	cursor: pointer;
	border-radius: 5px;
	float: right;
	margin-top: 3%;
	position:absolute;
    margin-top: 50px;
    margin-right: 820px;
}
#backBtn{
	padding: 10px 20px;
	color: #999;
	/* background-color: #fdfdfd; */
	border: 0;
	cursor: pointer;
	border-radius: 5px;
	/* float: right; */
	margin-top: 50px;
    margin-left: 10%;
	position:relative;
	padding: 10px 20px;
	background-color : #eee;
	text-decoration:none;
	
	
}
.pTag{
	line-height :2px;
}
</style>
<script src="https://kit.fontawesome.com/415f6f6023.js" crossorigin="anonymous">
</script>

</head>
<body>
	<div class="createContainer">
		<div class="reviewContent">
			<h1>리뷰를 남겨보세요!</h1>
			<div class="clubInfoBox">
			<img class="createClubPic" src="${path}/resources${selectClub.clubMain_pic}"
     								 onerror="this.onerror=null; this.src='${path}/resources/img/goal.PNG'" />
		                    
				<div class="clubTitle">
					<h4 title="모임타이틀">${selectClub.clubName }</h4>
					<fmt:formatDate value="${selectClub.clubStartDate}"
						var="startDateFmt" pattern="yyyy-MM-dd hh:mm" />
					<fmt:formatDate value="${selectClub.clubEndDate}" var="endDateFmt"
						pattern="yyyy-MM-dd hh:mm" />
					<p>📆모임기간 :</p>
					<p class="pTag">${startDateFmt} ~ ${endDateFmt}</p>
				</div>
			</div>
			<form action="writeReview" method="get">
           		 <div class="rating-group">
	               <label aria-label="1 star" class="rating__label" for="rating-1"><i class="rating__icon rating__icon--star fa fa-star"></i></label> 
	                  <input class="rating__input" name="reviewRate" id="rating-1" value="1" type="radio">
	                      <label aria-label="2 stars" class="rating__label" for="rating-2">
	                         <i class="rating__icon rating__icon--star fa fa-star"></i>
	                      </label> 
	                  <input class="rating__input" name="reviewRate" id="rating-2" value="2" type="radio">
	                      <label aria-label="3 stars"  class="rating__label" for="rating-3">
	                         <i class="rating__icon rating__icon--star fa fa-star"></i>
	                     </label> 
	                  <input class="rating__input" name="reviewRate" id="rating-3" value="3" type="radio" checked> 
	                     <label aria-label="4 stars"  class="rating__label" for="rating-4">
	                        <i class="rating__icon rating__icon--star fa fa-star"></i>
	                     </label> 
	                  <input class="rating__input" name="reviewRate" id="rating-4" value="4" type="radio"> 
	                     <label aria-label="5 stars" class="rating__label" for="rating-5">
	                        <i class="rating__icon rating__icon--star fa fa-star"></i>
	                     </label> 
                  	  <input  class="rating__input" name="reviewRate" id="rating-5" value="5"  type="radio">
          		  </div>
				<div>
					<p class="question">어떤 점이 좋으셨나요?</p>
					<input type="hidden" name="clubNum" value="${selectClub.clubNum}"/>
					<input type="hidden" name="memberNum" value="${selectMember}"/>
					<textarea name="reviewContent" cols="69" rows="9"
						style="resize: none; font-size: 20px;"
						placeholder=" 100자 이내로 작성해주세요." maxlength="100"></textarea>
					<br> <input type="submit" id="addBtn" value="등록하기" >
						 <input type="button" id="backBtn" value="뒤로가기" >
					<!-- <a href="getReviewList" id="backBtn" onclick="return confirm('리뷰가 저장되지 않습니다. 페이지를 나가시겠습니까?')==true;">뒤로가기</a> -->
				</div>
			</form>

		</div>
	</div>
	<script type="text/javascript"
	src="${path}/resources/js/jquery-1.12.4.min.js"></script>
	<script>
	$(document).ready(function(){ 
		$('#backBtn').click(function() { 
			var result = confirm('리뷰가 저장되지 않습니다. 페이지를 나가시겠습니까?'); 
			if(result) { //yes 
				location.replace('getReviewList'); } 
			else { //no 
				
			} }); });

	</script>
	
</body>
</html>

