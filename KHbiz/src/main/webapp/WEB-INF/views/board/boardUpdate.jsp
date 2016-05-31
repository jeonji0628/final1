<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="boardUpdate1" method="post">

작성자 : <input type="text" value="${boardDTO.id}" readonly="readonly" name="id">
제목 : <input type="text" value="${boardDTO.title}" name="title">
내용 : <textarea rows="" cols="" name="contents">${boardDTO.contents}</textarea>

<input type="hidden" value="${boardDTO.num}" name="num">
<input type="hidden" value="${boardDTO.kind}" name="kind">
<input type="hidden" value="${boardDTO.counts}" name="counts">
<input type="submit" value="update">

</form>
</body>
</html>