<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<%-- <link rel="stylesheet" type="text/css" href="${path}/resources/css/comm-aside.css"> --%>
<title>커뮤니티</title>

<style>
body {
	font-size: 16px;
/* 	background-color: #f5f4f0;
 */}

.communityContainer {
	margin: 0;
	margin-left:100px;
	width: 100%;
}

.inlineContent {
	width: 80%;
	padding: 3% 0 5% 0;
	display: flex;
	flex-direction: column;
	border: 1px solid rgba(0, 0, 0, 0.171);
	border-radius: 5px;
	margin:10px;
}

.contentBox {
	padding-bottom: 3%;
}

.userInfo {
	display: flex;

	/* background-color: tomato; */
}

.userComment {
	display: flex;
	flex-direction: column;
	font-size: 15px;
	width: 80%;
}

.userSpan {
	display: flex;
	flex-direction: row;
}

h1 {
	margin-bottom: 40px;
}

p {
	margin-top: 30px;
}

/*프로필사진 나오는 곳*/
#userPic {
	width: 45px;
	height: 45px;
	border-radius: 50%;
	margin: 20px 20px 50px 30px;
	box-shadow: 1px 1px 1px #8299d879;
}

#commentUserPic {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	margin: 0px 10px 10px 30px;
	box-shadow: 1px 1px 1px #8299d879;
}

.certification{
    margin-left:4%;
 }
        /*인증사진 위치 및 내용*/
        #certificationPic{
            /* text-align: center; */
            height: auto;
            width: 500px;
            overflow: hidden;
        }
        
        #certificationPic img{
        max-width:100%;
        height:auto;
        }

        #certificationContent{
            margin: 4% 10% 2% 0%;
            font-size: 15px;
        }


/*닉네임*/
#boardNickname {
	font-size: 22px;
	font-weight: 700;
}

#commentNickname {
	font-weight: 700;
	margin: 5px 30px 0px 0px;
	font-size: 17px;
}

/*댓글*/
.commentBox {
	margin: 20px 20px 20px 30px;
	width: 85%;
}

textarea {
	resize: none;
	font-size: 15px;
	margin-right: 2%;
	border-radius: 2%;
}

.writeComment {
	display: flex;
}


.reComm-box{
	margin-left:80px;
	display:flex;
} 

#submitCommBtn, #submit-reCommBtn {
	display: inline-block;
	padding: 10px 20px;
	color: #999;
	background-color: #fdfdfd;
	border: 0;
	cursor: pointer;
	border-radius: 5px;
	border: 1px solid #eee;
}

#commContent {
	margin: 0px 0px 50px 60px;
}

#commRegdate {
	margin-top: 10px;
	color: #6e7c7c;
	font-size: 12px;
}
#editBtn{
	margin-bottom:30px;
	color:#6e7c7c;
}

#delComm, #updateComm{
	float: right;
	font-size: 15px;
	margin-right: 10px;
	cursor: pointer;
}

#showReCommBtn{
	font-size: 15px;
	margin-right: 10px;
	cursor: pointer;
    margin-left: 60px;
}

#editText {
	margin: 0 0 10px 60px;
}

#editInput {
	color: #999;
	width: 100px;
	height: 46px;
	background-color: #fdfdfd;
	border: 0;
	cursor: pointer;
	border-radius: 5px;
	border: 1px solid #eee;
	float: right;
}

#commImg {
	width: 20px;
	height: 20px;
}

#showCommBtn {
	margin: 50px 0 0 4%;
	cursor: pointer;
	display: inline;
	display: flex;
}

#boardForm{
   position: fixed;
   float: right;
   bottom: 50px;
   right: 100px;
   border-radius:50%;
   height:50px;
   width:50px;
   background-color:#001eff;
   opacity:0.9;
   color:#333;
   border-style:none;
   }
   

   
   #boardForm img{
max-width:65%;
height:auto;
margin-left:3px;
/* width:50px;
 */
}

#boardRegdate{
  	margin:37px;
  	font-size:10pt;
  }
        
#dropdown {
	width: 15px;
	height: 15px;
	margin: 10px 0 0 300px;
	cursor: pointer;
}

   
.dropbtn {
  padding: 30px 16px 5px 16px;
  font-size: 16px;
  border: none;
  cursor:pointer;
/*   clear:both;
   position:relative;
   left:300px; */
}

#dropmenu{
width:15px;
height:18px;
opacity:0.5;

}
#btnDel, #btnUp{
padding:3px 5px;
margin-bottom:1px;
margin-left:5px;
border:none;
box-shadow:1px 1px 1px grey;
background-color:#001eff;
opacity:0.8;
border-radius:5px;
}

.dropdowns > ul > li {
      display: inline-block;
      position: relative;
    }
.dropdowns > ul > li > ul {
  position: absolute;
  list-style-type: none;
  padding-left: 0px;
  display: none;
}
.dropdowns > ul > li:hover > ul {
  display: block;
}
.dropdowns > ul > li:active > ul {
  display: block;
}
.dropdowns a{
color:white;
}
.dropdowns a:hover{
color:white;
}

.moreBtn{
margin:20px 0 50px 10%;
width:60%;
border-radius:5px;
border-style:none;
box-shadow: 1px 1px 1px grey;
background-color:#001eff;
color:white !important;
font-weight:bold;
height:35px;
}
.moreBtn:focus{
border:0;
outline:0;
}
.newContent{
padding-bottom:30px;
}

.reComm-list {
    margin: 40px 0 0 40px;
}
</style>
</head>
<body>


	
   <div class="communityContainer">
    <%--   <input type="button" name="boardForm" id="boardForm"
         onclick="location.href='${path}/insertBoardForm'"> --%>
         <!-- 정연 추가 20210410 링크에 ${clubNum }추가 -->
         <button type="button" name="boardForm" id="boardForm" onclick="location.href='${path}/insertBoardForm?clubNum=${clubNum }'">
         <img src="${path }/resources/img/penwhite.png"></button>
         

<div id="repeatBox">

      <c:forEach items="${boards}" var="board">
         <div class="inlineContent">
            <!-- 게시글 -->
            <div class="contentBox">
               <form role="form" name="updateForm" method="post">
                  <div class="userInfo">
                     <input type="hidden" name="boardNum" value="${board.boardNum }">
                     <img src="${path}/resources${board.memberPic}" id="userPic"
                        onerror="this.src='${path}/resources/img/default_pic.png'" />
                     <p id="boardNickname">${board.memberNickname}</p>
                     <div id="boardRegdate">
                     	<fmt:formatDate value="${board.boardRegDate}" var="changedDate"
							pattern="yyyy. MM. dd (HH:mm)" />
						${changedDate}
                     </div>

                     <c:set var="writer" value="${board.memberNum }" />
                     <c:if test="${writer eq user.memberNum}">

                        <div class="dropdowns">
                           <ul>
                              <li>
                                 <div class="dropbtn">
                                    <img id="dropmenu" src="${path }/resources/img/menu.png">
                                 </div>
                                 <ul>
                                    <button type="submit" id="btnUp"><a href="${path}/updateView?boardNum=${board.boardNum}&clubNum=${board.clubNum}">수정</a>
                                    </button>
                                    <button type="submit" id="btnDel"><a href="${path}/deleteBoard?boardNum=${board.boardNum}&clubNum=${board.clubNum}">삭제</a>
                                    </button>
                               <%--      <button type="submit" id="btnUp">
                                       <a href="${path}/updateView?boardNum=${board.boardNum}">수정</a>
                                    </button>
                                    <button type="submit" id="btnDel">
                                       <a href="${path}/deleteBoard?boardNum=${board.boardNum}">삭제</a>
                                    </button> --%>
                                 </ul>
                              </li>
                           </ul>
                        </div>
                     </c:if>

                  </div>
                  <div class="certification">
                     <div id="certificationPic">
                        <img src="${path}/resources${board.boardPic}"
                           onerror="this.style.display='none';">
                     </div>
                     <p id="certificationContent">${board.boardContent}</p>
                  </div>
               </form>
               <!-- 댓글 쓰는 부분 -->




               <%-- <c:forEach items="${comments}" var="comment">
                     <c:if test="${board.boardNum == comment.boardNum}">
                     아래부터 시작해야 함 
                     <hr>
                     <div id="commentBox">
                        <div id="writeComment">
                           <textarea cols="80" rows="1" id="textArea"
                              placeholder="댓글을 입력해보세요!"></textarea>
                           <br> <input type="button" id="submitCommBtn" value="등록하기"
                              onclick="insertComment(${board.boardNum})" />
                        </div>
                     </div>
                        <div class="comments-wrap">
                           <div class="userComment">
                              <div class="userSpan">
                                 <img src="${path}/resources${comment.memberPic}"
                                    id="commentUserPic"
                                    onerror="this.src='${path}/resources/img/default_pic.png'" />
                                 <div id="commentNickname">${comment.memberNickname}</div>
                                 <div id="commRegdate">${comment.commentsChangedRegdate}</div>
                              </div>
                              <div id="commContent">${comment.commentsContent}</div>
                              <div id="editBtn">
                                 <a href="#" id="delComm"
                                    onclick="deleteComment(${comment.commentsNum})">삭제</a> <a
                                    id="updateComm" href="#"
                                    onclick="changeTag(${comment.commentsNum})">수정</a>
                              </div>
                              <hr>
                           </div>
                        </div>
                     </c:if>
                  </c:forEach> --%>
               <div id="showCommBtn">
                  <img id="commImg" src="${path}/resources/img/message.png" />
                  <div id="commList" onclick="getComments(${board.boardNum})">댓글(${board.commentsCount}개)</div>
               </div>
            <!-- 댓글 가져오기  -->
            </div><!--contentBox  -->
         </div><!-- inline content 끝 -->
      </c:forEach>
      <div class="newContent">
      
      </div>
      <button type="button" class="moreBtn" id="moreContentBtn">더보기</button>
   </div><!-- repeatBox -->
   </div>   <!--communityContainer end-->
</body>
<script>

//수정, 삭제 시 확인 자바스크립트
	/* $(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$("#btnUp").on("click", function(){
				formObj.attr("action", "updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			$("#btnDel").on("click", function(){
				formObj.attr("action", "deleteBoard");
				formObj.attr("method", "post");
				formObj.submit();
			})
					
	}) */
	let mNum = '${user.memberNum}';
	let userNickname = '${user.memberNickname}';
	let boardNum = 0;

$(function(){
	var formObj = $("form[name='updateForm']");
	
	 
	$(document).on('click','#btnUp',function(){
		if(confirm("수정하시겠습니까?") == true){
		formObj.attr("action", "updateView");
		formObj.attr("method", "get");
		}else{
			return false;
		}
	})
	
	$(document).on('click','#btnDel',function(){
		if(confirm("정말 삭제하시겠습니까?") == true){
		formObj.attr("action", "deleteBoard");
		formObj.attr("method", "post");
		}else{
			return false;
		}
	})
	
	
	
	
let contentCnt = '${contentCount}'
	console.log('콘텐츠 개수'+contentCnt)

		 if(contentCnt<=5){
			 console.log("콘텐츠 카운트 체크")
			 $('#moreContentBtn').css("display","none");
		 }else{
			 console.log("콘텐츠 5개 이상")
		 }
		 
		 //개수제한
		 let startIndex = 0;
		 // 더보기 버튼 클릭 시 보여줄 값
		 let step = 5;
		
		 $('#moreContentBtn').click(function(){
			 startIndex += step;
			 console.log('시작넘버'+startIndex);
			 getMoreContents(startIndex); //밑에 있는 함수명
		 });
		 
		 // 더보기
		 function getMoreContents(startIndex){
			 $.ajax({
				 type: "post",
				 async: "true",
				 dataType : "json",
				 data: JSON.stringify({
					 clubNum:'${club.clubNum}',
					/* memberNum:'${user.memberNum}',*/
					 startIndex:startIndex
				 }),
				 contentType: "application/json",
				 url: "getMoreContents", //controller주소
				 success: function(data) {
					let newContentList = "";
					 
					let compareUser = '${writer eq user.memberNum}';
					let path = '${path}';
					
					 for(i = 0; i < data.length; i++){
				 let newContent = '<div class="inlineContent">';
					 newContent += '<div class="contentBox">';
					 newContent += '<form role="form" name="updateForm" method="post">';
					 newContent += '<div class="userInfo">';
					 newContent += '<input type="hidden" name="boardNum" value="'+ data[i].boardNum +'">';
					 newContent += '<img src="' + path +'/resources'+ data[i].memberPic +'" id="userPic" onerror="this.src=\'' + path +'/resources/img/default_pic.png\'" />';
					 newContent += '<p id="boardNickname">' + data[i].memberNickname + '</p>';
					 newContent += '<div id="boardRegdate">' + data[i].boardRegDate + '</div>';
					 newContent += '<c:set var="writer" value="' + data[i].memberNum + '" />';
					 newContent += '<c:if test="' + compareUser +'">';
					 newContent += '<div class="dropdowns">';
					 newContent += '<ul><li><button class="dropbtn"><img id="dropmenu" src="' + path +'/resources/img/menu.png"></button>';
					 newContent += '<ul><button type="submit" id="btnUp"><a href="' + path +'/updateView?boardNum=' + data[i].boardNum + '">수정</a></button>';
					 newContent += '<button type="submit" id="btnDel"><a href="' + path +'/deleteBoard?boardNum=' + data[i].boardNum + '">삭제</a></button>';
					 newContent += '</ul></li></ul></div></c:if></div>';
					 newContent += '<div class="certification"><div id="certificationPic">';
					 newContent += '<img src="' + path + '/resources' + data[i].boardPic + '" onerror="this.style.display=\'none\';"></div>';
					 newContent += '<p id="certificationContent">' + data[i].boardContent + '</p>';
					 newContent += '</div></form>';
					 newContent += '<div id="showCommBtn">';
					 newContent += '<img id="commImg" src="' + path +'/resources/img/message.png" />';
					 newContent += '<div id="commList" onclick="getComments('+ data[i].boardNum + ')">댓글(' + data[i].commentsCount + '개)</div></div></div></div>';
					 newContentList += newContent;
					 
					 }
					 
					 //부모태그에다가 작성한 html 태그를 append 시킨다
					 $(newContentList).appendTo($(".newContent")).slideDown();
					 
					 //더이상 볼 리뷰 없으면 더보기버튼 삭제
					 if(startIndex + step > contentCnt){
		        			$('#moreContentBtn').remove();
		        		}
				 }
			 })
		 }
		
	
	
		 
// 댓글 시작 



	//대댓글 등록
	$(document).on('click','#submit-reCommBtn',function(){
		//e.stopImmediatePropagation();
		
		// 대댓글 리스트 div 가져오기 
		let reCommWrap = $(this).parent().parent();
		console.log(reCommWrap)
		
		// textarea 입력 값 가져오기 
		let area = $(this).parent().children(":first");
		let content = area.val();
		if(content=="" || content==" "){
			alert("내용을 입력해주세요!");
			return;
		}
		
		let today = getTime();
		
		// 댓글번호 가져오기 
		let cNum = $(this).attr('name');
		console.log("댓글번호 : " + cNum);
		console.log("게시글번호 : " + boardNum); 
		
		
		 
		   	$.ajax({
				type: "post",
				url: "insertReComments",
				data: {
					commentsClass:cNum,
					memberNum:mNum,
					boardNum:boardNum,
					commentsContent:content,
					commentsRegdate:today,
				},
		    	 success: function (data) {
		     		console.log(data)
		     		console.log(data.commentsNum)
		     		if(data){
		     		
		     		// 오늘 날짜 format 변환
		     			today = today.split(':');
						// 대댓글입력시 대댓글 목록에 추가 
						let reList ='<div class="reComm-list">';
						reList +='<div class="userSpan">'
						reList += '<img src="${path}/resources/img/하이킹.PNG" id="commentUserPic"/>';
						reList += '<div id="commentNickname">'+ userNickname +'</div>';
						reList += '<div id="commRegdate">'+ today[0] + ':' + today[1] +'</div></div>';
						reList += '<div id="commContent">'+ content +'</div>';
				     	reList += '<div id="editBtn"><div id="delComm" onclick="delReComm('+data.commentsNum+')">삭제</div>'
				     	reList += '<div id="updateComm" onclick="changeTag('+data.commentsNum+')">수정</div></div></div>';
				     	let reCommBox = reCommWrap.children().first();
				     	console.log(reCommBox)
				     	$(reList).insertAfter(reCommBox);
				     	//reCommWrap.append(reList);
				     	
				     	console.log("대댓글 등록 성공!")
				     	alert("댓글이 등록되었습니다!");
				     	area.val('');
		     		}
		     	
		        },
		        error: function(e) {
		        	  alert("대댓글 불러오기 오류" + e);
		        }
			}) 
		
	})
});	// function 끝 


// 대댓글 삭제 
function delReComm(cNum){
	let thisEle = $(event.target);
	let reCommList = thisEle.parent().parent();
	
	
	$.ajax({
		type: "post",
		url: "deleteComment",
		data: {
			commentsNum:cNum,
		},
	          success: function (data) {
        	console.log(data)
        	if(data){
            		console.log("대댓글삭제완료");
            		alert("댓글이 삭제되었습니다!");
            		reCommList.remove();
            		
            	} else {
            		console.log("대댓글삭제실패");
	      		}
        },
        error: function() {
        	  alert("대댓글 삭제 오류");
        }
    });
	
}


// 답글 버튼 클릭시 
function showReComments(cNum){
	
	// 대댓글 접었다 펴기 
	$showReCommBtn = $(event.target);
	$showReCommBtn.toggleClass('selected');
	let target = $showReCommBtn.closest('.userComment').children('.reComm-wrap');
		if(!$showReCommBtn.hasClass('selected')){
			target.remove();	
	} else{
		console.log('댓글번호 : ' + cNum);
		let userComm = event.target.closest('.userComment');
		
		// 대댓글 wrap 만들기 
		let reCommWrap = document.createElement('div');
		reCommWrap.classList.add('reComm-wrap');
		userComm.appendChild(reCommWrap);
		
		// 대댓글 작성 폼 보여주기
		let reCommBox = document.createElement('div');
		reCommBox.classList.add('reComm-box');
		reCommBox.innerHTML = '<textarea cols="50" rows="2" id="re-textarea" placeholder="답글을 입력해보세요!" />';
		reCommBox.innerHTML += '<input type="button" id="submit-reCommBtn" name='+ cNum +' value="등록하기" />';
		reCommWrap.appendChild(reCommBox);
		
		// 대댓글 입력을 위한 노드 추가  
		let reCommList = document.createElement('div');
		reCommList.classList.add('reComm-list');
		reCommWrap.appendChild(reCommList);
		
		
		
		// 해당 댓글의 대댓글 목록 가져오는 ajax 		
	 	 $.ajax({
				type: "post",
				url: "getReComments",
				data: {
					commentsClass:cNum,
				},
	         success: function (data) {
	         	console.log(data)
	         	
				for(var i=0; i<data.length; i++){
					// 대댓글 리스트 보여주기 
					let reCommList = document.createElement('div');
					reCommList.classList.add('reComm-list');
					let span = document.createElement('div');
					span.classList.add('userSpan');
					span.innerHTML = '<img src="${path}/resources/img/하이킹.PNG" id="commentUserPic"/>';
					span.innerHTML += '<div id="commentNickname">'+data[i].memberNickname +'</div>';
					span.innerHTML += '<div id="commRegdate">'+ data[i].commentsChangedRegdate +'</div></div>';
					
					let commContent = document.createElement('div');
					commContent.id = 'commContent';
					commContent.innerHTML += data[i].commentsContent;
					
					let editBtn = document.createElement('div');
					editBtn.classList.add('editBtn');
					editBtn.innerHTML += '<div id="delComm" onclick="delReComm('+data[i].commentsNum+')">삭제</div>'
					editBtn.innerHTML += '<div id="updateComm" onclick="changeTag('+data[i].commentsNum+')">수정</div>';
					
					reCommList.appendChild(span);
					reCommList.appendChild(commContent);
					reCommList.appendChild(editBtn);
					reCommWrap.appendChild(reCommList);
					userComm.appendChild(reCommWrap);
					console.log(userComm) 

					}
		        },
		        error: function(e) {
		        	  alert("대댓글 불러오기 오류" + e);
		        }
	     });  
	}
	
	
}





//댓글보기 클릭시 
function getComments(bNum){
	// 댓글 보기 접었다 펴기 
	boardNum = bNum;
	$showCommBtn = $(event.target);
	$showCommBtn.toggleClass('selected');
	let inlineContent = $showCommBtn.closest('.inlineContent');
	if(!$showCommBtn.hasClass('selected')){
		inlineContent.children('.commentBox').remove();
		inlineContent.children('.comments-wrap').remove();

	} else{
	
		//inlineContent 찾기 
	let pnode = event.target.closest('.inlineContent');
	console.log(pnode);
	
	// 댓글 입력 부분 
	let commBox = document.createElement('div');
	commBox.classList.add('commentBox');
	let write = document.createElement('div');
	write.classList.add('writeComment');

	
	write.innerHTML ='<textarea cols="80" rows="1" id="textArea" placeholder="댓글을 입력해보세요!"></textarea>';
	write.innerHTML += '<br> <input type="button" id="submitCommBtn" value="등록하기" onclick="insertComment('+ bNum +')" />';
	
	
	commBox.appendChild(write);
	pnode.appendChild(commBox);
	
	// 댓글이 없을 경우를 대비해 wrap을 하나 만들어준다 (없으면 댓글 0개일시 댓글 감소,증가가 안됨) 
	let wrap = document.createElement('div');
	wrap.classList.add('comments-wrap');
	pnode.appendChild(wrap);
	
	 $.ajax({
			type: "post",
			url: "getComments",
			data: {
				boardNum:bNum,
			},
         success: function (data) {
         	console.log(data)
         	
			for(var i=0; i<data.length; i++){
				// 댓글 리스트 
				 	let commWrap = document.createElement('div');
					commWrap.classList.add('comments-wrap');
					let comment = document.createElement('div');
		         	comment.classList.add("userComment");
		         	let span = document.createElement('div');
		         	span.classList.add("userSpan");
		         	span.innerHTML = '<img src="${path}/resources/img/하이킹.PNG" id="commentUserPic"/>';
		         	span.innerHTML += '<div id="commentNickname">'+ data[i].memberNickname +'</div>';
		         	span.innerHTML += '<div id="commRegdate">'+ data[i].commentsChangedRegdate +'</div>';
		         	/* span.innerHTML += '<img src="${path}/resources/img/down.png" id="dropdown"/>'; */
		         	comment.appendChild(span);
		         	comment.innerHTML += '<div id="commContent">'+ data[i].commentsContent +'</div></div>';
		         	
		         	// 댓글쓴이와 로그인 유저가 같은 사람이면 수정,삭제가 보임 
		         	if(data[i].memberNickname === userNickname){
			         	comment.innerHTML += '<div id="editBtn"><div id="delComm" onclick="deleteComment('+data[i].commentsNum+')">삭제</div>'
			         						+'<div id="updateComm" onclick="changeTag('+data[i].commentsNum+')">수정</div>'
			         						+'<div id="showReCommBtn" onclick="showReComments('+data[i].commentsNum+')">대댓글</div></div>';
			         	comment.innerHTML += '<div class="reComm-wrap"></div>';		
		         	} else {
		         		
			         	comment.innerHTML +='<div id="editBtn"><div id="showReCommBtn" onclick="showReComments('+data[i].commentsNum+')">대댓글</div></div>';
			         	comment.innerHTML += '<div class="reComm-wrap"></div>';
		         	}
		         	
		         	commWrap.appendChild(comment);
					pnode.appendChild(commWrap);
				}
	        },
	        error: function(e) {
	        	  alert("댓글 불러오기 오류" + e);
	        }
     });
	}
	
}


// 날짜형식 yyyy. mm. dd 시:분 으로 지정 
function getTime() {
    let today = new Date();
   	today = today.getFullYear() + "." 
    		+ (today.getMonth()+1)
    		+ "." + today.getDate() 
    		+ " " + ("00" + today.getHours()).slice(-2) 
    		+ ":" + ("00" + today.getMinutes()).slice(-2) 
    		+ ":" + ("00" + today.getSeconds()).slice(-2);
    return today;
}


// 댓글 등록 
function insertComment(bNum){
	return new Promise(function(resolve, reject){
		console.log(bNum)
		
		
		
		//let pnode = event.target.parentNode.parentNode.nextElementSibling;
		let pnode = event.target.closest('.commentBox').nextElementSibling;
		
		console.log(pnode);	//comments-wrap
		
		let area = event.target.parentNode.getElementsByTagName('textArea')[0];
		console.log(area)
		let content = area.value;
		area.value="";
		console.log(content);
		if(content=="" || content==" "){
			alert("내용을 입력해주세요!");
			return;
		}
		
		let today = getTime();
 		let writer = "";
			       $.ajax({
			        
						type: "post",
						url: "insertComment",
						data: {
							memberNum:mNum,
							boardNum:bNum,
							commentsContent:content,
							commentsRegdate:today,
						},
			            success: function (data) {
			            	console.log(data);
			            	writer = data.boardWriter;
			            	console.log("작성자 번호 : " + writer)
			            	// 분까지만 나타내기 
			            	today = today.split(':');
			            	
			            	let comment = document.createElement('div');
			            	let wrap = document.createElement('div');
			            	comment.classList.add("userComment");
			            	wrap.classList.add("comments-wrap");
			            	let span = document.createElement('div');
			            	span.classList.add("userSpan");
			            	span.innerHTML = '<img src="${path}/resources/img/하이킹.PNG" id="commentUserPic"/>';
			            	span.innerHTML += '<div id="commentNickname">'+ userNickname +'</div>';
			            	span.innerHTML += '<div id="commRegdate">'+ today[0]+':'+today[1] +'</div>';
			            	comment.appendChild(span);
			            	comment.innerHTML += '<div id="commContent">'+ data.commentsContent +'</div></div>';
			            //	comment.innerHTML += '<input type="hidden" id="hiddenNum" value="'+bNum+'" />';
			            	comment.innerHTML += '<div id="editBtn"><div id="delComm" onclick="deleteComment('+data.commentsNum+')">삭제</div>'
			            						+'<div id="updateComm" onclick="changeTag('+data.commentsNum+')">수정</div>'
			            						+'<div id="showReCommBtn" onclick="showReComments('+data.commentsNum+')">대댓글</div></div>';
			            	
			            //comments wrap에 가져온 comment 삽입 
			            	wrap.appendChild(comment);
			            	console.log(pnode);
			            	
			            // comments wrap을 inlineContent의 첫번째 노드로  삽입 
			            	console.log(pnode.parentNode);	// inlineContent
			           		 let inline = pnode.parentNode;
			         	  	 inline.insertBefore(wrap, inline.children[2]);
		                   	console.log("댓글 등록 성공");
		                   	alert("댓글이 등록되었습니다!"); 
		                   	
		               	 // 성공하면 댓글 개수 증가 
					  	 	let showBtn = pnode.parentNode.firstElementChild
					   		let count = showBtn.lastElementChild.lastElementChild;
		 					let calc = "+";
		 					changeCount(calc, count); 
		 					
		 					
		 					
		 					
							// 알림 저장 & 서버로 메세지 전송 
						
							let clubNum= '${boards[0].clubNum}';
		 					console.log('클럽번호 : ' + clubNum);
		 					
		 					let notMessage ="회원님의 게시글에 <b>" + userNickname + "</b>님이 새로운 댓글을 등록했어요!";
		 					let notType= "댓글";
		 					let notUrl = "${path}/viewMyContent?boardNum=" + bNum;
		 					  $.ajax({
		 					        
		 							type: "post",
		 							url: "insertCommNoti",
		 							data: {
		 								// 알림이 갈 대상 
		 								memberNum:writer,
		 								clubNum:clubNum,					
		 								boardNum:bNum,
		 								notType:notType,
		 								notMessage: notMessage,
		 								// 알림을 눌렀을 때 이동할 페이지 
		 								notUrl:notUrl	
		 							
		 							},
		 				            success: function (data) {
		 				            	// 서버로 알림 메시지 전송 
		 				            	sock.send(notType + "," + writer + "," + notMessage + "," + notUrl);
		 				            	
		 				            },
		 				            error: function(e) {
		 					        	  alert("알림 저장 오류" + e);
		 					        }
		 				        }); 

		               
				        },
				        error: function(e) {
				        	  alert("댓글 등록 오류" + e);
				        }
			        });  
			   }); 
			   	
 				
			}

			


	//수정하는 폼으로 바꾸기 
	function changeTag(cNum){
		let pnode = event.target.parentNode.previousElementSibling;	
		console.log(pnode);	//userSpan?
		
		// 수정할 텍스트 
		let text = pnode.innerText;
		console.log(text);
		let parent = pnode.parentNode;
		
		// div commContent 삭제 
		pnode.parentNode.removeChild(pnode);
		
		// textarea 만들고 수정할 텍스트 삽입 
		let area = document.createElement('textarea');
		area.innerText = text; 
		
		// textarea 속성 추가 
		area.setAttribute('cols','40');
		area.setAttribute('rows','2');
		area.setAttribute('id','editText');
	
		//textarea 삽입 
		let editBtn = event.target.parentNode;
		parent.insertBefore(area, editBtn);
	
		// 수정하기 버튼 삽입 
		editBtn.innerHTML = '<input type="button" id="editInput" value="수정하기" onclick="updateComment('+cNum+')"/>'; 
	
		
	}

//	수정하기 버튼을 클릭시 
function updateComment(cNum){
	let editBtn = event.target.parentNode;
	let userComm = editBtn.parentNode;
	console.log(editBtn)
	console.log(userComm)
	
	// 댓글 등록시간 tag 가져오기 
	let regdate = userComm.firstElementChild.lastElementChild;
	
	// 수정할 text 값 가져오기 
	let text = event.target.parentNode.previousElementSibling.value;
	
	//textarea 삭제하기
	let area = event.target.parentNode.previousElementSibling;
	area.parentNode.removeChild(area);


	// commContent div 생성, 추가 
	let commContent = document.createElement('div');
	commContent.setAttribute('id','commContent');
	commContent.innerHTML = text;
	userComm.insertBefore(commContent, editBtn);
	
	//수정, 삭제버튼으로 돌리기 
	console.log(editBtn.parentNode.className)
	console.log(userComm)
	
	if(editBtn.parentNode.className!=="reComm-list"){
		console.log("댓글의 버튼")
	editBtn.innerHTML = '<div id="delComm" onclick="deleteComment('+cNum+')">삭제</div>'
						+'<div id="updateComm" onclick="changeTag('+cNum+')">수정</div>'
						+'<div id="showReCommBtn" onclick="showReComments('+cNum+')">대댓글</div>';
	} else {
		console.log("대댓글의 버튼")
		editBtn.innerHTML = '<div id="delComm" onclick="deleteComment('+cNum+')">삭제</div>'
		+'<div id="updateComm" onclick="changeTag('+cNum+')">수정</div>';
	}
	
	
	let today = getTime();
	
		$.ajax({
			type: "post",
			url: "updateComment",
			data: {
				commentsNum:cNum,
				commentsContent:text,
				commentsRegdate:today,
			},
	     success: function (data) {
	     	console.log(data)
	        console.log("댓글수정완료");
	     	alert("댓글이 수정되었습니다!");
	     	
	     	// 수정한 시간으로 변경하여 표시 
	     	today = today.split(':');
	     	regdate.innerText = today[0]+':'+today[1];
	     },
	     error: function() {
	     	  alert("댓글 수정 오류");
	     }
	 }); 
		
}
			
//댓글 삭제 
	function deleteComment(cNum){
	let result = confirm("댓글을 삭제하시겠습니까?");
	let pnode = event.target.parentNode.parentNode 		//comments-wrap
	if(result){
	//let area  = pnode.previousElementSibling.getElementsByTagName('div')[0];
	
				$.ajax({
						type: "post",
						url: "deleteComment",
						data: {
							commentsNum:cNum,
						},
			  	          success: function (data) {
			            	console.log(data)
			            	if(data){
				            		console.log("댓글삭제완료");
				            		alert("댓글이 삭제되었습니다!");
				            		pnode.innerHTML="";
				            		// 댓글 개수 감소 
				            		console.log(pnode)
				            		let showBtn = pnode.parentNode.parentNode.firstElementChild.lastElementChild;
				            		console.log(showBtn)
				            		let count = showBtn.lastElementChild;	// a태그 
				            		let calc = "-";
				            		changeCount(calc, count); 
				            		
				            	} else {
				            		console.log("댓글삭제실패");
					      		}
				        },
				        error: function() {
				        	  alert("댓글 삭제 오류");
				        }
			        });
				
		}
	
	
	}
		
	
	// 댓글 개수 증가, 감소 메서드 
	function changeCount(calc, count){
			   afterCount = count.innerText.split('(');
		       console.log(afterCount)
		       afterCount = afterCount[1].split('개');
		       afterCount = afterCount[0];
		       console.log(afterCount)
		       afterCount = Number(afterCount);
		       
		if(calc==="+"){
		       afterCount = afterCount+1;
		       console.log(afterCount)
		       count.innerText = "댓글("+afterCount+"개)";
		       
		} else if(calc==="-"){
			  afterCount = afterCount-1;
		       console.log(afterCount)
		       
		       if(afterCount <= 0){
		    	   count.innerText = "댓글(0개)";
		       }
		       
		      	 count.innerText = "댓글("+afterCount+"개)";
		       
		}
		
	}
			



</script>
</html>