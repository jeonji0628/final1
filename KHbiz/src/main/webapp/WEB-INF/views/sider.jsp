<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.side ul{
		display: none;
	}
	.side:HOVER ul{
		display: block;
	}
</style>
</head>
<body>
<nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav " id="main-menu">
					<li class="text-center">
	                    <img src="<%= application.getContextPath() %>/resources/img/find_user.png" class="user-image img-responsive"/>
					</li>	
                    <li class="side">
                        <a><i class="fa fa-clock-o fa-3x"></i> 출퇴근 관리<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">출퇴근 입력</a>
                            </li>
                            <li>
                                <a href="#">출퇴근 조회</a>
                            </li>
                            <li>
                                <a href="#">출퇴근 통계</a>
                            </li>
                        </ul>
                     </li>
                    <li class="side">
                        <a><i class="fa fa-file-text-o fa-3x"></i>업무일지<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=application.getContextPath()%>/workLog/workLogList?id=${member.id}&state=1&reg=1&gra=${member.position}&divi=${member.division}">개인 업무일지</a>
                            </li>
                            <li>
                                <a href="<%=application.getContextPath()%>/divisionWorkLog/divisionWorkLogList?id=${member.id}&divi=${member.division}&state=1&reg=1&gra=${member.position}">부서 업무일지</a>
                            </li>
                        </ul>
                     </li>
					<li class="side">
                        <a><i class="fa fa-stack-overflow fa-3x"></i> 자원관리<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">자원목록</a>
                            </li>
                            <li>
                                <a href="#">나의사용 내역</a>
                            </li>
                        </ul>
                     </li>
                    <li class="side">
                        <a><i class="fa fa-sign-in fa-3x"></i> 전자결재<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">걸재 상신</a>
                            </li>
                            <li>
                                <a href="#">결재 진행 조회</a>
                            </li>
                            <li>
                                <a href="#">결재 완료함</a>
                            </li>
                        </ul>
                     </li>
                     <li class="side">
                        <a><i class="fa fa-users fa-3x"></i> 프로젝트<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">프로젝트 등록</a>
                            </li>
                            <li>
                                <a href="#">진행 프로젝트</a>
                            </li>
                            <li>
                                <a href="#">완료 프로젝트</a>
                            </li>
                        </ul>
                     </li>
                     <li class="side">
                        <a><i class="fa fa-envelope-o fa-3x"></i> 쪽지함<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%= application.getContextPath()%>/note/noteList?id=${member.id }&state=1">받은 쪽지함</a>
                            </li>
                            <li>
                                <a href="<%= application.getContextPath()%>/note/noteList?id=${member.id }&state=2">보낸 쪽지함</a>
                            </li>
                        </ul>
                     </li>
                    <li class="side">
                        <a><i class="fa fa-sitemap fa-3x"></i> 조직구성<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                        	<li>
                                <a href="#">부서 관리</a>
                            </li>
                            <li>
                                <a href="#">부서별 사원관리</a>
                            </li>
                            <li>
                                <a href="organizationChart/allChart">사원 전체보기</a>
                            </li>
                            <li>
                                <a href="#">직급관리</a>
                            </li>
                        </ul>
                      </li>
                      <li class="side">
                        <a><i class="fa fa-calendar fa-3x"></i> 일정관리<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">개인 일정</a>
                            </li>
                            <li>
                                <a href="#">부서 일정</a>
                            </li>
                        </ul>
                      </li>
                      <li class="side">
                        <a><i class="fa fa-list-alt fa-3x"></i> 게시판<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=application.getContextPath()%>/board/boardList?kind=1&curPage=1">부서 게시판</a>
                            </li>
                            <li>
                               <a href="<%=application.getContextPath()%>/board/boardList?kind=2&curPage=1">사내 게시판</a>
                            </li>
                        </ul>
                      </li>
						<li class="side">
                        <a><i class="fa fa-wrench fa-3x"></i> 콘센트 제어<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                           <li>
                                <a href="#">콘센트 등록</a>
                            </li>
                            <li>
                                <a href="#">등록 내역</a>
                            </li>
                            <li>
                                <a href="#">온/오프 제어</a>
                            </li>
                        </ul>
                      </li>                   
                </ul>
            </div>
        </nav>  
        <!-- /. NAV SIDE  -->
</body>
</html>