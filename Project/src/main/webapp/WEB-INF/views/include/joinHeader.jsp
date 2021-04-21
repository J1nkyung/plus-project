<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>회원가입</title>
    <!-- css코드삽입 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/header.css">
    <style>

    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>


    <script type="text/javascript" src="${path}/resources/js/jquery-1.12.4.min.js"></script>
    <script>
        $(document).ready(function () {

            $('.hovereffect').on("click", function () {

                if ($("ul.menu-left li.hovereffect").hasClass("li-selected")) {
                    $("ul.menu-left li.hovereffect").removeClass("li-selected");
                }

                $(this).addClass("li-selected");

            });

        });


        //로그인 정보 받아오는 함수 같긴 한데 .. 
        Kakao.init("9ce759cfc8b480d36084d93d5b5d195f")

        Kakao.Auth.login({
            url:'v2/user/me',
            success: function(res){
                console.log(res);
                
                var nickname = res.properties.nickname;
                var email = res.kakao_acount.email;
                var html = '<BR>' + nickname + '<BR>' + email;

            $('body').append(html);

                 
            }

        })


        //카카오 로그아웃시키는 함수 ... ? 
        function kakaoLogout() {
    if (!Kakao.Auth.getAccessToken()) {
      alert('Not logged in.')
      return
    }
    Kakao.Auth.logout(function() {
      alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken())
    })
  }




    </script>
</head>

<body>
    <header></header>
    <div id="wrapper">
        <nav>
            <ul class="menu-left">
                <li id="logo_a"><a href="main.do"><img id="logo_img" src="${path}/resources/img/images/logo.png"></a></li>
                <li class="hovereffect nav-left"><a href="#">HOME</a></li>
                <li class="hovereffect nav-left"><a href="#">가치더하기</a></li>
                <li class="hovereffect nav-left"><a href="#">도움더하기</a></li>
 
                <li class="nav-right btncolor">
                    <div class="dropdown">
                        <button class="btn btn-primary dropdown-toggle joinbar" type="button" data-toggle="dropdown" id="btncolor">회원가입
                        </button>
                        <ul class="dropdown-menu">
                        <li class="dropli"><a href="#"></a></li>
                        <li class="dropli api-btn" onclick="kakaoLogout()"><a href="#"></a></li>
                        </ul>
                    </div>
                </li>
            </ul>          
        </nav>


    </div> <!-- id="wrapper" -->

</body>

</html>