<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
   <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="<%= application.getContextPath() %>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="<%= application.getContextPath() %>/resources/js/bootstrap.min.js" type="text/javascript"></script>
    <title>welcome KHbiz</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="<%= application.getContextPath() %>/resources/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="<%= application.getContextPath() %>/resources/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="<%= application.getContextPath() %>/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="<%= application.getContextPath() %>/resources/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
<div id="wrapper">  
	<header><%@ include file="./header.jsp" %></header>
	<%@ include file="./sider.jsp" %>
        <div id="page-wrapper" >
            <div id="page-inner">             
                  <hr/>
                <div class="row">
                	<div class="col-md-3 col-sm-6 col-xs-6">           
						<div class="panel panel-back noti-box">
                			<span class="icon-box bg-color-red set-icon">
                    			<i class="fa fa-envelope-o icon_top"></i>
                			</span>
	                		<div class="text-box" >
	                    		<a href="<%= application.getContextPath()%>/note/noteList"><p class="main-text">쪽지함</p></a>
	                    		<p class="text-muted">Messages</p>
	                		</div>
             			</div>
		     		</div>
                    <div class="col-md-3 col-sm-6 col-xs-6">           
						<div class="panel panel-back noti-box">
			                <span class="icon-box bg-color-green set-icon">
			                    <i class="fa fa-calendar icon_top"></i>
			                </span>
			                <div class="text-box" >
			                    <p class="main-text">일정</p>
			                    <p class="text-muted">Schedules</p>
			                </div>
			             </div>
		     		</div>
                    <div class="col-md-3 col-sm-6 col-xs-6">           
						<div class="panel panel-back noti-box">
			                <span class="icon-box bg-color-blue set-icon">
			                    <i class="fa fa-clock-o icon_top"></i>
			                </span>
			                <div class="text-box" >
			                    <p class="main-text">출퇴근</p>
			                    <p class="text-muted">Notifications</p>
			                </div>
			             </div>
					</div>
                    <div class="col-md-3 col-sm-6 col-xs-6">           
						<div class="panel panel-back noti-box">
			                <span class="icon-box bg-color-brown set-icon">
			                    <i class="fa fa-sign-in icon_top"></i>
			                </span>
			                <div class="text-box" >
			                    <p class="main-text">전자결재</p>
			                    <p class="text-muted">Pending</p>
			                </div>
			             </div>
		     		</div>
				</div>
                 <!-- /. ROW  -->
                <hr />                
                <div class="row">
                    <div class="col-md-6 col-sm-12 col-xs-12">           
						<div class="panel panel-back noti-box">
			                <span class="icon-box bg-color-blue">
			                    <i class="fa fa-warning icon_top"></i>
			                </span>
			                <div class="text-box" >
			                    <p class="main-text">공지사항</p>
			                    <p class="text-muted">Please fix these issues to work smooth</p>
			                    <p class="text-muted">Time Left: 30 mins</p>
			                    <hr />
			                   
			                </div>
			             </div>
			             <div class="panel panel-back noti-box">
			                <span class="icon-box bg-color-blue">
			                    <i class="fa fa-list-alt icon_top"></i>
			                </span>
			                <div class="text-box" >
			                    <a href="./board/boardList?kind=1&curPage=1"><p class="main-text">부서 게시판</p></a>
			                    <p class="text-muted">Please fix these issues to work smooth</p>
			                    <p class="text-muted">Time Left: 30 mins</p>
			                    <hr/>
			                </div>
			                
			             </div>
					</div>                    
                    
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel back-dash">
                              <i class="fa fa-users fa-3x icon_top"></i>
                              <strong> &nbsp; 프로젝트</strong>
                              <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing sit ametsit amet elit ftr. Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12 ">
                        <div class="panel ">
				          <div class="main-temp-back">
				            <div class="panel-body">
				              <div class="row">
				                <div class="col-xs-6"> <i class="fa fa-cloud fa-3x icon_top"></i> Newyork City </div>
				                <div class="col-xs-6">
				                  <div class="text-temp"> 10° </div>
				                </div>
				              </div>
				            </div>
				          </div>
				          
				        </div>
				        <div class="panel panel-back noti-box">
			                <span class="icon-box bg-color-green set-icon">
			                    <i class="fa fa-stack-overflow icon_top"></i>
			                </span>
			                <div class="text-box" >
			                    <p class="main-text">자원 관리</p>
			                    <p class="text-muted">Looking Good</p>
			                </div>
				        </div>
							
				    </div>
        		</div>
        	</div>
        </div>
	</div>
</body>
</html>



