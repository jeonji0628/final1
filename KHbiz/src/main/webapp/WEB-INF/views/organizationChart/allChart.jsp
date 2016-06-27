<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
   <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="<%= application.getContextPath() %>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="<%= application.getContextPath() %>/resources/js/bootstrap.min.js" type="text/javascript"></script>
    <title>welcome KHbiz</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="<%= application.getContextPath() %>/resources/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="<%= application.getContextPath() %>/resources/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="<%= application.getContextPath() %>/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="<%= application.getContextPath() %>/resources/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

	<link href="<%= application.getContextPath() %>/resources/css/allchart.css" rel="stylesheet" />
	<script src="<%= application.getContextPath() %>/resources/js/allchart.js" type="text/javascript"></script>
</head>
<body>
<div id="wrapper">  
	<header><%@ include file="../header.jsp" %></header>
	<%@ include file="../sider.jsp" %>
        <div id="page-wrapper" >
            <div id="page-inner">            	            
            	<div class="table-size">
	            	<div class="table-up">
	            		<!-- <div class="select"> -->
	            			 <select class="select">
						      	<option value="id">아이디</option>
						      	<option value="division">부서</option>
						      	<option value="position">직급</option>
						      	<option value="job">직책</option>
						      	<option value="email">메일</option>
						      </select>
						<!-- </div> -->
						    <div class="input-group">
						      <input type="text" class="form-control" id="text" placeholder="Search for...">
						      <span class="input-group-btn">
						        <button class="btn btn-default" id="go" type="button">검색</button>
						      </span>
						    </div><!-- /input-group -->
						  <!-- </div> -->
	            	</div> 
	            	<div class="table-search">
                 	<div class="table-responsive">
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
                			<c:if test="${member.id eq 'admin'}">
	                			<td style="padding-top: 13px;">비고</td>                			
                			</c:if>
                		</tr>
                			
                		<c:forEach items="${chart}" var="chart" varStatus="i">
                			<input type="hidden" id="pw${i.index}" value="${chart.pw}">
	                		<tr>
		                		<td></td>
		                		<td id="id${i.index}">${chart.id}</td>
		                		<td>${chart.name}</td>
		                		<td>${chart.division}</td>
		                		<td>${chart.position}</td>
		                		<td>${chart.email}</td>
		                		<td>${chart.job}</td>
		                		<td>${chart.joindate}</td>
		                		<c:if test="${member.id eq 'admin' }">
			                		<td>
			                			<button class="btn btn-danger square-btn-adjust updateChart" value="${i.index}">수정</button>
			                			<div class="modal fade" id="modal-update">
										  <div class="modal-dialog">
										    <div class="modal-content">
										        <!-- remote ajax call이 되는영역 -->
										    </div>
										  </div>
										</div>
			                			<button class="btn btn-danger square-btn-adjust" id="deleteChart">삭제</button>
			                		</td>		                		
		                		</c:if>
	                		</tr>
                		</c:forEach>
					</table>
					</div>
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
					</div>
				</div>
        	</div>
        </div>
	</div>
</body>
</html>
