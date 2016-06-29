<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<!--ck deitor-->
	<script type="text/javascript" src="<%= application.getContextPath()%>/resources/ckeditor/ckeditor.js">
	</script>	
	<script type="text/javascript">
	window.onload=function(){  /* /익명함수 */
		CKEDITOR.replace("ckeditor");
	}
	</script>
</head>
<body>
<%@ include file="../header.jsp" %></header>
	<%@ include file="../sider.jsp" %>

	<div id="page-wrapper">
		<div id="page-inner3">
			<hr/>
			<div class="table-size">
			<h3>${param.divi}부서</h3> 
			 <div class="table-up">
				<ul class="nav nav-tabs">
						<li role="presentation" class="active">
							<c:if test="${param.state eq 1}">
								<h3>일일업무일지작성</h3>
							</c:if>
							<c:if test="${param.state eq 2}">
								<h3>주간업무일지작성</h3>
							</c:if>
							<c:if test="${param.state eq 3}">
								<h3>월간업무일지작성</h3>
							</c:if>
						</li>
					</ul>
			</div>
			<div class="table-responsive2">
	               <table  class="table">
	        			<form action="divisionWorkLogWrite" method="post" enctype="multipart/form-data">
	        			<tr  class="active table-colname">
	                   	<td class="board_title" style="padding-top: 16px; padding-left: 10px;">
	        				작성자
	        			</td>
	        			<td id="board_input" style="padding-top: 13px;">
	                   		<div class="col-lg-6">
							    <div class="input-group">
							      ${param.division} 
							      <c:if test="${param.grade == 1}">
									사원
									</c:if>
									<c:if test="${param.grade == 2}">
									주임
									</c:if>
									<c:if test="${param.grade == 3}">
									대리
									</c:if>
									<c:if test="${param.grade == 4}">
									과장
									</c:if>
									<c:if test="${param.grade == 5}">
									차장
									</c:if>
									<c:if test="${param.grade == 6}">
									부장
									</c:if>
									<c:if test="${param.grade == 7}">
									실장
									</c:if>
									<c:if test="${param.grade == 8}">
									이사
									</c:if>
									<c:if test="${param.grade == 9}">
									대표이사
									</c:if>									
							      ${member.id}    
							    </div>
					    	</div>
	                    </td>	        			
	        			</tr>
	        			
	        			
	                   <tr>
	                   <!-- contents -->
	                   <td class="workLog_title" style="padding-top: 16px; padding-left: 10px;">업무계획</td>
	                   	<td colspan="2" style="padding-top: 13px;">
	                   		<textarea class="ckeditor" name="plan" rows="" cols="71"></textarea>
	                   	</td>
	                   </tr>
	                   <tr>
	                   <!-- contents -->
	                   <td class="workLog_title" style="padding-top: 16px; padding-left: 10px;">업무결과</td>
	                   	<td colspan="2" style="padding-top: 13px;">
	                   		<textarea class="ckeditor" name="result" rows="" cols="71"></textarea>
	                   	</td>
	                   </tr>
	                   <tr>
	                   <!-- contents -->
	                   <td class="workLog_title" style="padding-top: 16px; padding-left: 10px;">특이사항</td>
	                   	<td colspan="2" style="padding-top: 13px;">
	                   		<textarea class="ckeditor" name="noted" rows="" cols="71"></textarea>
	                   	</td>
	                   </tr>
	                   <p>
	                   </p>
	                   <tr>
	                   <td>이미지 업로드</td><td><input type="file" name="file"></td>
	                   <td>* 10메가바이트 이하의 이미지파일만 업로드 가능합니다</td>
	                   </tr>	                  
	                   <input type="hidden" value="${member.id}" name="id">
						<input type="hidden" name="divi" value="${member.division}">
						<input type="hidden" name="gra" value="${member.position}">
						<input type="hidden" name="state" value="${param.state}">
						<input type="hidden" name="name" value="${member.name}">
						<input type="hidden" name="job" value="${member.job}">
						<!-- division position job name id state (plan result noted) (upload, payment_state, payment_id, grade) -->	
	               </table>
	        				<div id="workLogUpdate_div1">	        				
			        				<input type="submit" id="writeSuccess" value="작성완료">
									<a href="<%=application.getContextPath()%>/divisionWorkLog/divisionWorkLogList?id=${member.id}&state=${param.state}&reg=1&gra=${member.position}&divi=${member.division}"><input type="button" id="list" value="취소"></a>
			        				</div>
	        			</form>
	         </div>
			</div>
		</div>
	</div>


</body>
</html>