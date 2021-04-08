<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/expert.css">

<!-- 구글 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <!-- 나눔폰트 -->
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

<title>같이하는 즐거움 가치더하기</title>
</head>

<body>
	<!-- 배너너ㅓ -->

    
	  <div class="mainbanner">
        <img 
         src="${path}/resources/img/plus1.png"
         alt="First slide"> 
         <div class="bannercontent2">
 <h1>가치더하기</h1>
<h4>같은 목표를 가진 사람들과 함께하는 가치더하기</h4>
<h4>사소하거나 혼자선 힘든 일도 같이하면 즐거움이 2배</h4>
</div>
    </div>

	<!--더하기 리스트-->
	<section class="gallery-block cards-gallery">
		<div class="gallery-container">
			<div class="gallerytitle">
				<h3 id="viewtitle">
					<b> 지금 인기!</b>
				</h3>
			</div>

				<div class="row">
				<c:forEach items="${normal2}" var="club" varStatus="status" begin="0"
					end="5">
					<div class="col-md-8 col-lg-4">
						<div class="card border-0 transform-on-hover">

							<a class="lightboxbest"
									href='getClub.do?clubNum=<c:out value="${club.clubNum}" />'>
								<img id="clubmainpic"
								src="${path}/resources${club.clubMain_pic}"
								onerror="this.onerror=null; this.src='${path}/resources/img/img1.jpg'" />


							</a>
							<div class="card-bodyarea">
								<div class=spanspace>
									<span class="badge" id="onoff">${club.clubOnOff}</span> <span
										class="badge" id="freq">${club.clubFreq}</span>

								</div>
								<div class=clubtitle>
									<a class=clubtitle
										href='getClub.do?clubNum=<c:out value="${club.clubNum}" />'>
										${club.clubName} </a>
								</div>
								<div class=subtitle>
									<i class="fas fa-heart"> ${club.clubHeart}</i>

								</div>

								<!-- 더하기 상세 정보 -->
								<p class="text-muted card-text">

									<c:set var="today" value="<%=new java.util.Date()%>" />
									<fmt:formatDate var="today" value="${today}" pattern="yyyyMMdd" />
									<fmt:formatDate var="shutDay" value="${club.clubShutDate}"
										pattern="yyyyMMdd" />
									<fmt:formatDate var="startDay" value='${club.clubStartDate}'
										pattern="yyyy-MM-dd" />
									<fmt:formatDate var="endDay" value='${club.clubEndDate}'
										pattern="yyyyMMdd" />
									<span class="period">📅 ${club.clubStartDate} ~
										${club.clubEndDate}</span></br> <span class="shutdown"> 🔒 모집 마감까지
										D - <c:out value="${shutDay-today}" />
									</span></br> <span class="person">현재<b> ${club.clubCurnum}</b> /
										${club.clubMax}명 참여중!
									</span></br>

								</p>
							</div>
						</div>
					</div>
				</c:forEach>
	</section>



	
	<section class="gallery-block cards-gallery">
		<div class="gallery-container">
				<div class="gallerytitle">
				
				<a href="totalList.do" id="viewtotal"> 더 보기 > </a>
			</div>

			<div class="row">
				<c:forEach items="${normal1}" var="club" varStatus="status" begin="0"
					end="11">
					<div class="col-md-6 col-lg-3">
						<div class="card border-0 transform-on-hover">

							<a class="lightbox"
							href='getClub.do?clubNum=<c:out value="${club.clubNum}" />'>
								<img id="clubmainpic"
								src="${path}/resources${club.clubMain_pic}"
								onerror="this.onerror=null; this.src='${path}/resources/img/img1.jpg'" />


							</a>
							<div class="card-bodyarea">
								<div class=spanspace>
									<span class="badge" id="onoff">${club.clubOnOff}</span> <span
										class="badge" id="freq">${club.clubFreq}</span>

								</div>
								<div class=clubtitle>
									<a class=clubtitle
											href='getClub.do?clubNum=<c:out value="${club.clubNum}" />'>
										${club.clubName} </a>
								</div>
								<div class=subtitle>
									<i class="fas fa-heart"> ${club.clubHeart}</i>

								</div>

								<!-- 더하기 상세 정보 -->
								<p class="text-muted card-text">

									<c:set var="today" value="<%=new java.util.Date()%>" />
									<fmt:formatDate var="today" value="${today}" pattern="yyyyMMdd" />
									<fmt:formatDate var="shutDay" value="${club.clubShutDate}"
										pattern="yyyyMMdd" />
									<fmt:formatDate var="startDay" value='${club.clubStartDate}'
										pattern="yyyy-MM-dd" />
									<fmt:formatDate var="endDay" value='${club.clubEndDate}'
										pattern="yyyyMMdd" />
									<span class="period">📅 ${club.clubStartDate} ~
										${club.clubEndDate}</span></br> <span class="shutdown"> 🔒 모집 마감까지
										D - <c:out value="${shutDay-today}" />
									</span></br> <span class="person">현재<b> ${club.clubCurnum}</b> /
										${club.clubMax}명 참여중!
									</span></br>

								</p>
							</div>
						</div>
					</div>
				</c:forEach>
	</section>

	
 <button id="addplus">
		<a href="clubForm.jsp"> <span class="material-icons"
			style="display: inline-block; font-size: 55px;"> add_circle </span></a>
	</button> 
	</div>
	</div>
</body>

<!--어썸폰트 아이콘 -->
<script src="https://kit.fontawesome.com/831a4ab0db.js"
	crossorigin="anonymous"></script>
<!--부트스트랩-->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	></script>

<script>

     

        <!------------------스크롤 위로 올리기----------------->
        var backToTop = () => {
            // Scroll | button show/hide
            window.addEventListener('scroll', () => {
                if (document.querySelector('html').scrollTop > 100) {
                    document.getElementById('go-top').style.display = "block";
                } else {
                    document.getElementById('go-top').style.display = "none";
                }
            });
            // back to top
            document.getElementById('go-top').addEventListener('click', () => {
                window.scrollTo({
                    top: 0,
                    left: 0,
                    behavior: 'smooth'
                });
            })
        };
        backToTop();
        
        
        

    </script>
</html>
