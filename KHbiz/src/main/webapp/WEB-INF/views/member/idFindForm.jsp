<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<link href="<%= application.getContextPath() %>/resources/css/member/idFind.css" rel="stylesheet" />
<script type="text/javascript">
$(function(){
	/* $("#phone").hide();
	$("#email").hide(); */
	$("#phone1").click(function(){
		/* $("#phone").toggle();
		$("#email").hide(); */
		$("#emailValue").val('');
		$("#nameValue2").val('');
	});
	$("#email1").click(function(){
		/* $("#email").toggle();
		$("#phone").hide(); */
		$("#phoneValue").val('');
		$("#nameValue1").val('');
	});
	$("#search1").click(function () {
		var name = $("#nameValue1").val();
		var phone = $("#phoneValue").val();
		if(document.getElementById("phone1").checked==false){
			alert("찾을 방법을 체크하세요.");
		}else if(name==''||phone==''){
			alert("모두 입력하세요.");
		}else{
			window.open("findResult?name="+name+"&phone="+phone,"popup","width=350, height=250, left=300, top=200, scrollbars=no, titlebar=no, status=no, resizable=no, fullscreen=no");			
		}
	});
	$("#search2").click(function () {
		var name = $("#nameValue2").val();
		var email = $("#emailValue").val();
		if(document.getElementById("email1").checked==false){
			alert("찾을 방법을 체크하세요.");
		}else if(name==''||email==''){
			alert("모두 입력하세요.");
		}else{
			window.open("findResult?name="+name+"&email="+email,"popup","width=350, height=250, left=300, top=200, scrollbars=no, titlebar=no, status=no, resizable=no, fullscreen=no");			
		}
	});
});
</script>
</head>
<body>
	<div id="total">
		<div id="top">
			<a href="<%=application.getContextPath()%>"><img src="<%=application.getContextPath()%>/resources/img/banner.png"></a>
		</div>
		<div id="top1">
			<p id="p1">KHbiz 그룹웨어에 오신것을 환영합니다.</p>
		</div >
		<div id="mid">
			<div id="mid_left">
				<div id="left_1">
					<input type="radio" name="check" id="phone1">회원정보에 등록한 휴대번호로 찾기
					<p id="phone">이&nbsp;&nbsp;&nbsp;름 <input type="text" name="name" id="nameValue1" class="input1">
					<br>휴대전화 <input type="tel" name="phone" id="phoneValue" class="input1">
					<input type="button" value="계정찾기" id="search1" class="sub1">
					</p>
				</div>
			</div>
			<div id="mid_right" >
				<div id="right_1">			
					<input type="radio" name="check" id="email1">회원정보에 등록한 이메일로 찾기
					<p id="email">이&nbsp;&nbsp;&nbsp;름 <input type="text" name="name" id="nameValue2" class="input1">
					<br>이메일 주소 <input type="email" name="email" id="emailValue" class="input1">
					<input type="button" value="계정찾기" id="search2" class="sub1">
					</p>
				</div>
			</div>
		</div>
		<div id="bottom">
			<div id="bottom_left">
				<div id="text2">
					<img src="<%=application.getContextPath()%>/resources/img/text_icon.gif">&nbsp;행복하고 활기찬 하루 되세요.
				</div>
			</div>
			<div id="bottom_right">
				<div id="text3">
					<img src="<%=application.getContextPath()%>/resources/img/bottom_btn01.gif"> &nbsp;1544-1577
					&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
			</div>
		</div>
	</div>
</body>
</html>
