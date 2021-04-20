<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>HeartPage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.wrap {
	height : auto !important;
}

/* 진경 추가 */
.fixed-top {
	position: sticky;
}

.heartContainer {
	margin: 0;
	width: 1140px;
	margin-left: 7%;
	/*  position: absolute; */
}

#heartTitle {
	margin: 4% 6%;
}

.heartTab {
	padding: 10px;
	background: #ffffff;
	margin-bottom: 10%;
}

.heartTab section {
	display: none;
	padding: 20px 0 0;
}

input[class="tabs"] {
	display: none;
}

label[class="tabs"] {
	display: inline-block;
	padding: 15px 25px;
	margin-left: 3%;
	font-weight: 600;
	color: #007bff;
	border: 1px solid transparent;
	font-size: 20px;
}

label:hover {
	color: #2C2C96;
	cursor: pointer;
}

.heartTab .tabs input:checked+label {
	color: #555;
	border: 1px solid #ddd;
	border-top: 2px solid #2e9cdf;
	/* border-bottom: 3px solid red; */
}

.heartTab #tab1:checked ~#heartContent1, .heartTab #tab2:checked ~#heartContent2
	{
	display: block;
}

div {
	display: block;
}

#totalDiv {
	width: 80%;
	margin-left: 79%;
}

.card {
	width: 350px;
}

#cardPadding {
	display: inline-block;
	padding: 2% 5% 5% 5%;
}

.card-body h4 {
	font-weight: bold;
}

.inputT {
	width: 21px;
	height: 21px;
}

.inputB {
	width: 26px;
	height: 26px;
}

.apply_Btn {
	float: right;
	margin-right: 8%;
	margin-left: 3%;
	margin-bottom: 10%;
	width: 24%;
}

.apply_Btn input {
	color: #fff;
	border-color: #007bff;
	padding: 5%;
	color: #fff;
	background-color: #007bff;
	border-radius: 7%;
	border-style: none;
	margin-left: 4%;
}

.heartTab hr {
	width: 83%;
	margin: 0;
	padding: 0;
	padding-left: 4%;
}

.badge {
	display: inline-block;
	padding: .30em .15em;
	font-size: 100%;
	font-weight: 700;
	line-height: 1;
	text-align: center;
	white-space: nowrap;
	vertical-align: baseline;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.card:hover {
	background-color: #eee;
}

table {
	border-collapse: collapse;
}

#noHeartDiv {
	width: 87%;
	height: 100%;
	border: 2px solid #eee;
	box-shadow: 0.5px 0.5px 0.5px 0.5px #8299d841;
	padding: 5.9%;
	font-size: 20px;
	text-align: center;
}

.card-img-top {
	width: 100%;
	border-top-left-radius: calc(.25rem - 1px);
	border-top-right-radius: calc(.25rem - 1px);
	/* width: 100%; */
	height: 250px;
}
</style>
<script>

	if (getCookie("categoryTab") != '') {
		if (getCookie("categoryTab") == 'one') {
			$('input:radio[name=tabs]:input[value=one]').attr("checked", true);
		} else if (getCookie("categoryTab") == 'two') {
			$('input:radio[name=tabs]:input[value=two]').attr("checked", true);
		}
	} else {
		setCookie("categoryTab", "one");
		$('input:radio[name=tabs]:input[value=one]').attr("checked", true);
	}
	
	var setCookie = function(name, value) {
	    document.cookie = name + '=' + value + ';path=/';
	};
	
	var getCookie = function(name) {
	    var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	    return value? value[2] : null;
	};

	var temp = $(':radio[name="tabs"]:checked').val();
	//if(temp ==null ){
	//	$('input:radio[name=tabs]:input[value=one]').attr("checked", true);
	
	$('input:radio[name=tabs]').on("click", function(){
		if (temp == 'one') {
			setCookie("categoryTab", "one");
			$('input:radio[name=tabs]:input[value=one]').attr("checked", true);
		} else {
			setCookie("categoryTab", "one");
s			$('input:radio[name=tabs]:input[value=two]').attr("checked", true);
		}
	});
	
</script>
</head>

<body>
	<div class="heartContainer">
		<h1 id="heartTitle">나의 찜목록</h1>
		<div class="heartTab" style="text-align: left">
			<input class="tabs" id="tab1" type="radio" name="tabs" value="one">
			<label for="tab1" class="tabs">신청 가능한 더하기</label> <input class="tabs"
				id="tab2" type="radio" name="tabs" value="two"> <label for="tab2"
				class="tabs">결제 가능한 더하기</label>
			<hr>

			<section id="heartContent1" style="margin-bottom: 20px;">
				<div id="totalDiv">
					<table>
						<tr>
							<td><input type="checkbox" class="inputT" id="totalBtn"
								checked></td>
							<td><label for="totalBtn">전체선택</label></td>
						</tr>
					</table>
				</div>
				<c:if test="${ empty selectFreeClub }">
					<p id="noHeartDiv">찜한 모임이 없습니다.🐾
					<p>
				</c:if>
				<div id="fBoxes">
					<c:forEach var="freeclub" items="${selectFreeClub}">
						<div id="cardPadding">
							<input type="checkbox" class="inputB" id="card1" name="clubNum"
								value="${freeclub.clubNum}" /><br> <label for="card">
								<div class="card"
									onclick="location.href='getClub?clubNum=${freeclub.clubNum}'">
									<img class="card-img-top"
										src="${path}/resources${freeclub.clubMain_Pic}"
										onerror="this.onerror=null; this.src='${path}/resources/img/goal.PNG'" />
									<div class="card-body">
										<h4 class="card-title">${freeclub.clubName }</h4>
										<p class="card-text">📆모임기간 : ${freeclub.clubStartDate} ~
											${freeclub.clubEndDate}</p>
										<div class="alreadyApply">
											<p>
												<c:if test="${not empty checkApplyClub }">
													<c:forEach var="check" items="${checkApplyClub }">
														<c:if test="${check.clubNum eq freeclub.clubNum}">
															<span class="badge badge-danger" id="alreadyApplyBadge">이미
																신청한 모임</span>
														</c:if>
													</c:forEach>
												</c:if>
												<span class="badge badge-primary">${freeclub.clubFreq}</span>
											</p>
										</div>
									</div>
								</div>
							</label>
						</div>
					</c:forEach>
				</div>
				<div class="apply_Btn">
					<input type="button" onclick="deleteHeart()" id="applyBtn"
						value="삭제하기" /> <input type="button" onclick="applyFreeClub()"
						id="applyBtn" value="신청하기" />
				</div>

				<!--fBoxes end-->
			</section>
			<section id="heartContent2" style="margin-bottom: 20px;">
				<form action="applyPayClub" method="post" id="applyPayClubForm">
					<input type="hidden" id="clubNumArr" name="clubNumArr" />
					<%-- <input type="hidden" id="clubLeader" name="clubLeader" value="${clubLeader}"/> --%>
				</form>
				<div id="totalDiv">
					<table>
						<tr>
							<td><input type="checkbox" class="inputT" id="totalBtn2"
								checked></td>
							<td><label for="totalBtn2">전체선택</label></td>
						</tr>
					</table>
				</div>
				<c:if test="${ empty selectNoFreeClub }">
					<p id="noHeartDiv">찜한 모임이 없습니다.🐾
					<p>
				</c:if>
				<div id="fBoxes">

					<c:forEach var="nofreeclub" items="${selectNoFreeClub}">
						<div id="cardPadding">
							<input type="checkbox" class="inputB" id="card2" name="clubNum"
								value="${nofreeclub.clubNum}"><br> <label
								for="card">
								<div class="card" onclick="location.href='getClub?clubNum=${nofreeclub.clubNum}'">
									<img class="card-img-top" alt="Card image"
										src="${path}/resources${nofreeclub.clubMain_Pic}"
										onerror="this.onerror=null; this.src='${path}/resources/img/goal.PNG'"
										style="width: 100%" />
									<div class="card-body">
										<h4 class="card-title">${nofreeclub.clubName }</h4>
										<input type="hidden" name="clubName"
											value="${nofreeclub.clubName }" />
										<p class="card-text">📆모임기간 : ${nofreeclub.clubStartDate}
											~ ${nofreeclub.clubEndDate}</p>
										<c:if test="${not empty checkApplyClub }">
											<c:forEach var="check" items="${checkApplyClub }">
												<c:if test="${check.clubNum eq nofreeclub.clubNum}">
													<span class="badge badge-danger">이미 신청한 모임</span>
												</c:if>
											</c:forEach>
										</c:if>
										<span class="badge badge-primary">${nofreeclub.clubFreq}</span>
									</div>
								</div>
							</label>
						</div>
					</c:forEach>
				</div>
				<div class="apply_Btn">
					<input type="button" onclick="deleteHeart()" id="applyBtn"
						value="삭제하기" /> <input type="button" onclick="applyPayClub()"
						id="applyBtn" value="결제하기" />
				</div>

			</section>
		</div>
	</div>
	</div>
	<!-- 아래 임포트 src는 badge 부트스트랩 js  -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script src="${path}/resources/js/jquery-1.12.4.min.js"></script>
	<script>
		var $totalBtn = $('#heartContent1 #totalBtn');
		$totalBtn.attr('checked', false);
		$totalBtn.change(function() {
			var $this = $(this);
			var checked = $this.prop('checked'); // checked 문자열 참조(true, false)
			$('#heartContent1 input[id="card1"]').prop('checked', checked);
		});

		var $totalBtn2 = $('#heartContent2 #totalBtn2');
		$totalBtn2.attr('checked', false);
		$totalBtn2.change(function() {
			var $this = $(this);
			var checked = $this.prop('checked'); // checked 문자열 참조(true, false)
			$('#heartContent2 input[id="card2"]').prop('checked', checked);
		});

		function applyFreeClub() {


				var param = [];// 변수 값 생성 
				// 체크 된 체크박스 name 값을 가져와 그 안의 value를 배열에 넣어줌 
				$("input[name='clubNum']:checked").each(function(i) { // input의 name이 clubNum 인 값들이 체크 되면 
					param.push($(this).val()); //배열에 값을 추가함. this의 value 값을 추가. 
				});

				console.log(param);

				$.ajax({
					url : 'applyFreeClub',
					type : 'post',
					traditional : true,
					/* contentType: 'application/json' // 보내는 데이터 json 일때 필수 옵션 */
					/*dataType : 'json',*/
					data : {
						'clubNumArr' : param
					},
					success : function(result) {
						console.log(result)
						alert(result);
						location.reload();
					},
					error : function() {
						alert("error")
					}
				});
		};

		function applyPayClub() {
			var param = [];
			$("input[name='clubNum']:checked").each(function(i) {
				param.push($(this).val()); //배열에 값을 추가함. this의 value 값을 추가.
			});

			$("#clubNumArr").val(param);
			
			$.ajax({
				url : 'checkPayYn',
				type : 'post',
				traditional : true,
				data : {
					'clubNumArr' : param
				},
				success : function(result) {
					console.log(result);
					if (result == 'applyAvailable') {
						window.open("applyPayClub?clubNumArr="+param,
		      	                "결제하기", "width=400, height=450, left=400, top=100");
					} else {
						alert(result);
						location.reload();
					}
				},
				error : function() {
					alert("error")
				}
			});
		}

		if ('${msg}' != '') {
			alert('${msg}');
		}

		function deleteHeart() {
			var param = [];// 변수 값 생성 
			var memberNum = ${user.memberNum};
			// 체크 된 체크박스 name 값을 가져와 그 안의 value를 배열에 넣어줌 
			$("input[name='clubNum']:checked").each(function(i) { // input의 name이 clubNum 인 값들이 체크 되면 
				param.push($(this).val()); //배열에 값을 추가함. this의 value 값을 추가. 
			});

			$.ajax({
				url : 'deleteHeart',
				type : 'post',
				traditional : true,
				/* contentType: 'application/json' // 보내는 데이터 json 일때 필수 옵션 */
				/* dataType : 'json', */
				data : {
					'clubNumArr' : param,
					'memberNum' : memberNum
				},
				success : function(result) {
					console.log(result)
					alert(result);
					location.reload();
				},
				error : function() {
					alert("error")
				}
			});
		}
		
		
		//1.체크된 radio value값 가져오기
		/* var temp = $(':radio[name="tabs"]:checked').val();
		if(temp ==null ){
			$('input:radio[name=tabs]:input[value=one]').attr("checked", true);
		} else{
			$('input:radio[name=tabs]:input[value=two]').attr("checked", true);
		} */
		//2. radio 값 체크하기
		


	</script>

</body>

</html>