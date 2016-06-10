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
    
    
   
    
 	<link href="<%= application.getContextPath() %>/resources/css/bootstrap.css" rel="stylesheet" />
 	<link href="<%= application.getContextPath() %>/resources/css/note.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="<%= application.getContextPath() %>/resources/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="<%= application.getContextPath()%>/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
       <!-- CUSTOM STYLES-->
    <link href="<%= application.getContextPath() %>/resources/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">

 function goWork(i){
	
	 alert(i);
	 if(i )
 }
/* $(function(){
	$("#chool").click(function(){
		alert("ehdsp");
		
	});
}); */
</script>

<style type="text/css">
.table-size{
	height: 853px;
}

#commute_mid{
	width: 100%;
	height: 350px;
	margin-top: 10px;

}
#commute_mid_left{
	width: 60%;
	height: 350px;
	float: left;
}
#commute_mid_right{
	width: 40%;
	height: 350px;
	float: right;
}
#commute_text{
	font-size: 37px;
	font-weight: bold;
}
#commute_text2{
	font-size: 18px;
	color: #555;
}
.commute_btn1{
	width : 162px;
	height : 70px;
	background-color: #d2322d;
	color: white;
	font-size : 25px;
	font-weight: bold;
	border-radius : 5px;
}

#commute_td1{
	width: 40px;
}

#commute_hr{
	margin-top: 10px;
	margin-bottom: 10px;
	width: 342px;
}
#commute_table2{
	background-color: #F3F3F3;
	border-radius : 7px;
	font-size: 15px;
}
.commute_td2{
	width: 253px;
	height: 40px;
}
.commute_td3{
	width: 90px;
	padding-left: 13px;
}
#commute_bottom{
	width: 100%;
	height : 423px;
}
#commute_td4{
	text-align: center;
	font-size: 18px; 
	padding-top: 12px;
}
.commute_td5{
	width: 225px;
    height: 50px;
    padding-top: 50px;
}
</style>
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
						<li role="presentation" class="active"><a href="./noteList?id=${member.id }&state=1">출퇴근 입력</a></li>
						<li role="presentation"><a href="./noteList?id=${member.id }&state=2">출퇴근 내역조회</a></li>
						<li role="presentation"><a href="./noteList?id=${member.id }&state=2">월별 통계</a></li>	
					</ul>
            	</div> 
            
            <div id="commute_mid">
            
            	<div id="commute_mid_left">
            		
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
            					<form action="#" method="post" name="commute_form1">
	            					<button class="commute_btn1" id="chool" onclick="goWork(1)">
	            						출 &nbsp;근
				          			</button>
				          			&nbsp;&nbsp;&nbsp;
				          			<button class="commute_btn1" data-toggle="modal" data-target="#myModal" onclick="goWork(2)">
						          		퇴 &nbsp;근
					        	   	</button>
			        	   		</form>					        	   	
				          		
            				</td>
            			</tr>
            		</table>
            		<br>
            		<table id="commute_table2">
            			<tr>
            				<td class="commute_td3">이름 </td>
            				<td class="commute_td2"> ${member.name }</td>
            			</tr>
            			<tr>
            				<td class="commute_td3">날짜 </td>
            				<td class="commute_td2" >2010.03.02</td>
            			</tr>
            			<tr>
            				<td class="commute_td3">출근시간 </td>
            				<td class="commute_td2">------</td>
            			</tr>
            			<tr>
            				<td class="commute_td3">퇴근시간</td>
            				<td class="commute_td2">------</td>
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
	                  
                <tr>
               		<td style="padding-top: 15px" class="commute_td5">
               			2016.06.09
                   	</td>
               		<td style="padding-top: 15px" class="commute_td5">
               			08:58
               		</td>
           			<td style="padding-top: 15px" class="commute_td5">
               			19:17
               		</td>
          			<td style="padding-top: 15px" class="commute_td5">
	          			정상근무
       				</td>
	       				
                </tr>
                 <tr>
               		<td class="commute_td5">
               			2016.06.09
                   	</td>
               		<td class="commute_td5">
               			08:58
               		</td>
           			<td class="commute_td5">
               			19:17
               		</td>
          			<td class="commute_td5">
	          			정상근무
       				</td>
	       				
                </tr>
                 <tr>
               		<td class="commute_td5">
               			2016.06.09
                   	</td>
               		<td class="commute_td5">
               			08:58
               		</td>
           			<td class="commute_td5">
               			19:17
               		</td>
          			<td class="commute_td5">
	          			정상근무
       				</td>
	       				
                </tr>
                 <tr>
               		<td class="commute_td5">
               			2016.06.09
                   	</td>
               		<td class="commute_td5">
               			08:58
               		</td>
           			<td class="commute_td5">
               			19:17
               		</td>
          			<td class="commute_td5">
	          			정상근무
       				</td>
	       				
                </tr>
                 <tr>
               		<td class="commute_td5">
               			2016.06.09
                   	</td>
               		<td class="commute_td5">
               			08:58
               		</td>
           			<td class="commute_td5">
               			19:17
               		</td>
          			<td class="commute_td5">
	          			정상근무
       				</td>
	       				
                </tr>
                 <tr>
               		<td class="commute_td5">
               			2016.06.09
                   	</td>
               		<td class="commute_td5">
               			08:58
               		</td>
           			<td class="commute_td5">
               			19:17
               		</td>
          			<td class="commute_td5">
	          			정상근무
       				</td>
	       				
                </tr>
                 <tr>
               		<td class="commute_td5">
               			2016.06.09
                   	</td>
               		<td class="commute_td5">
               			08:58
               		</td>
           			<td class="commute_td5">
               			19:17
               		</td>
          			<td class="commute_td5">
	          			정상근무
       				</td>
	       				
                </tr>
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
        <button class="commute_btn1" data-toggle="modal" data-target="#myModal2">
        	조 기 퇴 근
		</button>
		<button style="margin-left: 20px" class="commute_btn1">
        	정 상 퇴 근
		</button>
      </div>
      <div class="modal-footer" style="margin-top: 3px;">
      </div>
    </div>
  </div>
</div>


<!-- Modal2 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div id="modal_dialog_commute2">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">퇴근</h4>
      </div>
      <div >
      <br>
      	<table class="table" >
      		<tr class="active table-colname">
      			<td>이름 : <span id="modal2_id">${member.name }</span></td>
      		</tr>
      		
      		<tr>
      			<td><span style="font-size : 15px; font-weight: bold;">비고</span></td>
      		</tr>
      		<tr>
      			<td>
      				&nbsp;&nbsp;&nbsp;<textarea rows="8" cols="60"></textarea>
      			</td>
      		</tr>
      	</table>
      </div>
      <div class="modal-footer" style="margin-top: 3px;">
      	<button type="button" class="btn btn-primary" style="background-color: #d2322d; border-color: #d2322d; ">
      		제 출 
      	</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>