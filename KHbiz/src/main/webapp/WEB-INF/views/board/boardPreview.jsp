<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table class="table" id="boardpreviewTable">
<tr>
<td id="info">사내게시판</td>
<td id="more">
<a href="" onclick="more1()">더보기</a>
</td>
</tr>
<c:forEach items="${preview}" var="dto">
<tr>
<td style="border-bottom:1px solid #ddd;"><div class="tddd"><a href="" onclick="onePreview(${dto.num})">${dto.title}</a></div></td>
<td style="text-align: right; border-bottom: 1px solid #ddd;">${dto.id} &nbsp; ${dto.reg_date}</td>
</tr>
</c:forEach>
</table>
