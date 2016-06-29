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
#Iot_s_m_mid3{
    margin-top: 33px;
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
	function iotView() {
		iotView_frm.submit();
	}
	
	$(document).ready(function () {
		$("#IoT_s_sub1").click(function () {
			var adduino = "";
			
			// 영어 대문자만 가능;
			var check1 = /[A-Z]/;
			// 공백  체크
			var check2 = $("#iot_position").val();
			for(var i=1; i<7; i++){
				var r = check1.test($("#text"+i).val());
				adduino = adduino + $("#text"+i).val(); 
				if(r == false || $("#text"+i).val().length !=2 ){
					r = false;
					break;
				}
			}
				
			if(r != true){
				alert("유효하지 않은 번호 입니다(영문 대문자만 입력해 주시기 바랍니다.)");
			}else if(check2 == ""){
				alert("장소를 입력해 주세요.");
			}else{
				$("#adduino").val(adduino);
				iotInsertForm.submit();
			}
		});
	});
</script>
</head>
<body>
<div id="wrapper">

<!-- form hidden  -->
	<!-- updateConcent로 페이지 이동  -->
	<form name="updateConcent_frm" action="./updateConcent" method="post">

	</form>
	<!-- iotView로 페이지 이동  -->
	<form name="iotView_frm" action="./iotView" method="post">
	
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
						<li role="presentation" class="active"><a onclick="iotView()">콘센트 등록</a></li>
						<li role="presentation"><a onclick="updateConcent()">콘센트 제어</a></li>
					</ul>
            	</div> 
            
            <div id="commute_s_mid">
            	<form name="iotInsertForm" action="./iotInsertForm" method="post">
            		<input type="hidden" name="adduino" id="adduino">
	            	<div id="iot_s_m_top">
	            		<table id="IoT_table" >
	            			<tr>
	            				<td>
	            					콘센트 번호 : &nbsp;&nbsp;&nbsp;
	            				</td>
	            				
	            				<td>
	            					<input id="text1" class="IoT_input" type="text" maxlength="2">
	            				</td>
	            				<td >
	            				&nbsp;ㅡ&nbsp;
	            				</td>
	            				<td>
	            					<input id="text2" class="IoT_input" type="text" maxlength="2">
	            				</td>
	            				<td>
	            				&nbsp;ㅡ&nbsp;
	            				</td>
	            				<td >
	            					<input id="text3" class="IoT_input" type="text" maxlength="2">
	            				</td>
	            				<td>
	            				&nbsp;ㅡ&nbsp;
	            				</td>
	            				<td>
	            					<input id="text4" class="IoT_input" type="text" maxlength="2">
	            				</td>
	            				<td>
	            				&nbsp;ㅡ&nbsp;
	            				</td>
	            				<td>
	            					<input id="text5" class="IoT_input" type="text" maxlength="2">
	            				</td>
	            				<td>
	            				&nbsp;ㅡ&nbsp;
	            				</td>
	            				<td>
	            					<input id="text6" class="IoT_input" type="text" maxlength="2">
	            				</td>
	            				<td>
	            					<input style="margin-left: 15px;" id="IoT_s_sub1"   type="button" value="콘센트 등록">
	            				</td>
	            			</tr>
	            			
	            		</table>
            		 </div>
            		
	            	<div id="Iot_s_m_mid3">
	            		<table>
	            			<tr>
		            			<td class="commute_s_m_td1">
		            					등록자 이름
	            				</td>
	            				<td id="commute_s_m_td3">
	            					${member.name }
	            				</td>
	            			</tr>
	            			
	            			<tr>
		            			<td class="commute_s_m_td1">
		            					장소
	            				</td>
	            				<td  id="commute_s_m_td3">
	            					<input placeholder="장소를 입력해주세요..."  id="iot_position" name="position" style="border: none;" type="text">
	            				</td>
	            			</tr>
	            			<tr>
		            			<td class="commute_s_m_td1">
		            					PIN번호
	            				</td>
	            				<td  id="commute_s_m_td3">
	            					<input placeholder="핀번호를 입력 해 주세요. ex)1,2,3"  id="iot_position" name="con_state" style=" bordeborder-right : 1px solid  #eee ;" type="text">
	            					
	            				</td>
	            			</tr>
	            		</table>
	            	</div>
					</form>
	            	<div id="commute_s_m_mid5">
	            		<table class="table" id="iot_table">
			               <tr class="active table-colname">
			               		<td colspan="4" >
			              	 		등록된 콘센트
						    	</td>
			               </tr>
			               	<tr class="active table-colname" style="text-align: center;">
			               		   <td>
			               		   		등 록 번 호
			               		   </td>
					               <td>
					              	 	등 록 날 짜
								   </td>
								   <td>
					              	 	Physical Address
								   </td>
								   <td>
					              	 	장 소
								   </td>
								   
			               </tr>
			               	   <c:forEach items="${concentList}" var="concentList" >
				               	   <tr style="border-bottom: 1px solid #ddd;">
						           		<td style="padding-top: 15px; " >
						               			${concentList.num}
					                   	</td>
					                   	
					       				<td style="padding-top: 15px" >
						               			${concentList.reg_date}
					               		</td>
					               		
					           			<td style="padding-top: 15px" >
					               				${concentList.adduino}
					               		</td>
					               		<td style="padding-top: 15px" >
					               				${concentList.position}
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

</body>
</html>