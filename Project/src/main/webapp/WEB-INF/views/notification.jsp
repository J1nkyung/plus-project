<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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

        .read-wrap {
            margin-bottom: 100px;
        }
        </style>
</head>
<body>
    <div class="container"> 
        <div class="row justify-content-center">
            <div class="col-sm-8">
                <!--notification 카드, c:if로 데이터가 존재하면 출력 -->
                <div class="read-wrap">
                    <h1>새 알림이 왔어요!</h1><br>
                    <div class="notice notice-primary alert fade show">
                        <button type="button" class="close">
                            <span>×</span>
                        </button>
                    
                        <strong>Here's a little information:</strong>
                        <br>
                        <div class="content">Some message here!</div>
                    </div>
                </div>
            
        
            <!-- 읽은 알림 시작 -->
	            <div class="not-read-wrap">
	          	  <h1>읽지 않은 알림이 있어요!</h1><br>
	                <div class="notice notice-primary alert fade show">
	                    <button type="button" class="close">
	                        <span>×</span>
	                    </button>
	                
	                    <strong>Here's a little information:</strong>
	                    <br>
	                    <div class="content">Some message here!</div>
	                </div>
	             </div>
            </div>
        </div>
    </div>
</body>
<script>


</script>
</html>