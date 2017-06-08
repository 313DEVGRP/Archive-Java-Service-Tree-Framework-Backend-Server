<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : EgovSmsCacheBeanList.jsp
  * @Description : 캐시 빈 설정 목록 화면
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
<title>Cache Config List(Spring Integration)</title>

</head>
<body>

<script type="text/javaScript" language="javascript" defer="defer">
//<!--


/* 글 목록 화면 function */
function fn_egov_selectCacheList() {
   	document.beanVO.serviceNm.value = "ehCache";
   	
	var options = { 
		   	   success     : responseCtl,
		       url         : "<c:url value='/ole/sms/selectCacheBeanList.sms'/>",
		       type        : "post", /* get, post */
		       dataType    : "html" /* xml, html, script, json */
		}; 
	jQuery("#beanVO").ajaxSubmit( options );
	
}

function fn_egov_select(id){
	document.beanVO.beanNm.value = id;
	document.beanVO.serviceNm.value = "cache";

   	var options = { 
   		   	   success     : responseCtl,
		       url         : "<c:url value='/ole/sms/selectCacheBean.sms'/>",
		       type        : "post", /* get, post */
		       dataType    : "html" /* xml, html, script, json */
		}; 
	jQuery("#beanVO").ajaxSubmit( options );
}


function fn_egov_newView(){

	var options = { 
		   	   success     : responseCtl,
		       url         : "<c:url value='/ole/sms/insertCacheServiceView.sms'/>",
		       type        : "post", /* get, post */
		       dataType    : "html" /* xml, html, script, json */
		}; 
	jQuery("#beanVO").ajaxSubmit( options );
}

function responseCtl(html, status){
	$('#contents').html(html);
}

//-->
</script>

<div id="wrap">
<form:form commandName="beanVO" id="beanVO" name="beanVO" action ="<c:url value='/ole/sms/selectCacheBeanList.sms'/>" onsubmit="fn_egov_selectCacheList(); return false;" method="post">
<!-- content 시작 -->
<div id="content">	
<input type="hidden" name="beanNm" />
<input type="hidden" name="serviceNm" value="cache"/>
<input type="hidden" name="beanTotCount" value="<c:out value='${beanVO.beanTotCount}'/>"/>

	<div id="h2_topnav"><h2><strong>캐시 설정관리 목록 (Spring Integration)</strong></h2></div>
	<div id="search_area01">
	<ul>
		<li><img src="<c:url value='/images/egovframework/oe1/sms/img_search01.gif'/>" alt="검색조건" class="imgs" /></li>
		<li>
			<label for="searchCondition">
			<form:select path="searchCondition" cssClass="use">
				<form:option value="1" label="Bean ID" />
				<form:option value="0" label="Class" />
			</form:select></label>
		</li>
		<li><label for="searchKeyword"><form:input path="searchKeyword"   cssClass="txt"/></label></li>
		<li><a href="/#" onclick="javascript:fn_egov_selectCacheList();return false;"><img src="<c:url value='/images/egovframework/oe1/sms/btn_search01.gif'/>" alt="검색" class="btn_search" /></a></li></ul>		
	</div>
	<!-- 결과 테이블 시작 -->
			<div id="result_table">
				<table summary="No,BeanID,Class " class="table_style">
				<caption>Cache Config List</caption>
				<colgroup>
				<col width="10%">				
				<col width="30%">
				<col width="60%">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" align="center">No</th>
					<th scope="col" align="center">BeanID</th>
					<th scope="col" align="center">Class</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="result" items="${cache_list}" varStatus="status">	
					<tr>
						<td align="center" class="listtd"><c:out value="${result.beanCount}"/></td>
						<td align="left" class="listtd"><a href="/#" onclick="javascript:fn_egov_select('<c:out value="${result.beanNm}"/>');return false;"><c:out value="${result.beanNm}"/></a></td>
						<td align="left" class="listtd"><c:out value="${result.beanClassNm}"/>&nbsp;</td>
					</tr>			
				</c:forEach>																										
				</tbody>
				<c:if test="${fn:length(cache_list) == 0}">
					<tr>
						<td align="center" colspan="3">등록된 캐시 설정 정보가  없습니다.</td>
					</tr>
				</c:if>
				</table> 				
			</div>
			<!-- //결과 테이블 끝 -->
			<div id="btn_style01"><a title="신규등록" href="/#" onclick="javascript:fn_egov_newView();return false;"><span>신규등록</span></a></div>
					
	<!-- /List -->
</div>
</form:form>
</div>

</body>
</html>