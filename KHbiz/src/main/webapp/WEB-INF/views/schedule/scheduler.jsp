
<%@page import="java.util.List"%>
<%@page import="com.KHbiz.schedule.scheduleDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Calendar"%>
   <%@ page trimDirectiveWhitespaces="true"%>
   <%@page import="java.text.SimpleDateFormat"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="<%= application.getContextPath() %>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="<%= application.getContextPath() %>/resources/js/bootstrap.min.js" type="text/javascript"></script>
<link href="<%= application.getContextPath() %>/resources/css/bootstrap.css" rel="stylesheet" />
<link href="<%= application.getContextPath() %>/resources/css/font-awesome.css" rel="stylesheet" />
<link href="<%= application.getContextPath() %>/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<link href="<%= application.getContextPath() %>/resources/css/custom.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<link href="<%= application.getContextPath() %>/resources/css/allchart.css" rel="stylesheet" />
<style type="text/css">
#main{
		width : 70%;
		height: 100%;
		margin: 5% auto;
		
	}
button{
	background-color: rgba(255,255,255,0);
	border: 0;
}
</style>
<script type="text/javascript">
$(function(){
	$(".calnum").click(function(){
		var d = $("#date"+$(this).val()).text();
		$.ajax({
			url : "schedulerview",
			 data : {
				dates : d
			}, 
			success : function(result){
				$(".modal-content").html(result);
				$("#calendar").modal("show");
			}
		});
	});
	$(".but-view").click(function(){
		var d = $("#date"+$(this).val()).text();
		$.ajax({
			url : "schedulerview",
			data : {
				id : "<c:out value="${member.id}"/>",
				title : $(this).text(),
				dates : d
			}, 
			success : function(result){
				$(".modal-content").html(result);
				$("#calendar").modal("show");
			}
		});
	});
});
</script>
</head>
<body>
<header><%@ include file="../header.jsp" %></header>
	<%@ include file="../sider.jsp" %>
	<div id="page-wrapper" >
    	<div id="page-inner">     		
			<div id="main">
				<%
				    /* request.setCharacterEncoding("UTF-8"); */
				     
				    //클라이언트에서 넘어온 정보 받기
				    String y=request.getParameter("year");
				    String m=request.getParameter("month");
				   	
				    //현재 컴퓨터 시스템의 날짜 구하기
				    Calendar cal = Calendar.getInstance();
				    SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
				    int intToday = Integer.parseInt(sdf.format(cal.getTime()));
				    
				    int year = cal.get(Calendar.YEAR);
				    int month = cal.get(Calendar.MONTH)+1; //클라이언트에서 넘겨준 값이 없을때 표시하는 값
				     
				    if(y!=null)
				    year = Integer.parseInt(y);
				    if(m!=null)
				    month = Integer.parseInt(m);
				     
				    cal.set(year, month-1, 1);
				    year = cal.get(Calendar.YEAR);
				    month = cal.get(Calendar.MONTH)+1;
				    
				    if (month < 1) {
				        year--;
				        month = 12;
				    }

				    // 12월인 경우 다음년 1월로 지정
				    if (month > 12) {
				        year++;
				        month = 1;
				    }
				     
				    // 1일은 무슨 요일?
				    int w = cal.get(Calendar.DAY_OF_WEEK);
				     
				    // 달의 마지막 날짜는?
				    int endDays = cal.getActualMaximum(Calendar.DATE);
				%>
				
				<table border="1" style="width : 1000px; height:500px; table-layout:fixed; border:1px solid #ddd; bgcolor:#cccccc;">
			        <caption style="height: 25px; margin-bottom: 20px;">
			       		
			       			<a style="font-size: large; font-weight: bold;" href="<c:url value='./scheduler' />?id=${member.id}&year=<%=year%>&amp;month=<%=month-1%>" target="_self">◀</a>
			       		
				        <span style="font-size: large; font-weight: bold;" id="ym"><%=year%>년 <%=month%>월</span>
				       
                    		<a style="font-size: large; font-weight: bold;" href="<c:url value='./scheduler' />?id=${member.id}&year=<%=year%>&amp;month=<%=month+1%>" target="_self">▶</a>
				   
			        </caption>
			        <tr height="25" bgcolor="#e4e4e4">
			            <td width="30" align="center" style="font-weight:bold;">일</td>
			            <td width="30" align="center" style="font-weight:bold;">월</td>
			            <td width="30" align="center" style="font-weight:bold;">화</td>
			            <td width="30" align="center" style="font-weight:bold;">수</td>
			            <td width="30" align="center" style="font-weight:bold;">목</td>
			            <td width="30" align="center" style="font-weight:bold;">금</td>
			            <td width="30" align="center" style="font-weight:bold;">토</td>
			        </tr>
			        
			        <%
			            int line = 0;
			            //앞의 공백처리
			            out.print("<tr bgcolor='#ffffff' height='25'>");
			            for(int i=1; i<w; i++) {
			                out.print("<td> </td>");
			                line+=1;
			            }
			            //1~마지막날까지 출력하기
			            String fc;
			            int iUseDate=0;
			          	//일정 작성한 리스트 처리
			            List<scheduleDTO> ar = (List<scheduleDTO>)request.getAttribute("scheduler");
			            for(int i=1; i<=endDays; i++) {
			                fc = line == 0 ? "red" : (line == 6 ? "blue" : "black");
			                
			                String sUseDate = Integer.toString(year); 
					        sUseDate += Integer.toString(month).length() == 1 ? "0" + Integer.toString(month) : Integer.toString(month);
					        sUseDate += Integer.toString(i).length() == 1 ? "0" + Integer.toString(i) : Integer.toString(i);
					        iUseDate = Integer.parseInt(sUseDate);
					        String backColor = "white";
					        if(iUseDate == intToday ) {
					             backColor = "#e4e4e4";
					        }
					       
			                out.print("<td align='left' style='vertical-align:top; overflow:hidden; white-space:nowrap; text-overflow:ellipsis; width:100px; height:100px; background-color:"+backColor+"; color:"+fc+";'>");
			                out.print("<button style='font-size:15px;font-weight:bold;background-color:"+backColor+"; border:0;' class='calnum' value="+i+">"+i+"</button>");
			                
			                out.println("<BR>");
			                
			                for(int j=0; j<ar.size(); j++){
			                	if((Integer.parseInt(ar.get(j).getDates())) == iUseDate){
									out.println("<li><button class='but-view' value="+i+">"+ar.get(j).getTitle()+"</button></li>");
						        }
			                }
			                
			                out.println("<span style='display: none;' id='date"+i+"'>"+iUseDate+"</span>");
			                out.println("<BR>");
			                out.print("</td>");
			                line+=1;
			                if(line==7 && i!=endDays) {
			                    out.print("</tr><tr height='25' bgcolor='#ffffff'>");
			                    line = 0;
			                }
			            }			            			           
			             
			            //뒷부분 공백 처리
			            while(line>0 && line<7) {
			                out.print("<td> </td>");
			                line++;
			            }
			            out.print("</tr>");
			      %>
			      
			    </table>
			</div>
		</div>
	</div>
	
	<div class="modal" id="calendar">
   	 	<div class="modal-book">
	    	<div class="modal-content">
	    	</div>
	    </div>
    </div>
</body>
</html>