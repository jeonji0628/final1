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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function openDaumZipAddress() {

    new daum.Postcode({
        
        oncomplete: function(data) {

            jQuery('#postcode1').val(data.postcode1);
            jQuery('#postcode2').val(data.postcode2);
            jQuery('#address').val(data.address);
            jQuery('#address_etc').focus();
            console.log(data);
        }
    }).open();
}
</script>
<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/member/update.css">
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
	                  <li role="presentation" class="active"><a href="./updateForm">정보 수정</a></li>
	                  <li role="presentation"><a href="./deleteForm">회원 탈퇴</a></li>
				  </ul>
				<div id="updateForm">
				 <form action="./update" method="post"> 
					 <table class="table">
						<tr><td class="first">아&nbsp;이&nbsp;디</td><td><input class="second" type="text" name="id" value="${member.id}" readonly></td></tr>
						<tr><td class="first">비밀번호</td><td><input class="third" type="password" name="pw" required></td></tr>
						<tr><td class="first">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</td><td><input class="second" type="text" value="${member.name}" readonly></td></tr>
						<tr><td class="first">전화번호</td><td><input class="third" type="tel" name="phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" title="###-####-####" value="${member.phone}"></td></tr>
						<tr><td class="first">사원번호</td><td><input class="second" type="text" name="mem_num" value="${member.mem_num}" readonly></td></tr>
						<tr><td class="first">이 메 일</td><td><input class="second" type="email"  name="email" value="${member.email}"></tr>
						<tr><td class="first">부 서 명</td>
							<td style="padding-left: 40px">
								<select name="division" class="select" required>
									<option>${member.division}</option>
									<option></option>
									<option>이사</option>
									<option>서비스사업부</option>
									<option>신규사업부</option>
									<option>디자인팀</option>
									<option>호스팅팀</option>
									<option>그룹웨어팀</option> 
									<option>고객지원팀</option>
									<option>기술지원팀</option>
									<option>영업팀</option>
								</select>
							</td>
						</tr>
						<tr><td class="first">직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급</td>
							<td style="padding-left: 40px">
								<select name="position" class="select" required>
									<option>${member.position}</option>
									<option></option>
									<option>대표이사</option>
									<option>이사</option>
									<option>실장</option>
									<option>부장</option>
									<option>차장</option>
									<option>과장</option>
									<option>대리</option>
									<option>주임</option>
									<option>사원</option>
								</select>
							</td>
						</tr>
						<tr><td class="first">직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;책</td><td><input class="third" type="text" name="job" value="${member.job}" required></td></tr>
						<tr><td class="first" id="address_title">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</td>
							<td id="addressForm">
								현재 : ${member.address} 
								<br/><br/>
								<input id = "postcode1" type = "text" value = "" style="width:50px; border: 1px solid #ddd" readonly/> -
					    		<input id = "postcode2" type = "text" value = "" style="width:50px; border: 1px solid #ddd" readonly/>&nbsp;
					    		<input type = "button" onClick = "openDaumZipAddress()" value = "주소 찾기"/>
					    		<br/>
					    		<input type="text" id = "address" name = "address" value = "" style = "width:200px; border: 1px solid #ddd" readonly/>
					    		<input type="text" id = "address_etc" name = "address_etc" value = "" style = "width:168px; border: 1px solid #ddd"/>
							</td>
						</tr>
						<tr><td class="first">사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;진</td><td><input class="third" type="file" name="mem_img"></td></tr>
						<tr><td class="first">내선번호</td><td><input type="text" class="third" name="extention" required pattern="[0-9]{1,8}" value="${member.extention}"></td></tr>
						<tr><td colspan="2" id="last"><input id="submit" type="submit" value="수정하기"></td></tr>
					</table> 
				</form>
				</div>
               </div>
            </div>
</body>
</html>