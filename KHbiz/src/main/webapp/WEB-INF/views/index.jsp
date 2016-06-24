<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KH Biz</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="<%= application.getContextPath() %>/resources/css/index.css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript">
		

	
	function onePreview(count){
		window.open("./board/boardOnePreview?num="+count,"popup", "width=700, height=500, left=100, top=50, scrollbars=no,titlebar=no,status=no,resizable=no,fullscreen=no");
		/* location.href="./board/boardOnePreview?num="+count;	 */
	};
	
	function board(){		
		$.ajax({
			url : "./board/boardPreview",
			success:function(data){
				$("#mid_right").html(data);
			}
		});
	};	
	
	function more1(){
		alert("로그인이 필요한 서비스입니다");
	}
</script>
</head>

<body onload="board()">
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
										<a href="#"><img src="./resources/img/pw_btn.gif"></a>
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