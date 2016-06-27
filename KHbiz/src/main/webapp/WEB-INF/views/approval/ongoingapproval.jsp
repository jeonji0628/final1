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
	#approval{
		margin: 5% auto;
		/* padding:2.5%; */
		width: 60%;
		height: 100px;
	}
	.box{
		float:left;
		margin : 2%;
		width: 200px;
		height: 100px;
		border: 1px solid #ddd;
	}
	#result{
			 width: 250px; 
			 height: 50px; 
			 margin: 20% auto; 
			 font-size: 20px;
			 font-weight: bold;			 
		}
</style>
<script type="text/javascript">
	$(function(){
		$(".check-approval").click(function(){
			$.ajax({
				url : "changeapproval",
				type : "get",
				data : {
					num : $("#num"+$(this).val()).val(),
					state : 2
				},
				success : function(result){
					$(".modal-content").html(result);
					$("#changeModal").modal("show");
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
    		<div id="center">
	    		<ul class="nav nav-tabs">
				   <li role="presentation"><a href="reference?curpage=1&id=${member.id}">보낸 결재함</a></li>
				   <li role="presentation" class="active"><a href="#">진행중인 결재</a></li>
				   <li role="presentation"><a href="receiveApproval?curpage=1&id=${member.id}">받은 결재함</a></li>
				</ul>
			</div>
			<div id="main"> 
			<c:if test="${result ne null}">
				<div id="result">${result}</div>
			</c:if>
            <c:if test="${DTO ne null}">
				<div id="approval">
					<c:forEach items="${DTO}" var="dto" varStatus="i">
						<input type="hidden" id="num${i.index}" value="${dto.num}">
						<table class="box">
							<tr>
								<td><button class="btn btn-sm btn-danger check-approval"  value="${i.index}">${dto.title}</button></td>
							</tr>
							<tr>
								<td>${dto.reg_date}</td>
							</tr>
							<tr>
								<td>${member.id}</td>
							</tr>
						</table>
						<hr style="margin-top:27px;  float:left; width:2px; color:#ddd; background-color:#ddd; border:0; height:70px;">
						<table class="box">
							<tr>
								<td>${dto.decider1}</td>
							</tr>
							<tr>
								<c:if test="${dto.app_date ne null}">
									<td>${dto.app_date}</td>
								</c:if>
							</tr>
							<tr>
								<td>결재완료</td>
							</tr>
						</table>
						<span style="margin-top:50px; float:left; color:gray;">▶</span>
						<table class="box">
							<tr>
								<td>${dto.decider2}</td>
							</tr>
							<tr>
								<c:if test="${dto.com_date ne null}">
									<td>${dto.com_date}</td>
								</c:if>
								<td></td>
							</tr>
							<tr>
								<c:if test="${dto.com_date eq null}">
									<td>대기중</td>
								</c:if>
							</tr>
						</table>
					</c:forEach>
				</div>
				</c:if>
			</div>
		</div>
	</div>
	
<div class="modal" id="changeModal">
	<div class="modal-sm">
 		<div class="modal-content">
 		</div>
	</div>
</div>
</body>
</html>