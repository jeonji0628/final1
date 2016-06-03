<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
   		input[type=text]{
   			border: 0;
   			width: 100px;
   			text-align: center;
   		}
   		#email{
   			width:200px;
   		}
</style>


<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3>${chart.id}님의 정보 수정</h3>
</div>

<form action="./changeChart" method="post"> 
	<div class="modal-body">	
	  <input type="hidden" name="id" value="${chart.id}">	
	    <table class="table">
			<tr class="active table-colname">
				<td>이름</td>
				<td>부서</td>
				<td>직급</td>
				<td>메일</td>
				<td>직책</td>
			</tr>
			<tr>			
		   		<td><input type="text" name="name" value="${chart.name}"></td>
		   		<td><input type="text" name="division" value="${chart.division}"></td>
		   		<td><input type="text" name="position" value="${chart.position}"></td>
		   		<td><input type="text" name="email" id="email" value="${chart.email}"></td>
		   		<td><input type="text" name="job" value="${chart.job}"></td>
		   	</tr>
	    </table> 
  	</div>
  	
  	<div class="modal-footer">
	    <input type="submit"  class="btn btn-danger" value="저장">
	    <input type="button" data-dismiss="modal" class="btn btn-danger" value="취소">
	</div>
 </form>