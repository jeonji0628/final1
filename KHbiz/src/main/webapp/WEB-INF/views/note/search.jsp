<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		$("#btn4").click(function () {
			var name=$("#search_input2").val();
		   $.ajax({
            url : "./memberSearch" ,
            data : {
            	name : name
            },
            success : function(result){
            	$("#table_search").html(result);
            } 
           });
		});
		
		$("#sub_btn").click(function () {
			if(checked_count > 1){
				
				checked_count = 0;
				ch_state  = false;
				
			}else{
				$("#name").val($("#select_tempid").val());
				
			}
			
			if(ch_state == true){
				return true;
			}else{
				alert("하나만 선택해 주세요.");
				return false;
			}
		});
	});
</script>
    
    
	<!-- Modal -->
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <span class="modal-title" id="myModalLabel">쪽지 주소록</span>
    </div>
      <br>
      <div class="col-lg-6">
	    <div class="input-group">
	      <input name="name" id="search_input2" type="text" class="form-control" placeholder="이름을 입력하세요.">
	      <span class="input-group-btn">
	        <button id="btn4" class="btn btn-default" type="button"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>
	        </button>
	      </span>
	    </div>
   	  </div>
   	  <br>
   	  <br>
      <div id="table_search"  class="modal-body">
      
     	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn3" class="btn btn-default" data-dismiss="modal">
        	<span class="glyphicon glyphicon-remove" aria-hidden="true">닫기</span>
        </button>
        <button id="sub_btn" type="button" class="btn3" class="btn btn-primary" data-dismiss="modal" >
        	<span class="glyphicon glyphicon-ok" aria-hidden="true">등록</span>
       	</button>
      </div>
      
 	 <!-- 보낼 아이디 임시 아이디 저장  -->
	 <input id="select_tempid" type="hidden">