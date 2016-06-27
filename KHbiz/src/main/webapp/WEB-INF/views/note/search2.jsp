<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	var checked_count = 0;
	var ch_state  = true;
	function ck_check(i) {
		var id =$("#select_id"+i).html();
		$("#select_tempid").val(id);
		checked_count = checked_count+1;
		ch_state  = true;
		
	}
	$(document).ready(function () {
		
		if($("#ck").val() == "no"){
			alert("검색된 결과가 없습니다.");
			
		}
		$("#btn_search").click(function name() {
			 $.ajax({
		            url : "./search" ,
		            success : function (result) {
	            		$("#modal_div").html(result);
		            	$("#myModal").modal("show");
		           }
             });
		})
		$("#btn2").click(function () {
			location.href="./noteWrite";
		});
		$("#btn1").click(function () {
			location.href="./noteList";
		});
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

<table id="table_1"  class="table" style="text-align: center;">
	<tr class="active table-colname" >
		<td style="padding-top: 13px;">체크</td>
		<td style="padding-top: 13px;">이름</td>
		<td style="padding-top: 13px;">아이디</td>
		<td style="padding-top: 13px;">부서</td>
		<td style="padding-top: 13px;">직책</td>
	</tr>
	<c:forEach items="${list}" var="l" varStatus="i">
			<tr>
				
				<td><input type="checkbox" id="ck${i.index }" onclick="ck_check(${i.index})" ></td>
				
				<td>${l.name }</td>
				<td><span id="select_id${i.index }">${l.id }</span></td>
				<td>${l.division }</td>
				<td>${l.position }</td>
			</tr>
	</c:forEach>
	<c:if test="${list eq null }">
		<tr>
				
				<td colspan="5">
					<input type="hidden" id="ck" value="no" >
				</td>
				
		</tr>
	</c:if>
	
</table>