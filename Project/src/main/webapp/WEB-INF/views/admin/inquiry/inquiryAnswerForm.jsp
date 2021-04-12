<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>문의 답변하기</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.js"></script>

<style>
body {
	font-family: 'NanumSquare', sans-serif;
}

header {
	height: 50px;
	margin-bottom: 20px;
}

.inquiry-wrap {
	width: 710px;
	display: flex;
	flex-direction: column;
	margin: 0 auto;
}

.inquiry-category {
	width: 200px;
	margin-bottom: 20px;
}

#answer-title {
	width: 710px;
	margin-bottom: 10px;
}

textarea {
	width: 710px;
	height: 400px;
	resize: none;
	margin-bottom: 10px;
	border: 1px solid #dddddd;
	white-space:pre;
}

#answerBtn {
	width: 710px;
	height: 50px;
	border: 0;
	outline: 0;
	color: white;
	background-color: #001eff;
	margin-top: 30px;
}
.submit a {
float:right;
}
</style>
</head>
<body>
	<form action="answerInquiry" method="post"> 
		<div class="inquiry-wrap">
			<h1>1:1 답변하기</h1>
			<hr>
			<div class="inquiry-category">
				<label for="exampleFormControlSelect2">카테고리 선택</label>
				<select	name="inquiryType" id="id_select" class="form-control">
					<option value="회원문의" <c:if test="${answerInquiryForm.inquiryType == '회원문의'}">selected</c:if>>회원문의</option>
					<option value="모임문의" <c:if test="${answerInquiryForm.inquiryType == '모임문의'}">selected</c:if>>모임문의</option>
					<option value="결제문의" <c:if test="${answerInquiryForm.inquiryType == '결제문의'}">selected</c:if>>결제문의</option>
					<option value="기타문의" <c:if test="${answerInquiryForm.inquiryType == '기타문의'}">selected</c:if>>기타문의</option>
				</select>
			</div>
			
			<input type="text" class="form-control" id="answer-title" value="[RE]: 문의 답변입니다." readonly>
				
			<textarea name="inquiryAnswer" placeholder="[문의 내용]${answerInquiryForm.inquiryContent}"></textarea>		
			
			<%-- <input type="hidden" value="${answerInquiryForm.inquiryAnswer}" name="inquiryAnswer"> --%>
			<input type="hidden" value="${answerInquiryForm.inquiryNum}" name="inquiryNum">
			<!--  회원번호 진경 알림에게 넘겨주기  -->
			<button type="submit" class="btn btn-primary" id="answerBtn">답변 등록</button>
			<div class="submit"><a href="adminInquiry">글 목록 가기</a></div>
		<hr></div>
	</form> 
	</div>
<script>




		$(document).ready(function(){
			connect();

			$("#answerBtn").on("click", function(){
				alert("답변이 정상적으로 등록 되었습니다");
			
			// 문의글 작성자 번호 
			let mNum = '${answerInquiryForm.memberNum}'; 
			let inqNum = '${answerInquiryForm.inquiryNum}'; 
			console.log(mNum);
			console.log(inqNum);
			
			let notMessage ="회원님의 문의글에 <b>관리자</b>님이 답변을 등록했어요!";
			let notType= "문의";
			let notUrl = "${path}/getAdminInquiry?inquiryNum=" + inqNum;	
				  $.ajax({
				        
						type: "post",
						url: "insertCommNoti",
						data: {
							// 알림이 갈 대상 
							memberNum:mNum,
							inquiryNum:inqNum,					
							notType:notType,
							notMessage: notMessage,
							// 알림을 눌렀을 때 이동할 페이지 
							notUrl:notUrl	
						
						},
			            success: function (data) {
			            	// 서버로 알림 메시지 전송 
			            	sock.send(notType + "," + mNum + "," + notMessage + "," + notUrl);
			            	console.log("알림 보내기 성공");
			            	
			            },
			            error: function(e) {
				        	  alert("알림 저장 오류" + e);
				        }
			        }); 
			
			});
			
		});
		
		
		let sock;
		function connect(){
			sock = new SockJS("http://localhost:9999/plus/echo");
			sock.onopen = onopen;
			console.log("세션 생성");
		}

		function onopen() {
		    console.log('info: connection opened');
		   }
		 

		
		
</script>
</body>
</html>
