<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page import="com.project.plus.domain.InquiryVO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 
     <!-- Bootstrap CSS -->
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/mypage-aside.css">

    <!-- themify icon -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/icon/themify-icons/themify-icons.css">
    <!-- fontawesome CSS -->
  <!--   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous"> -->
        <!--하이퍼링크 스타일 서식 바꾸기-->

    <style>
      .review_herf a{
        text-decoration: none; 
      }
      .myPageSideBar{
          width: 25%;
          background-color:;
          
      }
      </style>
<title>Plus! My page</title>
</head>
<body>
      <div>
        <div class="myPageSideBar">
            <img src="images/송강.PNG" style="border:red 1px solid;width: 220px; height: 220px; border-radius: 50%;">
            <h3>pearjin<img src="images/settingImg.png" style=" width: 20px; height: 20px;"></h3>
            <h4>pearjin@15@gmail.com</h4>
            <br><br><br>
            <table>
                <thead>
                    <tr>
                        <th><class="review_herf"><a href="getCurrentClubList"> 마이페이지</a></th>
                    </tr>
                    <tr>
                        <th><class="review_herf" ><a href="getHeartList"> 찜하기</a></th>
                    </tr>
                    <tr>
                        <th><class="review_herf" ><a href="getClubDate"> 캘린더</a></th>
                    </tr>
                    <tr>
                        <th><class="review_herf" ><a href="getPaymentList"> 포인트</a></th>
                    </tr>
                    <tr>
                        <th><class="review_herf" ><a href="getReviewList"> 리뷰작성</a></th>
                    </tr>
                    <tr>
                        <th><class="review_herf"><a href="inquiry"> 1:1 문의</a></th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
</body>
</html>