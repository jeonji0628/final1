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
        	<!-- hidden state  -->
        	<input type="hidden" id="state" value="${param.kind}">
        	
        	<div class="table-size">
                <div class="table-up">
                	<ul class="nav nav-tabs">
                	                	
                		<c:if test="${param.kind eq 1}">
							<li role="presentation" class="active"><a href="./boardList?curPage=1&kind=1">부서 게시판</a></li>
							<li role="presentation"><a href="./boardList?curPage=1&kind=2">사내 게시판</a></li>
						</c:if>
						
						<c:if test="${param.kind eq 2}">
							<li role="presentation" ><a href="./boardList?curPage=1&kind=1">부서 게시판</a></li>
							<li role="presentation" class="active"><a href="./boardList?curPage=1&kind=2">사내 게시판</a></li>
						</c:if>
						
					</ul>
            	</div> 
            <br>
            <div class="table-responsive">
               <table class="table">
                   <tr class="active table-colname">
                   								
	                    <td id="board_num" style="padding-top: 13px;">번호</td>
	                    <td id="board_title" style="padding-top: 13px;">제목 [댓글]</td>
                    	<td id="board_writer" style="padding-top: 13px;">작성자</td>
                    	
                    	<td id="board_counts" style="padding-top: 13px;">조회수</td>
                    	<td id="board_reg_date" style="padding-top: 13px;">작성일</td>
				             
                   </tr>
                   
                   <c:forEach items="${list}" var="dto" varStatus="t">          
	        <tr>
				<td>${dto.num}</td>
				<td>
					<a href="boardView?num=${dto.num}&kind=${dto.kind}">${dto.title} <c:if test="${replyNum[t.index] != 0}">[${replyNum[t.index]}]</c:if></a>
				</td>
				<td>${dto.id}</td>
				<td>${dto.counts}</td>
				<td>${dto.reg_date}</td>
			</tr>
                   </c:forEach>
                   
               	</table>
               </div>
               
               <div id="btn_div">               
               <form action="boardWrite" method="get" id="boardListWrite">
					<input type="hidden" name="kind" value="${page.kind}">
					<input type="hidden" id="id" value="${member.id}">
					<a href="<%=application.getContextPath()%>/board/boardList?curPage=1&kind=${page.kind}"><input type="button" value="목록" id="list"></a>	          
					<input type="submit" name="write" id="write" value="글쓰기">
				</form>
               </div>
               
               <div class="table-down">
                 <ul class="pagination pagination-lg" style="margin-top: 3px">
                   
                   
                   <c:if test="${page.searchWord != null}">
						<c:if test="${page.curBlock > 1}">
						<li>
							<a href="./boardList?curPage=${page.startNum-1}&kind=${page.kind}&searchType=${page.searchType}&searchWord=${page.searchWord}"><span aria-hidden="true">&laquo;</span></a>
						</li>
						</c:if>
						<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i" >
							<li>
							<a href="./boardList?curPage=${i}&kind=${page.kind}&searchType=${page.searchType}&searchWord=${page.searchWord}">${i}</a>
							</li>
						</c:forEach>
					
						<c:if test="${page.curBlock < page.totalBlock}">
							<li>
							<a href="./boardList?curPage=${page.lastNum+1}&kind=${page.kind}&searchType=${page.searchType}&searchWord=${page.searchWord}"><span aria-hidden="true">&laquo;</span></a>
							</li>
						</c:if>
					</c:if>	
					
					<c:if test="${page.searchWord == null}">
						<c:if test="${page.curBlock > 1}">
							<li>
							<a href="./boardList?curPage=${page.startNum-1}&kind=${page.kind}"><span aria-hidden="true">&laquo;</span></a>
							</li>
						</c:if>
					
						<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i" >
							<li>	
							<a href="./boardList?curPage=${i}&kind=${page.kind}">${i}</a>
							</li>
						</c:forEach>
					
						<c:if test="${page.curBlock < page.totalBlock}">
							<li>
							<a href="./boardList?curPage=${page.lastNum+1}&kind=${page.kind}"> <span aria-hidden="true">&raquo;</span></a>
							</li>
						</c:if>
					</c:if>	
                 </ul>
                 
               </div>
            <!----------------검색 -------------------- -->
<div id="boardSearchDiv">
	<form action="search" method="get">
		<select name="searchType" id="searchType">
			<option value="id">작성자</option>
			<option value="title">제목</option>
			<option value="contents">내용</option>
		</select>
		<input type="text" name="searchWord" id="searchWord">
		<input type="hidden" value="${page.curPage}" name="curPage">
		<input type="hidden" value="${page.kind}" name="kind">
		<input type="submit" value="검색" id="search" onclick="return check()">
	</form>
</div>
            </div>
            
            
		</div>
	</div>
</body>
<script type="text/javascript">
	function check(){
		var searchWord = $("#searchWord").val();
		if(searchWord == ""){
			alert("검색어를 입력해주세요");
			return false;
		}else{
			return true;
		}
	}
</script>
</html>