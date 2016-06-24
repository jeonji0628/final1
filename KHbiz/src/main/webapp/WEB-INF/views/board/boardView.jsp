<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="<%= application.getContextPath() %>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="<%= application.getContextPath() %>/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<title>게시판</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

 <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	<script src="<%= application.getContextPath()%>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="<%= application.getContextPath()%>/resources/js/bootstrap.min.js" type="text/javascript"></script>
    <title>welcome KHbiz</title>
 	<link href="<%= application.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet" />
 	<link href="<%= application.getContextPath()%>/resources/css/board.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="<%= application.getContextPath()%>/resources/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="<%= application.getContextPath()%>/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
       <!-- CUSTOM STYLES-->
    <link href="<%= application.getContextPath()%>/resources/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body>

<header><%@ include file="../header.jsp" %></header>
	<%@ include file="../sider.jsp" %>
	


<div id="page-wrapper" >
 <div id="page-inner">  
        	<hr/>        	
        	<div class="table-size2">
			              <div class="table-up">
			    <ul class="nav nav-tabs">
					<li role="presentation" class="active">
						<c:if test="${boardDTO.kind eq 1}">
							<h3>부서 게시판</h3>
						</c:if>
						<c:if test="${boardDTO.kind eq 2}">
							<h3>사내 게시판</h3>
						</c:if>
						</li>
				</ul>
			</div> 
            <br>
            <!-- boardWrite form  -->
           
            	<div class="table-responsive2">
	               <table  class="table">				
	                   <tr  class="active table-colname">
	                   	<td class="board_title" style="padding-top: 16px; padding-left: 10px;">
	                   		작성자
						</td>
						
	                    <td id="board_input" style="padding-top: 13px;">
	                   		<div class="col-lg-6">
							    <div class="input-group">
							      <input type="text" name="id" value="${boardDTO.id}" readonly="readonly" id="boardWriteWriter">
							   </div>
					    	</div>
	                    </td>
	                   </tr> 
	                   
	                   <tr>
	                   	<td class="board_title" style="padding-top: 16px; padding-left: 10px;">제목</td>
	                   	
	                   	<!-- title -->
	                   	<td><div id="boardView_title" name="title">${boardDTO.title}</div></td>
	                   </tr>
	                   
	                   <tr>
	                   	<!-- contents -->
	                   	<td colspan="2" style="padding-top: 13px;">
	                   		<div id="boardView_contents">${boardDTO.contents}</div>
	                   	</td>
	                   </tr>
	                   
	               	</table>
	              </div>
	               
           
            </div>       
	               <div id="boardViewbtn_div2">	
					<a href="boardList?curPage=1&kind=${boardDTO.kind}"><input type="button" value="LIST"></a>
	               <c:if test="${member.id eq boardDTO.id}">          	   
					<a href="boardDelete?num=${boardDTO.num}&kind=${boardDTO.kind}"><input type="button" value="DELETE" id="delete" onclick="return delete_check()"></a>
					<a href="boardUpdate?num=${boardDTO.num}"><input type="button" value="UPDATE" id="update"></a>
					</c:if> 
	           	   	</div>
           
       		<hr/>         

<!----------------- 댓글  ------------------->

<div id="boardViewReplyDiv">
<c:forEach items="${reply}" var="reply">
<table id="boardViewReplyTable">
<tr>
	<td id="replyTd1" colspan="2">${reply.id}님의 댓글 - ${reply.reg_date}일 작성</td>
</tr>
<tr>
<td id="replyTd2" rowspan="3">${reply.contents}</td>
</tr>

</table>
</c:forEach>
</div>

<form action="reply" method="post" id="boardViewReplyForm">
<input type="hidden" name="num" value="${boardDTO.num}">
<input type="hidden" id="replyWrite_id" name="id" value="${member.id}" readonly="readonly">
<textarea rows="" cols="" name="contents" id="replyWrite_contents"></textarea>
<input type="submit" value="댓글달기" id="replyWrite">
</form>

</div>
</div>
</body>
<script type="text/javascript">
	function delete_check(){
		var select = confirm("정말로 게시물을 삭제하시겠습니까?");
		if(select){
				return true;
				alert("게시물을 삭제하였습니다");			
			}else{
				return false;
			}
	}

</script>
</html>