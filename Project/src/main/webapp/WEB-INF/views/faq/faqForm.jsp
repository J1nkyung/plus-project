<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 등록</title>

<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

<style>
body {
	font-family: 'NanumSquare', sans-serif;
	margin-left:40px;
}
</style>
</head>
<body>

	<div id="wrap">
		<section id="container">
			<div class="section_in">
				<form>
					<h2>FAQ 등록</h2>
					<hr>
					<fieldset class="formContent">
						<div class="category">
							<label for="exampleFormControlSelect2">카테고리 선택</label> <select
								class="form-control" name="faqCategory" style="width:200px;">
								<option value="회원관련">회원관련</option>
								<option value="모임관련">모임관련</option>
								<option value="결제문의">결제문의</option>
								<option value="기타문의">기타문의</option>
							</select>
						</div>
						<div class="faq-title">
						<label for="title">자주묻는질문 제목</label> <input type="text"
							style="width: 600px; height: 25px;" class="form-control"
							id="announce-title" name="announceTitle">
						</div>
						<div class="faq-content">
							<label for="faq-content-label">내용</label><br />
							<textarea name="faqtext" cols="100" rows="20"></textarea>
						</div>
					</fieldset>
					<hr>

					<div class="btn_faq">
						<input type="submit" value="등록하기" class="btn_faq2">
					</div>
				</form>

			</div>
		</section>
	</div>

	<hr>
	<a id="submit" href="faq.do">글 목록 가기</a>


</body>
</html>













