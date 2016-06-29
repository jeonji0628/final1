<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.navbar-brand{
		background-color: white;
	}
</style>
</head>
<body>
 <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%=application.getContextPath()%>/home">KHbiz Group</a> 
            </div>
		  <div style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;"> 
		  		${member.name }님 환영합니다&nbsp; 
		  	<a style="color: white;" href="<%= application.getContextPath()%>/memberLogout" class="btn btn-danger square-btn-adjust">Logout</a> 
		  </div>
  </nav> 
</body>
</html>