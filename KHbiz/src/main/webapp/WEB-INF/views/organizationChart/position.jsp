<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%= application.getContextPath() %>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="<%= application.getContextPath() %>/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="<%= application.getContextPath() %>/resources/css/bootstrap.css" rel="stylesheet" />
    <link href="<%= application.getContextPath() %>/resources/css/font-awesome.css" rel="stylesheet" />
    <link href="<%= application.getContextPath() %>/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <link href="<%= application.getContextPath() %>/resources/css/custom.css" rel="stylesheet" /> 
   	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/style.css" media="all" />
<title>Insert title here</title>
<style type="text/css">
.table {
  margin: 0 0 40px 0;
  width: 100%;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
  display: table;
}
@media screen and (max-width: 580px) {
  .table {
    display: block;
  }
}

.row {
  display: table-row;
  background: #f6f6f6;
}
.row:nth-of-type(odd) {
  background: #e9e9e9;
}
.row.header {
  font-weight: 900;
  color: #ffffff;
  background: #ea6153;
}
.row.green {
  background: #27ae60;
}
.row.blue {
  background: #2980b9;
}
@media screen and (max-width: 580px) {
  .row {
    padding: 8px 0;
    display: block;
  }
}

.cell {
  padding: 6px 12px;
  display: table-cell;
  text-align: center;
}
@media screen and (max-width: 580px) {
  .cell {
    padding: 2px 12px;
    display: block;
  }
}
	#center{
		width : 80%;
		height: 100%;
		margin: 0 auto;
		margin-top: 10%;
	}
	#main{
		width : 80%;
		height: 100%;
		margin: 6% auto;
	}
</style>
</head>
<body>
<header><%@ include file="../header.jsp" %></header>
	<%@ include file="../sider.jsp" %>
<div id="page-wrapper" >
    	<div id="page-inner">
    	<div id="center">
    		 <ul class="nav nav-tabs">
				   <li role="presentation"><a href="division">부서관리</a></li>
				   <li role="presentation" class="active"><a href="#">직급 관리</a></li>
				</ul>
    	</div>
    	<div id="main">
        	<div class="wrapper">
  
  <div class="table">
    
    <div class="row header">
      <div class="cell">
        No
      </div>
      <div class="cell">
       	직급코드
      </div>
      <div class="cell">
      	직급명
      </div>
      <div class="cell">
 		순서
      </div>
    </div>
    
    <div class="row">
      <div class="cell">
        9
      </div>
      <div class="cell">
        9
      </div>
      <div class="cell">
		대표이사
      </div>
      <div class="cell">
        1
      </div>
    </div>
    
    <div class="row">
      <div class="cell">
        8
      </div>
      <div class="cell">
        8
      </div>
      <div class="cell">
		이사
      </div>
      <div class="cell">
        2
      </div>
    </div>
    
    <div class="row">
      <div class="cell">
        7
      </div>
      <div class="cell">
        7
      </div>
      <div class="cell">
		실장
      </div>
      <div class="cell">
        3
      </div>
    </div>
    
    <div class="row">
      <div class="cell">
        6
      </div>
      <div class="cell">
        6
      </div>
      <div class="cell">
		부장
      </div>
      <div class="cell">
        4
      </div>
    </div>
    
    <div class="row">
      <div class="cell">
        5
      </div>
      <div class="cell">
        5
      </div>
      <div class="cell">
		차장
      </div>
      <div class="cell">
        5
      </div>
    </div>
    
    <div class="row">
      <div class="cell">
        4
      </div>
      <div class="cell">
        4
      </div>
      <div class="cell">
		과장
      </div>
      <div class="cell">
        6
      </div>
    </div>
    
    <div class="row">
      <div class="cell">
        3
      </div>
      <div class="cell">
        3
      </div>
      <div class="cell">
		대리
      </div>
      <div class="cell">
        7
      </div>
    </div>
    
    <div class="row">
      <div class="cell">
        2
      </div>
      <div class="cell">
        2
      </div>
      <div class="cell">
		주임
      </div>
      <div class="cell">
        8
      </div>
    </div>
    
    <div class="row">
      <div class="cell">
        1
      </div>
      <div class="cell">
        1
      </div>
      <div class="cell">
		사원
      </div>
      <div class="cell">
        9
      </div>
    </div>
    
  </div>
  
</div>
    </div>
    </div>
    </div>
</body>
</html>