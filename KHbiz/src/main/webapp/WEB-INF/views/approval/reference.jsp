<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
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
	#center{
		width : 80%;
		height: 100%;
		margin: 0 auto;
		margin-top: 10%;
	}
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
	#result{
			 width: 200px; 
			 height: 50px; 
			 margin: 20% auto; 
			 font-size: 20px;
			 font-weight: bold;			 
		}
</style>
<script type="text/javascript">
$(function(){
	$("#app_go").click(function(){
			$.ajax({
				url : "searchApproval",
				type : "get",
				data : {
					curpage : 1,
					search : $(".select").val(),
					text : $("#text").val(),
					id : $("#id").val()
				},
				success : function(result){
					$(".table-search").html(result);
				}
			});
		});
	$(".change-modal").click(function(){
		$.ajax({
			url : "changeapproval",
			type : "get",
			data : {
				num : $("#num"+$(this).val()).text(),
				state : 0
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
    		<div id="center">
	    		<ul class="nav nav-tabs">
				   <li role="presentation" class="active"><a href="#">보낸 결재함</a></li>
				   <li role="presentation"><a href="ongoingapproval?id=${member.id}">진행중인 결재</a></li>
				   <li role="presentation"><a href="receiveApproval?curpage=1&id=${member.id}">받은 결재함</a></li>
				</ul>
			</div>
			<div id="main">
			<c:if test="${result ne null}">
				<div id="result">${result}</div>
			</c:if>
            <c:if test="${approval ne null}">
				<div class="table-up">	            		
	            			 <select class="select">
						      	<option value="title">문서제목</option>
						      	<option value="num">문서번호</option>
						      	<option value="status">결재상태</option>
						      </select>
						    <div class="input-group">
						      <input type="text" class="form-control" id="text" placeholder="Search for...">
						      <span class="input-group-btn">
						        <button class="btn btn-default" id="app_go" type="button">검색</button>
						      </span>
						    </div>
	            </div> 
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
	                			<td style="padding-top: 13px;">등록날짜</td>
	                			<td style="padding-top: 13px;">비고</td>
	                		</tr>
                			
                			<c:forEach items="${approval}" var="approval" varStatus="i">
		                		<tr>
			                		<td>${approval.num}</td>
			                		<td>${approval.title}</td>
			                		<td id="num${i.index}">${approval.num}</td>
			                		<td>${approval.deadline}</td>
			                		<td>${approval.status}</td>
			                		<td>${approval.reg_date}</td>
			                		<td>
			                			<c:if test="${approval.status eq '대기중'}">
			                				<button data-toggle="modal" value="${i.index}" class="btn btn-danger change-modal">수정</button> 
			                				<button data-toggle="modal" value="${i.index}" class="btn btn-danger approval-delete">삭제</button> 
			                			</c:if>
			                		</td>
		                		</tr>
                			</c:forEach>
						</table>
					</div>
					<div class="table-down">
					  <ul class="pagination pagination-lg">
					  	<li>
					    	<c:if test="${paging.curblock > 1}">
					    		<a href="reference?curpage=${paging.startnum -1}&id=${member.id}" aria-label="Previous">
							    	<span aria-hidden="true">&laquo;</span>
							    </a>
					    	</c:if>
					    </li>
					    
					    <c:forEach begin="${paging.startnum}" end="${paging.lastnum}" step="1" var="i">
					    	<li><a href="reference?curpage=${i}&id=${member.id}">${i}</a></li>
					    </c:forEach>
					    
					    <c:if test="${paging.curblock < paging.totalblock }">
						    <li>
						      <a href="reference?curpage=${paging.lastnum + 1}&id=${member.id}" aria-label="Next">
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
	    		신청서 삭제
	    	</div>
	    	<div class="modal-body">
	    		<div style="padding: 10px; text-align: center; font: bolder; font-size: x-large;">
		    		삭제하시겠습니까?	    		
	    		</div>
	    	</div>
	    	<div class="modal-footer">
		    	<form action="formdelete" method="post">
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