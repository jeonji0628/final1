<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="<%= application.getContextPath() %>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="<%= application.getContextPath() %>/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<title>게시판</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<!-- BOOTSTRAP STYLES-->
    <link href="<%= application.getContextPath() %>/resources/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="<%= application.getContextPath() %>/resources/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="<%= application.getContextPath() %>/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="<%= application.getContextPath() %>/resources/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

<style type="text/css">
   		#boardBody{
   			width: 1250px;
   			height: 1250px;
   			margin: 0 auto;
   		}   		
   		#boardTable{
   			width: 1000px;
   			margin-left: 300px;
   		}   	
	   	#boardSearchDiv{
	   		width: 1000px;
	   		margin: 0 auto;
	   	}   	
	   	#boardPaging{
	   		width: 1000px;
	   		margin-left: 550px;
	   	}   	
	   	#boardListWrite{
	   		width: 800px;
	   		float: right;
	   	}   	
	   	
	   	#boardTitle{
	   		width : 800px;
	   		height : 100px;
	   		margin-top : 100px;
	   		margin-left : 600px;
	   		color: black;
	   		}
</style>
</head>
<body>
<header><%@ include file="../header.jsp" %></header>
	<%@ include file="../sider.jsp" %>

<div id="boardBody">
	<c:if test="${param.kind eq 1}">
		<h2 id="boardTitle">부서게시판</h2>
	</c:if>
	<c:if test="${param.kind eq 2}">
		<h2 id="boardTitle">사내게시판</h2>
	</c:if>	
	
<table id="boardTable">
	<thead>
		<tr><th>번호</th><th>제목[댓글]</th><th>작성자</th><th>조회수</th><th>작성일</th></tr>
    </thead>
	<tbody>
		<c:forEach items="${list}" var="dto" varStatus="t">
			<tr>
				<td>${dto.num}</td>
				<td>
					<a href="boardView?num=${dto.num}&kind=${dto.kind}">${dto.title} <c:if test="${replyNum[t.index] != 0}">[${replyNum[t.index]}]</c:if></a>
				</td>
				<td>${dto.id}</td>
				<td>${dto.counts}</td>
				<td>${dto.reg_date}</td>
			</tr>
		</c:forEach>	
	</tbody>
</table>	

<!-- ----------------페이징 ---------------------->
<div id="boardPaging">	
	<c:if test="${page.curBlock > 1}">
		<a href="./boardList?curPage=${page.startNum-1}&kind=${page.kind}&searchType=${page.searchType}&searchWord=${page.searchWord}">[이전]</a>
	</c:if>

	<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i" >
		<a href="./boardList?curPage=${i}&kind=${page.kind}&searchType=${page.searchType}&searchWord=${page.searchWord}">${i}</a>
	</c:forEach>

	<c:if test="${page.curBlock < page.totalBlock}">
		<a href="./boardList?curPage=${page.lastNum+1}&kind=${page.kind}">[다음]</a>
	</c:if>
</div>

<form action="boardWrite" method="get" id="boardListWrite">
<input type="hidden" name="kind" value="${page.kind}">
<input type="hidden" id="id" value="${member.id}">
<input type="submit" name="write" id="write" value="글쓰기">
</form>	
	
	<!----------------검색 -------------------- -->
<div id="boardSearchDiv">
	<form action="search" method="get">
		<select name="searchType">
			<option value="id">작성자</option>
			<option value="title">제목</option>
			<option value="contents">내용</option>
		</select>
		<input type="hidden" value="${page.curPage}" name="curPage">
		<input type="hidden" value="${page.kind}" name="kind">
		<input type="text" name="searchWord" id="searchText">
		<input type="submit" value="SEARCH" id="search" onclick="return check()">
	</form>
</div> 

</div>
</body>
<script type="text/javascript">
	function check(){
		var searchWord = $("#searchText").val();
		if(searchWord == ""){
			alert("검색어를 입력해주세요");
			return false;
		}else{
			return true;
		}
	}
</script>
</html>