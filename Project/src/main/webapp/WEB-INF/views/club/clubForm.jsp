<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 등록</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${path}/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="${path}/resources/css/clubform.css">
</head>
<header></header>
<section>

	<form action="insertClub" enctype="multipart/form-data" method="post" id="frm" name="insertform">
		<div class="selection">
			<div class="select-kind">
				<label for="exampleFormControlSelect2">더하기 종류</label> <select
					class="form-control" id="select-kindbox" name="clubKind"
					onchange="changeDetail()">
					<option value="1">가치더하기</option>
					<option value="2">도움더하기</option>
				</select>
			</div>
			<div class="select-onoff">
				<label for="exampleFormControlSelect2">온라인/오프라인</label> <select
					class="form-control" name="clubOnOff">
					<option value="온라인">온라인</option>
					<option value="오프라인">오프라인</option>
				</select>
			</div>
			<div class="category">
				<label for="exampleFormControlSelect2">카테고리 선택</label> <select
					class="form-control" name="clubCategory">
					<option value="운동">운동</option>
					<option value="공부">학습</option>
					<option value="습관">습관</option>
					<option value="취미">취미</option>
				</select>
			</div>
		
		</div>
		
		<label for="exampleFormControlFile1">모임의 제목을 입력해주세요</label> <input
			type="text" maxlength='16' class="form-control" id="club-title" autocomplete="off"
			placeholder="최대 16글자로 입력해주세요" name="clubName">

		<div class="form-group">
			<label for="exampleFormControlFile1">모임 프로필 사진 업로드</label>
			<div class="uploadBox">
				<label class="btn btn-info btn-sm uploadBtn"> 파일 선택 
				<input type="file" class="inputs"  style="display: none;" name="upload"
					onchange="getFileName(0); changeImg(0);" />
				</label> <span id="spanFileName[0]"></span>
				<button type="button" class="removeBtn" onclick="deleteFile(0)">x</button>
							<!-- 이미지 미리보기 영역  -->
				<div class="imgViewArea" style="margin-top:10px; display:none;">
					<img class="imgArea" style="width:200px; height:100px;" onerror="this.style.display='none';" /></div>
				</div>
		</div>
		<article>
			<div id="write-clubinfo">
				<label for="exampleFormControlFile1">개설하고자 하는 모임의 성격을
					설명해주세요!</label>
				<textarea name="clubContent1" placeholder="사진과 글로 모임을 자세히 소개해보세요."></textarea>
				<div class="uploadBox">
					<label class="btn btn-info btn-sm uploadBtn"> 파일 선택 
					<input type="file"  class="inputs" style="display: none;" name="upload" onchange="getFileName(1); changeImg(1);" />
					</label> <span id="spanFileName[1]"></span>
					<button type="button" class="removeBtn" onclick="deleteFile(1)">x</button>
									<!-- 이미지 미리보기 영역  -->
					<div class="imgViewArea" style="margin-top:10px; display:none;" >
						<img class="imgArea" style="width:200px; height:100px;" onerror="this.style.display='none';" /></div>
				</div>
			</div>
			<div id="write-checkinfo">
				<label for="exampleFormControlFile1" id="intro">모임의 인증방법을
					설명해주세요!</label>
				<textarea name="clubContent2" id="clubContent2" placeholder="모두가 실천할 수 있도록 구체적인 인증방법을 작성해주세요."></textarea>
				<div class="uploadBox">
					<label class="btn btn-info btn-sm uploadBtn"> 파일 선택 
					<input type="file" class="inputs" style="display: none;" name="upload"
						onchange="getFileName(2); changeImg(2);" />
					</label> <span id="spanFileName[2]"></span>
					<button type="button" class="removeBtn" onclick="deleteFile(2)">x</button>
									<!-- 이미지 미리보기 영역  -->
				<div class="imgViewArea" style="margin-top:10px; display:none;" >
					<img class="imgArea" style="width:200px; height:100px;" onerror="this.style.display='none';" /></div>
				</div>
			</div>
			<div class="hashtag-wrap">

				<input type="text" class="form-control" id="write-hashtag" autocomplete="off"
					onkeypress="onKeyDown()" maxlength='10'
					placeholder="해쉬태그를 입력해주세요! (최대 5개)"> 
				<input type="text" style="display:none" id="add-hashtag" name="clubHashtag" />
				<!-- append hashtag -->

			</div>
		</article>
</section>
<aside>

	<div class="clubinfo-form">
		<div class="location" >
		<label for="exampleFormControlSelect2">모임위치</label><br> 
		<p id=location-content><img src="${path}/resources/img/mapicon.png"> 마커를 움직여 모임의 위치를 등록해주세요.</p>
<div id="map" style="width:450px;height:300px;"></div>

</div>
	
	
		<label for="exampleFormControlSelect2">모집 종료일 </label>
		<div class="clubdate">
			<img class="calanderimg" src="${path}/resources/img/calendar.png" />
			<input type="text" class="form-control c-date" id="shut-date"  autocomplete="off"
				name="clubShutDate" />
		</div>
		<label for="exampleFormControlSelect2">모임 진행 기간 </label>
		<div class="form-row">
			<div class="col">
				<div class="clubdate">
					<img class="calanderimg" src="${path}/resources/img/calendar.png" />
					<input type="text" class="form-control c-date" id="start-date"  autocomplete="off"
						name="clubStartDate" />
				</div>
			</div>
			<div id="tilde">~</div>
			<div class="col">
				<div class="clubdate">
					<img class="calanderimg" src="${path}/resources/img/calendar.png" />
					<input type="text" class="form-control c-date" id="end-date"  autocomplete="off"
						name="clubEndDate" autocomplete="off" />
				</div>
			</div>
		</div>
		<div class="people">
			<label for="exampleFormControlSelect2">참가인원</label> <input
				type="text" class="form-control" maxlength="2" placeholder="최대 50명" autocomplete="off"
				id="club-max" name="clubMax">
		</div>


		<div class="freq">
			<label for="exampleFormControlSelect2">모임주기</label> <select
				class="form-control" name="clubFreq">
				<option value="주1회">주 1회</option>
				<option value="주2회">주 2회</option>
				<option value="주3회">주 3회</option>
				<option value="주4회">주 4회</option>
				<option value="주5회">주 5회</option>
				<option value="주6회">주 6회</option>
				<option value="주7회">주 7회</option>
			</select>
		</div>
		<div class="radioBtn">
			<label class="radio-inline"><input type="radio"
				name="optradio" value="free" onclick="radioEvent()">무료</label> <label
				class="radio-inline"><input type="radio" name="optradio"
				value="pay" onclick="radioEvent()">유료</label>
		</div>
		<div class="clubfeeBox">
			<label for="exampleFormControlSelect2">참가비용</label> <input
				type="text" class="form-control" id="club-fee" name="clubFee"  autocomplete="off"
				maxlength="6" >
		</div>
		<button type="button" class="btn" id="applyBtn" onclick="goSubmit()">등록하기</button>
	</div>
<input type="hidden" name="clubLatitude" id="club-lat" value=""></input>
<input type="hidden" name="clubLongitude" id="club-lng" value=""></input> 
<input type="hidden" name="clubLeader" value="${user.memberNickname}"></input> 

</form>
</aside>
<footer></footer>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="${path}/resources/js/bootstrap-datepicker.js"></script>
<script src="${path}/resources/js/bootstrap-datepicker.ko.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54bd0b6b843cae2c7eb4621d80f301a4"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA14FclHyP6uY1AXC81jP9ZEsnWKEn-nYE"></script>
<script>

var lat2=0;
var lng2=0;

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨 
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도

        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px" width:10px";>현재위치</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
    var marker = new kakao.maps.Marker({ 
        // 지도 중심좌표에 마커를 생성합니다 
        position: map.getCenter() 
    }); 
    // 지도에 마커를 표시합니다
    marker.setMap(map);

  
    // 지도에 클릭 이벤트를 등록합니다
    // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
        
        // 클릭한 위도, 경도 정보를 가져옵니다 
        var latlng = mouseEvent.latLng; 
    
        // 마커 위치를 클릭한 위치로 옮깁니다
        marker.setPosition(latlng);

        // 클릭한 위치의 위도 경도를 담아
        var lat2 = latlng.getLat();
        var lng2 = latlng.getLng();
     
        // formname.inputname.value로 변수를 넣는다.
        document.insertform.clubLatitude.value=lat2;
        document.insertform.clubLongitude.value=lng2;

    });

} else { 
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = '위치추적이 허용되지 않은 브라우저입니다.'
        
    displayMarker(locPosition, message);
}

    // 현재 위치를 나타내는 마커 이미지 변경하기
    function displayMarker(locPosition, message) {

var imageSrc ="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
    imageSize = new kakao.maps.Size(28, 40), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(14, 30)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition =locPosition// 마커가 표시될 위치입니다
   
    var marker = new kakao.maps.Marker({
        map:map,
        position: markerPosition, 
        image: markerImage // 마커이미지 설정 
    });

    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 말풍선
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 말풍선을 마커 위에 나타낸다.
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}   

  <!------------지도 끝----------->
  
  function changeImg(index){
	 console.log("몇번쨰? " + index)
	 let inputs = document.getElementsByClassName('inputs');
		 console.log(inputs[index])
		let target = inputs[index];
		 // 파일이 없으면 
		if(target.value == '' ) {
			// 이미지 소스 없애기 
			$('.imgArea:eq('+index+')').attr('src' , '');  
		}
		// 미리보기 영역 없애기
		$('.imgViewArea:eq('+index+')').css({ 'display' : '' });
		readURL(target, index);
		
  }
  
  
  // 모임 프로필 이미지 미리보기 
	function readURL(input, i) {
	  console.log(input)
		if (input.files && input.files[0]) {
	 		 console.log(input.files[0].name)
			var reader = new FileReader();
			reader.onload = function(e) {
				$('.imgArea:eq('+i+')').attr('src', e.target.result); 
			}
			reader.readAsDataURL(input.files[0]);
		}
	}


  
	//파일 선택시 파일이름 변경 
	function getFileName(index) {
		let fileNameSpan = document.getElementById('spanFileName[' + index
				+ ']')
		let name = $('input[type=file]')[index].files[0].name
		fileNameSpan.innerText = ""
		$(fileNameSpan).append(name);
	}

	//파일 삭제
	function deleteFile(index) {
		let fileNameSpan = document.getElementById('spanFileName[' + index
				+ ']')
		let fileOne = document.getElementById('spanFileName['+index+']');
		let nameArr = document.getElementsByName('upload');
		fileNameSpan.innerText = ""
		nameArr[index].value = "";
		$('.imgViewArea:eq('+index+')').css({ 'display' : 'none' });
		
	}

	//버튼 클릭시 유효성 검사 후 제출 
	function goSubmit() {
		//제목 유효성 체크 
		if (checkInput()) {
			if (isNumber()) {
				if (compareDate()) {
					document.getElementById('frm').submit();
					alert("모임 등록이 완료되었습니다!")
					}
				}
			}
		}

	//필수 입력란 검사 
	function checkInput() {
		let fee = document.getElementById("club-fee");
		let max = document.getElementById("club-max");
		let title = document.getElementById("club-title");
		let date = document.querySelectorAll(".c-date");
		
		/*  if(title && fee && max){
		 console.log("존재 ")  */
		if (title.value == "" || fee.value == "" || max.value == ""
				|| date[0].value == "" || date[1].value == ""
				|| date[2].value == "") {

			// return은 코드를 더이상 실행하지 않고 돌려보내기 위한 구문.
			if (title.value == "") {
				alert("제목을 입력해주세요!")
				return title.focus();
			}

			if (fee.value == "") {
				alert("참가비를 입력해주세요!")
				return fee.focus();
			}

			if (max.value == "") {
				alert("참가인원을 입력해주세요!")
				return max.focus()

			}

			for (var i = 0; i < date.length; i++) {
				if (date[i].value == "") {
					alert("날짜를 입력해주세요!")
					return date[i].focus()

				}
			}

		}
		return true;

	}

	function compareDate() {
		let shutDate = new Date($('#shut-date').val());
		let startDate = new Date($('#start-date').val());
		console.log(shutDate < startDate);

		if (shutDate > startDate) {
			alert("모집 날짜와 모임 날짜를 다시 확인해주세요!");
			return false;
		}
		return true;
	}

	//참가비, 참가인원 숫자만 입력하도록 검사 
	function isNumber() {
		let fee = document.getElementById("club-fee");
		let max = document.getElementById("club-max");

		var regexp1 = /^[0-9]\d{0,2}/g;
		var regexp2 = /^[0-9]\d{0,6}/g;

		if (!regexp2.test(fee.value)) {
			alert("숫자만 입력 가능합니다!")
			return fee.focus();
		}

		if (!regexp1.test(max.value)) {
			alert("숫자만 입력 가능합니다!")
			return max.focus();
		}

		return true;
	}

	function radioEvent() {
		let feeBox = document.querySelector(".clubfeeBox");
		let fee = document.getElementById("club-fee");
		let radioButtons = document.getElementsByName("optradio");
		console.log(radioButtons[0].value)
		console.log(radioButtons[1].value)

		if (radioButtons[0].checked) {
			//무료 체크시 hide input 
			fee.value = 0;
			feeBox.style.display = 'none';

		} else if (radioButtons[1].checked) {
			//유료 체크시 input 박스 보이기 
			fee.value = "";
			feeBox.style.display = 'block';
		}

	}

	let valArray = new Array();

	// 해시태그 스페이스바 / 엔터 입력시 등록 
	function onKeyDown() {
		event.stopPropagation();
		if (event.keyCode == 32 || event.keyCode == 13) {
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
	document.addEventListener('click', function(e) {
		if (e.target && e.target.id == 'delTag') {
			let targetSpan = e.target.parentNode;
			targetSpan.parentNode.removeChild(e.target.parentNode);

			//삭제하려는 해시태그 span의 text 가져오기 
			let text = targetSpan.innerText;
			text = text.split(' ')
			console.log(text[1])

			// 해쉬태그 단어의 index를 찾아서 제거 
			valArray.splice(valArray.indexOf(text[1]), 1);
			// 제거 후 array 다시 input에 넣기 
			$(("#add-hashtag")).val(valArray);

		}
	});

	//해시태그 개수 검사 
	function checkQty() {
		let hashtagBox = document.querySelector(".hashtag-wrap");
		let cnt = hashtagBox.querySelectorAll(".hashbadge").length;
		if (cnt > 5) {
			alert('hashtag는 5개까지 입력 가능합니다!');
			hashtagBox.removeChild(hashtagBox.children[cnt]);
		}
		console.log(cnt);
	}

	//해시태그 입력값 유효성 검사 
	function checkValue(input) {
		let regexp = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>#@\$%&\\\=\(\'\"\s]/gi;
		let value = input.value
		if (regexp.test(value)) {
			value = value.replace(regexp, "");
		}
		return value;
	}


	function changeDetail() {
		// let detail = document.getElementById('write-checkinfo');
		let selected = document.getElementById('select-kindbox');
		let intro = document.getElementById('intro');
		let placeHolder =  document.getElementById('clubContent2');
		
		if (selected.value == 1) {
			intro.innerText = "모임의 인증방법을 설명해주세요!";
			placeHolder.placeholder = "모두가 실천할 수 있도록 구체적인 인증방법을 작성해주세요."
		} else if (selected.value == 2) {
			intro.innerText = "모임의 리더가 되고싶은 회원님은 어떤사람인가요?";
			placeHolder.placeholder = '모임원들에게 멋진 자기소개를 해보세요!';
		}

	}

	$(function() {

		$('#shut-date').datepicker({
			calendarWeeks : false,
			todayHighlight : true,
			autoclose : true,
			format : "yyyy-mm-dd",
			startDate : '0d',
			endDate : '+1y',
			language : "ko"
		});

		$('#start-date').datepicker({
			calendarWeeks : false,
			todayHighlight : true,
			autoclose : true,
			format : "yyyy-mm-dd",
			startDate : '0d',
			endDate : '+1y',
			language : "ko"
		}).on(
				'changeDate',
				function(selectedDate) {
					if ($('#start-date').val() < $('#shut-date').val()) {
						$('#start-date').datepicker('setDate',
								new Date($('#shut-date').val()));
					}
				});

		$('#end-date').datepicker({
			calendarWeeks : false,
			todayHighlight : true,
			autoclose : true,
			format : "yyyy-mm-dd",
			startDate : '0d',
			endDate : '+1y',
			language : "ko"
		}).on(
				'changeDate',
				function(selectedDate) {
					if ($('#end-date').val() < $('#start-date').val()) {
						$('#end-date').datepicker('setDate',
								new Date($('#start-date').val()));
					}
				});
	});
</script>
</html>