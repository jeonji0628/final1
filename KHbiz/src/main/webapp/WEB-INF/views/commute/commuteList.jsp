<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
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
    
    
   <!-- 시계 css The main CSS file -->
	<link href="<%= application.getContextPath()%>/resources/css/style.css" rel="stylesheet" />
    
 	<link href="<%= application.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet" />
 	<%-- <link href="<%= application.getContextPath()%>/resources/css/note.css" rel="stylesheet" /> --%>
     <!-- FONTAWESOME STYLES-->
    <link href="<%= application.getContextPath()%>/resources/css/font-awesome.css" rel="stylesheet" />
    <!-- MORRIS CHART STYLES-->
    <link href="<%= application.getContextPath()%>/resources/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
     <!-- CUSTOM STYLES-->
    <link href="<%= application.getContextPath()%>/resources/css/custom.css" rel="stylesheet" />
     <!-- commute css  -->
     <link href="<%= application.getContextPath()%>/resources/css/commute.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

<!-- 시계 api JavaScript Includes -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min.js"></script>
<script src="<%= application.getContextPath()%>/resources/js/script.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<script type="text/javascript">
	function commuteList() {
		commuteList_frm.submit();
	}
	function commuteSearch() {
		commuteSearch_frm.submit();
	}
</script>

<style type="text/css">
	a:HOVER {
		color: gray;
	}
</style>
</head>
<body>
<div id="wrapper">
<header><%@ include file="../header.jsp" %></header>
<header><%@ include file="../sider.jsp" %></header>
        <div id="page-wrapper" >
          <div id="page-inner">  
        	<hr/>
        	
        	<!-- form hidden  -->

        		<!-- commute List POST 방식으로 보내기  -->
	        	<form name="commuteList_frm" action="./commuteList" method="post">
	        		<input type="hidden" name="id" value="${member.id}">
	        	</form>
					        	
	        	<form name="commuteSearch_frm" action="./commuteSearch" method="post">
	        		<input type="hidden" name="id" value="${member.id}">
	        	</form>
			<!--  -->        	
			
        	<div class="table-size">
                <div class="table-up">
                	<ul class="nav nav-tabs">
						<li role="presentation" class="active"><a onclick="commuteList()">출퇴근 입력</a></li>
						<li role="presentation"><a onclick="commuteSearch()">출퇴근 내역조회</a></li>
					</ul>
            	</div> 
            <div id="commute_mid">
            
            	<div id="commute_mid_left">
            		<div id="clock" class="light">
						<div id="display" class="display" style="height: 120px;">
							<div class="weekdays"></div>
							<div class="ampm"></div>
							<div class="alarm" style="margin-left: 50px;top: 78px;"></div>
							<div class="digits"></div>
						</div>
					</div>
            		
            	</div>
            	
            	<div id="commute_mid_right">
            		<table id="commute_table" >
            			<tr>
            				<td id="commute_td1" class="boder1">
            				<!-- 시간  -->
            				<%-- <fmt:formatDate value="${dto.date}" pattern="hh시:mm분" type="time"/> --%>
	            				<span class="glyphicon glyphicon-time" id="commute_text" aria-hidden="true"></span>
            				</td>
            				<td  class="boder1">
								&nbsp;<span id="commute_text2">출퇴근 입력</span>            					
            				</td>
            				
            			</tr>
            			<tr>
            				<td colspan="3" >
            					<hr id="commute_hr" >
            				</td>
            				
            			</tr>
            			<tr>
            				<td colspan="2">
	            				<form name="commute_form" action="./commuteGowork" method="post">
	            						<!--  id 히든 -->
	            						<input type="hidden" name="id" value="${member.id }">
	            						
		            					<input type="submit" class="commute_btn1" id="chool" value="출 &nbsp;근" >
					          			&nbsp;&nbsp;&nbsp;
					          			<input type="button" class="commute_btn1" data-toggle="modal" data-target="#myModal" value="퇴 &nbsp;근">
					          	</form>
            				</td>
            			</tr>
            		</table>
            		<br>
            		
            		<c:if test="${message ne null}">
            			<input id="message" type="hidden" value="${message}">
            			
            			<script type="text/javascript">
            				var message = $("#message").val();
            				alert(message);
            			</script>
            			
            		</c:if>
            		<table id="commute_table2">
            			
            			<tr>
            				<td class="commute_td3">이름 </td>
            				
            				<td class="commute_td2"> ${member.name }</td>
            			</tr>
            			<tr>
            				<td class="commute_td3">날짜 </td>
            				
            				<!-- 디비에 값이 있을때랑 없을때   -->
            				<c:if test="${oneList.reg_date ne null}">
	            				<td class="commute_td2" >${oneList.reg_date}</td>
            				</c:if>
            				
            				<c:if test="${oneList.reg_date eq null}">
	            				<td class="commute_td2" >-------</td>
            				</c:if>
            			</tr>
            			<tr>
            				<td class="commute_td3">출근시간 </td>
            				
            				<c:if test="${oneList.starttime ne null}">
            					<td class="commute_td2">${oneList.starttime}</td>
            				</c:if>
            				<c:if test="${oneList.starttime eq null}">
            					<td class="commute_td2">-------</td>
            				</c:if>
            				
            			</tr>
            			<tr>
            				<td class="commute_td3">퇴근시간</td>
            				
            				<c:if test="${oneList.fintime ne null}">
            					<td class="commute_td2">${oneList.fintime}</td>
            				</c:if>
            				<c:if test="${oneList.fintime eq null}">
            					<td class="commute_td2">-------</td>
            				</c:if>
            				
            			</tr>
            		</table>
            	</div>
            </div>
            
            
            <div id="commute_bottom">
	           <table class="table">
               <tr class="active table-colname">
               		<td colspan="4" id="commute_td4">
              	 		최근 출퇴근 내역
			    	</td>
               </tr>
               
			         <c:forEach  begin="0" end="6" var="i"   >
			           <tr>
			           		<td style="padding-top: 15px" class="commute_td5">
			           			<c:if test="${allList[i].reg_date ne null}">
			               			${allList[i].reg_date}
			          			</c:if>
			               		<c:if test="${allList[i].reg_date eq null}">
			               			-------
			          			</c:if>
		                   	</td>
		                   	
		       				<td style="padding-top: 15px" class="commute_td5">
	               				<c:if test="${allList[i].starttime ne null}">
			               			${allList[i].starttime}
			          			</c:if>
			          			<c:if test="${allList[i].starttime eq null}">
			               			-------
			          			</c:if>
			               			
		               		</td>
		               		
		           			<td style="padding-top: 15px" class="commute_td5">
		               			<c:if test="${allList[i].fintime ne null}">
			               			${allList[i].fintime}
			          			</c:if>
			          			<c:if test="${allList[i].fintime eq null}">
			               			-------
			          			</c:if>
		               		</td>
		               		
		          			<td style="padding-top: 15px" class="commute_td5">
		          				<c:if test="${allList[i].state eq 0}">
		          					결근
			          			</c:if>
			          			<c:if test="${allList[i].state eq 1}">
		          					지각
			          			</c:if>
			          			<c:if test="${allList[i].state eq 2}">
		          					사유퇴근
			          			</c:if>
			          			<c:if test="${allList[i].state eq 3}">
		          					정상근무
			          			</c:if>
			          			<c:if test="${allList[i].state eq null}">
		          					-------
			          			</c:if>
		       				</td>
		               	</tr>
		             </c:forEach>
               
               	</table>
            </div>
           </div>
            <br>
		</div>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div id="modal_dialog_commute">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">퇴근</h4>
      </div>
      <div class="modal-body">
      	&nbsp;
      	<form action="./commuteOutWork" method="post">
      		<input type="hidden" name="id" value="${member.id}">
	        <input type="button" class="commute_btn1" value="비고 작성" data-toggle="modal" data-target="#myModal2">
			<input type="submit" style="margin-left: 20px" class="commute_btn1" value="퇴 근">
		</form>
      </div>
      <div class="modal-footer" style="margin-top: 3px;">
      </div>
    </div>
  </div>
</div>


<!-- Modal2 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div id="modal_dialog_commute2">
  <form action="./commuteMemoInsert" method="post">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">비고 작성</h4>
      </div>
      <div >
      <br>
   	  
      	<table class="table" >
      		<tr class="active table-colname">
      			<td id="commute_td6" >이름 : <span id="modal2_id" >${member.name}</span></td>
      			<input type="hidden" name="id" value="${member.id}">
      		</tr>
      		
      		<tr>
      			<td><span style="font-size : 15px; font-weight: bold;">비고</span></td>
      		</tr>
      		<tr>
      			<td>
      				&nbsp;&nbsp;&nbsp;<textarea name="memo" style="resize:none;"  rows="8" cols="60"></textarea>
      			</td>
      		</tr>
      	</table>
      </div>
      <div class="modal-footer" style="margin-top: 3px;">
      	<input value="제 출 " type="submit" class="btn btn-primary" style="background-color: #d2322d; border-color: #d2322d; ">
      </div>
    </div>
   </form>
  </div>
</div>

</body>
</html>