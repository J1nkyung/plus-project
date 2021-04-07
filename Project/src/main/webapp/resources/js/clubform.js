
function radioEvent(){
 let radioButtons = document.getElementsByName("optradio");
 console.log(radioButtons[0].value)
 console.log(radioButtons[1].value)
 let feeBox = document.querySelector(".clubfeeBox");
 let fee = document.getElementById("club-fee");
 if(radioButtons[0].checked){
    //무료 체크시 hide input 
     feeBox.style.display = 'none';
     fee.value = 0;
     
 } else if(radioButtons[1].checked){
     //유료 체크시 input 박스 보이기 
     feeBox.style.display = 'block';
     fee.value="";
 }
}

//버튼 클릭시 유효성 검사 후 제출 
function goSubmit(){
 //제목 유효성 체크 
 if (checkInput()){
     if(isNumber()){
         // document.getElementById('frm').submit();
         alert("모임 등록이 완료되었습니다!")
     } 
 }
 
}


//필수 입력란 검사 
function checkInput(){
 let title = document.getElementById("club-title");
 let fee = document.getElementById("club-fee");
 let max = document.getElementById("club-max");

 let date = document.querySelectorAll(".c-date");
 console.log(date.value)
 
     if(title.value == "" || fee.value == "" || max.value == "" || 
         date[0].value == "" || date[1].value == "" || date[2].value == "" ){
    	 
         // return은 코드를 더이상 실행하지 않고 돌려보내기 위한 구문.
         if(title.value == "" ){
             alert("제목을 입력해주세요!")
             return title.focus();
         } 

         if(fee.value == ""){
             alert("참가비를 입력해주세요!")
             return fee.focus();
         } 
         
         if(max.value == ""){
             alert("참가인원을 입력해주세요!")
             return max.focus()

         }

         for(var i=0; i<date.length; i++){
             if(date[i].value == ""){
                 alert("날짜를 입력해주세요!")
                 return date[i].focus()

             }
         }
     }
 return true;
}


//참가비, 참가인원 숫자만 입력하도록 검사 
function isNumber(){
 let fee = document.getElementById("club-fee");
 let max = document.getElementById("club-max");

 var regexp1= /^[0-9]\d{0,2}/g;
 var regexp2= /^[0-9]\d{0,6}/g;
 console.log(fee.value)

 if(!regexp2.test(fee.value)){
     alert("숫자만 입력 가능합니다!")
     return fee.focus();
 } 
 
 if(!regexp1.test(max.value)){
     alert("숫자만 입력 가능합니다!")
     return max.focus();
 }
 return true;
}


let valArray = new Array();

// 해시태그 스페이스바 / 엔터 입력시 등록 
function onKeyDown(){
    event.stopPropagation();
    if(event.keyCode == 32 || event.keyCode == 13)
    {       
        let hashtagBox = document.querySelector(".hashtag-wrap");
        let span = document.createElement('span');
        span.classList.add("label");
        span.classList.add("label-info");
        span.classList.add("hashbadge");
        hashtagBox.append(span);
        let input = document.querySelector("#write-hashtag");
        let value = checkValue(input)
        valArray.push(value);
        $(("#add-hashtag")).val(valArray);
        console.log(valArray)

        // delete를 위한 span 추가 
        let delSpan = document.createElement('span');
        // 띄어쓰기와 x 표시 
        delSpan.innerHTML = ' x';
        // id 부여 
        delSpan.id = "delTag";
        delSpan.style.cursor = "pointer";
        // #+태그값 형태로 text 추가 
        span.innerHTML = "# " + value;
        span.append(delSpan);

        input.value = null;
        checkQty();

     }
}

// hastag 지우기 위한 click event 추가 
document.addEventListener('click', function (e) {
    if (e.target && e.target.id == 'delTag') {
        let targetSpan = e.target.parentNode;
        targetSpan.parentNode.removeChild(e.target.parentNode);
        
        //삭제하려는 해쉬태그 span의 text 가져오기 
        let text = targetSpan.innerText;
        text = text.split(' ')
        console.log(text[1])
       
        // 해쉬태그 단어의 index를 찾아서 제거 
        valArray.splice(valArray.indexOf(text[1]),1);
        // 제거 후 array 다시 input에 넣기 
        $(("#add-hashtag")).val(valArray);
        
    }
});


//해시태그 개수 검사 
function checkQty(){
 let hashtagBox = document.querySelector(".hashtag-wrap");
 let cnt = hashtagBox.querySelectorAll(".hashbadge").length;
 if(cnt > 5){
     alert('hashtag는 5개까지 입력 가능합니다!');
     hashtagBox.removeChild(hashtagBox.children[cnt]);   
 }
 console.log(cnt);
}

//해시태그 입력값 유효성 검사 
function checkValue(input){
 let regexp = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>#@\$%&\\\=\(\'\"\s]/gi;
 let value = input.value
     if(regexp.test(value)){
         value = value.replace(regexp, "");
     }
 return value;
}

function changeDetail(){
 // let detail = document.getElementById('write-checkinfo');
 let selected = document.getElementById('select-kindbox');
 let intro = document.getElementById('intro');
 console.log(selected.value)
 console.log(intro.innerText)
 
 if(selected.value == 1 ){
     intro.innerText = "모임의 인증방법을 설명해주세요!";
 } else if (selected.value == 2 ){
     intro.innerText = "모임의 리더가 되고싶은 회원님은 어떤사람인가요?";
 }
}

$(function(){

 $('#shut-date').datepicker({
     calendarWeeks: false,
     todayHighlight: true,
     autoclose: true,
     format: "yyyy-mm-dd",
     startDate: '0d',
     endDate:'+1y',
     language: "ko"
 });

 $('#start-date').datepicker({
     calendarWeeks: false,
     todayHighlight: true,
     autoclose: true,
     format: "yyyy-mm-dd",
     startDate: '0d',
     endDate:'+1y',
     language: "ko"
 }).on('changeDate', function(selectedDate){
     if($('#start-date').val() < $('#shut-date').val()){
         $('#start-date').datepicker('setDate', new Date($('#shut-date').val()));
     }
 });


     $('#end-date').datepicker({
         calendarWeeks: false,
         todayHighlight: true,
         autoclose: true,
         format: "yyyy-mm-dd",
         startDate: '0d',
         endDate:'+1y',
         language: "ko"
     }).on('changeDate', function(selectedDate){
         if($('#end-date').val() < $('#start-date').val()){
             $('#end-date').datepicker('setDate', new Date($('#start-date').val()));
	        }
	    });
});
