<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet" href="${path}/resources/css/memberJoin2.css">
<script type="text/javascript" src="${path}/resources/js/jquery-1.12.4.min.js"></script>
<script>
 
 
/* //입력양식 전체 유효성 검사 후 제출 
function goSubmit() {
	//비밀번호 일치
	if (checkPw()) {
		//이메일코드 확인
		if (emailcode()) {
			//필수항목 동의 여부
			if (chk_ess()) {
				
				document.getElementById('form').submit();
				alert("더하기에 오신 것을 환영합니다 !")
			}
		}
	}

} */

 
 
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




    isPw1 = function(){
              var pwVal = $("#pswd1").val();
                                       //특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
         var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
        if(pwVal.match(regExp) != null){
            document.getElementById('alertTxt').innerHTML = "적합한 비밀번호입니다.";
        }else{
        	alert("영문과 숫자, 특수문자를 조합한 8~16자의 비밀번호를 사용하세요.")
        	  $('#pswd1').focus();
//		    document.getElementById('pswd1').autofocus;
        	document.getElementById('alertTxt').innerHTML = "";
            document.getElementById('alertTxt').style.display = 'block';

        }
    };
     
    
    checkPw = function() {
        var p1 = document.getElementById('pswd1').value;
        var p2 = document.getElementById('pswd2').value;
        if( p1 != p2 ) {
        	alert("비밀번호가 일치하지 않습니다")
        	        	  $('#pswd2').focus();
        	document.getElementById('alertTxt1').innerHTML = "";

          return false;
        } else{
        	 document.getElementById('alertTxt1').innerHTML = "비밀번호가 일치합니다";
             document.getElementById('alertTxt1').style.display = 'block';

          return true;
        }

    }



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
    


    $(document).ready(function(){
        // 가입약관 중필수항목 체크 여부 체크하는 함수
        chk_ess()
        //모두 동의합니다 체크시 전체체크
        chk_all()
        //3번 선택동의항목 y , n 에 대해 value값 주는 함수
        chk3_yn()
        
        //이메일 인증코드 보내는 함수
      //  emailsend()
        
        //이메일 인증코드 확인 함수
        emailcode()
        
 
       // submitCheck()




    });
    
    var code = "";
    
    //메일 형식 중복검사, 형식에 적합할 시 이메일 보냄
    verifyEmail = function () {
        var emailVal = $("#email").val();
        var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        if (emailVal.match(regExp) != null) {
           // alert("적합한 메일 형식입니다.")
            
          //  function emailsend(){
           //     $(".mail_check_button").click(function(){
                    alert("입력하신 메일로 인증번호가 발송되었습니다. 메일함을 확인해주세요.")
                    	$('#mail_check_input').focus();
                    var email = $(".mail_input").val();        // 입력한 이메일
                    var cehckBox = $(".mail_check_input");        // 인증번호 입력란
                     var boxWrap = $(".mail_check_input_box"); 
                             $.ajax({
                                 
                                 type:"GET",
                                 url:"mailCheck?email=" + email,
                                 success:function(num1){
                                         console.log("data : " + num1);
                                         boxWrap.attr("class", "mail_check_input_box_true int1"); 
                                         code = num1;
                                         
                                 }
                             });
            //    });
       //     };
        } else {
            alert('형식에 맞게 입력해주세요 ex)plus@plus.com')
      	  $('#email').focus();

        }        
    };

       
    
   //인증번호 일치 여부 검사
    function emailcode(){
            $(".mail_check_input").click(function(){
                var inputCode = $("#mail_check_input").val();        // 입력코드    
                
                if(inputCode == code){                            // 일치할 경우
                    alert("인증되었습니다.")
                    isCertification = true;
                } else {                                            // 일치하지 않을 경우
                    alert("코드가 일치하지 않습니다. 다시 입력해주세요.")
              	  $('#mail_check_input').focus();

                    isCertification = false;
                }    

            })
    }
   

   
/*    function submitCheck(){
	   if (isCertification==false){
		   alert("메일 인증이 완료되지 않았습니다.");
			return false;
		}else
			true;
	   } */
  
   
   
 
   //코드 불일치하면 가입 안되게 하고싶은데...
/*    function emailCodeCheck(){
	   if($("#mail_check_input").is(":true")){
		   return true;
	   }else
		   return false;
   } */
   
   /*  function changeAttr() {
	   alert("양식 제출")
		if (emailcode()==true){
			   alert("버튼타입 submit으로 변경")
			   
			   document.getElementById('btnJoin').setAttribute('type','submit');

		}
		else{
			   alert("false")
	
		}
	}  */
  
   


    
    function chk_ess(){
    $("#btnJoin").click(function(){
            
            // 첫번째 체크박스가 체크되어 있는경우
            if($("#chk1").is(":checked")){
                // alert("첫번째 통과");
            } else { // 첫번째 체크박스가 체크 되어있지 않은 있는경우
                alert("더하기 이용 약관에 동의해주세요.")
                return false;
            }
            // 두번째 체크박스가 체크되어 있는경우
            if($("#chk2").is(":checked")){
                // alert("두번째 통과");
            } else { // 두번째 체크박스가 체크 되어있지 않은 있는경우
                alert("위치 정보 이용 약관에 동의해주세요.");
                return false;
            }
        });
    }

    function chk_all(){
        $("#chk_all").click(function(){
            if($("#chk_all").is(":checked")){
                $(".chk").prop("checked", true);
            }
            else{
                $(".chk").prop("checked", false);
            }
        });       
    };


    //마케팅정보 수신동의항목 value값 전달 함수
    function chk3_yn(){
        $('#chk3').click(function(){
            $(this).val(this.checked ? + "y" : "n");
            });
    }

	//등록한 사진 삭제하는 버튼
    removePic = function(){
        $('.removePic').click(function(){
               $("#image_container").empty()
    	$("#picFile").val("");
    }
        )}
	
	
	
//닉네임 중복 및 유효성 검사
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
	
</script>


</head>
<body>
<!-- header -->
    <div id="header">
       <%--  <img src="${path}/resources/img/images/logo.png" id="logo"> --%>
    </div>
<!--onsubmit="return submitCheck();"  -->
  <form action="memberJoin" method="POST" enctype="multipart/form-data">
<!--   <form action="memberJoin" method="POST" enctype="multipart/form-data" id="form"> -->

    <!-- wrapper -->
    <div id="wrapper">
    <div id="original_content">
        <!-- content1-->
        <div class="content1">
  <!-- 
<input type="hidden" name="memberNum"  value="${user.memberNum }"> 
   -->  

    
            <!-- MOBILE -->
            <div>
                <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                <span class="box int_mobile">
                    <input type="tel" name="memberPhone" id="mobile" class="int1" value="${user.memberPhone }" maxlength="16" placeholder=" 하이픈'-'을 포함해 입력해주세요 " required>
                    <input type="button" onclick="isMobile()" id="chkMobile" class="check" value="중복검사하기">
                </span>
                <span class="error_next_box"></span>
            </div>
    
            <!-- ID(Email) -->
            <div>
                <h3 class="join_title">
                    <label for="email">이메일(ID)</label>
                </h3>
                <span class="box int_email">
                    <input name="memberEmail" type="email" id="email" class="int1 mail_input" maxlength="50" value="${user.memberEmail }" required>
                    <input type="button" class="check mail_check_button" onclick="verifyEmail()" value="인증번호발송"/> 
                </span>
                <span class="error_next_box"></span>
            </div>
    
                <!-- ID(Email) -->
            <div>
                <h3 class="join_title">
                    <label for="email">이메일 인증코드 확인</label>
                </h3>
                <span class="box int_email mail_check_warp">
                    <input  name="memberEmailcode" id="mail_check_input" class="int1 mail_check_input_box" maxlength="50" required>
                    <input type="button" class="check mail_check_input" value="인증코드확인"> <!-- onclick="emailcode()" -->
                </span>
                <span class="error_next_box"></span>
            </div>
    
    
            <!-- PW1 -->
            <div>
                <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                <span class="box int_pass">
                    <input type="password" name="memberPassword"  id="pswd1" onchange="isPw1()" class="int psscolor" maxlength="20" value="${user.memberPassword }" required>
                    <span id="alertTxt"></span>
    
                </span>
                <span class="error_next_box"></span>
            </div>
            
            <!-- PW2 -->
            <div>
                <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                <span class="box int_pass_check">
                    <input type="password" id="pswd2" onchange="checkPw()" class="int psscolor" maxlength="20" value="${user.memberPassword }" required>
                    <span id="alertTxt1"></span>
                </span>
                <span class="error_next_box"></span>
            </div>
    

            <!-- NAME -->
            <div>
                <h3 class="join_title"><label for="name">이름</label></h3>
                <span class="box int_name">
                    <input type="text" name="memberName" id="name" class="int1" maxlength="20" value="${user.memberName }" required>
                    <!-- <input type="button" class="check" value="중복체크하기"> -->
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- nickNAME -->
            <div>
                <h3 class="join_title"><label for="nickname">닉네임</label></h3>
                <span class="box int_name">
                    <input type="text" name="memberNickname" id="nickname" class="int1" maxlength="16" value="${user.memberNickname }" placeholder="8자 이내의 닉네임을 지어주세요" required>
                    <input type="button" class="check" id="chkNickname" onclick="chNickname()" value="중복체크하기">
                </span>
                <span class="error_next_box"></span>
            </div>
    
        </div>
        <!--content1-->
    
        <div class="content2">


            <!-- original_content -->
            <div class="pro_pic_area">
                <div id="image_container">${user.memberPic}</div>
                <div class="filebox"> 
                </div>
                <label class="picbutton" for="picFile"><span class="picbutton1">사진첨부하기</span></label>
                <input id="picFile" type="file" name="memberPhoto" accept="image/*" onchange="setThumbnail(event);"/>
            	<button type="button" class="removePic" onclick="removePic();">취소</button>
            </div>

        </div>
        <!-- content2 -->
    </div>
            <!-- terms -->
             <div class="terms">

                <div id="all_agree">
                    <label id="all_agree"><input type="checkbox" class="chk" id="chk_all"> <span> 모든 이용 약관에 동의합니다</span>
                </label>
                    </div>
                <div class="term1">
            
            <label><input id="chk1" type="checkbox" class="chk"><span class="agree"> 더하기 이용 약관 동의<span class="ess">(필수)</span></span></label>
                    <textarea readonly>
개인정보보호법에 따라 더하기에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.

1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 더하기 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 더하기는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.

회원가입 시점에 더하기가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소, 프로필 정보를 수집합니다.
- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다.
서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
NAVER 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.

서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.
구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나,
2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며,
더하기에서 제공하는 위치기반 서비스에 대해서는 '더하기 위치정보 이용약관'에서 자세하게 규정하고 있습니다.
이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.
                                    
                    </textarea>
                  
                </div>                <!-- term1 -->
            
            
            <div class="term2">
                <label><input id="chk2" type="checkbox" class="chk"><span class="agree"> 위치 정보 이용약관 동의<span class="ess">(필수)</span></span></label>
                <textarea readonly>
위치정보 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 더하기 위치기반 서비스를 이용할 수 있습니다.


제 1 조 (목적)
이 약관은 더하기 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조 (약관 외 준칙)
이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.

제 3 조 (서비스 내용 및 요금)
①회사는 직접 위치정보를 수집하거나 위치정보사업자인 이동통신사로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.
1.Geo Tagging 서비스: 게시물에 포함된 개인위치정보주체 또는 이동성 있는 기기의 위치정보가 게시물과 함께 저장됩니다.
2.위치정보를 활용한 검색결과 제공 서비스: 정보 검색을 요청하거나 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 제공 시 본 위치정보를 이용한 검색결과 및 주변결과(맛집, 주변업체, 교통수단 등)를 제시합니다.
3.위치정보를 활용한 친구찾기 및 친구맺기: 현재 위치를 활용하여 친구를 찾아주거나 친구를 추천하여 줍니다.
4.연락처 교환하기: 위치정보를 활용하여 친구와 연락처를 교환할 수 있습니다.
5.이용자 위치를 활용한 광고정보 제공: 검색결과 또는 기타 서비스 이용 과정에서 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 광고소재를 제시합니다.
6. 이용자 보호 및 부정 이용 방지: 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 권한없는 자의 비정상적인 서비스 이용 시도 등을 차단합니다.
7. 위치정보 공유: 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 안심귀가 등을 목적으로 지인 또는 개인위치정보주체가 지정한 제3자에게 공유합니다.
8. 길 안내 등 생활편의 서비스 제공: 교통정보와 길 안내 등 최적의 경로를 지도로 제공하며, 주변 시설물 찾기, 뉴스/날씨 등 생활정보, 긴급구조 서비스 등 다양한 운전 및 생활 편의 서비스를 제공합니다.
②제1항 위치기반서비스의 이용요금은 무료입니다.
                 </textarea>
            </div>

            <div class="term3">
                <label><input id="chk3" type="checkbox" name="memberMarketing" class="chk" value="y"><span class="agree"> 마케팅 정보 수신 동의<span class="ess">(선택)</span></span></label>

                <textarea readonly>
더하기에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화(더하기 사이트 알림 또는 문자), 이메일로 받아보실 수 있습니다. 

1. 마케팅 정보에 대한 안내 
일부 서비스(별도 회원 체계로 운영하거나 더하기 가입 이후 추가 가입하여 이용하는 서비스 등)의 경우, 개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 이때에도 수신 동의에 대해 별도로 안내하고 동의를 받습니다.
할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 정보를 SMS나 이메일로 받아보실 수 있습니다.
단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.

선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.
인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계에 이용됩니다.
                 </textarea>
            </div>

            </div> <!--terms-->


            <!-- JOIN BTN-->
            <div class="btn_area">
                <button type="submit" id="btnJoin"><!--bitcamp@gmail.com2  -->
                    <span>가입하기</span>
                </button>
                
            </div>
        <!-- </div> content -->



    </div>
    <!-- wrapper -->
    
 </form>
</body>

</html>