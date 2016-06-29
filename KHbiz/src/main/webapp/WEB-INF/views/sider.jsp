<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
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
                                <a onclick="commuteList2()">출퇴근 입력</a>
                            </li>
                            <li>
                                <a onclick="commuteSearch2()">출퇴근 내역 조회</a>
                            </li>
                        </ul>
                     </li>
                    <li class="side">
                        <a><i class="fa fa-file-text-o fa-3x"></i> 일일 업무일지<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">개인 업무일지</a>
                            </li>
                            <li>
                                <a href="#">부서 업무일지</a>
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
                                <a href="#">부서 게시판</a>
                            </li>
                            <li>
                                <a href="#">사내 게시판</a>
                            </li>
                        </ul>
                      </li>
                      	<c:if test="${member.id eq 'admin'}">
							<li class="side">
	                        <a><i class="fa fa-wrench fa-3x"></i> 콘센트 제어<span class="fa arrow"></span></a>
	                        <ul class="nav nav-second-level">
	                           <li>
	                                <a onclick="iotView()">콘센트 등록</a>
	                           </li>
	                           <li>
	                                <a onclick="iotUpdate()">콘센트 제어</a>
	                           </li>
	                        </ul>
	                      </li>     
                      </c:if>              
                </ul>
                
                <!-- hidden IoT form -->
                <!-- 콘센트 등록 -->
                <form name="iotView_frm" action="<%= application.getContextPath() %>/adminIoT/iotView" method="post">
                	
                </form>
                <!-- 콘센트 업데이트  -->
                <form name="iotUpdate_frm" action="<%= application.getContextPath() %>/adminIoT/updateConcent" method="post">
                	
                </form>
                <!-- 출퇴근 내역보기  -->
                <form name="commute_form2" action="<%= application.getContextPath()%>/commute/commuteList" method="post">
	                   <input type="hidden" name="id" value="${member.id }"> 
                </form>
                
                <!-- 출퇴근 조회  -->
                <form name="commuteSearch_frm2" action="<%= application.getContextPath()%>/commute/commuteSearch" method="post">
	        		<input type="hidden" name="id" value="${member.id}">
	        	</form>
	        	
	        	<!-- 보낸 쪽지함  -->
	        	<%-- <form name="sider_note1"  action="<%= application.getContextPath()%>/note/noteList" method="post">
	        		<input type="hidden" name="id" value="${member.id}">
	        		<input type="hidden" name="state" value="1">
 	        	</form> --%>
                
                <script type="text/javascript">
                	//콘센트 등록
                	function iotView() {
                		iotView_frm.submit();
					}
                	//콘센트 업데이트
                	function iotUpdate() {
                		iotUpdate_frm.submit();
					}
                	//출퇴근 내역
                	function commuteList2() {
                		commute_form2.submit();
					}
                	//출퇴근 조회
                	function commuteSearch2() {
                		commuteSearch_frm2.submit();
					}
                	function sider_note2() {
                		alert("asd");
                		sider_note1.submit();
					}
                </script>
                
            </div>
        </nav>  
        <!-- /. NAV SIDE  -->
</body>
</html>