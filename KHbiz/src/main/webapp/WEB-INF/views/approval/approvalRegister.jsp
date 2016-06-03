<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
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
   	<link href="<%= application.getContextPath() %>/resources/css/divisionchart.css" rel="stylesheet" />
   	<link href="<%= application.getContextPath() %>/resources/css/allchart.css" rel="stylesheet" />
	<script src="<%= application.getContextPath() %>/resources/js/allchart.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			$("#vacationmodal").click(function(){	   			
	   			$.ajax({
   					url : "vacationmodal",
   					type : "get",
   					data : {
   						id : $("#id"+$(this).val()).text(),
   						pw : $("#pw"+$(this).val()).val()
   					},
   					success : function(result){
   						$(".modal-content").html(result);
   						$("#modal-update").modal("show");
   					}
   				});
	   	    });
		});
	</script>
</head>
<body>
	<header><%@ include file="../header.jsp" %></header>
	<%@ include file="../sider.jsp" %>
	<div id="page-wrapper" >
    	<div id="page-inner"> 
	    	<div class="well">
				<div class="dropdown">
				  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
				    	결재 문서  
				  </button>
				  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
				    <li role="presentation"><button role="menuitem" tabindex="-1" id="vacationmodal">휴가 신청서</button></li>
				    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">출장 보고서</a></li>
				  </ul>
			  	</div> 
			</div>
			<div class="modal fade" id="modal-update">
			  <div class="modal-dialog">
			    <div class="modal-content">
			        <!-- remote ajax call이 되는영역 -->
			    </div>
			  </div>
			</div>
			<div class="right">
	            	<div class="table-up">
	            		<!-- <div class="select"> -->
	            			 <select class="select">
						      	<option value="id">문서제목</option>
						      	<option value="division">문서번호</option>
						      	<option value="position">결재상태</option>
						      	<option value="job">등록날짜</option>
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
                			<td style="padding-top: 13px;">문서제목</td>
                			<td style="padding-top: 13px;">문서번호</td>
                			<td style="padding-top: 13px;">결재기한</td>
                			<td style="padding-top: 13px;">결재상태</td>
                			<td style="padding-top: 13px;">등록날짜</td>
                			<td style="padding-top: 13px;">비고</td>
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
</body>
</html>