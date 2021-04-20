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
<script type="text/javascript" src="${path}/resources/js/jquery-1.12.4.min.js"></script>
<title>콘텐츠 모아보기</title>
<script>
    </script>
<style>
.Container {
	margin: 0;
	width: 1440px;
}

.Content {
	padding: 40px 160px;
	height: 100vh;
}

#tableWrapper {
	/* width: 85%; */
	width: 100%; 
	height: 415.550px;
}

#block {
	/*    border: 1px solid rgba(189, 186, 186, 0.829); */
	border-radius: 2%;
	min-height: 443.2px;
}

#tableWrapper table {
	width: 100%;
	border-collapse: collapse;
}

#tableWrapper table th {
	text-align: center;
	background-color: grey;
	height: 19.6px;
	padding: 13px;
	background-color: #001eff;
	color: white;
}

#tableWrapper table td {
	text-align: center;
	padding: 7px;
	max-height: 17px;
	border-bottom: 1px solid rgba(189, 186, 186, 0.829);
}

#pageArea {
	margin: 0 auto;
	position: relative;
}

.pageArea {
	margin: 0 auto;
	position: relative;
}

.paging {
	margin-top: 10px;
	position: absolute;
	left: 45%;
}

.paging>li {
	list-style: none;
	float: left;
	padding: 6px 1px;
}

.span {
	padding: 6px 12px;
	border: 1px solid lightgray;
}

#info, .paging>li :hover {
	text-decoration: none;
}

#keywordInput {
	display: inline;
}

.search {
	float: right;
	margin-bottom: 3px;
	margin-right: 3px;
}

#searchType {
	height: 24px;
}

.titleBox2 {
	width: auto;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	color: #333;
}


.title {
	width: 350px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	color: #333;
	height:40px;
}


.title:hover {
	color: #001eff;
}
/*탭 박스 css start*/
.main {
	/* min-width: 320px; */
	max-width: 85%;
	padding: 10px;
	border-radius: 7px;;
	background: #ffffff;
}

section {
	display: none;
	padding: 20px 0 0;
	border-top: 1px solid #ddd;
}

input {
	display: none;
}

label {
	display: inline-block;
	padding: 15px 25px;
	font-weight: 600;
	color: #bbb;
	border: 1px solid transparent;
}

label:hover {
	color: #2e9cdf;
	cursor: pointer;
}

/*input 클릭시, label 스타일*/
input:checked+label {
	color: #555;
	/*  border-bottom: 1px solid #ffffff; */
}

#tab1:checked ~ #content1, #tab2:checked ~ #content2 {
	display: block;
}
/*탭 박스 css end*/

/*말줄임 css start*/
#cmtsContent{
display: inline-block;
text-overflow: ellipsis;
white-space: nowrap;
overflow: hidden;
width: 240px;
}
/*말줄임 css end*/
</style>
<script>
    $(function(){
      $('#searchBtn').click(function() {
        self.location = "memberList" + '${pmem.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
      });
    });   
</script>
</head>

<body>
	<div class="Container">
		<div class="Content">
			<!-- <h1>내 글 / 댓글 모아보기</h1> -->
			<div class="main" style="text-align: left">

				<input id="tab1" type="radio" name="tabs" value="tabOne" checked /> 
					<label for="tab1">내가 쓴 글</label>
				<input id="tab2" type="radio" name="tabs" value="tabTwo" /> 
					<label for="tab2">내가 쓴 댓글 </label>
				<section id="content1" style="margin-bottom: 20px;">
					<div id="tableWrapper"><!-- tab 1  -->
						<form role="form" method="get" id="form">

							<%--  <div class="search">
    <select name="searchType" id="searchType">
      <option value="null"<c:out value="${scmem.searchType == null ? 'selected' : ''}"/>>-----</option>
      <option value="e"<c:out value="${scmem.searchType eq 'e' ? 'selected' : ''}"/>>이메일</option>
      <option value="n"<c:out value="${scmem.searchType eq 'n' ? 'selected' : ''}"/>>이름</option>
    </select>
    <input type="text" size="30" name="keyword" id="keywordInput" value="${scmem.keyword}"/>
    <button id="searchBtn" type="button">검색</button>
</div> --%>
							<!-- search -->
							<div id="block">
								<table class="useInfo">
									<tr>
										<th>글내용</th>
										<th>작성자</th>
										<th>작성날짜</th>
									</tr>

									<c:forEach var="list" items="${list}">
										<tr>
											<td><a id="info" href="${path}/viewMyContent?boardNum=${list.boardNum}">
												<div class="title">${list.boardContent}</div></a></td>
											<td>${list.memberNickname }</td>


											<td id="boardRegdate"><fmt:formatDate
													value="${list.boardRegDate}" var="changedDate"
													pattern="yyyy. MM. dd (HH:mm)" /> ${changedDate}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<!-- pagenation -->
								<div class="pageArea">
									<ul class="paging">
										<li>
											<a class="span" href="ViewMyList${pmem.makeQuery(pmem.startPage - 1)}&clubNum=${clubNum}&memberNum=${memberNum}">◀</a>
										</li>
										<c:forEach begin="${pmem.startPage}" end="${pmem.endPage}" var="idx">
											<li>
												<a href="ViewMyList${pmem.makeQuery(idx)}&clubNum=${clubNum }&memberNum=${memberNum}">
													<span class="span" id="commSpan">${idx}</span>
												</a>
											</li>
										</c:forEach>
										<li>
											<a class="span" href="ViewMyList${pmem.makeQuery(pmem.endPage + 1)}&clubNum=${clubNum}&memberNum=${memberNum}">▶</a>
										</li>
									</ul>
								</div>
						<!-- pageArea -->
						</form>
					</div>
					<!-- wrapper -->
				</section><!-- 내가 쓴 글 탭 종료 -->

				<section id="content2" style="margin-bottom: 20px;">
					<!-- search -->
					<div id="tableWrapper"><!-- tab 2  -->
						<div id="block">	
							<table class="useInfo">
								<tr>
									<th>댓글내용</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>

								<c:forEach var="comments" items="${cmts}">
									<tr>
										<td><a id="cmtsContent" href="${path}/viewMyContent?boardNum=${comments.boardNum}" title="댓글이 있는 곳으로 이동"><div class="titleBox2">${comments.commentsContent}</div></a></td>
										<td>직장의신</td><!-- 이거 일단 스킵 정연 -->
										<td id="commentsRegdate">
										<fmt:parseDate value="${comments.commentsRegdate}" var="commentsRegdatee" pattern="yyyy-MM-dd HH:mm" />
										<fmt:formatDate value="${commentsRegdatee}"  pattern="yyyy. MM. dd (HH:mm)" /> 
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
						
						<!-- pagenation -->
						<div class="pageArea">
							<ul class="paging">
								<li>
									<a class="span" href="ViewMyList${PageMakerComments.makeQuery(PageMakerComments.startPage - 1)}&clubNum=${clubNum}&memberNum=${memberNum}">◀</a>
								</li>
								<c:forEach begin="${PageMakerComments.startPage}" end="${PageMakerComments.endPage}" var="idx">
									<li>
										<a href="ViewMyList${PageMakerComments.makeQuery(idx)}&clubNum=${clubNum }&memberNum=${memberNum}">
											<span class="span" id="commSpan">${idx}</span>
										</a>
									</li>
								</c:forEach>
								<li>
									<a class="span" href="ViewMyList${PageMakerComments.makeQuery(PageMakerComments.endPage + 1)}&clubNum=${clubNum}&memberNum=${memberNum}">▶</a>
								</li>
							</ul>
						</div>
						<!-- pageArea -->
					</div>
					<!-- wrapper -->
				</section> <!-- 내가 쓴 댓글 탭 종료 -->
			</div>
		</div>
	</div>
</body>
</html>