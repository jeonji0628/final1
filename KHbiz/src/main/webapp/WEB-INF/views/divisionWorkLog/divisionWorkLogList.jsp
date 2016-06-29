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
<script language = "javascript" type = "text/javascript">
$(document).ready(function() { 
  //******************************************************************************
  // 상세검색 달력 스크립트
  //******************************************************************************
  var clareCalendar = {
   monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
   dayNamesMin: ['일','월','화','수','목','금','토'],
   weekHeader: 'Wk',
   dateFormat: 'yymmdd', //형식(20120303)
   autoSize: false, //오토리사이즈(body등 상위태그의 설정에 따른다)
   changeMonth: true, //월변경가능
   changeYear: true, //년변경가능
   showMonthAfterYear: true, //년 뒤에 월 표시
   buttonImageOnly: true, //이미지표시
   buttonText: '날짜선택', //버튼 텍스트 표시
   showOn: "both", //엘리먼트와 이미지 동시 사용(both,button)
   yearRange: '1990:2100' //1990년부터 2020년까지
  }; 
  
  $("#selectDate").datepicker(clareCalendar);
  $("#toDt").datepicker(clareCalendar);
  $("#img.ui-datepicker-trigger").attr("style","margin-left:5px; vertical-align:middle; cursor:pointer;"); //이미지버튼 style적용
  $("#ui-datepicker-div").hide(); //자동으로 생성되는 div객체 숨김  
  
  $("#workLogView").click(function(){
	  	var id;
	  	var state;
	  	
	  	if($("#divisionWorkLog_id").val() == null){
	  		id=$("#hidden_id").val();
	  	}else{
	  		id=$("#divisionWorkLog_id").val();
	  	}	  	
	  	if($("#divisionWorkLog_state").val() == null){
		  		state=$("#hidden_state").val();
		  	}else{
		  		state=$("#divisionWorkLog_state").val();
		  	}	    		  	
	   	var reg_date = $("#selectDate").val();	   	
	   	var gra = $("#gra").val();
	   	var divi = $("#divi").val();
	   	
	  	location.href = "divisionWorkLogList?id="+id+"&state="+state+"&reg="+reg_date+"&gra="+gra+"&divi="+divi;	   

}); 
  
  $(".divisionWorkLogView1").click(function(){
	  	var num = $(this).attr("name");	  	
	  	location.href = "divisionWorkLogOneView?num="+num;
});   
  
});
</script>

</head>
<body>
<header><%@ include file="../header.jsp" %></header>
	<%@ include file="../sider.jsp" %>	
<div id="page-wrapper" >
		<div id="page-inner">
			<hr/>
			<div class="table-size">
				<h3>${param.divi}부서</h3> 
			 <div class="table-up">
				<ul class="nav nav-tabs">
					<c:if test="${param.state eq 1}">
						<li role="presentation" class="active"><a href="./divisionWorkLogList?id=${member.id}&state=1&reg=1&gra=${member.position}&divi=${member.division}">일일업무일지</a></li>
						<li role="presentation"><a href="./divisionWorkLogList?id=${member.id}&state=2&reg=1&gra=${member.position}&divi=${member.division}">주간업무일지</a></li>
						<li role="presentation"><a href="./divisionWorkLogList?id=${member.id}&state=3&reg=1&gra=${member.position}&divi=${member.division}">월간업무일지</a></li>
					</c:if>
					<c:if test="${param.state eq 2}">
						<li role="presentation"><a href="./divisionWorkLogList?id=${member.id}&state=1&reg=1&gra=${member.position}&divi=${member.division}">일일업무일지</a></li>
						<li role="presentation" class="active"><a href="./divisionWorkLogList?id=${member.id}&state=2&reg=1&gra=${member.position}&divi=${member.division}">주간업무일지</a></li>
						<li role="presentation"><a href="./divisionWorkLogList?id=${member.id}&state=3&reg=1&gra=${member.position}&divi=${member.division}">월간업무일지</a></li>
					</c:if>
					<c:if test="${param.state eq 3}">
						<li role="presentation"><a href="./divisionWorkLogList?id=${member.id}&state=1&reg=1&gra=${member.position}&divi=${member.division}">일일업무일지</a></li>
						<li role="presentation"><a href="./divisionWorkLogList?id=${member.id}&state=2&reg=1&gra=${member.position}&divi=${member.division}">주간업무일지</a></li>
						<li role="presentation" class="active"><a href="./divisionWorkLogList?id=${member.id}&state=3&reg=1&gra=${member.position}&divi=${member.division}">월간업무일지</a></li>
					</c:if>
				</ul>
				
			 </div>	
				 <br> 
				 <div class="table-responsive">
				 	<table class="table">
				 	<div id="calendar_div">
					 	<input type="text" name="fromDt" id="selectDate" size="8" maxlength="8" value ="">&nbsp;
						<input type="button" id="workLogView" value="해당날짜 업무일지보기">
					 </div>
					 	<tr class="active table-colname">
	                   								
		                    <td id="divisionWorkLog_num" style="padding-top: 13px; border-bottom: 1px solid #ddd;">번호</td>
		                    <td id="divisionWorkLog_title" style="padding-top: 13px; border-bottom: 1px solid #ddd;">ID</td>
	                    	<td id="divisionWorkLog_writer" style="padding-top: 13px; border-bottom: 1px solid #ddd;">업무내용</td>	                    	
	                    	<td id="divisionWorkLog_counts" style="padding-top: 13px; border-bottom: 1px solid #ddd;">업무결과</td>
	                      	<td id="divisionWorkLog_reg_date" style="padding-top: 13px; border-bottom: 1px solid #ddd;">작성일</td>
	                    	<td id="divisionWorkLog_paymentState" style="padding-top: 13px; border-bottom: 1px solid #ddd;" colspan="2">결제상태</td>
	                    	<td id="divisionWorkLog_paymentPerson" style="padding-top: 13px; border-bottom: 1px solid #ddd;">결제</td>
	                    	<c:if test="${member.id == divisionWorkLogDTO.id}">
	                    		<td id="aaaaa" style="padding-top: 13px;  border-bottom: 1px solid #ddd;"></td>
	                    	</c:if>				             
	                   </tr>
                   <c:forEach items="${divisionWorkLog1}" var="divisionWorkLogDTO" varStatus="i"> 	
	                    	
                 		    <tr>
		                    <td style="padding-top: 30px;">${divisionWorkLogDTO.num}</td>
		                    <td style="padding-top: 30px;">${divisionWorkLogDTO.id}</td>
		                    <td>
		                    <div id="short1"><a herf="" name="${divisionWorkLogDTO.num}" class="divisionWorkLogView1">${divisionWorkLogDTO.plan}</a></div>
		                    </td>
		                    <td>
		                    <div class="short"><a herf="" name="${divisionWorkLogDTO.num}" class="divisionWorkLogView1">${divisionWorkLogDTO.result}</a></div>
		                    </td>
		                    <td style="padding-top: 30px;">${divisionWorkLogDTO.reg_date}</td>
		                    <td style="padding-top: 30px;">${divisionWorkLogDTO.payment_state}</td>
		            <td>        
		            <input type="hidden" name="reg" id="hiddenReg" value="${param.reg}">
					<c:if test="${divisionWorkLogDTO.grade > 3}">
					<form action="divisionWorkLogListUpdate" method="post" style="margin-top: 20px;">
					<select name="payment_state" id="payment_state">
						<option value="1">미결제</option>
						<option value="2">결제완료</option>
						<option value="3">수정후 다시 제출</option>
					</select>
						<input type="hidden" id="divi" name="divi" value="${param.divi}">
						<input type="hidden" id="gra" name="gra" value="${param.gra}">
						<input type="hidden" id="divisionWorkLogNum" name="num" value="${divisionWorkLogDTO.num}">
						<input type="hidden" id="divisionWorkLog_state" name="state" value="${divisionWorkLogDTO.state}">
						<input type="hidden" id="divisionWorkLog_id" name="id" value="${member.id}">
						<input type="hidden" name="payment_id" value="${member.id}">
						<input type="hidden" name="reg" id="hiddenReg" value="${param.reg}">
						<input type="submit" value="확인">
					</form>
					</c:if>		
					</td>
				
					<td>
					<c:if test="${divisionWorkLogDTO.payment_id != '1' and divisionWorkLogDTO.payment_id !=null}">
					<div style="padding-top: 30px;">${divisionWorkLogDTO.payment_id}</div>
					</c:if>
					</td>
                     <c:if test="${member.id == divisionWorkLogDTO.id}">
	                   <td style="border-top: 1px solid #ddd;">
						<a href="divisionWorkLogUpdate?num=${divisionWorkLogDTO.num}&state=${divisionWorkLogDTO.state}"><input type="button" id="update" value="수정"></a>
						<a href="divisionWorkLogDelete?num=${divisionWorkLogDTO.num}&id=${member.id}&state=${divisionWorkLogDTO.state}&reg=${param.reg}&gra=${param.gra}&divi=${param.divi}"><input type="button" id="delete" value="삭제" onclick="return divisionWorkLogDelete()"></a>
						</td>
					</c:if>					
                   </tr>
                  </c:forEach>
				 	</table>
				 	
				 	<input type="hidden" id="hidden_id" value="${member.id}">
					<input type="hidden" id="hidden_state" value="${param.state}">
					<input type="hidden" id="divi" name="divi" value="${param.divi}">
					<input type="hidden" id="gra" name="gra" value="${param.gra}">
					
						<form action="divisionWorkLogWrite" method="get" id="divisionWorkLogWrite">
									<input type="hidden" name ="id" id="id" value="${member.id}">
									<input type="hidden" name ="state" value="${param.state}">
									<input type="hidden" name="divi" value="${member.division}">
									<input type="hidden" name="gra" value="${member.position}">
									<!-- division position job name id state (plan result noted) -->		
									<input type="submit" name="write" id="workLog_writer_button" value="업무일지작성">
						</form>
				 </div>
			</div>		
		</div>
	</div>
</body>
<script type="text/javascript">
function divisionWorkLogDelete(){
	  var select = confirm("정말로 업무일지를 삭제하시겠습니까?");
		if(select){
				return true;
				alert("업무일지를 삭제하였습니다");			
			}else{
				return false;
			}
}
</script>
</html>