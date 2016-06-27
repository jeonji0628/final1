<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
	.modal-body{
		margin-left : 20px;
		margin-right : 20px;
		margin-bottom: 10px;
	}
	#title{
		font-size: large;
		font-weight: bold;
	}
	#booktable{
		margin : 0 auto;
		width: 330px;
		height: 26px;
	}
</style>
<div class="table-responsive">
<div class="modal-header">
	<h3 id="title">자원 예약</h3>
</div>
	<form action="bookresources" method="post">
	 	<div class="modal-body">
	 		<input type="hidden" name="code" id="name">
				<h4 id="title">사용현황</h4>
	 			<table class="table">
					<tr class="active table-colname">
						<td style="padding-top: 10px;">사용자</td>
						<td colspan="2" style="padding-top: 10px;">사용시간</td>
						<td style="padding-top: 10px;">비고</td>
					</tr>
			               			
			      		<c:forEach items="${booklist}" var="book" varStatus="i">
			      			<tr>
			      				<td>${book.name}</td>
			      				<td colspan="2">${book.startday} ~ ${book.lastday}</td>
			      				<td>
			      				<c:if test="${book.id eq member.id}">
			      					<button class="btn btn-danger btn-sm">수정</button>
			      					<button class="btn btn-danger btn-sm">삭제</button>			      				
			      				</c:if>
			      				</td>
			      			</tr>
			      		</c:forEach>
				</table>
				<h4 id="title">사용예약</h4>
				<div id="booktable">
			 		<table>
			 			<tr>
			 				<td>
			 					<input type="text" name="startday" class="datetimepicker">
			 				</td>
			 				<td> - </td>
			 				<td>
			 					<input type="text" name="lastday" class="datetimepicker">
			 				</td>
			 			</tr>
			 		</table>
		 		</div>
	 	</div>
	 	<div class="modal-footer">
	 		<input type="hidden" name="id" value="${member.id}">
	 		<input type="hidden" name="name" id="name" value="${member.name}">
	 		<input type="submit" class="btn btn-danger" value="예약">
			<input type="button" data-dismiss="modal" class="btn btn-danger" value="취소">
	 	</div>
	</form>	
</div>