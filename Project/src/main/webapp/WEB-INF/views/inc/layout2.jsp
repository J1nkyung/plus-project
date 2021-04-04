<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"></tiles:getAsString></title>

</head>
<body>
	<!--  header 부분 -->
	<tiles:insertAttribute name="header" />
	
	<!--  body 부분 -->
	<tiles:insertAttribute name="body"/>
	
	<!--  footer 부분 -->
	<tiles:insertAttribute name="footer"/>
</body>
</html>