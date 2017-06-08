<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : EgovSmsEhCacheList.jsp
  * @Description : EhCache 설정 목록 화면
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
<title>EhCache Config List</title>


</head>	
<body>
<script type="text/javaScript" language="javascript" defer="defer">
//<!--
/* 글 목록 화면 function */
function fn_egov_selectEhCacheList() {
   	document.ehCacheVO.serviceNm.value = "ehCache";

   	var options = { 
		   	   success     : responseCtl,
		       url         : "<c:url value='/ole/sms/selectEhCacheList.sms'/>",
		       type        : "post", /* get, post */
		       dataType    : "html" /* xml, html, script, json */
		}; 
	jQuery("#ehCacheVO").ajaxSubmit( options );
}

function fn_egov_select(id){
	document.ehCacheVO.ehCacheNm.value = id;
	document.ehCacheVO.serviceNm.value = "ehCache";

   	var options = { 
   		   	   success     : responseCtl,
		       url         : "<c:url value='/ole/sms/selectEhCache.sms'/>",
		       type        : "post", /* get, post */
		       dataType    : "html" /* xml, html, script, json */
		}; 
	jQuery("#ehCacheVO").ajaxSubmit( options );
}

function fn_egov_newView(){
	var options = { 
		   	   success     : responseCtl,
		       url         : "<c:url value='/ole/sms/insertNewEhCacheServicesView.sms'/>",
		       type        : "post", /* get, post */
		       dataType    : "html" /* xml, html, script, json */
		}; 
	jQuery("#ehCacheVO").ajaxSubmit( options );
}

function fn_egov_newCacheView(){
	var options = { 
		   	   success     : responseCtl,
		       url         : "<c:url value='/ole/sms/insertNewEhCacheView.sms'/>",
		       type        : "post", /* get, post */
		       dataType    : "html" /* xml, html, script, json */
		}; 
	jQuery("#ehCacheVO").ajaxSubmit( options );
}

function responseCtl(html, status){

 $('#contents').html(html);
}

//-->
</script>

<div id="wrap" >
<div id="content">
<form:form commandName="ehCacheVO" id="ehCacheVO" name="ehCacheVO" action ="<c:url value='/ole/sms/selectEhCacheList.sms'/>" onsubmit="fn_egov_selectEhCacheList(); return false;" method="post">	
<input type="hidden" name="ehCacheNm" />
<input type="hidden" name="serviceNm" value="ehCache"/>

			<div id="h2_topnav"><h2><strong>EhCache Config List</strong></h2></div>
			<div id="search_area01">
				<ul>
					<li><img src="<c:url value='/images/egovframework/oe1/sms/img_search01.gif'/>" alt="검색조건" class="imgs" /></li>
					<li>
						<label style="display: none;">EhCache 설정관리 목록</label>
				    </li>
				    <li>
						<label for="searchCondition">
						<form:select path="searchCondition" cssClass="use">
							<form:option value="0" label="EhCache 명" />
						</form:select></label>
					</li>
					<li><label for="searchKeyword"><form:input path="searchKeyword" size="15" maxlength="30"/></label></li>
					<li><a href="/#" onclick="javascript:fn_egov_selectEhCacheList();return false;"><img src="<c:url value='/images/egovframework/oe1/sms/btn_search01.gif'/>" alt="검색" class="btn_search" /></a></li>
				</ul>
			</div>
			<!-- 결과 테이블 시작 -->
			<div id="result_table">
				<table summary="NO, Cache Name" class="table_style">
				<caption>EhCache Config List</caption>
				<colgroup>
				<col width="30%">
				<col width="70%">
				</colgroup>
				<thead>
				<tr>
					<th scope="col">NO</th>
					<th scope="col">Cache Name</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="result" items="${cache_list}" varStatus="status">	
					<tr>
						<td><c:out value="${result.ehCacheCount}"/></td>
						<td><a href="/#" onclick="javascript:fn_egov_select('<c:out value="${result.ehCacheNm}"/>');return false;"><c:out value="${result.ehCacheNm}"/></a></td>
					</tr>			
				</c:forEach>
				
				<c:if test="${fn:length(cache_list) == 0}">
					<tr>
						<td align="center" colspan="2">EhCache 서비스가 존재하지 않습니다.</td>
					</tr>
				</c:if>																											
				</tbody>
				</table> 				
			</div>
			<!-- //결과 테이블 끝 -->
			<div id="btn_style01">
				<a title="신규캐시등록" href="/#" onclick="javascript:fn_egov_newCacheView();;return false;"><span>신규캐시등록</span></a>
				<a title="신규등록" href="/#" onclick="javascript:fn_egov_newView();return false;"><span>신규등록</span></a>
			</div>

		</form:form>
				</div>
</div>
</body>
</html>