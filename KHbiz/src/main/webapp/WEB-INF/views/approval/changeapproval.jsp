<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
	#table{
		margin-left : 16px;
	}
	#contents{
		max-height: 120px;
		max-width: 305px;
	}
	input[type="date"]{
		margin-left:18px;
		margin-right:18px;
		width: 130px;
		height: 30px;
	}
	.text-line{
	text-align: left !important;
	}
	.text-line input{
		text-align: center !important;
	}
	#title{
		font-size: large;
		font-weight: bold;
	}
</style>
<script type="text/javascript">
$(function(){
	$("#selector-go").click(function(){
		$.ajax({
			url : "selectperson",
			data : {
				name : $("#select-text").val()
			},
			success : function(result){
				if($(result).find("#listname").text() == ""){
					alert("이름을 입력하세요.");
				}else{
					$("#select-list").html(result);
				}
			}
		});
  	});
	$("#search-complete").click(function(){
		if($("input[type='checkbox']").is(":checked") == false || $("#select-text").val() == ""){
			alert("결재자를 선택하세요.");		
		}else{
			$("#decide1").val($("#listname").text());
			$('#myModal2').modal('hide');
		}
	}); 
	$("#vacation-complete").click(function(){ 
		var decide = $("#decide1").val();
		var contents = $("#contents").val();
		var date1 = $("#date1").val();
		var date2 = $("#date2").val();
		
		if(decide == "" || contents == "" || date1 == "" || date2 == "") {			
			alert("모두 입력하세요");
			return false;
		}
	});	
	$(".change-close").click(function(){
		$("#myModal2").modal('hide');
	});
	
});
</script>    

<form id="frm" action="formupdate">

<input type="hidden" name="state" value="${state}">
 	<div class="modal-header">
   		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
   		<input type="text" name="title" id="title" value="${approvalDTO.title}" readonly="readonly">
   		<input type="hidden" name="num" value="${approvalDTO.num}">
   		<input type="hidden" id="id" name="id" value="${member.id}">
    </div>
    <div class="modal-body">
		<table border="1" style="float: right; margin-top:10px; margin-right: 20px;" >
			<tr>
				<td rowspan="3">결재</td>
				<td>					
					<c:if test="${state eq 0}">
						<a data-toggle="modal" href="#myModal2" class="btn btn-defualt">결재자</a>						
					</c:if>
					<c:if test="${state eq 1 || state eq 2}">
						결재자
					</c:if>
				</td>
				<td>
					대표이사
				</td>
			</tr>	
			<tr>
				<td style="height: 50px;">
					<c:if test="${approvalListDTO.status eq '진행중' || approvalListDTO.status eq '결재완료'}">
						<img src="<%=application.getContextPath()%>/resources/img/approval.png">
					</c:if>
				</td>
				<td> 
					<c:if test="${approvalListDTO.status eq '결재완료'}">
						<img src="<%=application.getContextPath()%>/resources/img/approval.png">
					</c:if>
				</td>
			</tr>
			<tr>
				<td><input type="text" id="decide1" name="decider1" value="${approvalDTO.decider1}" readonly="readonly"></td>
				<td><input type="text" id="decide2" name="decider2" value="김연우" readonly="readonly"></td>
			</tr>		
		</table>
		<table id="table">
			<tr>
				<td >부 서:</td><td colspan="3" class="text-line"> <input type="text" readonly="readonly" value="${approvalDTO.division}"><br></td>
			</tr>
			<tr>
				<td>직 급:</td><td colspan="3" class="text-line"><input type="text" readonly="readonly" value="${approvalDTO.position}"><br></td>
			</tr>
			<tr>
				<td style="padding-bottom: 30px;">성 명:</td><td colspan="3" class="text-line" style="padding-bottom: 30px;"><input type="text" readonly="readonly" value="${approvalDTO.name}"><br></td>
			</tr>
			<tr>
				<td>기 간:</td> 
				<td>
					<c:if test="${state eq 0}">
						<input type="date" id="date1" name="startday" value="${approvalDTO.startday}">
					</c:if>
					<c:if test="${state eq 1 || state eq 2}"> 
						<input type="date" id="date1" name="startday" readonly="readonly" value="${approvalDTO.startday}">			
					</c:if>
				</td>
				<td>
					~
				</td>
				<td>
					<c:if test="${state eq 0}">
						<input type="date" id="date2" name="lastday" value="${approvalDTO.lastday}"><br>
					</c:if>
					<c:if test="${state eq 1 || state eq 2}">
						<input type="date" id="date2" name="lastday" readonly="readonly" value="${approvalDTO.lastday}"><br>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>사 유:</td>
				<c:if test="${state eq 0}">
					<td colspan="3" class="text-line"><textarea style="margin-left: 18px;" cols="45" rows="15" id="contents" name="contents">${approvalDTO.contents}</textarea><br></td>
				</c:if>
				<c:if test="${state eq 1 || state eq 2}">
					<td colspan="3" class="text-line"><textarea  style="margin-left: 18px;" cols="45" rows="15" id="contents" name="contents" readonly="readonly" >${approvalDTO.contents}</textarea><br></td>
				</c:if>
			</tr>
			<tr>
				<td colspan="4" style="width:130px; padding-top:30px; padding-bottom: 30px;"><span style=" font-size: large; font-weight: bold;">위와 같이 휴가를 하고자 하오니 <br>허가하여 주시기 바랍니다.<br></span></td>
			</tr>
			<tr>
				<td colspan="4">
					<%
						Date date = new Date();
						java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy년MM월dd일");
						String today = formatter.format(new java.util.Date());
					%>
						<span style="margin: 0 20px;"><%= today %></span><br>
						<span>기안자  ${member.name}</span>
				</td>
			</tr>
		</table>	
	</div>
    <div class="modal-footer">
    	<c:if test="${state eq 0}">
			<input type="submit" class="btn btn-danger" id="vacation-complete" value="수정완료">
		</c:if>
		<c:if test="${state eq 1}">
			<input type="submit" class="btn btn-danger" value="승인">
		</c:if>
		<c:if test="${state eq 2}">
			<input type="button" class="btn btn-danger" data-dismiss="modal" value="확인">
		</c:if>
		<a href="#" data-dismiss="modal" class="btn btn-danger">취소</a>
    </div>
</form>
         
<div class="modal" id="myModal2" data-backdrop="static">
	<div class="modal-select">
      <div class="modal-content">
	        <div class="modal-header">
				<button type="button" class="close change-close"aria-hidden="true">×</button>
				<h4 id="title"> 결재자 검색</h4>
	        </div>  
	        
			<div class="modal-body">	
				<input type="text" class="form-control" id="select-text" placeholder="이름을 입력하세요">
				<span class="input-group-btn">
				  <button class="btn btn-default" id="selector-go" type="button">검색</button>
				</span>
				<div id="select-list"></div>
		  	</div>
		  	<div class="modal-footer">
				<input type="button"  class="btn btn-danger" id="search-complete" value="저장">
				<input type="button" class="btn btn-danger change-close" value="취소">
			</div>
       </div>
     </div>
</div>