<%--
/**
 * @Class Name  : EgovTroblProcessRegist.java
 * @Description : EgovTroblProcessRegist jsp
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
<title>장애처리결과 등록</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="troblProcess" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--

function fncTroblProcessInsert() {

	var varFrom = document.getElementById("troblProcess");
    varFrom.action = "<c:url value='/sym/tbm/tbp/addTroblProcess.do'/>";

	var requstTimeTmp;
	var requstTime = "<c:out value='${troblProcess.troblRequstTime}'/>";
	requstTimeTmp = requstTime.substring(0,4);
    requstTimeTmp = requstTimeTmp + requstTime.substring(5,7);
    requstTimeTmp = requstTimeTmp + requstTime.substring(8,10);
    requstTimeTmp = requstTimeTmp + requstTime.substring(11,13);
	requstTimeTmp = requstTimeTmp + requstTime.substring(14,16);
	requstTimeTmp = requstTimeTmp + requstTime.substring(17,19);

	var processTime = varFrom.troblProcessD.value;
	var processTimeTmp = processTime.substring(0,4);
	processTimeTmp = processTimeTmp + processTime.substring(5,7);
    processTimeTmp = processTimeTmp + processTime.substring(8,10);
    processTimeTmp = processTimeTmp + varFrom.troblProcessH.value +
                                      varFrom.troblProcessM.value +
                                      varFrom.troblProcessS.value;

    if(requstTimeTmp > processTimeTmp) {
        alert("처리시간은 장애요청시간 이후로 설정하셔야 합니다.");
        return;
    }

    varFrom.troblProcessTime.value = varFrom.troblProcessD.value +
                                     varFrom.troblProcessH.value +
                                     varFrom.troblProcessM.value +
                                     varFrom.troblProcessS.value;

    if(confirm("저장 하시겠습니까?")){
        if(!validateTroblProcess(varFrom)) {
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncTroblProcessDelete(troblId) {
    var varFrom = document.getElementById("troblProcess");

    varFrom.troblId.value = troblId;
    varFrom.action = "<c:url value='/sym/tbm/tbp/removeTroblProcess.do'/>";

    if(confirm("삭제 하시겠습니까?")) {
        varFrom.submit();
    }
}

function fncSelectTroblProcessList() {
    var varFrom = document.getElementById("troblProcess");
    varFrom.action = "<c:url value='/sym/tbm/tbp/selectTroblProcessList.do'/>";
    varFrom.submit();
}

-->
</script>
</head>

<c:set var="troblProcessTime" value='${troblProcess.troblProcessTime}' />
<c:set var="troblProcessDtmp" value="${fn:substring(troblProcessTime,0,10)}" />
<c:set var="troblProcessHtmp" value="${fn:substring(troblProcessTime,11,13)}" />
<c:set var="troblProcessMtmp" value="${fn:substring(troblProcessTime,14,16)}" />
<c:set var="troblProcessStmp" value="${fn:substring(troblProcessTime,17,19)}" />
<c:if test="${troblProcessHtmp < 10}"><c:set var="troblProcessHtmp" value="${fn:substring(troblProcessTime,12,13)}" /></c:if>
<c:if test="${troblProcessMtmp < 10}"><c:set var="troblProcessMtmp" value="${fn:substring(troblProcessTime,15,16)}" /></c:if>
<c:if test="${troblProcessStmp < 10}"><c:set var="troblProcessStmp" value="${fn:substring(troblProcessTime,18,19)}" /></c:if>

<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
    <form name="troblProcess" id="troblProcess" method="post" action="${pageContext.request.contextPath}/sym/tbm/tbp/addTroblProcess.do">
    <table width="100%" class="table-search" border="0">
     <tr>
      <td width="100%" class="title_left"><h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">장애처리결과 등록</h1></td>
     </tr>
     <tr>
      <td class="title_left"></td>
     </tr>
    </table>

    <table width="100%" cellpadding="1" class="table-register" summary="장애처리에 대한 결과를 등록한다.">
      <caption>장애처리결과 등록</caption>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>장애ID<img src="/images/egovframework/com/sym/tbm/tbp/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${troblProcess.troblId}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>장애명<img src="/images/egovframework/com/sym/tbm/tbp/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${troblProcess.troblNm}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>장애종류<img src="/images/egovframework/com/sym/tbm/tbp/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${troblProcess.troblKndNm}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>장애설명<img src="/images/egovframework/com/sym/tbm/tbp/icon/required.gif" width="15" height="15" alt=""></th>
        <td height="80"><label for="troblDc"><textarea name="troblDc" rows="5" cols="80" title="장애설명" readOnly><c:out value='${troblProcess.troblDc}'/></textarea></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>장애발생시간<img src="/images/egovframework/com/sym/tbm/tbp/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${troblProcess.troblOccrrncTime}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>장애등록자<img src="/images/egovframework/com/sym/tbm/tbp/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${troblProcess.troblRqesterNm}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>장애요청시간<img src="/images/egovframework/com/sym/tbm/tbp/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${troblProcess.troblRequstTime}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>처리상태<img src="/images/egovframework/com/sym/tbm/tbp/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${troblProcess.processSttusNm}'/></td>
      </tr>
    </table>
    <br/>
    <table width="100%" cellpadding="1" class="table-register">
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>처리결과<img src="/images/egovframework/com/sym/tbm/tbp/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="troblProcessResult"><textarea name="troblProcessResult" rows="5" cols="80" title="처리결과"><c:out value='${troblProcess.troblProcessResult}'/></textarea></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>처리시간<img src="/images/egovframework/com/sym/tbm/tbp/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap>
            <input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
            <!-- <input type="text" name="troblProcessD" id="troblProcessD" value="<c:out value="${troblProcessDtmp}" />" size="10" maxlength="10" title="처리시간" class="readOnlyClass" readonly onClick="javascript:fn_egov_NormalCalendar(document.troblProcess, document.troblProcess.troblProcessDate, document.troblProcess.troblProcessD);" onKeyDown="javascript:if (event.keyCode == 13) { fn_egov_NormalCalendar(document.troblProcess, document.troblProcess.troblProcessDate, document.troblProcess.troblProcessD); }" > -->
            <label for="troblProcessD"><input type="text" name="troblProcessD" id="troblProcessD" value="<c:out value="${troblProcessDtmp}" />" size="10" maxlength="10" title="처리시간" ></label>
            <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.troblProcess, document.troblProcess.troblProcessDate, document.troblProcess.troblProcessD);" style="selector-dummy:expression(this.hideFocus=false);"><img src="/images/egovframework/com/sym/cal/bu_icon_carlendar.gif" title="새창" alt="달력창팝업버튼이미지"></a>
            <input type="hidden" name="troblProcessDate" value=""/>
            <label for="troblProcessH"><select name="troblProcessH" id="troblProcessH" title="시">
              <c:forEach var="i" begin="0" end="23" step="1" varStatus="status">
                <option value="<c:if test="${i < 10}">0</c:if><c:out value="${i}"/>" <c:if test="${i == troblProcessHtmp}">selected</c:if>><c:if test="${i < 10}">0</c:if><c:out value="${i}"/></option>
              </c:forEach>
            </select>시&nbsp;</label>
            <label for="troblProcessM"><select name="troblProcessM" id="troblProcessM" title="분">
              <c:forEach var="i" begin="0" end="59" step="1" varStatus="status">
                <option value="<c:if test="${i < 10}">0</c:if><c:out value="${i}"/>" <c:if test="${i == troblProcessMtmp}">selected</c:if>><c:if test="${i < 10}">0</c:if><c:out value="${i}"/></option>
              </c:forEach>
            </select>분&nbsp;</label>
            <label for="troblProcessS"><select name="troblProcessS" id="troblProcessS" title="초">
              <c:forEach var="i" begin="0" end="59" step="1" varStatus="status">
                <option value="<c:if test="${i < 10}">0</c:if><c:out value="${i}"/>" <c:if test="${i == troblProcessStmp}">selected</c:if>><c:if test="${i < 10}">0</c:if><c:out value="${i}"/></option>
              </c:forEach>
            </select>초</label>
            <input type="hidden" name="troblProcessTime" />&nbsp;<form:errors path="troblProcessTime" />
        </td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>처리자<img src="/images/egovframework/com/sym/tbm/tbp/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="troblOpetrNm"><input name="troblOpetrNm" id="troblOpetrNm" type="text" value="<c:out value='${troblProcess.troblOpetrNm}'/>" maxLength="30" size="30" ></label></td>
      </tr>
    </table>

    <table width="100%" cellpadding="8">
      <tr>
        <td align="center">
           <table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><span class="button"><input type="submit" value="<spring:message code="button.create" />" onclick="fncTroblProcessInsert(); return false;"></span></td>
              <td>&nbsp;&nbsp;</td>
              <c:if test="${troblProcess.processSttus == 'C'}">
              <td><span class="button"><a href="<c:url value='/sym/tbm/tbp/removeTroblProcess.do'/>?troblId=<c:out value='${troblProcess.troblId}'/>" onclick="fncTroblProcessDelete('${troblProcess.troblId}'); return false;"><spring:message code="button.delete" /></a></span></td>
              <td>&nbsp;&nbsp;</td>
              </c:if>
              <td><span class="button"><a href="<c:url value='/sym/tbm/tbp/selectTroblProcessList.do'/>?pageIndex=<c:out value='${troblProcessVO.pageIndex}'/>&amp;strTroblNm=<c:out value="${troblProcessVO.strTroblNm}"/>" onclick="fncSelectTroblProcessList(); return false;"><spring:message code="button.list" /></a></span></td>
            </tr>
           </table>
       </td>
      </tr>
    </table>

    <input type="hidden" name="troblId" value="<c:out value='${troblProcess.troblId}'/>" />
    <!-- 검색조건 유지 -->
    <input type="hidden" name="strTroblNm" value="<c:out value='${troblProcessVO.strTroblNm}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${troblProcessVO.pageIndex}'/>" />
</form>
</td>
</tr>
</table>

</DIV>
</body>
</html>

