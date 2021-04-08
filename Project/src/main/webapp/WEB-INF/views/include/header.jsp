<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <!-- css코드삽입 -->
      <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/header.css">
   <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 
    <script type="text/javascript" src="${path}/resources/js/jquery-1.12.4.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <!--  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
    <!-- 웹소켓 import -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.js"></script>
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
    	
    	
     //	알림 벨 클릭시 
/*      function getContent(){
     	$.ajax({
			type: "post",
			url: "getNtf", 
			data: {
			},
		     success: function (data) {
	            	console.log(data);
			           	if(data){
			           		console.log("알림 가져오기")
			           	},
	            error: function() {
	            	  alert("메시지 저장 error");
	            	}
        });
    	 
     } */
    
     
    </script>
</head>

<body>
    <!-- 사실상 헤더가 없어요  -->
  
    <!-- 본문 너비 정하는 용으로 wrapper 아이디 설정 -->
        <!-- navi bar가 사실상 저희 헤더입니다 -->
        <nav>
            <ul class="menu-left">
                <li id="logo_a"><a href="main"><img id="logo_img" src="${path}/resources/img/images/logo.png"></a></li>
                <li class="hovereffect nav-left"><a href="main">HOME</a></li>
                <li class="hovereffect nav-left"><a href="normal">가치더하기</a></li>
                  <li class="hovereffect nav-left" id="expert"><a href="expert">도움더하기</a></li>
 
 <!-- 로그인정보 없을 때는 로그인버튼 보이게 , 로그인 후에는 채팅, 알람, 드롭다운 버튼 보이게 했습니다   -->
           <c:choose>
            <c:when test = "${user.memberEmail != null }"> <!-- 로그인 정보가 있으면 -->
                <li class="nav-right btncolor">
                    <div class="dropdown">
                        <button class="btn dropdown-toggle" type="button" data-toggle="dropdown" id="btncolor"><b>${user.memberNickname }</b>님, 환영합니다 <span class="dropT">▼</span>
                        </button>
                        <ul class="dropdown-menu">
                        <form>
	                        <c:choose>
				                <c:when test = "${user.memberNum == 1 }">
	                        <li class="dropli"><a href="memberListPage">회원관리</a></li>
				               </c:when>
				               <c:otherwise>
	                        <li class="dropli"><a href="memberUpdate?memberNum=${user.memberNum }">My Page</a></li>
				               </c:otherwise>
			               </c:choose>
                        </form>
                      <form action="logout" method="get">
                      <!--  onclick="kakaoLogout()" -->
                        <li class="dropli api-btn"><a href="logout">LogOut</a></li>
                      </form>
                        </ul>
                    </div>
                </li>
              	 <li class="nav-right icon"><a href="chat?memberNum=${user.memberNum}" target="_blank"><img src="${path}/resources/img/images/chat.png" class="icons"></a></li>
                <li class="nav-right icon"><a href="getNoti?mNum=${user.memberNum}" target="_blank"><img src="${path}/resources/img/images/bell1.png" class="icons" id="bell" ></a></li>
             </c:when>
             <c:otherwise><!-- 로그인 정보가 없으면  -->
                <li class="nav-right nav-left hovereffect login" id="login"><a href="login">로그인</a></li>
             </c:otherwise>
          </c:choose>
            </ul>    
        </nav>
        <div class="myToast">

        </div>
</body>

<script>

// location으로 페이지 이동 
 
	
$(function(){
	// 세션 연결 
	connect();
	$(document).on('click','#bell',function(){
		$('#bell').attr('src','${path}/resources/img/images/bell1.png');
	});
	
	
}); // function 끝 


let sock;
function connect(){
	sock = new SockJS("http://localhost:9999/plus/echo");
	sock.onopen = onopen;
	sock.onmessage = onMessage;
	console.log("세션 생성");
}

function onopen() {
    console.log('info: connection opened');
   }
 
function onMessage(msg) {
	console.log(msg.data);
	$('#bell').attr('src','${path}/resources/img/images/bell-ring.png');
	
	if($('.toast')){
		$('.toast').remove();
	}
		 let toast = '<div class="toast" role="alert" aria-live="assertive" aria-atomic="true"><div class="toast-header">';
		 toast += '<img src="${path}/resources/img/images/bell.png" class="rounded mr-2" alt="..." id="toastImg">';
		 toast += '<strong class="mr-auto">더하기 알림</strong><small>just now</small>';
		 toast += '<button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">';
		 toast += '<span aria-hidden="true">&times;</span></button> </div>';
		 toast += '<div class="toast-body">'+ msg.data +'</div></div>';
		 $('.myToast').append(toast);
		 $(".toast").toast({"animation": true, "autohide": false});
		 $('.toast').toast('show');  
}





</script>
</html>