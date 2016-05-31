<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>게시판</h2>
	
<table>
	<thead>
		<tr><th>번호</th><th>내용</th><th>작성자</th><th>조회수</th><th>작성일</th></tr>
    </thead>
	<tbody>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.num}</td>
				<td>
					<a href="boardView?num=${dto.num}">${dto.title}</a>
				</td>
				<td>${dto.id}</td>
				<td>${dto.counts}</td>
				<td>${dto.reg_date}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>	


<!-- ----------------페이징 ---------------------->
	<div>
	<c:if test="${page.curBlock > 1}">
		<a href="./boardList?curPage=${page.startNum-1}">[이전]</a>
	</c:if>
	<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
		<a href="./boardList?curPage=${i}">${i}</a>
	</c:forEach>
	<c:if test="${page.lastNum < page.totalBlock}">
		<a href="./boardList?curPage=${page.lastNum+1}">[다음]</a>
	</c:if>
</div>

<form action="boardWrite" method="get">
<input type="hidden" name="kind" value="${page.kind}">
<input type="submit" name="write" id="write" value="글쓰기">
</form>
	
	
	<!----------------검색 -------------------- -->
<!-- <div>
	<form action="./search" method="get">
		<select name="searchType">
			<option value="writer">작성자</option>
			<option value="title">제목</option>
			<option value="contents">내용</option>
		</select>
		<input type="text" name="searchWord">
		<input type="submit" value="SEARCH">
	</form>
</div> -->
</body>

</html>