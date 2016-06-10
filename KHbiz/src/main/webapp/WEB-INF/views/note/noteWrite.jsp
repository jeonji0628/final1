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
     <!-- FONTAWESOME STYLES-->
    <link href="<%= application.getContextPath() %>/resources/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="<%= application.getContextPath() %>/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
       <!-- CUSTOM STYLES-->
    <link href="<%= application.getContextPath() %>/resources/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
   	<link href="<%= application.getContextPath() %>/resources/css/note.css" rel="stylesheet" />


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		
		$("#btn_search").click(function name() {
			 $.ajax({
		            url : "./search" ,
		            success : function (result) {
	            		$("#modal_div").html(result);
		            	$("#myModal").modal("show");
		           }
             });
		})
		/* 전송 버튼 = form 데이터 전송  */
		$("#btn2").click(function () {
			onform.submit();
		});
		/* 뒤로가기 버튼  */
		$("#btn1").click(function () {
			location.href="./noteList";
		});
		/* 주소록 검색   */
		$("#btn4").click(function () {
			var name=$("#search_input2").val();
		   $.ajax({
            url : "./memberSearch" ,
            data : {
            	name : name
            },
            success : function (result) {
            	
           }
           });
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
        	
        	<div class="table-size2">
                <div class="table-up">
                	<ul class="nav nav-tabs">
						<li role="presentation" class="active"><a href="#">쪽지쓰기</a></li>
					</ul>
            	</div> 
            <br>
            <!-- noteSend form  -->
            <form action="./noteSend" name="onform" method="post">
            	<div class="table-responsive2">
	               <table  class="table">
	               
	                   <tr  class="active table-colname">
	                   	<td class="note_title" style="padding-top: 16px; padding-left: 10px;">
	                   		받는사람
						</td>
						
	                    <td id="note_input" style="padding-top: 13px;">
	                   		<div class="col-lg-6">
							    <div class="input-group">
							      
							      <!-- 보낸 아이디  -->
							      <input type="hidden" name="send_id" value="${member.id }">
							      <input type="hidden" name="division" value="${member.division }">
							      <input type="hidden" name="position" value="${member.position }">
							      
							      <!-- 받는 아이디 -->
							      <input id="name" name="to_id" type="text" class="form-control" placeholder="검색 버튼을 눌러주세요." readonly="readonly" value="${id}">
							      
							      <span class="input-group-btn">
							        <button id="btn_search" class="btn btn-default" type="button" data-toggle="modal" data-target="#myModal">
							        	<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							        </button>
							      </span>
							    </div>
					    	</div>
	                    </td>
	                   </tr> 
	                   
	                   <tr>
	                   	<td class="note_title" style="padding-top: 16px; padding-left: 10px;">제목</td>
	                   	
	                   	<!-- title -->
	                   	<td style="padding-top: 13px;"><input id="title" class="form-control" name="title" type="text"></td>
	                   </tr>
	                   
	                   <tr>
	                   	<!-- contents -->
	                   	<td colspan="2" style="padding-top: 13px;">
	                   		<textarea id="contents" name="contents" rows="10" cols="64.5"></textarea>
	                   	</td>
	                   </tr>
	                   
	               	</table>
	              </div>
	               
	               <div id="btn_div2">
	                <button id="btn1">
		    		   	<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"> 이전</span>
	       			</button>
		          	<button id="btn2">
		       			<span class="glyphicon glyphicon-envelope" aria-hidden="true"> 전송</span>
	        	   	</button>
	               </div>
             </form> 
            </div>
            
          <!-- Modal -->
           <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		   	<div class="modal-dialog">
			    <div class="modal-content">
			  		  <div id="modal_div">
            
           			  </div>
			    </div>
			  </div>
			</div>
           
       		<hr/>  
       		<input type="text" value="${message}">              
   		</div>
	</div>
</div>
</body>
</html>