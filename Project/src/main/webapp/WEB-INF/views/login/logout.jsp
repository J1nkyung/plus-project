<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>

   
</head>
<body>
 <script type="text/javascript" src="${path}resources/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			alert("로그아웃 되었습니다.");
		location.href = "main.do" ;
		

        //뒤로가기 막는 자바스크립트
		function noBack() {
			window.history.forward();
		}
		
		});
		
	       
	       

	</script>
	<%
		session.invalidate();
	%>


</body>
</html>