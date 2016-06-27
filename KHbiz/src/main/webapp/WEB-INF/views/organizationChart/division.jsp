<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="<%= application.getContextPath() %>/resources/css/bootstrap.css" rel="stylesheet" />
    <link href="<%= application.getContextPath() %>/resources/css/font-awesome.css" rel="stylesheet" />
    <link href="<%= application.getContextPath() %>/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <link href="<%= application.getContextPath() %>/resources/css/custom.css" rel="stylesheet" />
   	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<title>Insert title here</title>
<style type="text/css">
	* {margin: 0; padding: 0;}

.tree ul {
	padding-top: 50px; position: relative;
	transition: all 0.5s;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
}

.tree li {
	float: left; text-align: center;
	list-style-type: none;
	position: relative;
	padding: 50px 5px 0 5px;
	
	transition: all 0.5s;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
}

/*We will use ::before and ::after to draw the connectors*/

.tree li::before, .tree li::after{
	content: '';
	position: absolute; top: 0; right: 50%;
	border-top: 1px solid #ccc;
	width: 60%; height: 50px;
}
.tree li::after{
	right: auto; left: 50%;
	border-left: 1px solid #ccc;
}

/*We need to remove left-right connectors from elements without 
any siblings*/
.tree li:only-child::after, .tree li:only-child::before {
	display: none;
}

/*Remove space from the top of single children*/
.tree li:only-child{ padding-top: 0;}

/*Remove left connector from first child and 
right connector from last child*/
.tree li:first-child::before, .tree li:last-child::after{
	border: 0 none;
}
/*Adding back the vertical connector to the last nodes*/
.tree li:last-child::before{
	border-right: 1px solid #ccc;
	border-radius: 0 5px 0 0;
	-webkit-border-radius: 0 5px 0 0;
	-moz-border-radius: 0 5px 0 0;
}
.tree li:first-child::after{
	border-radius: 5px 0 0 0;
	-webkit-border-radius: 5px 0 0 0;
	-moz-border-radius: 5px 0 0 0;
}

/*Time to add downward connectors from parents*/
.tree ul ul::before{
	content: '';
	position: absolute; top: 0; left: 50%;
	border-left: 1px solid #ccc;
	width: 0; height: 50px;
}

.tree li a{
	width : 200px;
	height : 50px;
	border: 1px solid #ccc;
	padding: 12px 10px;
	text-decoration: none;
	color: #666;
	font-family: arial, verdana, tahoma;
	font-size: 17px;
	display: inline-block;
	
	border-radius: spx;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	
	transition: all 0.5s;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
}

/*Time for some hover effects*/
/*We will apply the hover effect the the lineage of the element also*/
.tree li a:hover, .tree li a:hover+ul li a {
	background: #c8e4f8; color: #000; border: 1px solid #94a0b4;
}
/*Connector styles on hover*/
.tree li a:hover+ul li::after, 
.tree li a:hover+ul li::before, 
.tree li a:hover+ul::before, 
.tree li a:hover+ul ul::before{
	border-color:  #94a0b4;
}
#tree-line{
	width : 90%;
	height : 400px;
	margin : 0 auto;	
}
#center{
		width : 80%;
		height: 100%;
		margin: 0 auto;
		margin-top: 10%;
	}
	#main{
		width : 100%;
		height: 400px;
		margin: 0 auto;
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
				   <li role="presentation" class="active"><a href="#">부서관리</a></li>
				   <li role="presentation"><a href="position">직급 관리</a></li>
				</ul>
    	</div>
    	<div id="main">
    		<div id="tree-line">
				<div class="tree">
				<ul>
					<li>
						<a>이사</a>
						<ul>
							<li><a>신규 사업부</a></li>
							<li>
								<a>서비스 사업부</a>
								<ul>
									<li><a>호스팅 팀</a></li>
									<li>
										<a>그룹웨어 팀</a>
										<ul>
											<li>
												<a>고객지원 팀</a>
											</li>
											<li>
												<a>기술지원 팀</a>
											</li>
											<li>
												<a>영업 팀</a>
											</li>
										</ul>
									</li>
								</ul>
							</li>
							<li>
								<a>디자인 팀</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
    	</div>
    	
	</div>
</div>
</body>
</html>