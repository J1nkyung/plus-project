<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!-- css코드삽입 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/header.css">
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/jquery-1.12.4.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script>
        		/*
        $(document).ready(
        		function () {
            $('.hovereffect').on("click", function () {
                if ($("ul.menu-left li.hovereffect").hasClass("li-selected")) {
                    $("ul.menu-left li.hovereffect").removeClass("li-selected"); 
                }
                $(this).addClass("li-selected");
            }); 
        });
            */
        
        window.onload = function(){
			selectHeader();
        }
        
    	function selectHeader(){ 
    		// 지금 접속해있는 주소 얻어서 now에 넣어줌
    		var now = window.location.href;
    		// className이 ()인 값을 header에 넣어줌
   			var header = document.getElementsByClassName("hovereffect nav-left");
    		// 주소에 포함되어야 하는 단어 배열로 선언
   			var arr = ["main", "normal", "expert"];
    		
    		//로그인페이지는 class명이 달라서 따로 효과를 주고
   			if(now.includes("login")){
   				var login = document.getElementById("login");
   				login.setAttribute("class", "nav-right nav-left hovereffect login li-selected");
    	
   			}else{
    		//기본 li 요소는 for문으로 돌려서 각 단어가 포함된 페이지의 해당 요소에 li-selected 클래스를 추가해준다 
   			for (var i = 0; i < arr.length; i++) {
   				if(now.includes(arr[i])){
				header[i].setAttribute("class", "li-selected");
   				}
			}
   			}
/*    			 if(now.includes("main")){
   				header[0].setAttribute("class", "li-selected");
   			}else if(now.includes("normal")){
   				header[1].setAttribute("class", "li-selected");
   			}else if(now.includes("expert")){
    			header[2].setAttribute("class", "li-selected");
    		} */ 
    		
   		
    	}
    </script>
</head>

<body>
    <!-- 사실상 헤더가 없어요  -->
  
    <!-- 본문 너비 정하는 용으로 wrapper 아이디 설정 -->

        <!-- navi bar가 사실상 저희 헤더입니다 -->
        <nav>
            <ul class="menu-left">
                <li id="logo_a"><a href="main.do"><img id="logo_img" src="${path}/resources/img/images/logo.png"></a></li>
                <li class="hovereffect nav-left"><a href="main.do">HOME</a></li>
                <li class="hovereffect nav-left"><a href="normal.do">가치더하기</a></li>
                  <li class="hovereffect nav-left" id="expert"><a href="expert.do">도움더하기</a></li>
 
 
 <!-- 로그인정보 없을 때는 로그인버튼 보이게 , 로그인 후에는 채팅, 알람, 드롭다운 버튼 보이게 했습니다   -->
           <c:choose>
            <c:when test = "${user.memberEmail != null }"> <!-- 로그인 정보가 있으면 -->
                <li class="nav-right btncolor">
                    <div class="dropdown">
                        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" id="btncolor"><b>${user.memberNickname }</b>님, 환영합니다
                        <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                        <form>
	                        <c:choose>
				                <c:when test = "${user.memberNum == 1 }">
	                        <li class="dropli"><a href="memberListPage">회원관리</a></li>
	                        <li class="dropli"><a href="adminInquiry">관리자</a></li>
				               </c:when>
				               <c:otherwise>
	                        <li class="dropli"><a href="memberUpdate?memberNum=${user.memberNum }">My Page</a></li>
	                        <li class="dropli"><a href="inquiry?memberNum=${user.memberNum}">나의1:1문의(임시)</a>
				               </c:otherwise>
			               </c:choose>
                        </form>
                      <form action="logout.do" method="get">
                      <!--  onclick="kakaoLogout()" -->
                        <li class="dropli api-btn"><a href="logout.do">LogOut</a></li>
                      </form>
                        </ul>
                    </div>
                </li>
              	 <li class="nav-right icon"><a href="chat.do?memberNum=${user.memberNum}" target="_blank"><img src="${path}/resources/img/images/chat.png" id="icon"></a></li>
                <li class="nav-right icon"><a href="#"><img src="${path}/resources/img/images/bell1.png" id="icon"></a></li>
             </c:when>
             <c:otherwise><!-- 로그인 정보가 없으면  -->
                <li class="nav-right nav-left hovereffect login" id="login"><a href="login.do">로그인</a></li>
             
             </c:otherwise>
          </c:choose>
            </ul>          
        </nav>
</body>

</html>