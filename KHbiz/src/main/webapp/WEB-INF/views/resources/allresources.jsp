<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="<%= application.getContextPath() %>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="<%= application.getContextPath() %>/resources/js/bootstrap.min.js" type="text/javascript"></script>
<link href="<%= application.getContextPath() %>/resources/css/bootstrap.css" rel="stylesheet" />
<link href="<%= application.getContextPath() %>/resources/css/font-awesome.css" rel="stylesheet" />
<link href="<%= application.getContextPath() %>/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<link href="<%= application.getContextPath() %>/resources/css/custom.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<link href="<%= application.getContextPath() %>/resources/css/allchart.css" rel="stylesheet" />

<link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>	

<title>Insert title here</title>
<style type="text/css">
	#main{
		width : 80%;
		height: 100%;
		margin: 0 auto;
	}
	img{
		 width: 200px; 
		 height: 100px; 
	}
	#center{
		width : 80%;
		height: 100%;
		margin: 0 auto;
		margin-top: 10%;
	}
</style>
<script type="text/javascript">
$(function(){
    $('.datetimepicker').appendDtpicker({'locale':'ko'});
    $('.book').click(function(){
    	$.ajax({
			url : "booklist",
			data : {
				code : $('#code'+$(this).val()).text() 
			},
			success : function(result){
				$(".modal-content").html(result);
				$("#myModal").modal("show");
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
			<div id="main">
				<div class="table-up">
	            		<!-- <div class="select"> -->
	            			 <select class="select">
						      	<option value="title">자원번호</option>
						      	<option value="num">자원명</option>
						      </select>
						    <div class="input-group">
						      <input type="text" class="form-control" id="text" placeholder="Search for...">
							      <span class="input-group-btn">
							        <button class="btn btn-default" id="app_go" >검색</button>
							      </span>
						    </div>
	            	</div> 
	            	<div class="table-search">
                 	<div class="table-responsive">
					<table class="table">
					    <tr class="active table-colname">
                			<td style="padding-top: 13px;">자원번호</td>
                			<td style="padding-top: 13px;">자원명</td>
                			<td style="padding-top: 13px;">자원이미지</td>
                			<td style="padding-top: 13px;">상태</td>
                			<td style="padding-top: 13px;">비고</td>
                		</tr>
                			
                		<c:forEach items="${resources}" var="resources" varStatus="i">
	                		<tr>
		                		<td id="code${i.index}">${resources.code}</td>
		                		<td>${resources.name}</td>
		                		<c:if test="${resources.code eq 1}">
		                			<td><img src="<%=application.getContextPath()%>/resources/img/대회의실.jpg"></td>
		                		</c:if>
		                		<c:if test="${resources.code eq 2}">
		                			<td><img src="<%=application.getContextPath()%>/resources/img/소회의실.jpg"></td>
		                		</c:if>
		                		<td>d</td>
		                		<td>		                			
		                			<button data-toggle="modal" value="${i.index}" class="btn btn-danger book">예약</button>
		                			<%-- <button data-toggle="modal" data-target="#booklist" value="${i.index}" class="btn btn-danger book">사용현황</button> --%>
		                		</td>
		                	</tr>
                		</c:forEach>
					</table>
					</div>
				</div>
			</div>
		</div>
	</div>

<div class="modal" id="myModal">
	<div class="modal-book">
      <div class="modal-content">
       </div>
     </div>
</div>
</body>
</html>