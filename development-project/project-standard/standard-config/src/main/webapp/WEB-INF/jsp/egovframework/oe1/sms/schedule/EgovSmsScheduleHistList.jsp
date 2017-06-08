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
<title>Scheduler History Log</title>

</head>
<body>

<script type="text/javaScript" language="javascript" defer="defer">
//<!--

 function fn_egov_selectList() {

		var options = { 
	   		   	   success     : responseCtl,
			       url         : "<c:url value='/ole/sms/selectScheduleHistList.sms'/>",
			       type        : "post", /* get, post */
			       dataType    : "html" /* xml, html, script, json */
			}; 
		jQuery("#schedulingVO").ajaxSubmit( options );
		
	}

 function responseCtl(html, status){

	 
	 $('#contents').html(html);
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
		<form:form commandName="schedulingVO" id="schedulingVO" name="schedulingVO" action ="<c:url value='/ole/sms/selectScheduleHistList.sms'/>" onsubmit="fn_egov_selectList(); return false;" method="post">
			<div id="h2_topnav"><h2><strong>스케줄 이력 조회</strong></h2></div>
			<div id="search_area01">
			<ul>
				<li><img src="<c:url value='/images/egovframework/oe1/sms/img_search01.gif'/>" alt="검색" class="imgs" /></li>
				<li>
					<label for="searchCondition">
					<form:select path="searchCondition" cssClass="use">
						<form:option value="2" label="구분" />
						<form:option value="1" label="JOB NAME" />
						<form:option value="0" label="GROUP NAME" />
					</form:select></label>
				</li>
				<li><label for="searchKeyword"><form:input path="searchKeyword"   cssClass="txt"/></label></li>
				<li><a href="/#" onclick="javascript:fn_egov_selectList();return false;"><img src="<c:url value='/images/egovframework/oe1/sms/btn_search01.gif'/>" alt="검색" class="btn_search" /></a></li></ul>		
			</div>
			<!-- 결과 테이블 시작 -->
			<div id="result_table">
				<table summary="No,구분,JOB NAME,GROUP NAME,실행 시간,로그 메시지" class="table_style">
				<caption>스케줄 이력 목록</caption>
				<colgroup>
				<col width="5%">				
				<col width="10%">
				<col width="20%">
				<col width="15%">				
				<col width="10%">
				<col width="35%">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" align="center">No</th>
					<th scope="col" align="center">구분</th>
					<th scope="col" align="center">JOB NAME</th>
					<th scope="col" align="center">GROUP NAME</th>
					<th scope="col" align="center">실행 시간</th>
					<th scope="col" align="center">로그 메시지</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="result" items="${hist_list}" varStatus="status">	
					<tr>
						<td align="center" class="listtd"><c:out value="${status.count}"/></td>
						<td align="center" class="listtd"><c:out value="${result.logSe}"/></td>
						<td align="center" class="listtd"><c:out value="${result.jobNm}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.jobGroupNm}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.jobExecutTime}"/>&nbsp;</td>
						<td align="left" class="listtd"><c:out value="${result.logMssage}"/>&nbsp;</td>
					</tr>			
				</c:forEach>
				<c:if test="${fn:length(hist_list) == 0}">
					<tr>
						<td align="center" colspan="6">스케줄링 이력정보가 존재하지 않습니다.</td>
					</tr>
				</c:if>																											
				</tbody>
				</table> 				
			</div>
			<br/>
			<!-- /List -->
			<div id="paging">
				<ui:pagination paginationInfo = "${paginationInfo}"
						   type="image"
						   jsFunction="fn_egov_link_page"
						   />
				<form:hidden path="pageIndex" />
			</div>

		</form:form>	
				</div>
</div>
<!-- //전체 레이어 끝 -->
</body>
</html>