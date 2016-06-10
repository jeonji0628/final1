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
 	<link href="<%= application.getContextPath()%>/resources/css/note.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="<%= application.getContextPath()%>/resources/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="<%= application.getContextPath()%>/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
       <!-- CUSTOM STYLES-->
    <link href="<%= application.getContextPath()%>/resources/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	function titleClick(i) {
		var id =$("#id"+i).val();
		var date=$("#date"+i).html();
		var contents=$("#contents"+i).val();
		var state=$("#state").val();
		var num=$("#select_num"+i).val();
		
		$.ajax({
            url : "./noteTitleListModel" ,
            data : {
            	id : id,
            	date : date,
            	contents : contents,
            	state : state,
            	num : num
            },
            success : function (result) {
        		$("#modal_div").html(result);
            	$("#myModal").modal("show");
           }
     	});
	}
	
	
	$(document).ready(function () {
		var del_num="";
		
		if($("#message").val() != ""){
			alert($("#message").val());
		}
		
		//체크박스 전체 체크
		$("#allcheck").click(function () {
			var checkAll= $("input[type='checkbox']");
			
			if(checkAll.length-1 == $("input[type='checkbox']:checked").length ){
				//전체가 선택 되어 있으면
				checkAll.prop("checked", false);
			}else{
				//전체가 선택 되어 있지 않으면
				checkAll.prop("checked", true);
			}
		});
		$("#btn1").click(function () {
			var count = 0;
			var size = $("#noteList_size").val();
			for(var i=0; i<size; i++){
				var num = $("#select_num"+i).val();
				var checked =$("#select_ck"+i).is(':checked');
				
				if(checked == true){
					count++;
					del_num = del_num +","+ num;
				}
			}
			
			if(count > 0){
				$("#del_num").val(del_num);
				del_form.submit();
				
			}else{
				count = 0;
				alert("삭제할 쪽지를 선택해 주세요.");
				return false
			}

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
        	<!-- hieen state  -->
        	<input type="hidden" id="state" value="${pageMaker.state}">
        	
        	<div class="table-size">
                <div class="table-up">
                	<ul class="nav nav-tabs">
                	
                		<c:if test="${pageMaker.state eq 1}">
							<li role="presentation" class="active"><a href="./noteList?id=${member.id }&state=1">받은 쪽지함</a></li>
							<li role="presentation"><a href="./noteList?id=${member.id }&state=2">보낸쪽지함</a></li>
						</c:if>
						
						<c:if test="${pageMaker.state eq 2}">
							<li role="presentation" ><a href="./noteList?id=${member.id }&state=1">받은 쪽지함</a></li>
							<li role="presentation" class="active"><a href="./noteList?id=${member.id }&state=2">보낸쪽지함</a></li>
						</c:if>
						
					</ul>
            	</div> 
            <br>
            <div class="table-responsive">
               <table class="table">
                   <tr class="active table-colname">
                   	<td id="note_check" style="padding-top: 13px;">
                   		<input id="allcheck" type="checkbox">
					</td>
					
					<c:if test="${pageMaker.state eq 1}">
	                    <td id="note_sendid" style="padding-top: 13px;">보낸이</td>
	                    <td id="note_contents" style="padding-top: 13px;">제목</td>
                    	<td id="note_data" style="padding-top: 13px;">날짜</td>
					</c:if>
					
					
					<c:if test="${pageMaker.state eq 2}">
	                    <td id="note_sendid" style="padding-top: 13px;">받는이</td>
	                    <td id="note_contents2" style="padding-top: 13px;">제목</td>
                    	<td id="note_data" style="padding-top: 13px;">날짜</td>
                    	<td id="note_check" style="padding-top: 13px;">수신확인</td>
					</c:if>
					
                    
                   </tr>
                   
                   <c:forEach items="${noteList }" var="nl" varStatus="i">
	                   <tr>
	                   	<td>
	                   		<input id="select_ck${i.index}" class="checkbox_size" type="checkbox" onclick="check_ck(${i.index})">
	                   	</td>
	                   	
	               		<td>
	               		<c:if test="${pageMaker.state eq 1}">
		               		${nl.send_id}
		               		<input id="id${i.index}" type="hidden" value="${nl.send_id}">
		               	</c:if>
		               	<c:if test="${pageMaker.state eq 2}">
		               		${nl.to_id}
		               		<input id="id${i.index}" type="hidden" value="${nl.to_id}">
		               	</c:if>
		               	
		               		<!-- num 가져와서 삭제  -->
		               		<input id="select_num${i.index}" type="hidden" value="${nl.num}">
	               		</td>
	               		
	          			<td>
	          				<a data-toggle="modal"  data-target="#myModal"  onclick="titleClick(${i.index})">
	          					<span id="title${i.index}" >${nl.title}</span>
	          				</a>
          				</td>
	       				<td>
	       					 <span id="date${i.index }">${nl.reg_date }</span> 
	       					 <input type="hidden" id="contents${i.index }" value="${nl.contents }">
       					</td>
	       				
       					<c:if test="${pageMaker.state eq 2}">
       					
       						<c:if test="${nl.state eq 0}">
       							<td>미확인</td>
       						</c:if>
       						
       						<c:if test="${nl.state eq 1}">
       							<td>수신확인</td>
       						</c:if>
       						
       					</c:if>
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
                   
               	   <c:if test="${pageMaker.curBlock > 1}">
	                   <li>
	                   	 <input type="text" value="${pageMaker.curBlock}"> 
	                     <a href="./noteList?curPage=${pageMaker.startNum}&id=${member.id}&state=${pageMaker.state}" aria-label="Previous">
	                       <span aria-hidden="true">&laquo;</span>
	                     </a>
	                   </li>
                   </c:if>
                   
                   <c:forEach begin="${pageMaker.startNum}" end="${pageMaker.lastNum}" step="1" var="num">
	                   		<li>
	                   			<a href="./noteList?curPage=${num }&id=${member.id}&state=${pageMaker.state}">${num}</a>
                   			</li>
                   </c:forEach>
                   
                   <c:if test="${pageMaker.totalBlock > 1}">
	                   <li>
	                     <a href="./noteList?curPage=${pageMaker.startNum}&id=${member.id}&state=${pageMaker.state}" aria-label="Next">
	                       <span aria-hidden="true">&laquo;</span>
	                     </a>
	                   </li>
                   </c:if>
                 </ul>
                 
               </div>
            </div>
            
            <form action="./noteDel" name="del_form" >
	      		<!-- hidden -->
	            <input id="message" type="hidden" value="${message}"> 
	            <input id="noteList_size" type="hidden" value="${noteList.size()}" >  
	            <input type="hidden" name="view_state" id="view_state" value="${pageMaker.state}">
	            <input type="hidden" name="id" id="id" value="${member.id}">
	            <input type="hidden" name="del_num" id="del_num">
            </form>
            
           <!-- Modal -->
          <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		   	<div class="modal-dialog">
			    <div class="modal-content">
			  		  <div id="modal_div">
            
           			  </div>
			    </div>
			  </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>