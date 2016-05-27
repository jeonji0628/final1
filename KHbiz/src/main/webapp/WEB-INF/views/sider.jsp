<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav " id="main-menu">
					<li class="text-center">
	                    <img src="./resources/img/find_user.png" class="user-image img-responsive"/>
					</li>	
                    <li>
                    	<div class="btn-group">
						  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						    	<i class="fa fa-dashboard fa-3x"></i>출퇴근 관리 <span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu" role="menu">
						    <li><a href="#">Action</a></li>
						    <li><a href="#">Another action</a></li>
						    <li><a href="#">Something else here</a></li>
						    <li class="divider"></li>
						    <li><a href="#">Separated link</a></li>
						  </ul>
						</div>
                        <!-- <a class="active-menu"  href="home"><i class="fa fa-dashboard fa-3x"></i>출퇴근 관리 </a> -->
                    </li>
                     <li>
                        <a href="resource"><i class="fa fa-desktop fa-3x"></i> 자원관리</a>
                    </li>
                    <li>
                        <a href="today-schedule"><i class="fa fa-qrcode fa-3x"></i> 일일 업무일지</a>
                    </li>
					<li>
                        <a href="commute"><i class="fa fa-bar-chart-o fa-3x"></i>전자결재 </a>
                    </li>	
                      <li >
                        <a href="project"><i class="fa fa-table fa-3x"></i> 프로젝트</a>
                    </li>
                    <li>
                        <a href="letter"><i class="fa fa-edit fa-3x"></i> 쪽지함</a>
                    </li>				   
                    <li>
                        <a href="schedule"><i class="fa fa-sitemap fa-3x"></i> 조직구성<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">개인 일정</a>
                            </li>
                            <li>
                                <a href="#">부서 일정</a>
                            </li>
                        </ul>
                      </li>
                       <li>
                        <a  href="concent"><i class="fa fa-square-o fa-3x"></i> 일정관리</a>
                      </li>
                  	  <li>
                        <a  href="concent"><i class="fa fa-square-o fa-3x"></i> 콘센트 제어</a>
                      </li>
                      <li>
                        <a  href="concent"><i class="fa fa-square-o fa-3x"></i> 게시판</a>
                      </li>		
                </ul>
            </div>
        </nav>  
        <!-- /. NAV SIDE  -->
</body>
</html>