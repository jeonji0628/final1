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
</head>
<body>

<p>id : ${boardDTO.id}</p>
<p>title : ${boardDTO.title}</p>
<p>contents : ${boardDTO.contents}</p>
<p>counts : ${boardDTO.counts}</p>
<p>reg_date : ${boardDTO.reg_date}</p>

<a href="boardUpdate?num=${boardDTO.num}"><input type="button" value="UPDATE" id="update"></a>
<a href="boardDelete?num=${boardDTO.num}&kind=${boardDTO.kind}"><input type="button" value="DELETE" id="delete"></a>
<a href="boardList?curPage=1&kind=${boardDTO.kind}"><input type="button" value="LIST"></a>


<!----------------- 댓글  ------------------->
<p></p>

<div>

<c:forEach items="${reply}" var="reply">
	<p>id : ${reply.id}</p>
<p>contents : ${reply.contents}</p>
<p>reg_date : ${reply.reg_date}</p> 
</c:forEach>

</div>

<form action="reply" method="post">
<input type="hidden" name="num" value="${boardDTO.num}">
<input type="text" name="id">
<textarea rows="" cols="" name="contents"></textarea>
<input type="submit" value="댓글달기">
</form>


</body>
</html>