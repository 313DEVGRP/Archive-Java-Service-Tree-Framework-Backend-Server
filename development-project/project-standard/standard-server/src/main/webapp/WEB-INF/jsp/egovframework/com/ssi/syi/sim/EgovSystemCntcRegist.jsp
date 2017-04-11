<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 /**
  * @Class Name  : EgovSystemCntcRegist.jsp
  * @Description : EgovSystemCntcRegist 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.08.11   이중호              최초 생성
  *
  *  @author 공통컴포넌트팀
  *  @since 2009.08.11
  *  @version 1.0
  *  @see
  *
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<html lang="ko">
<head>
<title>시스템연계 등록</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="systemCntc" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_SystemCntc(){
	location.href = "<c:url value='/ssi/syi/sim/getSystemCntcList.do'/>";
}
/* ********************************************************
 * 등록처리
 ******************************************************** */
function fn_egov_regist_SystemCntc(form){
	if(confirm("<spring:message code='common.save.msg' />")){
		if(!validateSystemCntc(form)){
			return;
		}else{
		    var validBeginDe = Number(document.getElementById('validBeginDe').value);
		    var validEndDe   = Number(document.getElementById('validEndDe'  ).value);
		    if(validEndDe < validBeginDe){
		        alert("유효시작일자는 유효종료일자 보다 클수 없다.");
		        return;
		    }
			form.submit();
		}
	}
}
/* ********************************************************
* CodeList 가져오기
******************************************************** */
function fn_egov_get_CodeList(form,choose){
	form.cmd.value = "";

	if(choose == 'provdInsttId') {
		form.provdSysId.value = "";
		form.provdSvcId.value = "";
	} else
	if(choose == 'provdSysId') {
		form.provdSvcId.value = "";
	} else
	if(choose == 'requstInsttId') {
		form.requstSysId.value = "";
	}

	form.submit();
}

-->
</script>
</head>

<body>
<DIV id="content" style="width:712px">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!-- 상단타이틀 -->
<form:form commandName="systemCntc" name="systemCntc" method="post">
<input name="cmd"     type="hidden" value="<c:out value='Regist'/>"/>
<input name="confmAt" type="hidden" value="<c:out value='N'/>"/>

<!-- 상단 타이틀  영역 -->
<table width="700" cellpadding="8" class="table-search" border="0" summary="상단 타이틀을 제공한다.">
 <tr>
  <td width="100%"class="title_left">
   	<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;시스템연계 등록</h1>
  </td>
 </tr>
</table>
<!-- 줄간격조정  -->
<table width="700" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="시스템연계 입력을 제공한다.">
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >연계ID<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
      <form:input  path="cntcId" title="연계ID" size="20" maxlength="20"  readonly="readonly" cssClass="readOnlyClass"/>
      <form:errors path="cntcId"/>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >연계명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
      <form:input  path="cntcNm" title="연계명" size="60" maxlength="60"/>
      <form:errors path="cntcNm"/>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >연계유형<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
      <form:input  path="cntcType" title="연계유형" size="60" maxlength="60"/>
      <form:errors path="cntcType"/>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >제공기관<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
		<select name="provdInsttId" class="select" onChange="javascript:fn_egov_get_CodeList(document.systemCntc,'provdInsttId');" title="제공기관선택">
			<c:forEach var="result" items="${cntcInsttList}" varStatus="status">
				<option value='<c:out value="${result.insttId}"/>' <c:if test="${result.insttId == systemCntc.provdInsttId}">selected="selected"</c:if> ><c:out value="${result.insttNm}"/></option>
			</c:forEach>
		</select>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >제공시스템<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
		<select name="provdSysId" class="select" onChange="javascript:fn_egov_get_CodeList(document.systemCntc,'provdSysId');" title="제공시스템선택">
			<c:forEach var="result" items="${cntcProvdSystemList}" varStatus="status">
				<option value='<c:out value="${result.sysId}"/>' <c:if test="${result.sysId == systemCntc.provdSysId}">selected="selected"</c:if> ><c:out value="${result.sysNm}"/></option>
			</c:forEach>
		</select>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >제공서비스<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
		<select name="provdSvcId" class="select" title="제공서비스선택">
			<c:forEach var="result" items="${cntcProvdServiceList}" varStatus="status">
				<option value='<c:out value="${result.svcId}"/>' <c:if test="${result.svcId == systemCntc.provdSvcId}">selected="selected"</c:if> ><c:out value="${result.svcNm}"/></option>
			</c:forEach>
		</select>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >요청기관<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
		<select name="requstInsttId" class="select" onChange="javascript:fn_egov_get_CodeList(document.systemCntc,'requstInsttId');" title="요청기관선택">
			<c:forEach var="result" items="${cntcInsttList}" varStatus="status">
				<option value='<c:out value="${result.insttId}"/>' <c:if test="${result.insttId == systemCntc.requstInsttId}">selected="selected"</c:if> ><c:out value="${result.insttNm}"/></option>
			</c:forEach>
		</select>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >요청시스템<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
		<select name="requstSysId" class="select" title="요청시스템선택">
			<c:forEach var="result" items="${cntcRequstSystemList}" varStatus="status">
				<option value='<c:out value="${result.sysId}"/>' <c:if test="${result.sysId == systemCntc.requstSysId}">selected="selected"</c:if> ><c:out value="${result.sysNm}"/></option>
			</c:forEach>
		</select>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >유효시작일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
	  <input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />

      <form:hidden path="validBeginDe" />
	  <input name="v_validBeginDe" type="text" size="10" value=""  maxlength="10" readonly class="readOnlyClass" onClick="javascript:fn_egov_NormalCalendar(document.systemCntc, document.systemCntc.validBeginDe, document.systemCntc.v_validBeginDe);" title="시작일자입력"/>

	  <a href="#" onclick="fn_egov_NormalCalendar(document.systemCntc, document.systemCntc.validBeginDe, document.systemCntc.v_validBeginDe);" style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"></a>

    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >유효종료일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>

      <form:hidden path="validEndDe" />
	  <input name="v_validEndDe" type="text" size="10" value=""  maxlength="10" readonly class="readOnlyClass" onClick="javascript:fn_egov_NormalCalendar(document.systemCntc, document.systemCntc.validBeginDe, document.systemCntc.v_validBeginDe);" title="시작일자입력"/>

	  <!-- 2010.11.12
	  <a href="javascript:fn_egov_NormalCalendar(document.systemCntc, document.systemCntc.validEndDe, document.systemCntc.v_validEndDe);" style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"></a>
	  -->

	  <a href="#" onclick="fn_egov_NormalCalendar(document.systemCntc, document.systemCntc.validEndDe, document.systemCntc.v_validEndDe);" style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"></a>

    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >사용여부<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
      <form:select path="useAt">
	      <form:option value="Y" label="Y"/>
	      <form:option value="N" label="N"/>
      </form:select>
    </td>
  </tr>
</table>
<table width="700" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>

<!-- 줄간격조정  -->
<table width="700" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
<tr><td height="3px"></td></tr>
<tr>
	<td>
		<!-- 목록/저장버튼  -->
		<table border="0" cellspacing="0" cellpadding="0" align="center" summary="목록/저장 버튼을 제공한다.">
		<tr>

		  <td>
		  	<span class="button"><input type="submit" value="<spring:message code="button.save" />" title="<spring:message code="button.save" />" onclick="fn_egov_regist_SystemCntc(document.systemCntc); return false;" ></span>
		  </td>
		  <td>
		  	<span class="button"><input type="button" value="<spring:message code="button.list" />" title="<spring:message code="button.list" />" onclick="fn_egov_list_SystemCntc(); return false;"></span>
		  </td>
		  <!-- 
		  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" alt="목록" width="8" height="20"></td>
		  <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif' />);" class="text_left" nowrap><a href="<c:url value='/ssi/syi/sim/getSystemCntcList.do'/>">목록</a></td>
		  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" alt="목록" width="8" height="20"></td>
 		  -->
		</tr>
		</table>
	</td>
</tr>
</table>
</form:form>
</DIV>
</body>
</html>
