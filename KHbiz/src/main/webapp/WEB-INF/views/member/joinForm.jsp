<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%= application.getContextPath() %>/resources/css/member/joinForm.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
		var temp=false;
	$(function () {
		$("#check").click(function () {
			var i=document.getElementById("insertId");
			
			var pattern1=/[a-z]+/;
			var pattern2=/[0-9]+/;
			
			var r=pattern1.test(i.value);
			var r2=pattern2.test(i.value);
			var r3=i.value.length>=8;
			var r4=i.value.length<=15;
		
			
			
			if(r&&r2&&r3&&r4){
				var id=$("#insertId").val();
				$.ajax({
					url:"idCheck",
					type:"GET",
					data:{
						id:id
					},
					success:function(result){
							alert(result.id);
							if(result.id=="사용 가능한 아이디 입니다."){
								temp=true;
							}
					}
				});
			}else{
				alert("조건에 맞지않습니다. 영문 소문자와 숫자포함 8~15글자를 입력하세요");
			}
		});
		
		$("#submit").click(function () {
			if(temp==false){
				alert("아이디 중복확인 하세요.");
				return false;
			}
		});
		$("#insertId").change(function () {
			temp=false;
		})
	});
	
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
</head>
<body>
<div id="top">
	<a href="<%=application.getContextPath()%>"><img src="<%=application.getContextPath() %>/resources/img/banner.png"></a>
</div>
<form action="./join" method="post"> 
	 <table>
		<tr><td class="first">아&nbsp;이&nbsp;디</td><td><input class="second" type="text" name="id" id="insertId" required>
				&nbsp;<input class="second" type="button" value="중복확인" id="check">
			</td>
		</tr>
		<tr><td class="first">비밀번호</td><td><input class="second" type="password" name="pw" required></td></tr>
		<tr><td class="first">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</td><td><input class="second" type="text" name="name" required></td></tr>
		<tr><td class="first">전화번호</td><td><input class="second" type="tel" name="phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" title="###-####-####"></td></tr>
		<tr><td class="first">사원번호</td><td><input class="second" type="text" name="mem_num" required></td></tr>
		<tr><td class="first">이 메 일</td><td><input class="second" type="email"  name="email"></tr>
		<tr><td class="first">부 서 명</td>
			<td>
				<select name="division" class="select" required>
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
			<td>
				<select name="position" class="select" required>
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
		<tr><td class="first">직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;책</td><td><input class="second" type="text" name="job" required></td></tr>
		<tr><td class="first">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</td>
			<td>
				<input id = "postcode1" type = "text" value = "" style="width:50px;" readonly/> -
	    		<input id = "postcode2" type = "text" value = "" style="width:50px;" readonly/>&nbsp;
	    		<input type = "button" onClick = "openDaumZipAddress()" value = "주소 찾기" />
	    		<br/>
	    		<input type="text" id = "address" name = "address" value = "" style = "width:200px;" readonly/>
	    		<input type="text" id = "address_etc" name = "address_etc" value = "" style = "width:150px;"/>
			</td>
		</tr>
		<tr><td class="first">사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;진</td><td><input class="second" type="file" name="mem_img"></td></tr>
		<tr><td class="first">내선번호</td><td><input type="text" class="second" name="extention" required pattern="[0-9]{1,8}"></td></tr>
		<tr><td colspan="2" id="last"><input id="submit" type="submit" value="가입하기"></td></tr>
	</table> 
</form>
</body>
</html>