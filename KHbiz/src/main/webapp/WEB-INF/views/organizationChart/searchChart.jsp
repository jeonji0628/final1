<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table class="table">
    <tr class="active table-colname">
		<td style="padding-top: 13px;">no</td>
		<td style="padding-top: 13px;">아이디</td>
		<td style="padding-top: 13px;">이름</td>
		<td style="padding-top: 13px;">부서</td>
		<td style="padding-top: 13px;">직급</td>
		<td style="padding-top: 13px;">메일</td>
		<td style="padding-top: 13px;">직책</td>
		<td style="padding-top: 13px;">등록일</td>
		<c:if test="${member.id }">
			<td style="padding-top: 13px;">비고</td>		
		</c:if>
	</tr>
	<c:forEach items="${result}" var="result">
		<tr>
	 		<td></td>
	 		<td>${result.id}</td>
	 		<td>${result.name}</td>
	 		<td>${result.division}</td>
	 		<td>${result.position}</td>
	 		<td>${result.email}</td>
	 		<td>${result.job}</td>
	 		<td>${result.joindate}</td>
	 		<c:if test="${member.id eq 'admin'}">
		 		<td>
		 			<button class="btn btn-danger square-btn-adjust">수정</button>
		 			<button class="btn btn-danger square-btn-adjust">삭제</button>
		 		</td>	 		
	 		</c:if>
		</tr>
	</c:forEach>
</table>
<div class="table-down">
					  <ul class="pagination pagination-lg">
					    <li>
					    	<c:if test="${paging.curblock > 1}">
					    		<a href="allChart?curpage=${paging.startnum -1}" aria-label="Previous">
							    	<span aria-hidden="true">&laquo;</span>
							    </a>
					    	</c:if>
					    </li>
					    <c:forEach begin="${paging.startnum}" end="${paging.lastnum}" step="1" var="i">
					    	<li><a href="allChart?curpage=${i}">${i}</a></li>
					    </c:forEach>
					    <c:if test="${paging.curblock < paging.totalblock }">
						    <li>
						      <a href="allChart?curpage=${paging.lastnum + 1}" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
					    </c:if>
					  </ul>
					</div>