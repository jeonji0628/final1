<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	$(function(){
		$(".page").click(function(){
			$.ajax({
				url : "searchpaging",
				type : "get",
				data : {
					curpage : $(this).text(),
					search : $("#search").val(),
					text : $("#text").val(),
					id : $("#id").val()
				},
				success : function(result){
					 $("#r").html(result); 
				}
			}); 
		});
		$(".change-modal").click(function(){
			$.ajax({
				url : "changeapproval",
				type : "get",
				data : {
					num : $("#id"+$(this).val()).text()
				},
				success : function(result){
					 $(".modal-content").html(result); 
				}
			});
		});
	});
</script>
	<input type="hidden" id="search" value="${search}">
	<input type="hidden" id="text" value="${text}">
	<input type="hidden" id="id" value="${member.id}">
<div class="table-responsive" id="r">
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
			<td id="id${i.index}">${approval.num}</td>
			<td>${approval.deadline}</td>
			<td>${approval.status}</td>
			<td>${approval.reg_date}</td>
		</tr>
		</c:forEach>
	</table>
</div>
<div class="table-down">
  <ul class="pagination pagination-lg">
    <li>
    	<c:if test="${paging.curblock > 1}">
   			<a href="approvalRegister?curpage=${paging.startnum -1}&id=${member.id}&search=${search}&text=${text}" aria-label="Previous">
	    		<span aria-hidden="true">&laquo;</span>
	    	</a>
   		</c:if>
   </li>
   
   <c:forEach begin="${paging.startnum}" end="${paging.lastnum}" step="1" var="i">
   		<li><a class="page">${i}</a></li>
   </c:forEach>
   
   <c:if test="${paging.curblock < paging.totalblock }">
	   <li>
	     <a href="approvalRegister?curpage=${paging.lastnum + 1}&id=${member.id}&search=${search}&text=${text}" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	     </a>
	   </li>
   </c:if>
  </ul>
</div>


<div class="modal fade" id="modal-update">
	<div class="modal-sm">
	  <div class="modal-content">
	  </div>
	</div>
</div>