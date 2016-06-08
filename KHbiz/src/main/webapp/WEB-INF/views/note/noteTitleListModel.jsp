<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		$("#sub_btn").click(function () {
			var id=$("#span_id").html();
			location.href="./noteWrite?id="+id;
		});
	});
</script>
    
	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <span class="modal-title" id="myModalLabel">쪽지보기</span>
    </div>
      <br>
      <div class="col-lg-6">
	    <div class="input-group">
    		<table id="table_1" style="width: 530px;" class="table" style="text-align: center;">
				<tr class="active table-colname" >
					<td id="model_td" style="padding-top: 13px;">
					
						<c:if test="${state eq 1}">
							<span id="span_id" class="span1">${id}</span>
							님께서 
							<span class="span1">${date }</span>
							에 남기셨습니다.
						</c:if>
						
						<c:if test="${state eq 2}">
							<span class="span1">${id}</span>
							님께
							<span class="span1">${date }</span>
							에 남기셨습니다.
						</c:if>
						
					</td>
				</tr>
				<tr>
					<td>
						<textarea rows="9" cols="58" readonly="readonly">${contents }</textarea>
					</td>
				</tr>
				
			</table>
	    </div>
   	  </div>
   	 
  	  <br>
   	  <br><br><br><br><br><br><br>
   	  <br><br><br><br>
      <div id="table_search"  class="modal-body">
      
     	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn3" class="btn btn-default" data-dismiss="modal">
        	<span class="glyphicon glyphicon-remove" aria-hidden="true"> 닫기</span>
        </button>
        <c:if test="${state eq 1}">
	        <button id="sub_btn" type="button" class="btn3" class="btn btn-primary" data-dismiss="modal" >
	        	<span class="glyphicon glyphicon-envelope" aria-hidden="true"> 답장</span>
	       	</button>
       	</c:if>
      </div>
      
 	 <!-- 보낼 아이디 임시 아이디 저장  -->
	 <input id="select_tempid" type="hidden">