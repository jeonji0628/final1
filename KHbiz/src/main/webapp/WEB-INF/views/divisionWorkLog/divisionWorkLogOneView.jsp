<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="<%= application.getContextPath() %>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="<%= application.getContextPath() %>/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<title>업무일지</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

 <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	<script src="<%= application.getContextPath()%>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="<%= application.getContextPath()%>/resources/js/bootstrap.min.js" type="text/javascript"></script>
    <title>welcome KHbiz</title>
 	<link href="<%= application.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet" />
 	<link href="<%= application.getContextPath()%>/resources/css/workLog.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="<%= application.getContextPath()%>/resources/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="<%= application.getContextPath()%>/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
       <!-- CUSTOM STYLES-->
    <link href="<%= application.getContextPath()%>/resources/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name = "viewport" content = "width=device-width, initial-scale = 1">
<link rel = "stylesheet" href = "ui/jquery.mobile-1.2.0.min.css" />
<link href="<%= application.getContextPath()%>/resources/css/calendar.css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
</head>
	<body>
	<%@ include file="../header.jsp" %></header>
	<%@ include file="../sider.jsp" %>
	<div id="page-wrapper">
		<div id="page-inner">
			
		
			<hr/>
			<div class="table-size">
			 <div class="table-up">
				<ul class="nav nav-tabs">
						<li role="presentation" class="active">
			 			<h3>${divisionWorkLogOne.division} 부서</h3>
							<c:if test="${divisionWorkLogOne.state eq 1}">
								<h4>일일업무일지보기</h4>
							</c:if>
							<c:if test="${divisionWorkLogOne.state eq 2}">
								<h4>주간업무일지보기</h4>
							</c:if>
							<c:if test="${divisionWorkLogOne.state eq 3}">
								<h4>월간업무일지보기</h4>
							</c:if>
						</li>
					</ul>
			</div>
			<div class="table-responsive2">
	               <table  class="table">
	        			<tr  class="active table-colname">
	                   	<td class="board_title" style="padding-top: 16px; padding-left: 10px;">
	        				작성자
	        			</td>
	        			<td id="board_input" style="padding-top: 13px;">
	                   		<div class="col-lg-6">
							    <div class="input-group">
							      ${divisionWorkLogOne.division} 
							      <c:if test="${divisionWorkLogOne.grade == 1}">
									사원
									</c:if>
									<c:if test="${divisionWorkLogOne.grade == 2}">
									주임
									</c:if>
									<c:if test="${divisionWorkLogOne.grade == 3}">
									대리
									</c:if>
									<c:if test="${divisionWorkLogOne.grade == 4}">
									과장
									</c:if>
									<c:if test="${divisionWorkLogOne.grade == 5}">
									차장
									</c:if>
									<c:if test="${divisionWorkLogOne.grade == 6}">
									부장
									</c:if>
									<c:if test="${divisionWorkLogOne.grade == 7}">
									실장
									</c:if>
									<c:if test="${divisionWorkLogOne.grade == 8}">
									이사
									</c:if>
									<c:if test="${divisionWorkLogOne.grade == 9}">
									대표이사
									</c:if>									
							      ${member.id}    
							    </div>
					    	</div>
	                    </td>	        			
	        			</tr>
	        			
	        			<tr>
	                   	<td class="workLog_title" style="padding-top: 16px; padding-left: 10px;">작성일</td>
	                   	
	                   	<!-- title -->
	                   	<td style="padding-top: 13px;"><input type="text" value="${divisionWorkLogOne.reg_date}" name="reg_date" readonly="readonly" class="form-control"></td>
	                   </tr>
	                   <tr>
	                   <!-- contents -->
	                   <td class="workLog_title" style="padding-top: 16px; padding-left: 10px;">업무계획</td>
	                   	<td colspan="2" style="padding-top: 13px;">
	                   		${divisionWorkLogOne.plan}
	                   	</td>
	                   </tr>
	                   <tr>
	                   <!-- contents -->
	                   <td class="workLog_title" style="padding-top: 16px; padding-left: 10px;">업무결과</td>
	                   	<td colspan="2" style="padding-top: 13px;">
	                   		${divisionWorkLogOne.result}
	                   	</td>
	                   </tr>
	                   <tr>
	                   <!-- contents -->
	                   <td class="workLog_title" style="padding-top: 16px; padding-left: 10px;">특이사항</td>
	                   	<td colspan="2" style="padding-top: 13px;">
	                   		${divisionWorkLogOne.noted}
	                   	</td>
	                   </tr>
	                   <p>
	                   </p>
	                   <tr>
	                   <td>파일 업로드</td><td><input type="file" name="upload"></td>
	                   </tr>
	                   <c:if test="${divisionWorkLogOne.payment_id != '1'}">
		                    <tr>
								<td colspan="1">결제자</td><td><input style="width:10px;" type="text" readonly="readonly" id="payment_id1">${divisionWorkLogOne.payment_id}</td>
							</tr>
							<tr>
								<td style="width:90px;">결제상태</td><td colspan="2"><input type="text" readonly="readonly" id="payment_idSpan"></td>
							</tr>
						</c:if>	
							
	               </table>
	        			
	        		
	         </div>
			</div>
		</div>
	</div>

</body>
</html>