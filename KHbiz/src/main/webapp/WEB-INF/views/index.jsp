<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#total{
		height: 1000px;
		width: 1400px;
		background-color: red;
		margin:  0px auto;
	}
	
	#top {
		height: 350px;
		width: 100%;	
		background-color: blue;
	}
	#top1{
	    font-weight: bold;
	    font-size: 12px;
	    color: #FFF;
	    font-family: "돋움";
	    background-color: 
	}
		
</style>
</head>

<body>
	<div id="total">
		<div id="top">
			<img src="./resources/img/banner.png">
		</div>
		<div id="top1">
			<p>KHbiz 그룹웨어에 오신것을 환영합니다.</p>
		</div>
		<div id="login">
			<form action="member/memberLogin" method="post">
				ID: <input type="text" name="id">
				PW: <input type="password" name="pw">
				<input type="submit" value="로그인">
			</form>
		</div>
	</div>
</body>
</html>