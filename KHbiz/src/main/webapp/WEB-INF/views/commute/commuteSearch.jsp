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

<!-- 시계 api JavaScript Includes -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min.js"></script>
<script src="<%= application.getContextPath()%>/resources/js/script.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<script type="text/javascript">
	function date_info(i) {
		
		var memo_info=$("#memo_info"+i).val();
		var text_info=$("#text_info"+i).val()+"일의 출퇴근 관련 메모 내용 입니다.";
		
		$("#modal_date").html(text_info);
		$("#modal_textarea").val(memo_info);
	}
	function commuteList() {
		commuteList_frm.submit();
	}
	//페이지 이동시
	function commuteSearch() {
		commuteSearch_frm.submit();
	}
	function MemberSearch() {
		alert("asdasd");
		commuteSearch_frm3.submit();
	}
	
</script>
<style type="text/css">
	#memo_btn{
		border: none;
		color: #337ab7;
		background-color: white;
	}
	#search_modal_body{
		padding-top: 0px;
		padding-left: 0px;
		padding-right: 0px;
		padding-bottom: 0px;
	}
	#modal_td{
		text-align: center;
		font-weight: bold;
	}
	textarea{
		resize : none;
	}
	#memo_title{
		font-weight: bold;
	}
</style>
</head>
<body>
<div id="wrapper">
<!-- form hidden  -->
	<!-- commute List POST 방식으로 보내기  -->
	<form name="commuteList_frm" action="./commuteList" method="post">
		<input type="hidden" name="id" value="${member.id}">
	</form>
	
	<!-- commute Search POST 방식으로 보내기  -->
	<form name="commuteSearch_frm" action="./commuteSearch" method="post">
		<input type="hidden" name="id" value="${member.id}">
	</form>	
<!--  -->    
    	
<header><%@ include file="../header.jsp" %></header>
<header><%@ include file="../sider.jsp" %></header>
	<div id="page-wrapper" >
          <div id="page-inner">  
        	<hr/>
        	<div class="table-size">
        	
                <div class="table-up">
                	<ul class="nav nav-tabs">
						<li role="presentation" ><a onclick="commuteList()">출퇴근 입력</a></li>
						<li role="presentation" class="active"><a onclick="commuteSearch()">출퇴근 내역조회</a></li>
					</ul>
            	</div> 
            
            <div id="commute_s_mid">
            	<form name="commuteSearch_frm3" action="./commuteSearch2" method="post">
	            	<div id="commute_s_m_top">
	            		<table id="commute_s_table1" >
	            			<tr>
	            				<td >검색기간 :&nbsp;&nbsp;&nbsp; </td>
	            				
	            				<td>
	            					<select id="year" name="year">
	            						<c:forEach begin="2000" end="2016" var="i" >
		            						<option value="${i}">
		            							${i}
		            						</option>
	            						</c:forEach>
	            					</select>
	            					년 &nbsp;&nbsp;&nbsp;
	            				</td>
	            				
	            				<td>
	            					<select name="month" id="month">
	            						<c:forEach begin="1" end="12" var="i" >
	            							<c:if test="${i < 10}">
			            						<option value="0${i}">
			            							0${i}
			            						</option>
	            							</c:if>
	            							<c:if test="${i > 9}">
			            						<option value="${i}">
			            							${i}
			            						</option>
	            							</c:if>
	            						</c:forEach>
	            					</select>
	            					월&nbsp;&nbsp;&nbsp;
	            				</td>
	            				
	   							<td>
	            					<select name="id" id="select_id">
	            						<c:forEach items="${memberList}" var="mL">
		            						<option value="${mL.id}">
		            							[${mL.id }]&nbsp;${mL.name}
		            						</option>
	            						</c:forEach>
	            					</select>
	            					&nbsp;&nbsp;&nbsp;
	            				</td>
	            				<td>
	            					<input id="commute_s_sub1" onclick="MemberSearch()" type="button" value="검 색 ">
	            				</td>
	            			</tr>
	            			
	            		</table>
	            	</div>
	            	<div  id="commute_s_m_mid2">
	            		<table >
	            			<tr>
	            				<td class="commute_s_m_td1">
	            					부서
	            				</td>
	            				<td class="commute_s_m_td2">
            						<c:if test="${ memberOneList ne null}">
	            						${ memberOneList.division}
	           						</c:if>
	           						<c:if test="${ memberOneList eq null}">
	            						-------
	            					</c:if>
	            				</td>
	            				<td class="commute_s_m_td1">
	            					직급
	            				</td>
	            				<td class="commute_s_m_td2">
	            					<c:if test="${ memberOneList ne null}">
	            						${ memberOneList.position}
	           						</c:if>
	           						<c:if test="${ memberOneList eq null}">
	            						-------
	            					</c:if>
            						
	            				</td>
	            			</tr>
	            			
	            			<tr>
	            				<td class="commute_s_m_td1">
	            					아이디
	            				</td>
	            				<td class="commute_s_m_td2">
	            					<c:if test="${ memberOneList ne null}">
	            						${ memberOneList.id}
	           						</c:if>
	           						<c:if test="${ memberOneList eq null}">
	            						-------
	            					</c:if>
            						
	            				</td>
	            				<td class="commute_s_m_td1">
	            					출석기간
	            				</td>
	            				<td class="commute_s_m_td2">
	            					<c:if test="${date ne null}">
	            							${date}
	           						</c:if>
	           						<c:if test="${date eq null}">
	            						-------
	            					</c:if>
	            				
            					
	            				</td>
	            			</tr>
	            		</table>
	            		
	            	</div>
	            	
	            	<div id="commute_s_m_mid3">
	            		<table>
	            			<tr>
		            			<td class="commute_s_m_td1">
		            					이름
	            				</td>
	            				<td id="commute_s_m_td3">
	            					<c:if test="${ memberOneList ne null}">
	            						${ memberOneList.name}
	           						</c:if>
	           						<c:if test="${ memberOneList eq null}">
	            						-------
	            					</c:if>
	            				</td>
	            			</tr>
	            		</table>
	            	</div>
					<div id="commute_s_m_mid4">
						<table border="1">
							<tr>
								<td class="commute_s_m_td1">근무 일 </td>
								<td class="commute_s_m_td2">
									<c:if test="${ total_time[0] ne null}">
	            						${total_time[0]}일
	           						</c:if>
	           						<c:if test="${ total_time[0] eq null}">
	            						-------
	            					</c:if>
								</td>
								<td class="commute_s_m_td1">총 근무시간</td>
								<td class="commute_s_m_td2">
									<c:if test="${ total_time[1] ne null or total_time[2] ne null}">
	            						${total_time[1]}시간 ${total_time[2]}분
	           						</c:if>
	           						<c:if test="${ total_time[1] eq null or total_time[2] eq null}">
	            						-------
	            					</c:if>
									
								</td>
							</tr>
						</table>
					</div>	            	
					</form>
	            	<div id="commute_s_m_mid5">
	            		<table class="table" id="commute_table3">
			               <tr class="active table-colname">
			               		<td colspan="5" id="commute_td4">
			              	 		출퇴근 내역
						    	</td>
			               </tr>
		               	   <tr class="active table-colname">
				               <td>
				              	 	 날 짜
							   </td>
							   <td>
				              	 	 출근 시간
							   </td>
							   <td>
				              	 	퇴근 시간
							   </td>
							   <td>
							   		근무 상태
							   </td>
							   <td>
							   		비 고 
							   </td>
							   
			               </tr>
			               		<%-- <c:if test="${commuteSearch eq null}">
			               			<tr>
			               				<td colspan="5" style="text-align: center;">
			               					검색된 결과가 없습니다.
			               				</td>
			               			</tr>
			               		</c:if> --%>
			               		<c:forEach items="${commuteSearch}" var="commuteSearch" varStatus="i">
						           <tr>
							           <td style="padding-top: 15px" class="commute_td5">
							           	   <c:if test="${commuteSearch.reg_date ne null}">
							               			${commuteSearch.reg_date}
							          	   </c:if>
							               <c:if test="${commuteSearch.reg_date eq null}">
							               			-------
							          	   </c:if>
					                   </td>
					                   
					                   <td style="padding-top: 15px" class="commute_td5">
							           	   <c:if test="${commuteSearch.starttime ne null}">
							               			${commuteSearch.starttime}
							          	   </c:if>
							               <c:if test="${commuteSearch.starttime eq null}">
							               			-------
							          	   </c:if>
					                   </td>
					                   
					                   
					                   <td style="padding-top: 15px" class="commute_td5">
				               				<c:if test="${commuteSearch.fintime ne null}">
						               			${commuteSearch.fintime}
						          			</c:if>
						          			<c:if test="${commuteSearch.fintime eq null}">
						               			-------
						          			</c:if>
					          		   </td>
					          			<td style="padding-top: 15px" class="commute_td5">
					          				<c:if test="${commuteSearch.state eq 0}">
					          					결근
						          			</c:if>
						          			<c:if test="${commuteSearch.state eq 1}">
					          					지각
						          			</c:if>
						          			<c:if test="${commuteSearch.state eq 2}">
					          					사유퇴근
						          			</c:if>
						          			<c:if test="${commuteSearch.state eq 3}">
					          					정상근무
						          			</c:if>
						          			<c:if test="${commuteSearch.state eq null}">
					          					-------
						          			</c:if>
				       					</td>
				       					<td style="padding-top: 15px" class="commute_td5">
				       						<c:if test="${commuteSearch.memo ne null}">
				       						
					          					
					          					<%-- <input id="select_ck${i.index}" class="checkbox_size" type="checkbox" onclick="check_ck(${i.index})"> --%>
												<button id="memo_btn" data-toggle="modal" data-target="#myModal"  onclick="date_info(${i.index})">
													<span id="memo_img" class="glyphicon glyphicon-file" aria-hidden="true"></span>
												</button>
					          					<input  type="hidden" value="${commuteSearch.memo}" id="memo_info${i.index}">
					          					<input type="hidden" value="${commuteSearch.reg_date}" id="text_info${i.index}">
						          			</c:if>
				       						<c:if test="${commuteSearch.memo eq null}">
					          					-------
						          			</c:if>
				       					</td>
					               			
								   </tr>			               			
			               		</c:forEach>
				          			
		               	</table>
	            	</div>
            </div>
            
           </div>
            <br>
		</div>
	</div>
	
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span id="memo_title">Memo</span></h4>
      </div>
      <div class="modal-body" id="search_modal_body">
        <table class="table" id="commute_s_table1">
        	<tr  class="active table-colname">
	       		<td id="modal_td">
        			<span id="modal_date">2016-03-09 [사원]전지용 님의 비고 입니다.</span>
        		</td>
        	</tr>
        	<tr >
        		<td>
        			<textarea id="modal_textarea" rows="5" cols="55" readonly="readonly"></textarea>
        		</td>
        	</tr>
        </table>
      </div>
      <div class="modal-footer">
      	<br><br>
      </div>
    </div>
  </div>
</div>
</div>

</body>
</html>