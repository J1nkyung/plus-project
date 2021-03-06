<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>회원정보수정</title>
    <link rel="stylesheet" href="${path}/resources/css/memberUpdate.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
	<script type="text/javascript" src="${path}/resources/js/jquery-1.12.4.min.js"></script>
<script>

function setThumbnail(event){
		var reader = new FileReader();
		reader.onload = function(event){
			var target = document.querySelector("div#image_container");
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
                        target.innerHTML = '';
			target.append(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}
	
//휴대폰번호 유효성, 중복검사
  isMobile = function(){
        var phoneVal = $("#mobile").val();
        /*  var regExp = /^\d{11}$/;*/
      	var regExp = /^\d{3}-\d{3,4}-\d{4}$/; 
        if(phoneVal.match(regExp) != null){
          // alert('형식에 맞는 번호입니다')
           
         //  $('#chkMobile').on("click", function(){
        	   var memberPhone = $('#mobile').val();
        	   var data = {memberPhone : memberPhone}
        	   
        	   $.ajax({
        		   type: "post",
        		   url : "memberPhoneCheck",
        		   data : data,
        		   success : function(result){
        			   console.log("성공 여부"+result);
        		 	if(result !='fail'){
        		 		alert("사용 가능한 휴대폰번호입니다.")
        		 	}else{
        		 		alert("이미 등록된 휴대폰번호입니다. 다시 한 번 확인해주세요.")
        		 	}
        		   
        		   }//success종료
        	   }); //ajax종료
          // })
        }else{
            alert("입력 형식에 맞지 않습니다. '010-0000-0000'의 형태로 입력해주세요.")
        }
    }; 

  
//등록한 사진 삭제하는 버튼
removePic = function(){
    $('.removePic').click(function(){
           $("#image_container").empty()
	$("#picFile").val("");
       	$("#oldPic").val("");
       	$("#pic_upload_button").val("");
	}
)}


//닉네임 중복 , 유효성 검사
chNickname = function(){
    for (var i=0; i<$("#nickname").val().length; i++)  { 

	        var chk = $("#nickname").val().substring(i,i+1); 
	
	        if(chk.match(/([^가-힣a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ\x20])/i)){
	        	alert("특수문자는 사용할 수 없습니다");
	            return;
	       	}
		    if ($("#nickname").val().length > 8) {
		    	alert("8자를 초과하였습니다");
		    	return;
		    }
	        if($("#nickname").val() == " "){
	        	alert("공백은 입력할 수 없습니다");
	            return;
	        }
    } 
    
    var memberNickname = $('#nickname').val();
	   var data = {memberNickname : memberNickname}
	   
	   $.ajax({
		   type: "post",
		   url : "memberNickCheck",
		   data : data,
		   success : function(result){
			   console.log("성공 여부"+result);
		 	if(result !='fail'){
		 		alert("사용 가능한 닉네임입니다.")
		 	}else{
		 		alert("이미 등록된 닉네임입니다. 다른 닉네임을 사용해주세요.")
		 	}
		   
		   }//success종료
	   }); //ajax종료
	  //      alert("사용 가능한 닉네임입니다")
}

$(document).ready(function(){
	
	var formObj = $("form[name='updateForm']");
	
	//관리자의 삭제버튼
	$("#btnDel").on("click", function(){
	formObj.attr("action", "memberDelete").submit();
	formObj.attr("method", "post");
	alert("삭제되었습니다");
//	formObj.submit();
	})

	//관리자의 수정버튼 - CSS때문에 분리 
	$("#btnUp").on("click", function(){
		alert("회원정보 수정 완료");
		formObj.attr("action", "memberUpdate").submit();
		formObj.attr("method", "post");
	//	formObj.submit();				
	})
	
	//회원의 수정버튼 
	$("#btnUpMem").on("click", function(){
		formObj.attr("action", "memberUpdate").submit();
		formObj.attr("method", "post");
		alert("회원님의 정보가 수정되었습니다");
//		formObj.submit();				
	})


})

</script>

<!-- 관리자 회원정보 수정시 필요한 코드 -->
<link rel="stylesheet" href="${path}/resources/css/admin-aside.css">
<!-- fontawesome CSS -->
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
   integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu"
   crossorigin="anonymous">

</head>

<body>

<!-- 관리자가 회원정보 수정 할 때 aside 부분 추가 -->
<c:if test="${user.memberNum eq 1}">
<!-- Bootstrap CSS -->
 <link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
   
  <style>
.nav-item {
   font-size: 13px;
   padding: 0px;
   padding-left: 35px;
}

.navbar-light .navbar-nav .nav-link {
   margin: 0;
   padding: 5px;
}

#gomain a {
   color: white;
   font-size: 12px;
   padding-top: 30px;
}

.update_title label{
font-size:14px;
font-weight:700;
} 
</style>
               <!--  사이드 바 추가 -->
               <nav class="navbar navbar-expand-md navbar-light">
                  <div class="col-lg-3 sidebar fixed-top" style="width:300px;">
                     <button class="navbar-toggler ml-auto mb-2 bg-light"
                        type="button" data-toggle="collapse" data-target="#sidebar">
                        <span class="navbar-toggle-icon"></span>
                     </button>
                     <div class="collapse navbar-collapse" id="sidebar">
                        <div class="container-fluid">
                           <div class="row">
                              <!-- sidebar -->
                              <a href="#"
                                 class="navbar-brand text-white text-center d-block mx-auto py-3 mb-4">ADMIN
                                 PAGE</a>
                              <!--  <div class="bottom-border pb-3"> -->
                              <img class="rounded-circle mr-3"
                                 src="${path}/resources/img/admin.jpg" alt="" width="200px"
                                 height="200px">

                           </div>
                           <div class="navcontent">
                              <ul class="navbar-nav flex-column mt-4">

                                 <!-- 회원 관리 -->
                                 <li class="nav-item"><a href="memberListPage"
                                    class="nav-link text-white p-3 mb-2 sidebar-link current"> <i
                                       class="fas fa-users-cog text-white fa-lg mr-3"></i>회원 관리
                                 </a></li>
                                 <!-- 모임 관리 -->
                                 <li class="nav-item"><a href="adminClub"
                                    class="nav-link text-white p-3 mb-2 sidebar-link"> <i
                                       class="fas fa-plus text-white fa-lg mr-3"></i>모임 관리
                                 </a></li>

                                 <!-- 문의 관리 -->
                                 <li class="nav-item"><a href="adminInquiry"
                                    class="nav-link text-white p-3 mb-2 sidebar-link"> <i
                                       class="fas fa-question-circle text-white fa-lg mr-3"></i>문의 관리
                                 </a></li>
                                 <!-- 공지 관리 -->
                                 <li class="nav-item"><a href="announce"
                                    class="nav-link text-white p-3 mb-2 sidebar-link"> <i
                                       class="far fa-flag text-white fa-lg mr-3"></i>공지 관리
                                 </a></li>
                                 <!-- 결제내역 관리 -->
                                 <li class="nav-item"><a href="adminPay"
                                    class="nav-link text-white p-3 mb-2 sidebar-link"> <i
                                       class="fas fa-coins text-white fa-lg mr-3"></i>결제내역 관리
                                 </a></li>
                                 <!-- 관리자 차트 -->
                                 <li class="nav-item"><a href="adminChart"
                                    class="nav-link text-white p-3 mb-2 sidebar-link"> <i
                                       class="fas fa-chart-line text-white fa-lg mr-3"></i>차트 관리
                                 </a></li>
                                 <p id="gomain">
                                    <a href="main"><i class="fas fa-home"></i> 메인으로 가기 </a>
                                 </p>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </div>
               </nav>

</c:if>




    <!-- header -->
    <div id="header">
        <!-- <h1>회원정보수정</h1> -->
        <!-- <img src="../images/logo.png" id="logo"> -->
    </div>

  <form name="updateForm" role="form" enctype="multipart/form-data">

    <!-- wrapper -->
    <div id="wrapper">

<input type="hidden" name="memberNum"  value="${memberInfo.memberNum }"> 
        <!-- content1-->
        <div class="content1">      
                <!-- profile pic -->
            <input type="hidden" name="memberPhoto" id="oldPic" value="${memberInfo.memberPic }"> 

                <div class="pro_pic_area">
                    <div id="image_container"><img src="${path}/resources${memberInfo.memberPic}" onerror="this.style.display='none';"/></div>
                <div class="filebox"> 
                </div>
                	<button type="button" class="removePic" onclick="removePic();">삭제</button>
   	                <label class="picbutton" for="pic_upload_button"><div class="picbutton1">사진첨부하기</div></label>
                    <input id="pic_upload_button" type="file" name="memberPhoto" accept="image/*" onchange="setThumbnail(event);" >
                </div>

                <!-- ID(Email) -->
                <div>
                    <h3 class="update_title">
                        <label for="email">이메일(ID)</label>
                    </h3>
                    <span class="box int_email">
                        <input type="text" name="memberEmail" id="email" class="int1" maxlength="20" value="${memberInfo.memberEmail }" readonly>
                        <!-- <input type="button" class="check" value="중복체크"> -->
                    </span>
                </div>
                
            <!-- NAME -->
            <div>
                <h3 class="update_title"><label for="name">이름</label></h3>
                <span class="box int_name">
                    <input type="text" name="memberName" id="name" class="int1" maxlength="16" value="${memberInfo.memberName }" readonly>
                    <!-- <input type="button" class="check" value="중복체크하기"> -->
                </span>
            </div>


                <!-- nickNAME -->
                <div>
                    <h3 class="update_title"><label for="name">닉네임</label></h3>
                    <span class="box int_name">
                        <input type="text" name="memberNickname" id="nickname" class="int1" maxlength="16" value="${memberInfo.memberNickname }" placeholder="8자 이내의 닉네임을 지어주세요" >
                        <input type="button" id="chkNickname" class="check" value="중복체크하기" onclick="chNickname()" >
                    </span>
                </div>

                <!-- MOBILE -->
                <div>
                    <h3 class="update_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" name="memberPhone" id="mobile" class="int1" maxlength="16" placeholder=" 하이픈'-'을 포함해 입력해주세요" value="${memberInfo.memberPhone }">
                        <input type="button" id="chkMobile" class="check" onclick="isMobile()" value="중복검사하기">
                    </span>
                </div>


                <!-- 보유 포인트 -->
                <div>
                    <h3 class="update_title"><label for="point">보유 포인트</label></h3>
                    <span class="box int_point">
                    
        <c:if test="${user.memberNum ne 1}">
             <input type="text" name="memberPoint" id="point" class="int" maxlength="20" value="${memberInfo.memberPoint }" readonly>
        </c:if>
 		<c:if test="${user.memberNum eq 1}">
             <input type="text" name="memberPoint" id="point" class="int" maxlength="20" value="${memberInfo.memberPoint }">
        </c:if>
                    </span>
                </div>

         <c:if test="${user.memberNum ne 1}">
                    <span class="box int_pass1">
			<button id="btnPw" type="button" onclick="location.href='changePw'"><span>비밀번호 수정</span></button> 

                    </span>
        </c:if>

      <div class="btn_area">
                
       	<c:if test="${user.memberNum ne 1}">
			<button id="btnUpMem" type="submit"><span>내정보 수정하기</span></button> 
        </c:if>
 		<c:if test="${user.memberNum eq 1}">
			<button id="btnUp" type="submit"><span>수정하기</span></button>
            <button id="btnDel" type="submit"><span>삭제하기</span></button>
        </c:if>
  	 </div><!-- btn_area -->
        </div>
        <!--content1-->
    </div>
    <!-- wrapper -->
  </form>
</body>

</html>