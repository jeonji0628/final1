<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <style type="text/css">
    	.font{
    		font-size: x-small;
    	}
    </style>
    <script type="text/javascript">
    $('input[type="checkbox"]').bind('click',function() {
		$('input[type="checkbox"]').not(this).prop("checked", false);
	});
    </script>
<div class="table-responsive">
<table class="table">
	<tr class="active table-colname">
		<td style="padding-top: 13px;">no</td>
		<td style="padding-top: 13px;">아이디</td>
		<td style="padding-top: 13px;">이름</td>
		<td style="padding-top: 13px;">부서</td>
		<td style="padding-top: 13px;">직급</td>
		<td style="padding-top: 13px;">메일</td>
	</tr>
         			
	<c:forEach items="${list}" var="list" varStatus="i">
		<tr class="font">
			<td><input type="checkbox" value="${i.index}"></td>
			<td id="id${i.index}">${list.id}</td>
			<td id="listname">${list.name}</td>
			<td>${list.division}</td>
			<td>${list.position}</td>
			<td>${list.email}</td>
		</tr>
	</c:forEach>
</table>
</div>