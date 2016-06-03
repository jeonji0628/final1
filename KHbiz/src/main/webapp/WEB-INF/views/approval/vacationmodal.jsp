<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<h2>휴가 신청서</h2>
		<table border="1">
			<tr>
				<td rowspan="2">결재</td>
				<td>
					<button>결재자</button>
				</td>
				<td>
					대표이사
				</td>
			</tr>	
			<tr>
				<td></td>
				<td></td>
			</tr>		
		</table>
		부 서 : ${member.division}<br>
		직 급 : ${member.position}<br>
		성 명 : ${member.name}
	<form>
		<input type="hidden" name="id" value="${member.id}">
		사 유 : <textarea rows="10" cols="80" name="contents"></textarea><br>
		기 간 : <input type="date" name="deadline1"> ~ <input type="date" name="deadline2">
	</form>
		위와 같이 휴가를 하고자 하오니 허가하여 주시기 바랍니다.<br>
				<%
					Date date = new Date();
					SimpleDateFormat simpledate = new SimpleDateFormat("yyyy년 mm월 dd일");
					String strdate = simpledate.format(date);
				%>
				<%= strdate %><br>
				위 ${member.name}
</div>
</body>
</html>