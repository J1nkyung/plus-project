<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${path}/resources/css/chat.css">
<title>채팅</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.js"></script>
</head>

<body>
	<div class="chat-wrap">
		<div class="lists">
			<div class="chatRoomList">
				<div class="header">채팅방 목록</div>
				<c:forEach items="${clubs}" var="club">
					<div class="chatRoom">
						<div class="clubName">
							<img class="group-img" src="${path}/resources/img/chat.png" />${club.clubName}</div>
						<input type="button" value="입장" id="enterBtn" class="btns"
							onclick="enterRoom(${club.clubNum});" /> 
							<input type="hidden" name="hiddenName" value="${club.clubName}" />
							
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="chat-box">
			<div class="header" id="chatRoomName">
				<div id="exitBtn">
					<img src="${path}/resources/img/back-button.png" />
				</div>
				<div id="userBtn"><img src="${path}/resources/img/userInfo.png"/></div>
				<div id="title">더하기</div>
				<div id="myModal" class="modal">
					<div class="modal-content"></div>
				</div>
			</div>

			<div class="message-wrap" style="overflow: auto">
				<h2>채팅할 모임을 선택해주세요.</h2>
			</div>
			<div class="send-message">
				<input placeholder="보낼 메세지를 입력해주세요." id="message" /> <input
					type="button" id="sendBtn" value="보내기" />
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">


$(function() {


	// 입장 버튼 누를 시 
$(document).on('click', '#enterBtn', function(){	
	// 동적으로 채팅방 이름 바꾸기 
	let clubName = $(this).parent('div').find("input[name='hiddenName']").val();
	$('#title').text(clubName);
	$('h2').remove();
	// 채팅방 대화 초기화 
	$('.message-wrap').html('');
	
	// 엔터키 이벤트 추가 
	$('#message').attr("onkeydown", "enterKey(" + roomId + ")");
	// 보내기 클릭이벤트 추가 
	$('#sendBtn').attr("onclick", "sendMessage()");
	// 입장 버튼 모두 숨기기 
	$('.btns').css( "visibility", "hidden" );
	// 유저목록 아이콘 표시 
	$('#userBtn').css( "display", "block" );
	// 나가기 버튼 표시 	
	$('#exitBtn').css("display","block");
}); 
	
	// 나가기 버튼 클릭시 
$(document).on('click', '#exitBtn', function(){		
	    const data = {
	    	     "clubNum" : roomId,
	             "memberNickname" : name,
	        	 "chatMessage" : "LEAVE"
			};
	    
		let jsonMsg = JSON.stringify(data);
		sock.send(jsonMsg);
		sock.close();
		 
		// 채팅방 대화 초기화 
		$('.message-wrap').html('');
		let exit = '<h2>채팅할 모임을 선택해주세요</h2>';
		$('.message-wrap').html(exit);
		
		// 버튼클릭 이벤트 삭제 
		$('#sendBtn').attr("onclick", "");
		$('#message').attr("onkeydown","");
		
		// 나가기 버튼 숨김 
		$('#exitBtn').css("display","none");
		// 입장버튼 모두 표시 
		$('.btns').css( "visibility", "visible" );
		
		// default 제목 표시 
		$('#title').text('더하기');
		
		// 유저목록 아이콘 숨김 
		$('#userBtn').css( "display", "none" );
});
	
	
	// 모달창 
	var modal = document.getElementById('myModal');
	var btn = document.getElementById("userBtn");
	
	btn.onclick = function() {
	    modal.style.display = "block";
	}
	
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}

});


let myMessage = "";
let otherMessage = "";
let today="";
// 로그인한 유저 닉네임
let name ='${user.memberNickname}';
let roomId = 0;	


	//	채팅방 입장 클릭 이벤트 
	function enterRoom(clubNum){
		roomId = clubNum;
		console.log(" 입장한 모임 번호 : " + roomId);

		//입장할때마다 소켓에 연결 
		connect(roomId);
		
		// 채팅 내역 불러오기 
		$.ajax({
			type: "post",
			data: {
				clubNum:roomId
			},
			url: "/plus/getMessages",
			success : function(data){        
				console.log("채팅내역 불러오기 성공"); 
				for(var i=0; i<data.length; i++){
					if(name===data[i].members.memberNickname){
						myMessage = '<div class="mymessage-box">';
					        myMessage += '<div class="mymessage">' + data[i].chatMessage + '</div>';
					        myMessage += '<div class="time-date" id="send-date">' + data[i].chatStringSendtime + '</div></div>';
					        $('.message-wrap').append(myMessage);
							$('#message').val('');
					} else{
						otherMessage = '<div class="other-message-box">';
							otherMessage += '<div id="othername"><strong>' + data[i].members.memberNickname + '</strong></div>';
							otherMessage += '<div class="others-message">' + data[i].chatMessage + '</div>';
							otherMessage += '<div class="time-date" id="receive-date">' + data[i].chatStringSendtime + '</div></div>';
						    $('.message-wrap').append(otherMessage);
					
					}
				}
				// 본인 입장 메시지 
				$('.message-wrap').append('<div class="enterTxt"></div>');
				$('.enterTxt').append('<p><strong>' + name + "</strong>님이 입장하셨습니다.</p>");
				$('.message-wrap').scrollTop($('.message-wrap')[0].scrollHeight);
				// 모달창에 접속인원 표시 
				let total = '<div id="total">(1명 접속중)</div>';
				let userList = '<div class="users"><img src="${path}/resources/img/default_pic.png" id="userPic" />'
								+ name +'</div>';
				$('.modal-content').html('');
				$('.modal-content').append(total);
				$('.modal-content').append(userList);
            },
            error: function() {
            	  console.log(" 채팅내역 error");
            }
						
						
		});  
	}



	
	//input에서 엔터치면 메시지 전송 
	function enterKey(roomId){
		if(event.keyCode == 13) {
			if($("#message").val() != null && $("#message").val() != '') {
				sendMessage();
				$("#message").val('');
			}
		}
	}
	
	
	// 메시지 전송
	function sendMessage() {
		let msg = $("#message").val();
		
		// 서버로 메시지 전송 
	     const data = {
	    	       "clubNum" : roomId,
                   "memberNickname" : name,
             	   "chatMessage" : msg
         };
		let jsonMsg = JSON.stringify(data);
		sock.send(jsonMsg);
		
		// 내 말풍선 표시 
		today = new Date();   
		myMessage = '<div class="mymessage-box">';
        myMessage += '<div class="mymessage">' + msg + '</div>';
        myMessage += '<div class="time-date" id="send-date">' + today.toLocaleDateString() +  ' | ' 
        			+ today.toLocaleTimeString("en-US") + '</div></div>';
        $('.message-wrap').append(myMessage);
		$('#message').val('');
		$('.message-wrap').scrollTop($('.message-wrap')[0].scrollHeight);
		
		// 메시지 db에 저장 
	 	$.ajax({
			type: "post",
			data: {
				clubNum: roomId,
				memberNum:'${user.memberNum}',
				chatMessage:msg
				
			},
			url: "/plus/insertMessage",
            success: function (data) {
            	console.log(data);
	           	if(data==1){
	           		console.log("메시지 저장 성공")
	           	} else{
	           		console.log("메세지 저장 실패")
	           		}
            	},
            error: function() {
            	  alert("메시지 저장 error");
            	}
			}); 
	}
	
	// 서버로부터 유저 목록 가져오기 
	function getUserList(jsonString){
		console.log("유저리스트 오나용")
		let obj = JSON.parse(jsonString);
		console.log(obj);
		let val=0;
		let userList="";
		
		for(key in obj){
			console.log(key);
			val = obj[key];
			console.log(val);
			
			if(val==roomId){
				console.log("일치 " + roomId +","+ val);
				userList += '<div class="users"><img src="${path}/resources/img/default_pic.png" id="userPic" />'+ key +'</div>';
			}
		}
		return userList;
	}
	
	
	// 입장 or 퇴장에따라 다른 메시지 표시 
	function enterOrLeave(id, p){
		let enterTxt = '<div class="enterTxt">';
		enterTxt += '<p><strong>' + id + '</strong>님이 ' + p + '하셨습니다.</p></div>';
				$('.message-wrap').append(enterTxt);
				$('.message-wrap').scrollTop($('.message-wrap')[0].scrollHeight);
	}
	
	// 접속 인원 보여주기 
	function showPeopleCnt(people,users){
		let total = '<div id="total">('+ people + '명 접속중)</div>';
		$('.modal-content').html('');
		$('.modal-content').append(total);
		$('.modal-content').append(getUserList(users));
	}
	
	// 서버로부터 메시지를 받았을 때
	let people="";
	function onMessage(msg) {
		console.log(msg)
		jsonString = msg.data.split("json");
		let users = jsonString[1];
		let words = jsonString[0].split(',');
		let id = words[1];
		people = words[2];
		
		if(words[0]==="ENTER"){
			if(name!==id){
				// 입장 메시지 띄우기
				let p = "입장";
				enterOrLeave(id,p);
			}		
			showPeopleCnt(people,users);
		
				
		} else if(words[0]==="LEAVE"){
			// 퇴장 메시지 띄우기 
			let p = "퇴장";
			enterOrLeave(id, p);
			showPeopleCnt(people,users);
		
		} else {
			// 입장, 퇴장이 아닌 다른 사람으로부터 온 보통의 메시지 
			let id = words[0];
			words = words[1].trim();
			console.log(words);
			
			today = new Date();  
				
			if(name!==id){
				otherMessage = '<div class="other-message-box">';
				otherMessage += '<div id="othername">' + id + '</div>';
				otherMessage += '<div class="others-message">' + words + '</div>';
				otherMessage += '<div class="time-date" id="receive-date">' + today.toLocaleDateString() 
							+  ' | ' + today.toLocaleTimeString("en-US") + '</div></div>';
			    $('.message-wrap').append(otherMessage);
				$('.message-wrap').scrollTop($('.message-wrap')[0].scrollHeight);
			} else {
				console.log("자기 자신이 보냈음")
			}
		}
		
	}
	

	// 소켓 생성, 연결 
		let sock;
		function connect(clubNum){
			sock = new SockJS("http://localhost:9999/plus/chat");
			sock.onopen = onopen;
			sock.onmessage = onMessage;
			sock.onclose = onclose; 
			console.log("세션 생성" + clubNum)
		}

		//채팅 입장시 서버로 입장했다는 정보를 보낸다  
			function onopen() {
		           console.log('info: connection opened' + roomId);
		           
		           const data = {
		                   "clubNum" : roomId,
		                   "memberNickname" : name,
		               	   "chatMessage" : "ENTER"
		           };
		           
		           let jsonData = JSON.stringify(data);
		           sock.send(jsonData);    
		          }
			 
		    
			// 서버와 연결 끊겼을 때 
		 	function onclose(evt) {
				console.log("연결끊김");
				$(".mymessage-box").append("연결 끊김");
				

			} 



</script>
</html>