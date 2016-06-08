<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="<%= application.getContextPath() %>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="<%= application.getContextPath() %>/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<title>게시판</title>
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
	#boardViewDiv{
		width: 1250px;
	margin-left: 300px;
	}
	#boardViewReplyDiv{
	width : 800px;
	text-align: center;
	margin-top: 100px;
	}
	#boardViewReplyForm{
		width: 1000px;
		margin-left: 500px;
		margin-top: 50px;
	}
	#boardViewButtonDiv{
		float: left;
		margin-left: 910px;
		margin-top: 50px;
	}
	#boardViewTable{
		width : 1000px;
		height : 800px;
		margin-left: 100px;
		margin-top: 100px;
		text-align: center;
	}
	td{
	border : 1px solid gray;
	}
	#firstTd{
		height: 100px;
		background-color: #4d4d4d;
		color : white;
	}
	#secondTd{
		height: 100px;
		background-color: #4d4d4d;
		color : white;
	}
		
	#boardViewReplyTable{
	width : 800px;
	height : 100px;
		margin-left: 600px;
		margin-top: 10px;
	}

	#replyTd1{
		background-color: #4d4d4d;
		color : white;
	}
	 	#boardTitle{
	   		width : 800px;
	   		height : 50px;
	   		margin-top : 100px;
	   		margin-left : 800px;
	   		color: black;
	   		}
	

</style>
</head>
<body>

<header><%@ include file="../header.jsp" %></header>
	<%@ include file="../sider.jsp" %>
	
	<c:if test="${param.kind eq 1}">
		<h2 id="boardTitle">부서게시판</h2>
	</c:if>
	<c:if test="${param.kind eq 2}">
		<h2 id="boardTitle">사내게시판</h2>
	</c:if>	
	
<div id="boardViewDiv">
	<table id="boardViewTable">
		<tr>
			<td id="firstTd">작성자</td><td id="firstTd">${boardDTO.id}</td><td id="firstTd">조회수</td><td id="firstTd">${boardDTO.counts}</td><td id="firstTd">작성일</td><td id="firstTd">${boardDTO.reg_date}</td>
		</tr>
		<tr>
			<td id="secondTd">제목</td><td colspan="5">${boardDTO.title}</td>
		</tr>
		<tr>
			<td id="">내용</td><td colspan="5" id="boardViewContents"><br>${boardDTO.contents}</td>
			
		</tr>
	
	</table>
	
	
<div id="boardViewButtonDiv">
<a href="boardUpdate?num=${boardDTO.num}"><input type="button" value="UPDATE" id="update"></a>
<a href="boardDelete?num=${boardDTO.num}&kind=${boardDTO.kind}"><input type="button" value="DELETE" id="delete"></a>
<a href="boardList?curPage=1&kind=${boardDTO.kind}"><input type="button" value="LIST"></a>
</div>	

</div>
<!----------------- 댓글  ------------------->

<div id="boardViewReplyDiv">
<c:forEach items="${reply}" var="reply">
<table id="boardViewReplyTable">
<tr>
	<td id="replyTd1" colspan="2">${reply.id}님의 댓글 - ${reply.reg_date}일 작성</td>
</tr>
<tr>
<td rowspan="3">${reply.contents}</td>
</tr>

</table>
</c:forEach>
</div>

<form action="reply" method="post" id="boardViewReplyForm">
<input type="hidden" name="num" value="${boardDTO.num}">
<input type="text" name="id"><!--value="${member.id}"  -->
<textarea rows="5" cols="100" name="contents"></textarea>
<input type="submit" value="댓글달기" id="replyWrite">
</form>


</body>
</html>