<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!--${pageContext.request.contextPath}" 이게 web-app을 가리킨다!!!!!   -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- 그래서 path 써주고 그 아래 소스 파일 이름 지정해주면 된다 ! 이건 진경언니가 준거 !   -->

    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <title>Document</title>
    <script>
	    function payment(amount) {
	    	var memberNum = ${user.memberNum};
	    	var IMP = window.IMP; // 생략가능
	        IMP.init('imp60466849'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	        IMP.request_pay({
	            pg : 'inicis', // version 1.1.0부터 지원.
	            pay_method : 'card',
	            merchant_uid : 'merchant_' + new Date().getTime(),
	            name : '포인트 결제',
	            amount : amount,
	             /* amount : 100,  */
	            //buyer_email : 'iamport@siot.do', 
	            //buyer_name : '구매자이름',
	            //buyer_tel : '010-1234-5678',
	            //buyer_addr : '서울특별시 마포구 신수동',
	            //buyer_postcode : '123-456',
	            m_redirect_url : '/chargePointPopup'
	        }, function(rsp) {
	            if ( rsp.success ) {
	            	$.ajax({
	            		url : 'chargePoint',
	            		type : 'post',
	            		dataType : 'json',
	            		data : {'payAmount' : rsp.paid_amount,
	            				'memberNum' : memberNum
	            				},
	            		success:function(result){
	            			console.log('결제 완료');
	            		}
	            	});
	                var msg = '💬 결제가 완료되었습니다. 보유하신 포인트 금액을 확인해주세요.';
	                msg += '고유ID : ' + rsp.imp_uid;
	                msg += '상점 거래ID : ' + rsp.merchant_uid;
	                msg += '결제 금액 : ' + rsp.paid_amount;
	                msg += '카드 승인번호 : ' + rsp.apply_num;
	            } else {
	                var msg = '💬 결제에 실패하였습니다.\n';
	                msg += '     에러내용 : ' + rsp.error_msg + ". \n";
	                msg += '     다시 한번 시도해보세요! '
	            }
	            alert(msg);
	            opener.parent.location.reload(); //팝업창을 닫으면서 부모창을 새로고침하는 방법
	            window.close();
	        });
	        
	    }
    </script>
    <style>
        .pointContainer{
            margin: 10% 6%;
        }
        .pointContainer h2{
            line-height: 17px;
        }
        .pText{
            margin: 3% 0 2% 0;
            
        }
        .pText p{
            font-size: 14px;
            font-weight: 600;
            color: rgb(158, 158, 158);
            line-height: 7px;
        }
        .pointTable{
            margin: 1% 0 2% 0;
        }
        .pointTable input{
            color: rgb(255, 255, 255);
            background-color: rgb(67, 177, 251);
            border: none;
            /* padding: 3px 8px; */
            width: 90px;
            height: 25px;
            border-radius : 3%;
        }
        .pointTable td:nth-child(2){
            padding-right: 100px;
        }
        .pointTable td{
            padding: 10px 4px 10px 0;
        }
    </style>
</head>
<body>
    <div class="pointContainer">
        <h2>다양한 모임에 참여하여</h2>
        <h2>습관형성에 재미를 더하세요!</h2>
        <div class="pText">
            <p>더하기에서 포인트를 이용해서 모임에 참여하고 꿈을</p> 
            <p>이뤄보세요. 다양한 모임을 통해 습관 형성의 재미를</p>
            <p>느낄 수 있습니다.</p>
        </div>
        <table class="pointTable">
            <tr>
                <td><img src="${path}/resources/img/good.png" width="24px" height="24px"></td>
                <td> 1000 포인트</td>
                <td><input type="button" value="1,000원" id="1000" onclick="payment(1000)"></td>
            </tr>
            <tr>
                <td><img src="${path}/resources/img/good.png" width="24px" height="24px"></td>
                <td> 3000 포인트</td>
                <td><input type="button" value="3,000원" id="3000" onclick="payment(3000)"></td>
            </tr>
            <tr>
                <td><img src="${path}/resources/img/good.png" width="24px" height="24px"></td>
                <td> 5000 포인트</td>
                <td><input type="button" value="5,000원" id="5000" onclick="payment(5000)"></td>
            </tr>
            <tr>
                <td><img src="${path}/resources/img/good.png" width="24px" height="24px"></td>
                <td> 10000 포인트</td>
                <td><input type="button" value="10,000원" id="10000" onclick="payment(10000)"></td>
            </tr>
            <tr>
                <td><img src="${path}/resources/img/good.png" width="24px" height="24px"></td>
                <td> 25000 포인트</td>
                <td><input type="button" value="25,000원" id="25000" onclick="payment(25000)"></td>
            </tr>
            <tr>
                <td><img src="${path}/resources/img/good.png" width="24px" height="24px"></td>
                <td> 50000 포인트</td>
                <td><input type="button" value="50,000원" id="50000" onclick="payment(50000)"></td>
            </tr>
            <tr>
                <td><img src="${path}/resources/img/good.png" width="24px" height="24px"></td>
                <td> 100000 포인트</td>
                <td><input type="button" value="100,000원" id="100000" onclick="payment(100000)"></td>
            </tr>
        </table>
        <div class="pText">
            <p>상품 가격에 부가가치세가 포함되어 있으며 </p> 
            <p>사용하지 않은 포인트는 환불 불가합니다.</p>
        </div>
    </div>      

</body>
</html>