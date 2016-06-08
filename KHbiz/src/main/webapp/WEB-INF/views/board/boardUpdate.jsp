<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
#boardUpdateForm{
	width: 1250px;
	margin-left: 300px;
}
	#boardTitle{
	   		width : 800px;
	   		height : 100px;
	   		margin-top : 100px;
	   		margin-left : 500px;
	   		color: black;
	   		}
td{
	border: 1px solid gray;
}
</style>
</head>
<body>

<header><%@ include file="../header.jsp" %></header>
	<%@ include file="../sider.jsp" %>

	<c:if test="${boardDTO.kind eq 1}">
		<h2 id="boardTitle">부서게시판</h2>
	</c:if>
	<c:if test="${boardDTO.kind eq 2}">
		<h2 id="boardTitle">사내게시판</h2>
	</c:if>	
	
<form action="boardUpdate1" method="post" id="boardUpdateForm">
<table>
<tr>
<td>작성자</td><td><input type="text" value="${boardDTO.id}" readonly="readonly" name="id"></td>
<td>제목</td><td><input type="text" value="${boardDTO.title}" name="title"></td>
</tr>
<tr>
<td>내용</td><td colspan="3"><textarea rows="" cols="" name="contents">${boardDTO.contents}</textarea></td>
</tr>
</table>

<input type="hidden" value="${boardDTO.num}" name="num">
<input type="hidden" value="${boardDTO.kind}" name="kind">
<input type="hidden" value="${boardDTO.counts}" name="counts">
<input type="submit" value="update">

</form>
</body>
</html>