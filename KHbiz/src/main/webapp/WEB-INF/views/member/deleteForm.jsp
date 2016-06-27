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

<script type="text/javascript">
$(function () {
	var pw=${member.pw};
	var mem_num=${member.mem_num};
	$("#pw1").blur(function () {
		if($("#pw1").val()!=pw){
			$("#check").html("불일치");
			$("#check").css("color","red");
		}else{
			$("#check").html("일치");
			$("#check").css("color","blue");			
		}
	});
	$("#deleteButton").click(function () {
		if($("#pw1").val()==pw && $("#mem_num1").val()==mem_num){
			return true;
		}else{
			alert("비밀번호 또는 사원번호가 틀렸습니다.");
			return false;
		}
	});
});
</script>
<style type="text/css">
	table{
		width: 350px;
	}
	input{
		border: 0;
	}
	.first{
		width: 125px;
	}
</style>
<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/member/delete.css">
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
	                  <li role="presentation"><a href="./myInfo">나의 정보</a></li>
	                  <li role="presentation"><a href="./updateForm">정보 수정</a></li>
	                  <li role="presentation" class="active"><a href="./deleteForm">회원 탈퇴</a></li>
				  </ul>
				  <div id="delete">
					  <form action="./delete">
					  	<table class="table">
					  		<tr>
					  			<td class="first">아이디</td><td><input type="text" name="id" value="${member.id}"></td>		  		
					  		</tr>
					  		<tr>
					  			<td class="first">비밀번호 확인</td><td><input type="password" name="pw" required id="pw1"><span id="check"></span></td>
					  		</tr>
					  		<tr>
					  			<td class="first">사원번호</td><td><input type="text" name="mem_num" required id="mem_num1"></td>
					  		</tr>
					  		<tr><td colspan="2" id="submit_td"><input type="submit" value="탈퇴하기" id="deleteButton"></td></tr>
					  	</table>
					  </form>
				</div>
               </div>
            </div>
</body>
</html>