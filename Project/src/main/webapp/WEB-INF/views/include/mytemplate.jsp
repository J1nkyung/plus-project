<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--  공통으로 import하는 소스들  -->
   <!--  <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
    <!-- <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>  -->

</head>
   <tiles:insertAttribute name="header" />
   <tiles:insertAttribute name="aside" />
   <tiles:insertAttribute name="body"/>
   <tiles:insertAttribute name="footer"/> 
</html>