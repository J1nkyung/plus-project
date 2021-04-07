<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- Required meta tags -->
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 
     <!-- Bootstrap CSS -->
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/admin-aside.css">

    <!-- themify icon -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/icon/themify-icons/themify-icons.css">
    <!-- fontawesome CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
  
<title>Plus! Admin</title>
</head>
<body>
  <!-- navbar -->
    <nav class="navbar navbar-expand-md navbar-light">
        <button class="navbar-toggler ml-auto mb-2 bg-light" type="button" data-toggle="collapse" data-target="#sidebar">
            <span class="navbar-toggle-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="sidebar">
            <div class="container-fluid">
                <div class="row">
                    <!-- sidebar -->
                    <div class="col-lg-3 sidebar fixed-top">
                     <a href="#" class="navbar-brand text-white text-center d-block mx-auto py-3 mb-4">ADMIN PAGE</a>
                     <div class="bottom-border pb-3">
                         <img class="rounded-circle mr-3" src="../../../../resources/img/admin.jpg" alt="" width="200px" height="200px">
                         <div class="user-name">Admin</a>
                     </div>
                     <ul class="navbar-nav flex-column mt-4">
                        <!-- 회원 관리 -->
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white p-3 mb-2 sidebar-link current">
                                <i class="fas fa-users-cog text-white fa-lg mr-3"></i>회원 관리
                            </a>
                        </li>
                        <!-- 모임 관리 -->
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white p-3 mb-2 sidebar-link">
                                <i class="fas fa-plus text-white fa-lg mr-3"></i>모임 관리
                            </a>
                        </li>
                       
                        <!-- 문의 관리 -->
                        <li class="nav-item">
                            <a href="adminInquiry.do" class="nav-link text-white p-3 mb-2 sidebar-link">
                                <i class="fas fa-question-circle text-white fa-lg mr-3"></i>문의 관리
                            </a>
                        </li>
                        <!-- 결제내역 관리 -->
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white p-3 mb-2 sidebar-link">
                                <i class="fas fa-coins text-white fa-lg mr-3"></i>결제내역 관리
                            </a>
                        </li>
                        
                        


                     </ul>

                    </div> 
                    <!-- end of sidebar -->
                    

                </div>
            </div>
        </div>
        
        
    </nav>
   


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   <!--  <script src="js/script.js"></script> -->


</body>
</html>