<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="<%= application.getContextPath() %>/resources/css/index.css" rel="stylesheet" />
</head>

<body>
	<div id="total">
		<div id="top">
			<img src="./resources/img/banner.png">
		</div>
		<div id="top1">
			<p id="p1">KHbiz 그룹웨어에 오신것을 환영합니다.</p>
		</div >
		<div id="mid">
			<div id="mid_left">
				<div id="loginForm">
					<div id="loginForm2">
						<form action="./memberLogin" method="post">
							<table id="table1" >
								<tr>
									<td ><img src="./resources/img/ch_id_title.gif"></td>
									<td ><input class="input1" type="text" name="id"></td>
									<td rowspan="2">
										<input id="sub1" type="submit" class="btn btn-warning" value="로그인">
									</td>
								</tr>
								<tr>
									<td><img src="./resources/img/ch_pw_title.gif"></td>
									<td><input class="input1" type="password" name="pw"></td>
								</tr>
								<tr>
									<td></td>
									<td id="td1">
										<input type="checkbox"> 아이디저장 &nbsp;&nbsp;&nbsp;&nbsp;
										<a href="./member/joinForm">회원가입</a>
										<a href="./member/idFindForm">계정찾기</a>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
			
			<div id="mid_right" >
			</div>
		</div>
		<div id="bottom">
			<div id="bottom_left">
				<div id="text2">
					<img src="./resources/img/text_icon.gif">&nbsp;행복하고 활기찬 하루 되세요.
				</div>
			</div>
			<div id="bottom_right">
				<div id="text3">
					<img src="./resources/img/bottom_btn01.gif"> &nbsp;1544-1577
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#"><img src="./resources/img/ch_select_bg.gif"></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>