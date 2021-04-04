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





	
	//비밀번호 유효성 검사
isPw1 = function(){
    var pwVal = $("#pswd1").val();
                             //특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
if(pwVal.match(regExp) != null){
 
  document.getElementById('alertTxt').innerHTML = "적합한 비밀번호입니다.";
}else{
	alert("영문 대 소문자, 숫자, 특수문자를 조합한 8~16자의 비밀번호를 사용하세요.")
	document.getElementById('alertTxt').innerHTML = "";
  document.getElementById('alertTxt').style.display = 'block';
}
};


//비밀번호 재확인 시 일치하는지 여부
checkPw = function() {
    var p1 = document.getElementById('pswd1').value;
    var p2 = document.getElementById('pswd2').value;
    if( p1 != p2 ) {
    	alert("비밀번호가 일치하지 않습니다")
    	document.getElementById('alertTxt1').innerHTML = "";

      return false;
    } else{
    	 document.getElementById('alertTxt1').innerHTML = "비밀번호가 일치합니다";
         document.getElementById('alertTxt1').style.display = 'block';

      return true;
    }

  }
  
//등록한 사진 삭제하는 버튼
removePic = function(){
    $('.removePic').click(function(){
           $("#image_container").empty()
	$("#picFile").val("");
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
		alert("수정되었습니다~~~");
		formObj.attr("action", "memberUpdate").submit();
		formObj.attr("method", "post");
	//	formObj.submit();				
	})
	
	//회원의 수정버튼 
	$("#btnJoin").on("click", function(){
		alert("수정되었습니다~~~");
		formObj.attr("action", "memberUpdate").submit();
		formObj.attr("method", "post");
//		formObj.submit();				
	})


})



</script>
</head>

<body>
    <!-- header -->
    <div id="header">
        <h1>회원정보수정</h1>
        <!-- <img src="../images/logo.png" id="logo"> -->
    </div>

  <form name="updateForm" role="form" enctype="multipart/form-data">

    <!-- wrapper -->
    <div id="wrapper">

<input type="hidden" name="memberNum"  value="${memberInfo.memberNum }"> 
        <!-- content1-->
        <div class="content1">      
                <!-- profile pic -->
                <div class="pro_pic_area">
                    <div id="image_container"><img src="${path}/resources${memberInfo.memberPic}" onerror="this.style.display='none';"/></div>
                <div class="filebox"> 
                </div>
                	<button type="button" class="removePic" onclick="removePic();">삭제</button>
   	                <label class="picbutton" for="pic_upload_button"><div class="picbutton1">사진첨부하기</div></label>
                    <input id="pic_upload_button" type="file" name="memberPhoto" accept="image/*" onchange="setThumbnail(event);" value="${memberInfo.memberPic}">
                </div>

                <!-- ID(Email) -->
                <div>
                    <h3 class="join_title">
                        <label for="email">이메일(ID)</label>
                    </h3>
                    <span class="box int_email">
                        <input type="text" name="memberEmail" id="email" class="int1" maxlength="20" value="${memberInfo.memberEmail }" readonly>
                        <!-- <input type="button" class="check" value="중복체크"> -->
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
            <!-- NAME -->
            <div>
                <h3 class="join_title"><label for="name">이름</label></h3>
                <span class="box int_name">
                    <input type="text" name="memberName" id="name" class="int1" maxlength="16" value="${memberInfo.memberName }" readonly>
                    <!-- <input type="button" class="check" value="중복체크하기"> -->
                </span>
                <span class="error_next_box"></span>
            </div>


                <!-- nickNAME -->
                <div>
                    <h3 class="join_title"><label for="name">닉네임</label></h3>
                    <span class="box int_name">
                        <input type="text" name="memberNickname" id="nickname" class="int1" maxlength="16" value="${memberInfo.memberNickname }" placeholder="8자 이내의 닉네임을 지어주세요" >
                        <input type="button" id="chkNickname" class="check" value="중복체크하기" onclick="chNickname()" >
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" name="memberPhone" id="mobile" class="int1" maxlength="16" placeholder=" 하이픈'-'을 포함해 입력해주세요" value="${memberInfo.memberPhone }">
                        <input type="button" id="chkMobile" class="check" onclick="isMobile()" value="중복검사하기">
                    </span>
                    <span class="error_next_box"></span>
                </div>


                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" name="memberPassword" id="pswd1" onchange="isPw1()" class="int" maxlength="20" value="${memberInfo.memberPassword }">
                        <span id="alertTxt"></span>

                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="password" id="pswd2" onchange="checkPw()" class="int" maxlength="20" value="${memberInfo.memberPassword }">
		                    <span id="alertTxt1"></span>
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- 보유 포인트 -->
                <div>
                    <h3 class="join_title"><label for="point">보유 포인트</label></h3>
                    <span class="box int_point">
                    
        <c:if test="${user.memberNum ne 1}">
             <input type="text" name="memberPoint" id="point" class="int" maxlength="20" value="${memberInfo.memberPoint }" readonly>
        </c:if>
 		<c:if test="${user.memberNum eq 1}">
             <input type="text" name="memberPoint" id="point" class="int" maxlength="20" value="${memberInfo.memberPoint }">
        </c:if>
                    
                    
                    </span>
                    <span class="error_next_box"></span>
                </div>


                <div class="btn_area">
                
       	<c:if test="${user.memberNum ne 1}">
			<!--  버튼명만 join이고 수정버튼! -->
			<button id="btnJoin" type="submit"><span>수정하기</span></button> 
        </c:if>
 		<c:if test="${user.memberNum eq 1}">
			<button id="btnUp" type="submit"><span>수정하기</span></button>
            <button id="btnDel" type="submit"><span>삭제하기</span></button>
        </c:if>
                
<!--                 <button type="submit" id="btnJoin">
                    <span>수정하기</span>
                </button> -->
            	</div>
        </div>
        <!--content1-->
    </div>
    <!-- wrapper -->
  </form>
</body>

</html>