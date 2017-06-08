<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : EgovSmsPropertyList.jsp
  * @Description : 프로퍼티 설정 목록 화면
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
<title>Property Config List</title>


</head>
<body>

<script type="text/javaScript" language="javascript" defer="defer">
//<!--

 function fn_egov_selectPropertyList() {
	   	document.propertyVO.serviceNm.value = "property";

		var options = { 
	   		   	   success     : responseCtl,
			       url         : "<c:url value='/ole/sms/selectPropertyList.sms'/>",
			       type        : "post", /* get, post */
			       dataType    : "html" /* xml, html, script, json */
			}; 
		jQuery("#propertyVO").ajaxSubmit( options );
 }
	
 function fn_egov_select(id){
		document.propertyVO.propertyNm.value = id;
		document.propertyVO.serviceNm.value = "property";

	   	var options = { 
	   		   	   success     : responseCtl,
			       url         : "<c:url value='/ole/sms/selectPropertyService.sms'/>",
			       type        : "post", /* get, post */
			       dataType    : "html" /* xml, html, script, json */
			}; 
		jQuery("#propertyVO").ajaxSubmit( options );
 }

 function fn_egov_insertNewProperty(){

	   	var options = { 
	   		   	   success     : responseCtl,
			       url         : "<c:url value='/ole/sms/insertNewPropertyBeanView.sms'/>",
			       type        : "post", /* get, post */
			       dataType    : "html" /* xml, html, script, json */
			}; 
		jQuery("#propertyVO").ajaxSubmit( options );
}


function fn_egov_insertNewPropertyService(){
	var options = { 
		   	   success     : responseCtl,
		       url         : "<c:url value='/ole/sms/insertNewPropertyServiceView.sms'/>",
		       type        : "post", /* get, post */
		       dataType    : "html" /* xml, html, script, json */
		}; 
	jQuery("#propertyVO").ajaxSubmit( options );
}
 

 function responseCtl(html, status){	 
	 $('#contents').html(html);
 }
//-->
</script>

<div id="wrap">
		<!-- content 시작 -->
		<div id="content">
		<form:form commandName="propertyVO" id="propertyVO" name="propertyVO" action ="<c:url value='/ole/sms/selectPropertyServiceList.sms'/>" onsubmit="fn_egov_selectPropertyList(); return false;" method="post">
		<input type="hidden" name="propertyNm" />
		<input type="hidden" name="serviceNm" />	
			<div id="h2_topnav"><h2><strong>프로퍼티 설정관리 목록</strong></h2></div>
			<div id="search_area01">
			<ul>
				<li><img src="<c:url value='/images/egovframework/oe1/sms/img_search01.gif'/>" alt="검색조건" class="imgs" /></li>
				<li><label style="display: none;" for="searchCondition">검색조건</label>
					<form:select path="searchCondition" cssClass="use">
						<form:option value="0" label="프로퍼티 명" />
					</form:select>
				</li>
				<li><label for="searchKeyword"><form:input path="searchKeyword"   cssClass="txt"/></label></li>
				<li><a href="/#" onclick="javascript:fn_egov_selectPropertyList();return false;"><img src="<c:url value='/images/egovframework/oe1/sms/btn_search01.gif'/>" alt="검색" class="btn_search" /></a></li></ul>		
			</div>
			
			<div id="btn_style02">
				<a title="신규빈등록" href="/#" onclick="javascript:fn_egov_insertNewProperty();return false;"><span>신규빈등록</span></a>
				<a title="신규등록" href="/#" onclick="javascript:fn_egov_insertNewPropertyService();return false;"><span>신규등록</span></a>					
			</div>
			
			<!-- 결과 테이블 시작 -->
			<div id="result_table">
				<table summary="No, Bean Name, Class, Property Name" class="table_style">
				<caption>Property Config List</caption>
				<colgroup>
				<col width="10%">				
				<col width="20%">
				<col width="50%">
				<col width="20%">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" align="center">No</th>
					<th scope="col" align="center">BeanId Name</th>
					<th scope="col" align="center">Class</th>
					<th scope="col" align="center">Property Name</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="result" items="${property_list}" varStatus="status">	
					<tr>
						<td align="center" class="listtd"><c:out value="${result.propertyCnt}"/></td>
						<td align="left" class="listtd"><c:out value="${result.beanNm}"/></td>
						<td align="left" class="listtd"><c:out value="${result.beanClassNm}"/></td>
						<td align="left" class="listtd"><a href="/#" onclick="javascript:fn_egov_select('<c:out value="${result.propertyNm}"/>');return false;"><c:out value="${result.propertyNm}"/></a></td>
					</tr>			
				</c:forEach>	
				<c:if test="${fn:length(property_list) == 0}">
					<tr>
						<td align="center" colspan="4">프로퍼티 설정정보가 존재하지 않습니다.</td>
					</tr>
				</c:if>																										
				</tbody>
				</table> 				
			</div>
			<!-- //결과 테이블 끝 -->
			<div id="btn_style01">
				<a title="신규빈등록" href="/#" onclick="javascript:fn_egov_insertNewProperty();return false;"><span>신규빈등록</span></a>
				<a title="신규등록" href="/#" onclick="javascript:fn_egov_insertNewPropertyService();return false;"><span>신규등록</span></a>					
			</div>
		
		</form:form>	
		</div>
</div>
<!-- //전체 레이어 끝 -->
</body>
</html>