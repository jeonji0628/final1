<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<!DOCTYPE html PUBLIC >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
 <meta charset="utf-8" />
 
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
   <script src="<%= application.getContextPath()%>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>
   <script src="<%= application.getContextPath()%>/resources/js/bootstrap.min.js" type="text/javascript"></script>
    <title>welcome KHbiz</title>  
    <link href="<%= application.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="<%= application.getContextPath()%>/resources/css/font-awesome.css" rel="stylesheet" />
    <!-- MORRIS CHART STYLES-->
    <link href="<%= application.getContextPath()%>/resources/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
     <!-- CUSTOM STYLES-->
    <link href="<%= application.getContextPath()%>/resources/css/custom.css" rel="stylesheet" />
     <!-- commute css  -->
     <link href="<%= application.getContextPath()%>/resources/css/commute.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
      <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/member/myInfo.css">
</head>
<body>
<div id="wrapper">
<header><%@ include file="../header.jsp" %></header>
<header><%@ include file="../sider.jsp" %></header>
        <div id="page-wrapper" >
          <div id="page-inner">  
           <hr/>
           
           <!-- form hidden  -->

              <!-- commute List POST 방식으로 보내기  -->
              <form name="commuteList_frm" action="./commuteList" method="post">
                 <input type="hidden" name="id" value="${member.id}">
              </form>
                          
              <form name="commuteSearch_frm" action="./commuteSearch" method="post">
                 <input type="hidden" name="id" value="${member.id}">
              </form>
         <!--  -->           
         
           <div class="table-size">
                <div class="table-up">
                   <ul class="nav nav-tabs">
	                  <li role="presentation" class="active"><a href="./myInfo">나의 정보</a></li>
	                  <li role="presentation"><a href="./updateForm">정보 수정</a></li>
	                  <li role="presentation"><a href="./deleteForm">회원 탈퇴</a></li>
				  </ul>
				  <div id="info_1">
				  	<table  class="table" >
					  	<tr >
				  			<td colspan="2" class="top_1"><h2 class="title_1">개인 정보</h2></td>
				  		</tr>
				  	</table>
				  	<table class="table">
				  		<tr >
				  			<td class="active table-colname" style="width: 24%;">아이디</td>
				  			<td style="width: 28%;">${member.id}</td>
			  				<td class="active table-colname" style="width: 23.6%">이름</td>
				  			<td>${member.name}</td>
				  		</tr>
				  		<tr>
				  			<td class="active table-colname">휴대전화</td>
				  			<td>${member.phone}</td>
			  				<td class="active table-colname">이메일</td>
				  			<td>${member.email}</td>
				  		</tr>
				  		<tr style="border-bottom: 1px solid #ddd;" >
				  			<td class="active table-colname">주소</td>
				  			<td colspan="3">${member.address}</td>
				  		</tr>
				  	</table>
				  	<table  class="table" id="company">
					  	<tr >
				  			<td colspan="2" class="top_1"><h2 class="title_1">회사 정보</h2></td>
				  		</tr>
				  	</table>
				  	<table  class="table">
				  		<tr >
				  			<td class="active table-colname">사원번호</td>
				  			<td>${member.mem_num}</td>
			  				<td class="active table-colname">내선번호</td>
				  			<td>${member.extention}</td>
				  		</tr>
				  		<tr>
				  			<td class="active table-colname">부서</td>
				  			<td>${member.division}</td>
			  				<td class="active table-colname">직급</td>
				  			<td>${member.position}</td>
				  		</tr>
				  		<tr style="border-bottom: 1px solid #ddd;" >
				  			<td class="active table-colname">직책</td>
				  			<td>${member.job}</td>
				  			<td class="active table-colname">입사날짜</td>
				  			<td>${member.joindate}</td>
				  		</tr>
				  	</table>
				  </div>
                </div>
            </div>
</body>
</html>