<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <meta charset="utf-8" />
 
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	<script src="<%= application.getContextPath()%>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="<%= application.getContextPath()%>/resources/js/bootstrap.min.js" type="text/javascript"></script>
    <title>welcome KHbiz</title>
 	<link href="<%= application.getContextPath() %>/resources/css/bootstrap.css" rel="stylesheet" />
 	<link href="<%= application.getContextPath() %>/resources/css/note.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="<%= application.getContextPath() %>/resources/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="<%= application.getContextPath() %>/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
       <!-- CUSTOM STYLES-->
    <link href="<%= application.getContextPath() %>/resources/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		if($("#message").val() != ""){
			alert($("#message").val());
		}
		$("#btn2").click(function () {
			location.href="./noteWrite";
		});
		$("#btn2").click(function () {
			location.href="./noteWrite";
		});
	});
</script>
</head>
<body>
<div id="wrapper">  
	<header><%@ include file="../header.jsp" %></header>
	<%@ include file="../sider.jsp" %>
        <div id="page-wrapper" >
          <div id="page-inner">  
        	<hr/>
        	
        	<div class="table-size">
                <div class="table-up">
                	<ul class="nav nav-tabs">
						<li role="presentation" class="active"><a href="#">받은 쪽지함</a></li>
						<li role="presentation"><a href="#">보낸쪽지함</a></li>
					</ul>
            	</div> 
            <br>
            <div class="table-responsive">
               <table class="table">
               
                   <tr class="active table-colname">
                   	<td id="note_check" style="padding-top: 13px;">
                   		<input type="checkbox">
					</td>
                    <td id="note_sendid" style="padding-top: 13px;">보낸이</td>
                    <td id="note_contents" style="padding-top: 13px;">제목</td>
                    <td id="note_data" style="padding-top: 13px;">날짜</td>
                   </tr>
                   
                   <c:forEach items="${noteList }" var="nl" varStatus="i">
	                   <tr>
	                   	<td><input class="checkbox_size" type="checkbox"></td>
	               		<td>${nl.send_id}</td>
	          			<td>${nl.title}</td>
	       				<td>${nl.reg_date }</td>
	                   </tr>
                   </c:forEach>
                   
               	</table>
               </div>
               
               <div id="btn_div">
                <button id="btn1">
	    		   	<span class="glyphicon glyphicon-remove" aria-hidden="true"> 삭제</span>
	          			</button>
	          	<button id="btn2">
	       			<span class="glyphicon glyphicon-pencil" aria-hidden="true"> 쓰기</span>
        	   	</button>
               </div>
               
               <div class="table-down">
                 <ul class="pagination pagination-lg" style="margin-top: 3px">
                   <li>
                     <a href="#" aria-label="Previous">
                       <span aria-hidden="true">&laquo;</span>
                     </a>
                   </li>
                   <li><a href="#">1</a></li>
                   <li><a href="#">2</a></li>
                   <li><a href="#">3</a></li>
                   <li><a href="#">4</a></li>
                   <li><a href="#">5</a></li>
                   <li>
                     <a href="#" aria-label="Next">
                       <span aria-hidden="true">&raquo;</span>
                     </a>
                   </li>
                 </ul>
                 
               </div>
            </div>
            
            <!-- alert 띄우는용  -->
            <input id="message" type="hidden" value="${message}">   
       		<hr/>                
   		</div>
	</div>
</div>
</body>
</html>