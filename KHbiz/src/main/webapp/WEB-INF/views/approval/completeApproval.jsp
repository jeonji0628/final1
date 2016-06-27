<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="<%= application.getContextPath() %>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="<%= application.getContextPath() %>/resources/js/bootstrap.min.js" type="text/javascript"></script>
<link href="<%= application.getContextPath() %>/resources/css/bootstrap.css" rel="stylesheet" />
<link href="<%= application.getContextPath() %>/resources/css/font-awesome.css" rel="stylesheet" />
<link href="<%= application.getContextPath() %>/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<link href="<%= application.getContextPath() %>/resources/css/custom.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<link href="<%= application.getContextPath() %>/resources/css/allchart.css" rel="stylesheet" />
<style type="text/css">
	#main{
		width : 80%;
		height: 100%;
		margin: 0 auto;
	}
	input[type="text"]{
			border: 0;
			width: 100px;
			text-align: center;
		}
</style>
<script type="text/javascript">
$(function(){
	$(".view-modal").click(function(){
		$.ajax({
			url : "changeapproval",
			type : "get",
			data : {
				num : $("#num"+$(this).val()).text(),
				state : 2
			},
			success : function(result){
				$(".modal-html").html(result);
				$("#changeModal").modal("show");
			}
		});
	});
	
	$(".approval-delete").click(function(){
		$("#delete-num").val($("#num"+$(this).val()).text());
		$("#delete-id").val($("#id").val());
		$("#delete").modal("show");
	});
});
</script>
</head>
<body>
<header><%@ include file="../header.jsp" %></header>
	<%@ include file="../sider.jsp" %>
	<div id="page-wrapper" >
    	<div id="page-inner">     		
			<div id="main">
				<div class="table-up">	            		
           			 <select class="select">
				      	<option value="title">문서제목</option>
				      	<option value="num">문서번호</option>
				      </select>
				    <div class="input-group">
				      <input type="text" class="form-control" id="text" placeholder="Search for...">
				      <span class="input-group-btn">
				        <button class="btn btn-default" id="app_go" type="button">검색</button>
				      </span>
				    </div>
	            </div> 
			<c:if test="${result ne null}">
				${result}
			</c:if>
	           <c:if test="${approval ne null}">
	            <input type="hidden" id="id" name="id" value="${member.id}">
	            <div class="table-search">
                 	<div class="table-responsive">
						<table class="table">
						    <tr class="active table-colname">
	                			<td style="padding-top: 13px;">no</td>
	                			<td style="padding-top: 13px;">문서제목</td>
	                			<td style="padding-top: 13px;">문서번호</td>
	                			<td style="padding-top: 13px;">결재기한</td>
	                			<td style="padding-top: 13px;">결재상태</td>
	                			<td style="padding-top: 13px;">완료날짜</td>
	                			<td style="padding-top: 13px;">비고</td>
	                		</tr>
                			
                			<c:forEach items="${approval}" var="approval" varStatus="i">
		                		<tr>
			                		<td>${approval.num}</td>
			                		<td>${approval.title}</td>
			                		<td id="num${i.index}">${approval.num}</td>
			                		<td>${approval.deadline}</td>
			                		<td>${approval.status}</td>
			                		<td>${approval.com_date}</td>
			                		<td>
		                				<button data-toggle="modal" value="${i.index}" class="btn btn-danger view-modal">보기</button> 
		                				<button data-toggle="modal" value="${i.index}" class="btn btn-danger approval-delete">삭제</button> 
			                		</td>
		                		</tr>
                			</c:forEach>
						</table>
					</div>
					<div class="table-down">
					  <ul class="pagination pagination-lg">
					  	<li>
					    	<c:if test="${paging.curblock > 1}">
					    		<a href="completeApproval?curpage=${paging.startnum -1}&id=${member.id}" aria-label="Previous">
							    	<span aria-hidden="true">&laquo;</span>
							    </a>
					    	</c:if>
					    </li>
					    
					    <c:forEach begin="${paging.startnum}" end="${paging.lastnum}" step="1" var="i">
					    	<li><a href="completeApproval?curpage=${i}&id=${member.id}">${i}</a></li>
					    </c:forEach>
					    
					    <c:if test="${paging.curblock < paging.totalblock }">
						    <li>
						      <a href="completeApproval?curpage=${paging.lastnum + 1}&id=${member.id}" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
					    </c:if>
					  </ul>
					</div>
				</div> 
				</c:if>
			</div>
		</div>
	</div>
	
	<div class="modal" id="changeModal">
   	 	<div class="modal-sm">
	    	<div class="modal-content modal-html">
	    	</div>
	    </div>
    </div>
    <div class="modal" id="delete">
   	 	<div class="modal-sm">
	    	<div class="modal-content">
	    	<div class="modal-header">
	    		완료 신청서 삭제
	    	</div>
	    	<div class="modal-body">
	    		<div style="padding: 10px; text-align: center; font: bolder; font-size: x-large;">
		    		삭제하시겠습니까?	    		
	    		</div>
	    	</div>
	    	<div class="modal-footer">
	    	<form action="formreturn" method="post">
	    		<input type="hidden" id="delete-num" name="num">
	    		<input type="hidden" id="delete-id" name="id">
	    		<input type="submit" class="btn btn-danger" value="삭제">
				<input type="button" data-dismiss="modal" class="btn btn-danger" value="취소">
			</form>	
	    	</div>
	    	</div>
	    </div>
    </div>
</body>
</html>