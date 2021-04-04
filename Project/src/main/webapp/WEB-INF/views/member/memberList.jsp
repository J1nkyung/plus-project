<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!--${pageContext.request.contextPath}" 이게 web-app을 가리킨다!!!!!   -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- 그래서 path 써주고 그 아래 소스 파일 이름 지정해주면 된다 ! 이건 진경언니가 준거 !   -->
<link rel="stylesheet" href="${path}/resources/css/reviewList.css">
    <script type="text/javascript" src="${path}/resources/js/jquery-1.12.4.min.js"></script>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원관리</title>
    <script>
    </script>
    <style>
        .Container {
            margin: 0;
            width: 1140px;
        }

        .Content {
            padding: 40px 60px;
            height: 100vh;
        }


        #tableWrapper {
            width: 85%;
            height: 415.550px;
        }
        
    	 #block{
            border: 1px solid rgba(189, 186, 186, 0.829);
            border-radius: 2%;
       		min-height:443.2px;
        }
        

        #tableWrapper table {
            width: 100%;
            border-collapse: collapse;  
        }
        


        #tableWrapper table th {
            text-align: center;
            background-color: grey;
            height:19.6px;
            padding: 13px;
            background-color:#001eff;
            color:white;
        }

        #tableWrapper table td {
            text-align: center;
            padding: 7px;
            max-height:17px;

        }
        #pageArea{
        margin:0 auto;
        position:relative;
        }
        
        .paging{
        margin-top:10px;
        position:absolute;
        left:45%;
        }
        
       .paging > li{
        list-style:none;
        float:left;
        padding:6px 1px;
        }
        
        .span{
        padding:6px 12px;
        border: 1px solid lightgray;
        }
        
        #info, .paging >li :hover{
        text-decoration:none;
        }

	#keywordInput{
	display:inline;
	}
	.search{
	float:right;
	margin-bottom:3px;
	margin-right:3px;
	}
	#searchType{
	height:24px;
	}

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
            <h1>회원관리</h1>
            
    
       	 <div id="tableWrapper">
       	 <form role="form" method="get" id="form">
  
 <div class="search">
    <select name="searchType" id="searchType">
      <option value="null"<c:out value="${scmem.searchType == null ? 'selected' : ''}"/>>-----</option>
      <option value="e"<c:out value="${scmem.searchType eq 'e' ? 'selected' : ''}"/>>이메일</option>
      <option value="n"<c:out value="${scmem.searchType eq 'n' ? 'selected' : ''}"/>>이름</option>
    </select>
    <input type="text" size="30" name="keyword" id="keywordInput" value="${scmem.keyword}"/>
    <button id="searchBtn" type="button">검색</button>
</div><!-- search -->
    <div id="block"> 
		              <table class="useInfo">
		                  <tr>
		                  	<th>회원번호</th>
		                      <th>회원Email</th>
		                      <th>회원이름</th>
		                      <th>가입일</th>
		                      <th>상세보기</th> 
		                  </tr>
		                  
		                     <c:forEach var="list" items="${list}" >
		                        <tr>
		                        	<td>${list.memberNum }</td>
		                           <td>${list.memberEmail }</td>
		                           <td>${list.memberName }</td>
		                           <td>${list.memberJoindate }</td>
		                          <td><button><a id="info" href="${path}/memberUpdate?memberNum=${list.memberNum}">상세보기</a></button></td>
		                      
		                        </tr>
		                     </c:forEach>
		              </table>
                 </div><!-- block -->
					 <div id="pageArea">
              
						  <ul class="paging">
							  
						  
						    	<li><a class="span" href="memberList${pmem.makeSearch(pmem.startPage - 1)}">◀</a></li>
						
						    <c:forEach begin="${pmem.startPage}" end="${pmem.endPage}" var="idx">
						    	<li><a href="memberList${pmem.makeSearch(idx)}"><span class="span">${idx}</span></a></li>
						    </c:forEach>
						
						    	<li><a class="span" href="memberList${pmem.makeSearch(pmem.endPage + 1)}">▶</a></li>
						  </ul>
					 </div><!-- pageArea -->
       	 </form>
     			</div><!-- wrapper -->
         
        </div>
    </div>
</body>
</html>