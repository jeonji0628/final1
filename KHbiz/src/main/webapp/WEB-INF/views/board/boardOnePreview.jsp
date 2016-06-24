<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="<%= application.getContextPath()%>/resources/css/board.css" rel="stylesheet" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사내게시판</title>
<style type="text/css">
	#boardView_contents{
		text-align: center;
	}
	#boardView_contents{
		height: 300px;
	}
	
</style>
</head>
<body>

 <div class="table-responsive3">
 <table  class="table">				
	                   <tr  class="active table-colname">
	                   	<td class="board_title" style="padding-top: 16px; padding-left: 10px;">
	                   		작성자
						</td>
						
	                    <td id="board_input" style="padding-top: 18px;">
	                   		<div class="col-lg-6">
							    <div class="input-group">
							      ${boardOnePreview1.id}
							   </div>
					    	</div>
	                    </td>
	                   </tr> 
	                   
	                   <tr>
	                   	<td class="board_title" style="padding-top: 16px; padding-left: 20px;">제목</td>
	                   	
	                   	<!-- title -->
	                   	<td><div id="boardView_title" name="title" style="padding-top: 18px;">${boardOnePreview1.title}</div></td>
	                   </tr>
	                   
	                   <tr>
	                    	<td class="board_title" style="padding-top: 20px; padding-left: 10px;">내용</td>
	                   	<!-- contents -->
	                   	<td colspan="2" style="padding-top: 13px;">
	                   		<div id="boardView_contents">${boardOnePreview1.contents}</div>
	                   	</td>
	                   </tr>
	                   
	                   <tr>
	                    	<td class="board_title" style="padding-top: 16px; padding-left: 10px;">작성일</td>
	                   	<td colspan="2" style="padding-top: 13px;">
	                   		<div>${boardOnePreview1.reg_date}</div>
	                   	</td>
	                   </tr>
	                   
	               	</table>
</div>



</body>
</html>