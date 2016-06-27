<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table class="table">
<tr class="active table-colname">
			<td style="padding-top: 13px;">no</td>
			<td style="padding-top: 13px;">문서제목</td>
			<td style="padding-top: 13px;">문서번호</td>
			<td style="padding-top: 13px;">결재기한</td>
			<td style="padding-top: 13px;">결재상태</td>
			<td style="padding-top: 13px;">등록날짜</td>
		</tr>
		<c:forEach items="${approval}" var="approval" varStatus="i">
		<tr>
			<td>${approval.num}</td>
			<td>${approval.title}</td>
			<td>${approval.num}</td>
			<td>${approval.deadline}</td>
			<td>${approval.status}</td>
			<td>${approval.reg_date}</td>
			<c:if test="${member.id eq 'admin' }">
				<td>
					<button class="btn btn-danger square-btn-adjust updateChart" value="${i.index}">수정</button>
		      		<button class="btn btn-danger square-btn-adjust" id="deleteChart">삭제</button>
		   		</td>			
			</c:if>
		</tr>
		</c:forEach>
</table>

<div class="modal fade" id="modal-update">
	<div class="modal-sm">
	  <div class="modal-content">
	  </div>
	</div>
</div>