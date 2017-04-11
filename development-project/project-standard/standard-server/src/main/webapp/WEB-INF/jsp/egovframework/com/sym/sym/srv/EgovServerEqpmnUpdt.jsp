<%--
/**
 * @Class Name  : EgovServerEqpmnUpdt.java
 * @Description : EgovServerEqpmnUpdt jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.07.01    lee.m.j     최초 생성
 *
 *  @author lee.m.j
 *  @since 2010.07.01
 *  @version 1.0
 *  @see
 *
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
--%>

<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<title>서버장비 수정</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="serverEqpmn" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fncSelectServerEqpmnList() {
    var varFrom = document.getElementById("serverEqpmn");
    varFrom.action = "<c:url value='/sym/sym/srv/selectServerEqpmnList.do'/>";
    varFrom.submit();
}

function fncServerEqpmnUpdate() {
    var varFrom = document.getElementById("serverEqpmn");
    varFrom.action = "<c:url value='/sym/sym/srv/updtServerEqpmn.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateServerEqpmn(varFrom)){
            return;
        }else{
            if(!ipValidate(varFrom.serverEqpmnIp.value))
                return;
            else
                varFrom.submit();
        }
    }
}

function fncServerEqpmnDelete() {
    var varFrom = document.getElementById("serverEqpmn");
    varFrom.action = "<c:url value='/sym/sym/srv/removeServerEqpmn.do'/>";
    if(confirm("삭제 하시겠습니까?")){
        varFrom.submit();
    }
}

function ipValidate(ipValue) {

    var varFrom = document.getElementById("serverEqpmn");
    var IPvalue = ipValue;

    var ipPattern = /^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/;
    var ipArray = IPvalue.match(ipPattern);

    var result = "";
    var thisSegment;

    if(IPvalue == "0.0.0.0") {
        alert(IPvalue + "는 예외 아이피 입니다..");
        result = false;
    } else if (IPvalue == "255.255.255.255") {
        alert(result =IPvalue + "는 예외 아이피 입니다.");
        result = false;
    } else {
        result = true;
    }

    if(ipArray == null) {
        alert("IP 형식이 일치 하지않습니다. ");
        result = false;
    } else {
        for (var i=1; i<5; i++) {

            thisSegment = ipArray[i];

            if (thisSegment > 255) {
                alert("IP 형식이 일치 하지않습니다. ");
                result = false;
            }

            if ((i == 0) && (thisSegment > 255)) {
                alert("IP 형식이 일치 하지않습니다. ");
                result = false;
            }
        }
    }

    return result;
}
-->
</script>
</head>

<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
    <form name="serverEqpmn" id="serverEqpmn" method="post" action="${pageContext.request.contextPath}/sym/sym/srv/updtServerEqpmn.do">
    <table width="100%" class="table-search" border="0">
     <tr>
      <td width="100%" class="title_left"><h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;서버H/W 수정</h1></td>
     </tr>
     <tr>
      <td class="title_left"></td>
     </tr>
    </table>

    <table width="100%" cellpadding="1" class="table-register" summary="서버H/W를 수정한다.">
      <caption>서버H/W 수정</caption>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>서버H/W ID<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="serverEqpmnId"><input name="serverEqpmnId" id="serverEqpmnId" type="text" value="<c:out value='${serverEqpmn.serverEqpmnId}'/>" size="20" class="readOnlyClass" readonly></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>서버H/W 명<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="serverEqpmnNm"><input name="serverEqpmnNm" id="serverEqpmnNm" type="text" value="<c:out value='${serverEqpmn.serverEqpmnNm}'/>" maxLength="30" size="30" >&nbsp;<form:errors path="serverEqpmnNm" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>서버H/W IP<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="serverEqpmnIp"><input name="serverEqpmnIp" id="serverEqpmnIp" type="text" value="<c:out value='${serverEqpmn.serverEqpmnIp}'/>" maxLength="23" size="23" >&nbsp;<form:errors path="serverEqpmnIp" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>관리자<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="serverEqpmnMngrNm"><input name="serverEqpmnMngrNm" id="serverEqpmnMngrNm" type="text" value="<c:out value='${serverEqpmn.serverEqpmnMngrNm}'/>" maxLength="30" size="30" >&nbsp;<form:errors path="serverEqpmnMngrNm" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>관리자이메일주소<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="mngrEmailAddr"><input name="mngrEmailAddr" id="mngrEmailAddr" type="text" value="<c:out value='${serverEqpmn.mngrEmailAddr}'/>" maxLength="50" size="50" >&nbsp;<form:errors path="mngrEmailAddr" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>OS정보<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="opersysmInfo"><input name="opersysmInfo" id="opersysmInfo" type="text" value="<c:out value='${serverEqpmn.opersysmInfo}'/>" maxLength="1000" size="80" >&nbsp;<form:errors path="opersysmInfo" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>CPU정보<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="cpuInfo"><input name="cpuInfo" id="cpuInfo" type="text" value="<c:out value='${serverEqpmn.cpuInfo}'/>" maxLength="1000" size="80" >&nbsp;<form:errors path="cpuInfo" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>메모리정보<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="moryInfo"><input name="moryInfo" id="moryInfo" type="text" value="<c:out value='${serverEqpmn.moryInfo}'/>" maxLength="1000" size="80" >&nbsp;<form:errors path="moryInfo" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>하드디스크<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="hdDisk"><input name="hdDisk" id="hdDisk" type="text" value="<c:out value='${serverEqpmn.hdDisk}'/>" maxLength="1000" size="80" >&nbsp;<form:errors path="hdDisk" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>기타정보<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="etcInfo"><input name="etcInfo" id="etcInfo" type="text" value="<c:out value='${serverEqpmn.etcInfo}'/>" maxLength="1000" size="80" ></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>등록일자<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="regstYmd">
        	<input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
            <!--  <input type="text" name="regstYmd" id="regstYmd" value="<c:out value="${serverEqpmn.regstYmd}"/>" size="10" maxlength="10" title="등록일자" class="readOnlyClass" readonly onClick="javascript:fn_egov_NormalCalendar(document.serverEqpmn, document.serverEqpmn.registerDate, document.serverEqpmn.regstYmd);" onKeyDown="javascript:if (event.keyCode == 13) { fn_egov_NormalCalendar(document.serverEqpmn, document.serverEqpmn.registerDate, document.serverEqpmn.regstYmd); }" >-->
            <input type="text" name="regstYmd" id="regstYmd" value="<c:out value="${serverEqpmn.regstYmd}"/>" size="10" maxlength="10" title="등록일자" >
            <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.serverEqpmn, document.serverEqpmn.registerDate, document.serverEqpmn.regstYmd);" style="selector-dummy:expression(this.hideFocus=false);"><img src="/images/egovframework/com/sym/cal/bu_icon_carlendar.gif" title="새창" alt="달력창팝업버튼이미지"></a>
            <input type="hidden" name="registerDate" value=""/>
            &nbsp;<form:errors path="regstYmd" />
        </label></td>
      </tr>
    </table>

    <table width="100%" cellpadding="8">
      <tr>
        <td align="center">
           <table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncServerEqpmnUpdate(); return false;"></span></td>
              <td>&nbsp;&nbsp;</td>
              <!--
              <td><span class="button"><a href="<c:url value='/sym/sym/srv/removeServerEqpmn.do'/>?serverEqpmnId=<c:out value='${serverEqpmnVO.serverEqpmnId}'/>" onclick="fncServerEqpmnDelete(); return false;"><spring:message code="button.delete" /></a></span></td>
              <td>&nbsp;&nbsp;</td>
              -->
              <td><span class="button"><a href="<c:url value='/sym/sym/srv/selectServerEqpmnList.do'/>?pageIndex=<c:out value='${serverEqpmnVO.pageIndex}'/>&amp;strServerEqpmnNm=<c:out value="${serverEqpmnVO.strServerEqpmnNm}"/>" onclick="fncSelectServerEqpmnList(); return false;"><spring:message code="button.list" /></a></span></td>
            </tr>
           </table>
       </td>
      </tr>
    </table>

    <!-- 검색조건 유지 -->
    <input type="hidden" name="strServerEqpmnNm" value="<c:out value='${serverEqpmnVO.strServerEqpmnNm}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${serverEqpmnVO.pageIndex}'/>" >
</form>
</td>
</tr>
</table>

</DIV>
</body>
</html>

