<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="<%= application.getContextPath() %>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="<%= application.getContextPath() %>/resources/js/bootstrap.min.js" type="text/javascript"></script>
    <title>welcome KHbiz</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="<%= application.getContextPath() %>/resources/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="<%= application.getContextPath() %>/resources/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="<%= application.getContextPath() %>/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="<%= application.getContextPath() %>/resources/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
   	<link href="<%= application.getContextPath() %>/resources/css/divisionchart.css" rel="stylesheet" />
   	<link href="<%= application.getContextPath() %>/resources/css/allchart.css" rel="stylesheet" />
	<script src="<%= application.getContextPath() %>/resources/js/allchart.js" type="text/javascript"></script>
	<style type="text/css">
		.btn-app{
			width : 250px;
			height : 50px;
			padding-top : 10px;
			margin-bottom : 10%;
			margin-left: 10%; 
			font-size: large;
			font-weight: bold;
		}
		 input[type="text"]{
			border: 0;
			width: 100px;
			text-align: center;
		} 
		#table{
			margin-left : 16px;
		}
		#contents{
			max-height: 120px;
			max-width: 305px;
		}
		input[type="date"]{
			margin-left:18px;
			margin-right:18px;
			width: 130px;
			height: 30px;
		}
		.text-line{
		text-align: left !important;
		}
		.text-line input{
			text-align: center !important;
		}
		#title{
			font-size: large;
			font-weight: bold;
		}
		
		#select-text{
			margin-top : 5px;
			margin-bottom : 5px;
			margin-left : 50px;
			width: 200px;
			float: left;
		}
		#selector-go{
			margin-top : 5px;
			margin-bottom : 5px;
			float: left;
		}
		#result{
			 width: 200px; 
			 height: 50px; 
			 margin: 10% auto; 
			 font-size: 20px;
			 font-weight: bold;			 
		}
		.well{
			width:24%;
			height: 850px;
		}
	</style>
<script type="text/javascript">
$(function(){
	 var now = new Date();
     var year= now.getFullYear();
     var mon = (now.getMonth()+1);
     var day = now.getDate();
             
     var today = year + '년' + mon + '월' + day + '일';
	$("#today").text(today);
	
	$("#selector-go").click(function(){
		$.ajax({
			url : "selectperson",
			data : {
				name : $("#select-text").val()
			},
			success : function(result){
				if($(result).find("#listname").text() == ""){
					alert("이름을 입력하세요.");
				}else{
					$("#select-list").html(result);
				}
			}
		});
  	});

	$("#date1").change(function(){
		var nowdate = new Date(year,mon,day).valueOf();
		var date = $(this).val().split('-');
		var startdate = new Date(date[0], date[1], date[2]).valueOf();
		if(nowdate > startdate){
			alert("기간을 다시 설정해 주세요.");
			$("#date1").val("");
		}
	});
	
	$("#date2").change(function(){
		var date = $("#date1").val().split('-');
		var startdate = new Date(date[0], date[1], date[2]).valueOf();;
		var date2 = $(this).val().split('-');
		var lastdate = new Date(date2[0], date2[1], date2[2]).valueOf();
		if($("#date1").val() == ""){
			alert("시작 기간을 먼저 설정해 주세요.");
			$("#date2").val(" ");
		}
		if(startdate > lastdate){
			alert("기간을 다시 설정해 주세요.");
			$("#date2").val(" ");
		}
	});
	
	$("#search-complete").click(function(){
		if($("input[type='checkbox']").is(":checked") == false || $("#select-text").val() == ""){
			alert("결재자를 선택하세요.");		
		}else{
			$("#decide1").val($("#listname").text());
			$('#myModal2').modal('hide');
		}
	}); 
	
	$("#vacation-complete").click(function(){
		var decide = $("#decide1").val();
		var contents = $("#contents").val();
		var date1 = $("#date1").val();
		var date2 = $("#date2").val();
		if(decide == "" || contents == "" || date1 == "" || date2 == "") {			
			alert("모두 입력하세요");
			return false;
		}else{
			 $('#frm').submit(); 
		}
	});
	$("#app_go").click(function(){
			$.ajax({
				url : "searchApproval",
				type : "get",
				data : {
					curpage : 1,
					search : $(".select").val(),
					text : $("#text").val(),
					id : $("#id").val()
				},
				success : function(result){
					$(".table-search").html(result);
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
	    	<div class="well">
				<a data-toggle="modal" href="#myModal" class="btn btn-default btn-app"><i class="fa fa-file-text-o" aria-hidden="true">&nbsp;&nbsp;휴가신청서</i></a>
				<a data-toggle="modal" href="#" class="btn btn-default btn-app"><i class="fa fa-file-text-o" aria-hidden="true">&nbsp;&nbsp;사유서</i></a>
				<a data-toggle="modal" href="#" class="btn btn-default btn-app"><i class="fa fa-file-text-o" aria-hidden="true">&nbsp;&nbsp;결과보고서</i></a>
				<a data-toggle="modal" href="#" class="btn btn-default btn-app"><i class="fa fa-file-text-o" aria-hidden="true">&nbsp;&nbsp;사직서</i></a>
				<a data-toggle="modal" href="#" class="btn btn-default btn-app"><i class="fa fa-file-text-o" aria-hidden="true">&nbsp;&nbsp;기안품의서</i></a> 
			</div>
			<div class="right">
            	<div class="table-up">
            		<!-- <div class="select"> -->
            			 <select class="select">
					      	<option value="title">문서제목</option>
					      	<option value="num">문서번호</option>
					      	<option value="status">결재상태</option>
					      </select>
					    <div class="input-group">
					      <input type="text" class="form-control" id="text" placeholder="Search for...">
						      <span class="input-group-btn">
						        <button class="btn btn-default" id="app_go" >검색</button>
						      </span>
					    </div>
            	</div> 
            	<c:if test="${result ne null}">
					<div id="result">${result}</div>
				</c:if>
	            <c:if test="${approval ne null}">
	            	<div class="table-search">
                 	<div class="table-responsive">
					<table class="table">
					    <tr class="active table-colname">
                			<td style="padding-top: 13px;">no</td>
                			<td style="padding-top: 13px;">문서제목</td>
                			<td style="padding-top: 13px;">문서번호</td>
                			<td style="padding-top: 13px;">결재기한</td>
                			<td style="padding-top: 13px;">결재상태</td>
                			<td style="padding-top: 13px;">등록날짜</td>
                		</tr>
                			
                		<c:forEach items="${approval}" var="approval" varStatus="i">
	                		<tr>
		                		<td>${approval.num}</td>
		                		<td>${approval.title}</td>
		                		<td>${approval.num}</td>
		                		<td>${approval.deadline}</td>
		                		<td>${approval.status}</td>
		                		<td>${approval.reg_date}</td>
		                	</tr>
                		</c:forEach>
					</table>
					</div>
					<div class="table-down">
					  <ul class="pagination pagination-lg">
					    <li>
					    	<c:if test="${paging.curblock > 1}">
					    		<a href="approvalRegister?curpage=${paging.startnum -1}&id=${member.id}" aria-label="Previous">
							    	<span aria-hidden="true">&laquo;</span>
							    </a>
					    	</c:if>
					    </li>
					    <c:forEach begin="${paging.startnum}" end="${paging.lastnum}" step="1" var="i">
					    	<li><a href="approvalRegister?curpage=${i}&id=${member.id}">${i}</a></li>
					    </c:forEach>
					    <c:if test="${paging.curblock < paging.totalblock }">
						    <li>
						      <a href="approvalRegister?curpage=${paging.lastnum + 1}&id=${member.id}" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
					    </c:if>
					  </ul>
					</div>
				</div>
				</c:if>
			</div>
  		</div>
	</div>
	
<!-- MODAL -->
<div class="modal" id="myModal">
	<div class="modal-sm">
      <div class="modal-content">
        <form id="frm" action="forminsert" method="post">
		 	<div class="modal-header">
		   		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		   		<input type="text" name="title" id="title" value="휴가신청서" readonly="readonly">
		   		<input type="hidden" id="id" name="id" value="${member.id}">
		    </div>
    		<div class="modal-body">
				<table border="1" style="float: right; margin-top:10px; margin-right: 20px;" >
					<tr>
						<td rowspan="3">결재</td>
						<td>									
							<a data-toggle="modal" href="#myModal2" class="btn btn-defualt">결재자</a>						
						</td>
						<td>
							대표이사
						</td>
					</tr>	
					<tr>
						<td style="height: 50px;"></td>
						<td></td>
					</tr>
					<tr>
						<td><input type="text" id="decide1" name="decider1" readonly="readonly"></td>
						<td><input type="text" id="decide2" name="decider2" value="김연우" readonly="readonly"></td>
					</tr>		
				</table>
				<table id="table">
					<tr>
						<td >부 서:</td><td colspan="3" class="text-line"> <input type="text" name="division" readonly="readonly" value="${member.division}"><br></td>
					</tr>
					<tr>
						<td>직 급:</td><td colspan="3" class="text-line"><input type="text" name="position" readonly="readonly" value="${member.position}"><br></td>
					</tr>
					<tr>
						<td style="padding-bottom: 30px;">성 명:</td><td colspan="3" class="text-line" style="padding-bottom: 30px;"><input type="text" name="name" readonly="readonly" value="${member.name}"><br></td>
					</tr>
					<tr>
						<td>기 간:</td> 
						<td><input type="date" id="date1" name="startday"></td>
						<td>~</td>
						<td><input type="date" id="date2" name="lastday"><br></td>
					</tr>
					<tr>
						<td>사 유:</td>
						<td colspan="3" class="text-line"><textarea  style="margin-left: 18px;" cols="50" rows="8" id="contents" name="contents"></textarea><br></td>
					</tr>
					<tr>
						<td colspan="4" style="width:130px; padding-top:30px; padding-bottom: 30px;"><span style=" font-size: large; font-weight: bold;">위와 같이 휴가를 하고자 하오니 <br>허가하여 주시기 바랍니다.<br></span></td>
					</tr>
					<tr>
						<td colspan="4">
							<span style="margin: 0 20px;" id="today"></span><br>
							<span>기안자  ${member.name}</span>
						</td>
					</tr>
				</table>	
			</div>
		    <div class="modal-footer">
				<input type="button" class="btn btn-danger" id="vacation-complete" value="완료">
				<a href="#" data-dismiss="modal" class="btn btn-danger">취소</a>
		    </div>
		</form>
       </div>
     </div>
</div>

<div class="modal" id="myModal2" data-backdrop="static">
	<div class="modal-select">
      <div class="modal-content">
	        <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 id="title">결재자 검색</h4>
	        </div>  
	        
			<div class="modal-body">	
				<input type="text" class="form-control" id="select-text" placeholder="이름을 입력하세요">
				<span class="input-group-btn">
				  <button class="btn btn-default" id="selector-go" type="button">검색</button>
				</span>
				<div id="select-list">
					
				</div>
		  	</div>
		  	<div class="modal-footer">
				<input type="button"  class="btn btn-danger" id="search-complete" value="저장">
				<input type="button" data-dismiss="modal" class="btn btn-danger" value="취소">
			</div>
       </div>
     </div>
</div>
</body>
</html>