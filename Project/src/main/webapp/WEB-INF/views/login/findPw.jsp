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
	
//	var formObj = $("form[name='findPw']");
	
	
	$("#btnFind").on("click", function(){
	
		if (emailChk()==false){
			//alert("이메일 오류");

		}else{
			if(phoneChk()==false){
				//alert("휴대폰 오류");
			}	
			else{
				sendEmail();
			}
		}
	})
})//document ready




//이메일 중복체크 - true
function emailChk(){
	 var emailVal = $("#email").val();
     var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
     if (emailVal.match(regExp) != null) {
        // alert("적합한 메일 형식입니다.")

     	   
    var memberEmail = $('#email').val();
	   var data = {memberEmail : memberEmail}
	   
	   var ret = true;
	   $.ajax({
		   type: "post",
		   url : "memberEmailCheck",
		   async : false,
		   data : data,
		   success : function(result){
			   console.log("성공 여부"+result);
		 	if(result !='fail'){
		 		ret = false;
		 	 /*  alert("db에 없는 메일주소 ") */
		       if(confirm("등록되지 않은 이메일입니다\n 확인버튼을 누르시면 회원가입 창으로 이동합니다") == true){
		    	   location="memberJoin";
		       }
		 	}
		   
		   }//success종료
	   }); //ajax종료
		  //      alert("형식에 맞는 닉네임입니다")

     return ret;
    
     } else {
         alert('형식에 맞게 입력해주세요 ex)plus@plus.com')
   	  $('#email').focus();
			return false;
     }          
	}


//휴대폰번호 유효성, 중복검사
function phoneChk(){
    var phoneVal = $("#mobile").val();
    /*  var regExp = /^\d{11}$/;*/
  	var regExp = /^\d{3}-\d{3,4}-\d{4}$/; 
    if(phoneVal.match(regExp) != null){
      // alert('형식에 맞는 번호입니다')
       
    	   var memberPhone = $('#mobile').val();
    	   var data = {memberPhone : memberPhone}
    	   
    	   var ret = true;
    	   $.ajax({
    		   type: "post",
    		   url : "memberPhoneCheck",
    		   async : false,
    		   data : data,
    		   success : function(result){
    			   console.log("성공 여부"+result);
    		 	if(result !='fail'){
    		 		ret = false;
    		 		alert("등록되지 않은 휴대폰번호입니다 \n다시 한 번 확인해주세요")
    		 		
    		 		
    		 	}else{
    		 	/* alert("db에 있는 휴대폰번호"); */

    		 		
    		 	}
    		   
    		   }//success종료

    	   }); //ajax종료
    	   return ret;
    }else{
        alert("입력 형식에 맞지 않습니다. '010-0000-0000'의 형태로 입력해주세요.")
        return false;
    }
}; 

function sendEmail(){
	
     $.ajax({
			url : "getPw",
			type : "POST",
			data : {
				memberEmail : $("#email").val(),
				memberPhone : $("#mobile").val()
			},
			success : function(data) {
		        alert("입력하신 이메일로 비밀번호가 전송되었습니다")

 			   console.log("성공 여부"+data);
				location.href=data;
		
			},
			error : function(data){
				//alert("error" + data)
			}
		})
}




</script>

<body>
<!--  action="findPw" method="post" -->
    <form name="getPw" role="form" method="post">
    
  <div id="wrapper">
            <!-- content1-->
            <div class="findPw">      
                <div class="logo-wrap">
                   <img id="logo" src="${path}/resources/img/images/logo.png">

                </div>
                    <!-- ID(Email) -->
                    <div>
                        <h3 class="join_title">
                            <label for="email">이메일(ID)</label>
                        </h3>
                        <span class="box int_email">
                            <input type="text" name="memberEmail" id="email" class="int1 mail_input" maxlength="50">
                            <!-- <input type="button" class="check" value="중복체크"> -->
                        </span>
                        <span class="error_next_box"></span>
                    </div>
    
                    <!-- MOBILE -->
                    <div>
                        <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                        <span class="box int_mobile">
                            <input type="tel" name="memberPhone" id="mobile" class="int1" maxlength="16" placeholder=" 하이픈'-'을 포함해 입력해주세요">
                            <!-- <input type="button" id="chkMobile" class="check" onclick="isMobile()" value="중복검사하기"> -->
                        </span>
                        <span class="error_next_box"></span>
                    </div>
                            
                        
                     
    
                    <div class="btn_area">
                    
                <!--  버튼명만 join이고 수정버튼! -->
                <button id="btnFind" type="button"><span>비밀번호찾기</span></button> 
                    
                    </div>
            </div>
            <!--content1-->
        </div>
        <!-- wrapper -->
      </form>
</body>

</html>