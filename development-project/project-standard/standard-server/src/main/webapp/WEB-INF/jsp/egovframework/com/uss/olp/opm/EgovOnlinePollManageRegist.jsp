<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
  Class Name : EgovOnlinePollManageRegist.jsp
  Description : 온라인POLL관리 등록 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<html lang="ko">
<head>
<title>온라인POLL관리 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<validator:javascript formName="onlinePollManage" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_OnlinePollManage(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_OnlinePollManage(){
	location.href = "<c:url value='/uss/olp/opm/listOnlinePollManage.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_OnlinePollManage(){
	var varFrom = document.onlinePollManage;

	if(confirm("<spring:message code="common.save.msg" />")){
		varFrom.action =  "<c:url value='/uss/olp/opm/registOnlinePollManage.do' />";

		if(!validateOnlinePollManage(varFrom)){
			return;
		}else{

			var pollBeginDe = Number( document.getElementById('pollBeginDe').value.replaceAll("-","") );
			var pollEndDe = Number( document.getElementById('pollEndDe').value.replaceAll("-","") );

			if(pollBeginDe > pollEndDe || pollEndDe < pollBeginDe ){
				alert("POLL시작일자는 POLL종료일자 보다 클수 없고,\nPOLL종료일자는 POLL시작일자 보다 작을수 없습니다. ");
				return;
			}

			varFrom.submit();
		}


	}

}

/* ********************************************************
 * 설문지정보 팝업창열기
 ******************************************************** */
 function fn_egov_QustnrManageListPopup_QustnrItemManage(){

 	window.showModalDialog("<c:url value='/uss/olp/qmc/EgovQustnrManageListPopup.do' />", self,"dialogWidth:800px;dialogHeight:500px;resizable:yes;center:yes");

}
 /* ********************************************************
 * PROTOTYPE JS FUNCTION
 ******************************************************** */
 String.prototype.trim = function(){
 	return this.replace(/^\s+|\s+$/g, "");
 }

 String.prototype.replaceAll = function(src, repl){
 	 var str = this;
 	 if(src == repl){return str;}
 	 while(str.indexOf(src) != -1) {
 	 	str = str.replace(src, repl);
 	 }
 	 return str;
 }
</script>
</head>
<body onLoad="fn_egov_init_OnlinePollManage()">
<DIV id="content" style="width:712px">
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!--  상단타이틀 -->
<form:form commandName="onlinePollManage" name="onlinePollManage" id="onlinePollManage" action="" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0" summary="상단 타이틀을 제공한다.">
 <tr>
  <td width="100%"class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="온라인POLL관리 등록">&nbsp;온라인POLL관리 등록</td>
 </tr>
</table>
<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!--  등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="온라인POLL관리 입력을 제공한다..">
  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label for="IdPollNm">POLL명</label>
    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
      <form:input path="pollNm" size="73" cssClass="txaIpt" maxlength="255"/>
      <form:errors path="pollNm" cssClass="error"/>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label for="IdPollBeginDe">POLL시작일자</label>
    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
      <input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
      <form:input path="pollBeginDe" size="10" maxlength="10" readonly="true" cssClass="readOnlyClass" />
      <a href="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].pollBeginDe);">
      <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" align="middle" style="border:0px" alt="POLL시작일자" title="POLL시작일자"></a>
      <form:errors path="pollBeginDe" cssClass="error"/>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label for="IdPollEndDe">POLL종료일자</label>
    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
      <form:input path="pollEndDe" size="10" maxlength="10" readonly="true" cssClass="readOnlyClass" />
      <a href="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].pollEndDe);">
      <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" align="middle"  style="border:0px" alt="POLL종료일자" title="POLL종료일자"></a>
      <form:errors path="pollEndDe" cssClass="error"/>
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text" ><label for="IdPollKindCode">POLL구분</label>
    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td>
        <form:select path="pollKindCode">
            <form:option value="" label="선택"/>
            <form:options items="${pollKindCodeList}" itemValue="code" itemLabel="codeNm"/>
        </form:select>
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label for="IdPollDsuseYn">POLL페기유무</label>
    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
   		<input type="radio" name="pollDsuseYn" value="N"  checked>N
   		<input type="radio" name="pollDsuseYn" value="Y">Y
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label for="IdPollAutoDsuseYn">POLL자동페기유무</label>
    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
    	<input type="radio" name="pollAutoDsuseYn" value="N">N
   		<input type="radio" name="pollAutoDsuseYn" value="Y" checked>Y
    </td>
  </tr>
</table>

<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
<tr>
	<td height="3px"></td>
</tr>
</table>
<center>
<!--  목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center" summary="목록/저장 버튼을 제공한다.">
<tr>
  <td>
  	<span class="button">
  		<input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_save_OnlinePollManage(); return false;">
  	</span>
  </td>
  <td>&nbsp;</td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
  <td class="btnBackground" nowrap><a href="<c:url value='/uss/olp/opm/listOnlinePollManage.do' />"><spring:message code="button.list" /></a>
  </td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
</tr>
</table>
</center>

<input name="cmd" type="hidden" value="<c:out value='save'/>">
</form:form>
</DIV>

</body>
</html>
