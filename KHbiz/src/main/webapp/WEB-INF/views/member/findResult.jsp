<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
	margin-left: 40px;
	margin-top: 60px;
	font-size: 25px;
}
.first{
	background-color: #f5f5f5;
}
#second_tr{
	margin-top: 10px;
}
</style>
</head>
<body>
<table>
	<tr>
		<td class="first">아이디</td><td class="second">${user.id}</td>
	</tr>
	<tr id="second_tr">
		<td class="first">비밀번호</td><td class="second">${user.pw}</td>
	</tr>
</table>
</body>
</html>