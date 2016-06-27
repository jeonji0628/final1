<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style type="text/css">
    	.dv{
    		width : 90%;
    		margin: 5%;
    	}
    	textarea{
    		/* max-width: 400px;
    		max-height: 150px; */
    		resize:none;
    		
    	}
    	.title{
		font-size: large;
		font-weight: bold;
	}
    </style>
 <script type="text/javascript">
 	$(function(){
	 	$("input[type='sumit']").click(function(){
	 		alert("a");
	 	});
	 	
 	});
 </script>
<form action="scheduleform" method="post">
   	<div class="modal-header title">
   		개인 일정 작성
   	</div>
   	<div class="modal-body dv">
   		<table>
   			<tr>
   				<td style="font-weight: bold; padding-bottom:20px; padding-right: 20px;">제목</td>
   				<td style="padding-bottom: 20px;"><input style="width: 485px;" type="text" id="title" name="title" value="${view.title}"></td>
   			</tr>
   			<tr>
   				<td style="font-weight: bold; padding-right: 20px;">내용</td>
   				<td><textarea cols="57" rows="10" id="contents" name="contents">${view.contents}</textarea></td>
   			</tr>
   			
   		</table>
   	</div>
   	<div class="modal-footer">
   		<input type="hidden" name="dates" id="dates" value="${view.dates}">
   		<input type="hidden" name="id" id="ttt" value="${member.id}">
   		<input type="hidden" name="name" value="${member.name}">
   		<input type="submit" class="btn btn-danger" value="완료">
		<input type="button" data-dismiss="modal" class="btn btn-danger" value="취소">
   	</div>
</form>