<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"></tiles:getAsString></title>
<!-- <link href="/css/mypage/layout.css" type="text/css" rel="stylesheet">  -->
</head>
<body>
	<!--  header 부분 -->
	<tiles:insertAttribute name="header" />
	
	<!--  aside 부분 -->
	<tiles:insertAttribute name="aside"/>
	
	<!--  footer 부분 -->
	<tiles:insertAttribute name="footer"/>
</body>
</html>