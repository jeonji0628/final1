<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
</head>
<body>
<h2>글쓰기</h2>
<form action="boardWrite" method="post">
		<input type="hidden" name="kind" value="${param.kind}">
		작성자 : <input type="text" name="id"><br><!--value="${member.id}"   -->
		제목 : <input type="text" name="title"><br>
		내용 : <textarea rows="" cols="" name="contents"></textarea><br>
		<input type="submit" value="글쓰기">
	</form>

</body>
</html>