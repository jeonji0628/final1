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
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	<script src="<%= application.getContextPath()%>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="<%= application.getContextPath()%>/resources/js/bootstrap.min.js" type="text/javascript"></script>
    <title>welcome KHbiz</title>
    
    
    
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

<style type="text/css">
a:HOVER{
	color: gray;
}
#commute_s_mid{
	margin-top : 22px;
	width: 100%;
	height: 57px;
	background-color: #f5f5f5;
}
#iot_s_m_top{
    padding-top: 10px;
}
#IoT_table{
	margin: 5px auto;
	font-size:  20px;
	font-weight: 300;
	text-align: center;
}
.IoT_input{
   width: 60px;
   text-align: center;
}
#IoT_s_sub1{
	background-color: #c9302c;
	border: 1px solid #c9302c; 
	color: white;
    height: 31px;
    width: 120px;
    font-weight: 600px;
}
#commute_s_m_mid2{
	
	margin-top : 50px;
	width: 100%;
	height: 70px;
	
}
#Iot_u_m_mid3{
    margin-top: 31px;
    width: 100%;
    height: 163px;
}
#commute_s_m_mid4{
	margin-top : 2px;
	width: 100%;
	height: 70px;
}
#commute_s_m_td3{
	width: 600px;
	text-align: center;
	height: 45px;
	border: solid 1px #eee; 
}

.commute_s_m_td1{
	background-color: #f5f5f5;
	text-align:  center;
	height: 45px;
    width: 200px;
    border: solid 1px #eee; 
}
.commute_s_m_td2{
	text-align:  center;
	height: 45px;
    width: 200px;
    border: solid 1px #eee; 
}
#iot_position{
	border: none;
    width: 100%;
    height: 50px;
    text-align: center;
}
#page-inner{
	overflow: auto;
}
</style>
<script type="text/javascript">
	//updateConcent로 단순 페이지 이동
	function updateConcent() {
		updateConcent_frm.submit();
	}
	//iotView로 단순 페이지 이동
	function iotView2() {
		iotView2_frm.submit();
	}
	
	function update_state(i,j) {
		
		var concent_num = $("#concent_num"+i).val(); 
		var passing_length = $("#passing_length"+i).val();
		
		//ex) 1:ON이면 :을 기준으로 1,on으로 배열에 저장
		var temp = $("#btn_"+i+"_"+j).val().split(":");
		//콘센트 버튼 갯수
		var state_length = $("#passing_length"+i).val();
		//콘센트 상태 변화
		var con_state="";
		
		if(temp[1] == "ON"){
			 $("#btn_"+i+"_"+j).val(temp[0]+":OFF");
			 
			 for(var j=0; j<state_length; j++){
				 	 var temp2=$("#btn_"+i+"_"+j).val();
				 	 con_state=con_state+temp2+";";
			 }
			 
			 $("#num_frm").val(concent_num);
			 $("#con_state_frm").val(con_state);
			 
		}else if(temp[1] == "OFF"){
			
			$("#btn_"+i+"_"+j).val(temp[0]+":ON"); 
			 for(var j=0; j<state_length; j++){
				 	 var temp2=$("#btn_"+i+"_"+j).val();
				 	 con_state=con_state+temp2+";";
			 }
			 $("#num_frm").val(concent_num);
			 $("#con_state_frm").val(con_state);
		}
		update1.submit();
	}
	
	
</script>
</head>
<body>
<div id="wrapper">

<!-- form hidden  -->
	<!-- 업데이트로 넘기기  -->
	<form id="update1"  action="<%=application.getContextPath() %>/adminIoT/iotUpdate" method="post">
		<input name="con_state" id="con_state_frm" type="hidden">
		<input name="num" id="num_frm" type="hidden" >
	</form>
	<!-- updateConcent로 페이지 이동  -->
	<form name="updateConcent_frm" action="./updateConcent" method="post">

	</form>
	<!-- iotView로 페이지 이동  -->
	<form name="iotView2_frm" action="./iotView" method="post">
	
	</form>
	
	
<!--  -->    
    	
<header><%@ include file="../header.jsp" %></header>
<header><%@ include file="../sider.jsp" %></header>
<!-- heiien form  -->

	<div id="page-wrapper" >
          <div id="page-inner">  
        	<hr/>
        	<div class="table-size">
        	
                <div class="table-up">
                	<ul class="nav nav-tabs">
						<li role="presentation" ><a onclick="iotView2()">콘센트 등록</a></li>
						<li role="presentation" class="active"><a onclick="updateConcent()">콘센트 제어</a></li>
					</ul>
            	</div> 
            
            <div id="commute_s_mid">
            		<input type="hidden" name="adduino" id="adduino">
	            	<div id="Iot_u_m_mid3">
	            	<div id="commute_s_m_mid5">
	            		<table class="table" id="iot_table">
			               <tr class="active table-colname">
			               		<td colspan="4" >
			              	 		등록된 콘센트
						    	</td>
			               </tr>
			               	<tr class="active table-colname" style="text-align: center;">
			               		   <td>
			               		   		등 록 날 짜
			               		   </td>
					               <td>
					              	 	Physical Address
								   </td>
								   <td>
					              	 	장 소 
								   </td>
								   <td>
					              	 	ON/OFF
								   </td>
								   
			               </tr>
			               	   <c:forEach items="${concentList}" var="concentList" varStatus="i" >
				               	   <tr style="border-bottom: 1px solid #ddd;">
						           		<td style="padding-top: 15px;" >
					               				${concentList.reg_date}
					               				
					               				<!-- num hidden  -->
					               	   			<input id="concent_num${i.index}" type="hidden"  value="${concentList.num }">
					               	   			
					                   	</td>
					                   	
					       				<td style="padding-top: 15px; width: 266px;" >
						               			${concentList.adduino}
						               			
					               		</td>
					               		
					           			<td style="padding-top: 15px; width: 246px;" >
			               					${concentList.position}
				               				<!-- on/off 버튼 갯수 hidden  -->
					               			<input id="passing_length${i.index}" type="hidden" value="${fn:length(passing[i.index])}">
					               		</td>
					               		<td style="padding-top: 15px" >
					               			<c:forEach items="${passing[i.index]}" varStatus="j">
						               			<input style="color: white; background-color: #d9534f; border: none;" id="btn_${i.index}_${j.index}" type="button" value="${passing[i.index][j.index]}" onclick="update_state(${i.index},${j.index})"> 
						               			<%-- <input id="btn_state${j.index}" type="text" > --%>
					               			</c:forEach>
					               		</td>
					          		
					               	</tr>
			               	   </c:forEach>
					           
		               
		               	</table>
	            	</div>
          		
            </div>
            
           </div>
            <br>
		</div>
	</div>
</div>
</div>
</body>
</html>