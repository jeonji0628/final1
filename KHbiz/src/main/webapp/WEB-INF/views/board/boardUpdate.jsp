<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="<%= application.getContextPath() %>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="<%= application.getContextPath() %>/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<title>게시판</title>
	
	<!--ck deitor-->
	<script type="text/javascript" src="<%= application.getContextPath()%>/resources/ckeditor/ckeditor.js">
	</script>	
	<script type="text/javascript">
	window.onload=function(){  /* /익명함수 */
		CKEDITOR.replace("ckeditor");
	}
	</script>
	
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
	
<div id="wrapper">  
	<header><%@ include file="../header.jsp" %></header>
	<%@ include file="../sider.jsp" %>
<div id="page-wrapper" >
          <div id="page-inner">  
        	<hr/>        	
        	<div class="table-size2">
                <div class="table-up">
                	<ul class="nav nav-tabs">
						<li role="presentation" class="active">
							<c:if test="${param.kind eq 1}">
								<h3>부서 게시판</h3>
							</c:if>
							<c:if test="${param.kind eq 2}">
								<h3>사내 게시판</h3>
							</c:if>
						</li>
					</ul>
            	</div> 
            <br>
            <!-- boardWrite form  -->
           
            	<div class="table-responsive2">
	               <table  class="table">
	              <form action="boardUpdate1" method="post" id="boardUpdateForm">
					    <tr  class="active table-colname">
	                   	<td class="board_title" style="padding-top: 16px; padding-left: 10px;">
	                   		작성자
						</td>
						
	                    <td id="board_input" style="padding-top: 13px;">
	                   		<div class="col-lg-6">
							    <div class="input-group">
							      <input type="text" name="id" value="${member.id}" readonly="readonly" id="boardWriteWriter">
							   
							    </div>
					    	</div>
	                    </td>
	                   </tr> 
	                   
	                   <tr>
	                   	<td class="board_title" style="padding-top: 16px; padding-left: 10px;">제목</td>
	                   	
	                   	<!-- title -->
	                   	<td style="padding-top: 13px;"><input type="text" id="title" class="form-control" name="title" value="${boardDTO.title}"></td>
	                   </tr>
	                   
	                   <tr>
	                   	<!-- contents -->
	                   	<td colspan="2" style="padding-top: 13px;">
	                   		<textarea id="ckeditor" name="contents" rows="10" cols="71">${boardDTO.contents}</textarea>
	                   	</td>
	                   </tr>
	                   
	               	</table>
	              </div>
	               <input type="hidden" value="${boardDTO.num}" name="num">
					<input type="hidden" value="${boardDTO.kind}" name="kind">
					<input type="hidden" value="${boardDTO.counts}" name="counts">
	               
	               <div id="btn_div2">
	               
					<a href="boardList?curPage=1&kind=${boardDTO.kind}"><input type="button" id="list" value="취소"></a>
	           	   	<input type="submit" value="수정하기" id="goUpdate">
	        	   	</form>
	        	   	
	               </div>
           
            </div>       
           
       		<hr/>         
   		</div>
	</div>
</div>





</form>
</body>
</html>