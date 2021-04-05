<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ 등록</title>

<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

<style>
body {
	font-family: 'NanumSquare', sans-serif;
	margin-left:40px;
}
.faq-wrap {
	width:750px;
	display:flex;
	flex-direction:column;
	margin:0 auto;
}
#faq-title {
	width: 710px;
	margin-bottom: 10px;
}

textarea {
	width: 710px;
	height: 400px;
	resize: none;
	margin-bottom: 10px;
	border: 1px solid #dddddd;
}

#faqBtn {
	width: 710px;
	height: 50px;
	border: 0;
	outline: 0;
	color: white;
	background-color: #001eff;
	margin-top: 30px;
}

.back-to-list {
	margin-top: 30px;
}
</style>
</head>
<body>	
<!-- 	<div id="wrap">
		<section id="container"> -->
			<!-- <div class="section_in"> -->
				<form action="insertFaq" method="post">
				<div class="faq-wrap">
					<h2>FAQ 등록</h2>
					<hr>
					<!-- <fieldset class="formContent"> -->
					<div class="category">
							<label for="exampleFormControlSelect2">카테고리 선택</label>
							<select
								class="form-control" name="faqCategory" style="width:200px;">
								<option value="회원관련">회원관련</option>
								<option value="모임관련">모임관련</option>
								<option value="결제문의">결제문의</option>
								<option value="기타문의">기타문의</option>
							</select>
						</div>
						<!-- <div class="faq-title">
						<label for="title">자주묻는질문 제목</label> -->
						<input type="text" style="width: 600px; height: 25px;" class="form-control" name="faqTitle" placeholder="제목을 입력하세요">
						<!-- </div> -->
						<!-- <div class="faq-content"> -->
							<!-- <label for="faq-content-label">내용</label><br /> -->
							<textarea cols="100" rows="20" name="faqContent" style="white-space:pre-line;"></textarea>
						<!-- </div> -->
					<!-- </fieldset> -->
					<hr>

					<!-- <div class="btn_faq">
						<input type="submit" value="등록하기" class="btn_faq2">
					</div> -->
			
					<button type="submit" id="faqBtn">등록하기</button> <!-- 둘 중 하나 선택 -->
	<a class="back-to-list" href="faq">글 목록 가기</a><br/>
				</form>

			<!-- </div> -->
<!-- 		</section>
	</div> -->



</body>
</html>













