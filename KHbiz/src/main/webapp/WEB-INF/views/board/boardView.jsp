<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


<a href="boardUpdate?num=${boardDTO.num}"><input type="button" value="UPDATE" id="update"></a>
<a href="boardDelete?num=${boardDTO.num}&kind=${boardDTO.kind}"><input type="button" value="DELETE" id="delete"></a>
<input type="button" value="LIST">

</body>

</html>