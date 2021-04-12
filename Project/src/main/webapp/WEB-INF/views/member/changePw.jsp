<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호찾기</title>
    <link rel="stylesheet" href="${path}/resources/css/memberUpdate.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
</head>
<script>
$(document).ready(function(){
	
	var formObj = $("form[name='changePw']");
	
	
	$("#btnch").on("click", function(){
	
			formObj.attr("action", "changePw").submit();
			formObj.attr("method", "post");
			//alert("비밀번호 수정 시도");
		
		
		
	})
})//document ready



//비밀번호 유효성 검사
function isPw1(){
    var pwVal = document.getElementById('pswd1').value;
                             //특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
if(pwVal.match(regExp) != null){
 
  document.getElementById('alertTxt1').innerHTML = "적합한 비밀번호입니다.";
}else{
	alert("영문 대 소문자, 숫자, 특수문자를 조합한 8~16자의 비밀번호를 사용하세요.")
	document.getElementById('alertTxt1').innerHTML = "";
  document.getElementById('alertTxt1').style.display = 'block';
}
};


//비밀번호 재확인 시 일치하는지 여부
function checkPw() {
    var p1 = document.getElementById('pswd1').value;
    var p2 = document.getElementById('pswd2').value;
    if( p1 != p2 ) {
    	alert("비밀번호가 일치하지 않습니다")
    	document.getElementById('alertTxt2').innerHTML = "";

      return false;
    } else{
    	 document.getElementById('alertTxt2').innerHTML = "비밀번호가 일치합니다";
         document.getElementById('alertTxt2').style.display = 'block';

      return true;
    }

  }




</script>

<body>
<!--  action="findPw" method="post" -->
    <form name="changePw" role="form" method="post">
    
  <div id="wrapper">
            <!-- content1-->
            <div class="findPw">      
                <div class="logo-wrap" style=" margin-bottom:80px;">
       		<a style="font-size:30px;"><b>비밀번호 수정</b></a> 
                

                </div>
                 
                 
                 <!-- original  -->
                <div>
                    <h3 class="join_title"><label for="ori_pswd">기존 비밀번호 확인</label></h3>
                    <span class="box int_pass">
                        <input type="password" name="ori_pswd" id="ori_pswd" class="int" maxlength="20">
                        <span id="alertTxt"></span>

                    </span>
                </div> 
                 
                 <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">새로운 비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" name="memberPassword" id="pswd1" onchange="isPw1()" class="int" maxlength="20">
                        <span id="alertTxt1"></span>

                    </span>
                </div> 

                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">새로운 비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="password" id="pswd2" onchange="checkPw()" class="int" maxlength="20">
		                    <span id="alertTxt2"></span>
                    </span>
                </div> 
                            
                        
                     
    
                    <div class="btn_area">
                    
                <button id="btnch" type="button"><span>비밀번호 수정</span></button> 
                    
                    </div>
            </div>
            <!--content1-->
        </div>
        <!-- wrapper -->
      </form>
</body>

</html>