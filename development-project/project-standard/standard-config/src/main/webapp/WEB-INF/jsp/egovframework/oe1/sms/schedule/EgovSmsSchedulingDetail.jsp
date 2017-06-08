<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
  /**
  * @Class Name : EgovSmsSchedulingDetail.jsp
  * @Description : 스케줄링 Job 상세 화면
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
<title>Scheduling Detail</title>


</head>
<body>
<script type="text/javaScript" language="javascript" defer="defer">
//<!--

 function fn_egov_back(){
	 var options = { 
 		   	   success     : responseCtl,
		       url         : "<c:url value='/ole/sms/selectSchedulingList.sms'/>",
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
<form:form commandName="schedulingVO" id="schedulingVO" name="schedulingVO">
	<div id="h2_topnav"><h2><strong>스케줄링 상세 정보</strong></h2></div>
		  	<div id="datail_table">
				<table id="tbl" summary="Job명,그룹명,Job 클래스명,Job 상세설명,시작 시간,트리거 유형,반복 주기,이전 실행 시간,다음 실행 시간" class="">
				<caption>Scheduling Detail</caption>
                  <tr>
                    <th scope="row">Job명</th>
                    <td>
                    	<c:out value="${resultVo.jobNm}"/>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">그룹명</th>
                    <td>
                    	<c:out value="${resultVo.jobGroupNm}"/>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">Job 클래스명</th>
                    <td>
                    	<c:out value="${resultVo.jobClass}"/>
                  	</td>
                  </tr>
                  <tr>
                    <th scope="row">Job 상세설명</th>
                    <td>
                    	<c:out value="${resultVo.jobDescription}"/>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">시작 시간</th>
                    <td>
                    	<c:out value="${resultVo.startDate}"/>
					</td>
                  </tr>
                  <tr>
                    <th scope="row">트리거 유형</th>
                    <td>
                    	<c:out value="${resultVo.triggerType}"/>
               		</td>
                  </tr>
                  <c:choose>
				  <c:when test="${resultVo.triggerType == 'cronTrigger'}">
				  	<tr>
	                    <th scope="row">크론 표현식</th>
	                    <td>
	                    	<c:out value="${resultVo.cronExp}"/>
	                    </td>
                    </tr>
				  </c:when>
				  <c:otherwise>
				  	<tr>
	                    <th scope="row">반복 주기</th>
	                    <td>
	                    	<c:out value="${resultVo.repeatInterval}"/>&nbsp;Sec
	                    </td>
                    </tr>
				  </c:otherwise>
				  </c:choose>
				  <tr>
	                    <th scope="row">이전 실행 시간</th>
	                    <td>
	                    	<c:out value="${resultVo.previousFireTime}"/>
	                    </td>
                  </tr>
				  <tr>
	                    <th scope="row">다음 실행 시간</th>
	                    <td>
	                    	<c:out value="${resultVo.nextFireTime}"/>
	                    </td>
                  </tr>
                </table>                	
			</div>
			
			<div id="btn_style01">
				<a title="목록" href="/#" onclick="javascript:fn_egov_back();return false;"><span>목록</span></a>
			</div>
			
</form:form>
</div>
</div>
</body>
</html>

