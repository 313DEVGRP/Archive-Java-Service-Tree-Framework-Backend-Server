<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : EgovSmsScheduleHistList.jsp
  * @Description : 스케줄 이력 현황 목록
  * @Modification Information
  * 
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2010.05.25            최초 생성
  *
  * author 운영환경1  개발팀
  * since 2010.05.25
  *  
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Scheduling List</title>


</head>
<body>
<script type="text/javaScript" language="javascript" defer="defer">
//<!--

 function fn_egov_select(jobName){
	document.schedulingVO.jobName.value = jobName;

	   	var options = { 
	   		   	   success     : responseCtl,
			       url         : "<c:url value='/ole/sms/selectScheduling.sms'/>",
			       type        : "post", /* get, post */
			       dataType    : "html" /* xml, html, script, json */
			}; 
		jQuery("#schedulingVO").ajaxSubmit( options );
 }
 

 function responseCtl(html, status){
	 $('#content').html(html);
 }

 /* pagination 페이지 링크 function */
 function fn_egov_link_page(pageNo){
 	document.schedulingVO.pageIndex.value = pageNo;

 	var options = { 
		   	   success     : responseCtl,
		       url         : "<c:url value='/ole/sms/selectScheduleHistList.sms'/>",
		       type        : "post", /* get, post */
		       dataType    : "html" /* xml, html, script, json */
	}; 
	
 	jQuery("#schedulingVO").ajaxSubmit( options );
 }
 
//-->
</script>

<div id="wrap">
		<!-- content 시작 -->
		<div id="content">
		<form:form commandName="schedulingVO" id="schedulingVO" name="schedulingVO" action ="<c:url value='/ole/sms/selectScheduling.sms'/>" method="post">
			<input type="hidden" name="jobName" />
			<div id="h2_topnav"><h2><strong>스케줄링 목록</strong></h2></div>
			
			<!-- 결과 테이블 시작 -->
			<div id="result_table">
				<table summary="No,Trigger Type,Group Name,Job Name,Job Class Name" class="table_style">
				<caption>Scheduling List</caption>
				<colgroup>
				<col width="5%">				
				<col width="15%">
				<col width="10%">
				<col width="15%">				
				<col width="50%">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" align="center">No</th>
					<th scope="col" align="center">Trigger Type</th>
					<th scope="col" align="center">Group Name</th>
					<th scope="col" align="center">Job Name</th>
					<th scope="col" align="center">Job Class Name</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="result" items="${jobList}" varStatus="status">	
					<tr>
						<td align="center" class="listtd"><c:out value="${status.count}"/></td>
						<td align="center" class="listtd"><c:out value="${result.triggerType}"/></td>
						<td align="center" class="listtd"><c:out value="${result.jobGroupNm}"/>&nbsp;</td>
						<td align="center" class="listtd"><a href="/#" onclick="javascript:fn_egov_select('<c:out value="${result.jobNm}"/>');return false;"><c:out value="${result.jobNm}"/></a></td>
						<td align="left" class="listtd"><c:out value="${result.jobClass}"/>&nbsp;</td>
					</tr>			
				</c:forEach>
				
				<c:if test="${fn:length(jobList) == 0}">
					<tr>
						<td align="center" colspan="5">스케줄링 서비스가  존재하지 않습니다.</td>
					</tr>
				</c:if>																											
				</tbody>
				</table> 				
			</div>
			<!-- /List -->


		</form:form>	
		</div>		
</div>
<!-- //전체 레이어 끝 -->
</body>
</html>