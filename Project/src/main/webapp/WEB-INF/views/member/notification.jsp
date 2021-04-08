<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PLUS! 알림</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <!------ Include the above in your HEAD tag ---------->
    
    <style>
        .notice {
            padding: 15px;
            background-color: #fafafa;
            margin-bottom: 10px;
            -webkit-box-shadow: 0 5px 8px -6px rgba(0,0,0,.2);
               -moz-box-shadow: 0 5px 8px -6px rgba(0,0,0,.2);
                    box-shadow: 0 5px 8px -6px rgba(0,0,0,.2);
        }
        .notice-sm {
            padding: 10px;
            font-size: 80%;
        }
        .notice-lg {
            padding: 35px;
            font-size: large;
        }
        
        /* Primary */
        .notice-primary {
            border-left: 6px solid #cce5ff !important;
        }
        .notice-primary>strong {
            color: #004085;
        }
        /* Secondary */
        .notice-secondary {
            border-left: 6px solid #e2e3e5 !important;
        }
        .notice-secondary>strong {
            color: #383d41;
        }
        /* Success */
        .notice-success {
            border-left: 6px solid #d4edda !important;
        }
        .notice-success>strong {
            color: #155724;
        }
        /* Information */
        .notice-info {
            border-left: 6px solid #d1ecf1 !important;
            margin-top:20px;
        }
        .notice-info>strong {
            color: #0c5460;
        }
        /* Warning */
        .notice-warning {
            border-left: 6px solid #fff3cd !important;
        }
        .notice-warning>strong {
            color: #856404;
        }
        /* Danger */
        .notice-danger {
            border-left: 6px solid #f8d7da !important;
        }
        .notice-danger>strong {
            color: #721c24;
        }

        .not-read-wrap {
            margin-bottom: 100px;
        }
        
        h3{
        	margin-top: 50px;
        	color:#dddddd;
        }
        </style>
</head>
<body>
    <div class="container"> 
        <div class="row justify-content-center">
            <div class="col-sm-8">
                <!--notification 카드, c:if로 데이터가 존재하면 출력 -->
                    <h2>새 알림이 왔어요!</h2>
                <div class="not-read-wrap">
                    <c:forEach items="${unreadList}" var="unread">
	                    <div class="notice notice-primary alert fade show">
	                       <input type="hidden" value="${unread.notId}" id="notId"/>
	                        <button type="button" class="close">
	                            <span>×</span>
	                        </button>
	            		      <b>[${unread.notType}알림]</b>
	                        <div class="content"><a target="_blank" href="${unread.notUrl}" class="url">${unread.notMessage}</a></div>
	                    </div>
                    </c:forEach>
	                    <c:if test="${empty unreadList }">
	                    	<h3>새로운 알림이 없습니다</h3>
	                    </c:if>
                </div>
            <!-- 읽은 알림 시작 -->
	          	  <h2>읽은 알림</h2>
	            <div class="read-wrap">
	                   <c:forEach items="${readList}" var="read">
		                    <div class="notice notice-primary alert fade show">
		                    <input type="hidden" value="${read.notId}" id="notId"/>
		                        <button type="button" class="close">
		                            <span>×</span>
		                        </button>
		            		      <b>[${read.notType}알림]</b>
		                        <div class="content"><a target="_blank" href="${read.notUrl}">${read.notMessage}</a></div>
		                    </div>
                   	 </c:forEach>
	              		 <c:if test="${empty readList}">
	              		 	<h3>읽은 알림이 없습니다</h3>
	              		 </c:if>
	                </div>
	             </div>
            </div>
        </div>
</body>
<script>
$(function(){
	$(document).on('click','.close',function(){
		 let $target = $(event.target);
		 let notId= $target.parent().siblings('#notId').val();
		 console.log(notId);
		 $target.parent().parent().remove();
		
		 
		 // 새로운 알림에 알림이 없으면 
	/* 	 if(!$(".not-read-wrap").hasClass(".notice")){
			 console.log($(".not-read-wrap").hasClass(".notice"));
			 $(".not-read-wrap").append("<h3>새로운 알림이 없습니다</h3>");
		 }
		 
		 if(!$(".read-wrap").hasClass(".notice")){
			 $(".read-wrap").append("<h3>읽은 알림이 없습니다</h3>");
		 } */
		 
			$.ajax({
				type: "post",
				url: "deleteNoti",
				data: {
					notId:notId
				},
		    	 success: function (data) {
		     		if(data==1){
		     			console.log("알림 삭제 성공");
		     			
		     		}
		    	 },
		    	 error: function(e) {
		        	  alert("알림 삭제 오류" + e);
		        }
		}); 
		
	});
	
	// 안읽은 알림 링크 클릭 시 
	$(document).on('click','.url',function(){
		let unreadEle = $('.notice').has(this);
		let readEle = $('.read-wrap').children().first();
		console.log(readEle)
		let input = unreadEle.find('input[type=hidden]');
		let notId = input.val();
    	
    	readEle.before(unreadEle);
    /* 	
    	 if($(".read-wrap").hasClass(".notice")){
			 $(".read-wrap h3").remove();
		 }
   	 */
		$.ajax({
			type: "post",
			url: "updateStatus",
			data: {
				notId:notId
			},
	    	 success: function (data) {
	     		if(data==1){
	     			console.log("읽은 알림으로 상태 변경 성공");
	     			
	     		}
	    	 },
	    	 error: function(e) {
	        	  alert("알림 변경 오류" + e);
	        }
		});   
	})

	
})

</script>
</html>