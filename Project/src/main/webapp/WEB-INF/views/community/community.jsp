<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<title>커뮤니티</title>
<style>
body {
	font-size: 16px !important;
	background-color: #f5f4f4;
}

.communityContainer {
	margin: 0;
	width: 100%;
}

.inlineContent {
	width: 80%;
	padding: 3% 0 5% 0;
	display: flex;
	flex-direction: column;
	border: 1px solid rgba(0, 0, 0, 0.171);
	border-radius: 5px;
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
            padding-left: 4%;
            width: 70%;
            height: 30%;
            overflow: hidden;
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

#submitCommBtn {
	display: inline-block;
	padding: 10px 20px;
	color: #999;
	/* vertical-align: middle; */
	background-color: #fdfdfd;
	border: 0;
	cursor: pointer;
	border-radius: 5px;
	border: 1px solid #eee;
}

#commContent {
	margin: 0px 0px 20px 60px;
}

#commRegdate {
	margin-top: 10px;
	color: #6e7c7c;
	font-size: 12px;
}

#delComm, #updateComm {
	float: right;
	font-size: 15px;
	margin-right: 10px;
	cursor: pointer;
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
	margin: 50px 0 0 10px;
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
   background-color:lightgrey;
   color:#333;
   border-style:none;
   }

#boardRegdate{
           margin:32px;
        }
        
#dropdown {
	width: 15px;
	height: 15px;
	margin: 10px 0 0 300px;
	cursor: pointer;
}

   
.dropbtn {
  background-color:#f5f4f4;
  padding: 30px 16px 5px 16px;
  font-size: 16px;
  border: none;
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
.dropdowns a{
color:white;
}
.dropdowns a:hover{
color:white;
}
</style>
</head>
<body>
   <div class="communityContainer">
      <input type="button" name="boardForm" id="boardForm"
         onclick="location.href='${path}/insertBoardForm'" value="글쓰기">
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
                     <div id="boardRegdate">${board.boardRegDate}</div>

                     <c:set var="writer" value="${board.memberNum }" />
                     <c:if test="${writer eq user.memberNum}">

                        <div class="dropdowns">
                           <ul>
                              <li>
                                 <button class="dropbtn">
                                    <img id="dropmenu" src="${path }/resources/img/menu.png">
                                 </button>
                                 <ul>
                                    <button type="submit" id="btnUp">
                                       <a href="${path}/updateView?boardNum=${board.boardNum}">수정</a>
                                    </button>
                                    <button type="submit" id="btnDel">
                                       <a href="${path}/deleteBoard?boardNum=${board.boardNum}">삭제</a>
                                    </button>
                                 </ul>
                              </li>
                           </ul>
                        </div>
                     </c:if>

                  </div>
                  <div class="certification">
                     <div id="certificationPic">
                        <img src="${board.boardPic}"
                           onerror="this.style.display='none';" style="height: 70%;">
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


$(function(){


});

let userNickname = '${user.memberNickname}';


//댓글보기 클릭시 
function getComments(bNum){
	// 댓글 보기 접었다 펴기 
	$("#showCommBtn").toggleClass('selected');
	if(!$("#showCommBtn").hasClass('selected')){
		$('.commentBox').remove();		
		$('.comments-wrap').remove();		
	} else{
	
	let pnode = event.target.parentNode.parentNode.parentNode;
	// contentBox
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
		         						+'<div id="updateComm" onclick="changeTag('+data[i].commentsNum+')">수정</div></div>';
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
	console.log(bNum)
	
	
	let pnode = event.target.parentNode.parentNode.nextElementSibling;
	console.log(pnode);	//comments-wrap
	
	let area = event.target.parentNode.getElementsByTagName('textArea')[0];
	console.log(area)
	let content = area.value;
	area.value="";
	console.log(content);
	
	let today = getTime();
    console.log(today);
    
    console.log(pnode.parentNode)
 	
			       //  return new Promise(function(resolve, reject){
			       $.ajax({
						type: "post",
						url: "insertComment",
						data: {
							memberNum:2,
							boardNum:bNum,
							commentsContent:content,
							commentsRegdate:today,
						},
			            success: function (data) {
			            	
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
			            	comment.innerHTML += '<div id="editBtn"><div id="delComm" onclick="deleteComment('+data.commentsNum+')">삭제</div>'
			            						+'<div id="updateComm" onclick="changeTag('+data.commentsNum+')">수정</div></div>';
			            	
			            //comments wrap에 가져온 comment 삽입 
			            	wrap.appendChild(comment);
			            	console.log(pnode);
			            	
			            // comments wrap을 inlineContent의 첫번째 노드로  삽입 
			            	console.log(pnode.parentNode);	// inlineContent
			           		 let inline = pnode.parentNode;
			         	  	 inline.insertBefore(wrap, inline.children[2]);
		                   	console.log("댓글 등록 성공");
		                   	alert("댓글이 등록되었습니다!"); 
		               
				        },
				        error: function(e) {
				        	  alert("댓글 등록 오류" + e);
				        }
			        });  
		//    }); 
			   		 // 댓글 개수 증가 
			  	 	let showBtn = pnode.parentNode.firstElementChild
			   		let count = showBtn.lastElementChild.lastElementChild;
 					let calc = "+";
 					changeCount(calc, count); 
 				
			}
			
			


	//수정하는 폼으로 바꾸기 
	function changeTag(cNum){
		let pnode = event.target.parentNode.previousElementSibling;	
		
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
	editBtn.innerHTML = '<div id="delComm" onclick="deleteComment('+cNum+')">삭제</div>'
						+'<div id="delComm" onclick="changeTag('+cNum+')">수정</div>';
						
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
				            		
				            	} else {
				            		console.log("댓글삭제실패");
					      		}
				        },
				        error: function() {
				        	  alert("댓글 삭제 오류");
				        }
			        });
				
		}
	
		// 댓글 개수 감소 
		console.log(pnode)
		let showBtn = pnode.parentNode.parentNode.firstElementChild.lastElementChild;
		console.log(showBtn)
		let count = showBtn.lastElementChild;	// a태그 
		console.log(count.lastElementChild)
		let calc = "-";
		changeCount(calc, count); 
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
			


	
	
	
	/*		
			// 알림 
			function plusCurnum(){
				   return new Promise(function(resolve, reject){
			          	$.ajax({
						type: "post",
						url: "plusCurnum", 
						data: {
						},
			            success: function (data) {
			            	console.log(data);
			            
				        }
			        });
			      });
			}
			
			function successFunc(){
				console.log("promise 성공");
			}
			
			  function errorFunc() {
	            	 console.log("promise error");
	           } */

</script>
</html>