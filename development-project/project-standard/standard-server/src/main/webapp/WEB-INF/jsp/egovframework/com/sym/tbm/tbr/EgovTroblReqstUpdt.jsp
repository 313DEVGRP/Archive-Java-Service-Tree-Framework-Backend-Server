<%--
/**
 * @Class Name  : EgovTroblReqstUpdt.java
 * @Description : EgovTroblReqstUpdt jsp
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
<title>장애신청 수정</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="troblReqst" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fncSelectTroblReqstList() {
    var varFrom = document.getElementById("troblReqst");
    varFrom.action = "<c:url value='/sym/tbm/tbr/selectTroblReqstList.do'/>";
    varFrom.submit();
}

function fncTroblReqstUpdate() {

    var varFrom = document.getElementById("troblReqst");
    varFrom.action = "<c:url value='/sym/tbm/tbr/updtTroblReqst.do'/>";

    varFrom.troblOccrrncTime.value = varFrom.troblOccrrncD.value +
                                     varFrom.troblOccrrncH.value +
                                     varFrom.troblOccrrncM.value +
                                     varFrom.troblOccrrncS.value;
/*
    varFrom.troblRequstTime.value = varFrom.troblRequstD.value +
                                    varFrom.troblRequstH.value +
                                    varFrom.troblRequstM.value +
                                    varFrom.troblRequstS.value;
*/

	fncCheckValiDay();

	var tmp = varFrom.troblOccrrncTime.value;
	tmp = tmp.substring(0,4) + tmp.substring(5,7) + tmp.substring(8,16);

	if(varFrom.valiDay.value < tmp) {
	    alert("장애발생시간은 현재시간 이전으로 설정하셔야 합니다.");
	    return;
	}


    if(confirm("저장 하시겠습니까?")){
        if(!validateTroblReqst(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncTroblReqstDelete() {

    var varFrom = document.getElementById("troblReqst");
    varFrom.action = "<c:url value='/sym/tbm/tbr/removeTroblReqst.do'/>";
    if(confirm("삭제 하시겠습니까?")){
        varFrom.submit();
    }
}

function initDate() {

	var varFrom = document.getElementById("troblReqst");

	// 장애발생시간
    var troblOccrrncTime = '<c:out value="${troblReqst.troblOccrrncTime}"/>';


    // 장애요청시간
    // var troblRequstTime = '<c:out value="${troblReqst.troblRequstTime}"/>';

    varFrom.troblOccrrncD.value = troblOccrrncTime.substring(0,10);
    varFrom.troblOccrrncHtmp.value = troblOccrrncTime.substring(11,13);
    varFrom.troblOccrrncMtmp.value = troblOccrrncTime.substring(14,16);
    varFrom.troblOccrrncStmp.value = troblOccrrncTime.substring(17,19);

    if(varFrom.troblOccrrncHtmp.value < 10) varFrom.troblOccrrncHtmp.value = troblOccrrncTime.substring(12,13);
    if(varFrom.troblOccrrncMtmp.value < 10) varFrom.troblOccrrncMtmp.value = troblOccrrncTime.substring(15,16);
    if(varFrom.troblOccrrncStmp.value < 10) varFrom.troblOccrrncStmp.value = troblOccrrncTime.substring(18,19);
}

function fncCheckValiDay() {
    var varFrom = document.getElementById("troblReqst");

    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth()+1;
    var day = date.getDate();
    var hour = date.getHours();
    var minute = date.getMinutes();
    var second = date.getSeconds();

    if(month < 10) month = "0" + month;
    if(day < 10) day = "0" + day;
    if(hour < 10) hour = "0" + hour;
    if(minute < 10) minute = "0" + minute;
    if(second < 10) second = "0" + second;

    // return year+month+day+hour+minute+second;
    varFrom.valiDay.value = year+""+month+""+day+""+hour+""+minute+""+second;

}

-->
</script>
</head>

<c:set var="troblOccrrncTime" value='${troblReqst.troblOccrrncTime}' />
<c:set var="troblOccrrncDtmp" value="${fn:substring(troblOccrrncTime,0,10)}" />
<c:set var="troblOccrrncHtmp" value="${fn:substring(troblOccrrncTime,11,13)}" />
<c:set var="troblOccrrncMtmp" value="${fn:substring(troblOccrrncTime,14,16)}" />
<c:set var="troblOccrrncStmp" value="${fn:substring(troblOccrrncTime,17,19)}" />
<c:if test="${troblOccrrncHtmp < 10}"><c:set var="troblOccrrncHtmp" value="${fn:substring(troblOccrrncTime,12,13)}" /></c:if>
<c:if test="${troblOccrrncMtmp < 10}"><c:set var="troblOccrrncMtmp" value="${fn:substring(troblOccrrncTime,15,16)}" /></c:if>
<c:if test="${troblOccrrncStmp < 10}"><c:set var="troblOccrrncStmp" value="${fn:substring(troblOccrrncTime,18,19)}" /></c:if>

<!--
<c:set var="troblRequstTime" value='${troblReqst.troblRequstTime}' />
<c:set var="troblRequstDtmp" value="${fn:substring(troblRequstTime,0,10)}" />
<c:set var="troblRequstHtmp" value="${fn:substring(troblRequstTime,11,13)}" />
<c:set var="troblRequstMtmp" value="${fn:substring(troblRequstTime,14,16)}" />
<c:set var="troblRequstStmp" value="${fn:substring(troblRequstTime,17,19)}" />
<c:if test="${troblRequstHtmp < 10}"><c:set var="troblRequstHtmp" value="${fn:substring(troblRequstTime,12,13)}" /></c:if>
<c:if test="${troblRequstMtmp < 10}"><c:set var="troblRequstMtmp" value="${fn:substring(troblRequstTime,15,16)}" /></c:if>
<c:if test="${troblRequstStmp < 10}"><c:set var="troblRequstStmp" value="${fn:substring(troblRequstTime,18,19)}" /></c:if>
-->

<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
    <form name="troblReqst" id="troblReqst" method="post" action="${pageContext.request.contextPath}/sym/tbm/tbr/updtTroblReqst.do">
    <table width="100%" class="table-search" border="0">
     <tr>
      <td width="100%" class="title_left"><h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;장애신청 수정</h1></td>
     </tr>
     <tr>
      <td class="title_left"></td>
     </tr>
    </table>

    <table width="100%" cellpadding="1" class="table-register" summary="장애신청 정보를 수정한다.">
      <caption>장애신청 수정</caption>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>장애ID<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="troblId"><input name="troblId" id="troblId" type="text" value="<c:out value='${troblReqst.troblId}'/>" size="30" class="readOnlyClass" readOnly></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>장애명<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="troblNm"><input name="troblNm" id="troblNm" type="text" value="<c:out value='${troblReqst.troblNm}'/>" maxLength="30" size="30" >&nbsp;<form:errors path="troblNm" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>장애종류<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="troblKnd">
          <select name="troblKnd" title="장애종류">
            <c:forEach var="cmmCodeDetail" items="${cmmCodeDetailList}" varStatus="status">
              <option value="<c:out value="${cmmCodeDetail.code}"/>" <c:if test="${cmmCodeDetail.code == troblReqst.troblKnd}">selected</c:if>><c:out value="${cmmCodeDetail.codeNm}"/></option>
            </c:forEach>
          </select>
        </label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>장애설명<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="troblDc"><textarea name="troblDc" rows="5" cols="80" title="장애설명"><c:out value='${troblReqst.troblDc}'/></textarea><form:errors path="troblDc" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>장애발생시간<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap>
            <input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
            <!-- <input type="text" name="troblOccrrncD" id="troblOccrrncD" value="<c:out value="${troblOccrrncDtmp}" />" size="10" maxlength="10" title="장애발생시간" class="readOnlyClass" readonly onClick="javascript:fn_egov_NormalCalendar(document.troblReqst, document.troblReqst.troblOccrrncDate, document.troblReqst.troblOccrrncD);" onKeyDown="javascript:if (event.keyCode == 13) { fn_egov_NormalCalendar(document.troblReqst, document.troblReqst.troblOccrrncDate, document.troblReqst.troblOccrrncD); }" > -->
            <label for="troblOccrrncD"><input type="text" name="troblOccrrncD" id="troblOccrrncD" value="<c:out value="${troblOccrrncDtmp}" />" size="10" maxlength="10" title="장애발생시간"></label>
            <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.troblReqst, document.troblReqst.troblOccrrncDate, document.troblReqst.troblOccrrncD);" style="selector-dummy:expression(this.hideFocus=false);"><img src="/images/egovframework/com/sym/cal/bu_icon_carlendar.gif" title="새창" alt="달력창팝업버튼이미지"></a>
            <input type="hidden" name="troblOccrrncDate" value=""/>
            <label for="troblOccrrncH"><select name="troblOccrrncH" id="troblOccrrncH">
              <c:forEach var="i" begin="0" end="23" step="1" varStatus="status">
                <option value="<c:if test="${i < 10}">0</c:if><c:out value="${i}"/>" <c:if test="${i == troblOccrrncHtmp}">selected</c:if>><c:if test="${i < 10}">0</c:if><c:out value="${i}"/></option>
              </c:forEach>
            </select>시&nbsp;</label>
            <label for="troblOccrrncM"><select name="troblOccrrncM" id="troblOccrrncM">
              <c:forEach var="i" begin="0" end="59" step="1" varStatus="status">
                <option value="<c:if test="${i < 10}">0</c:if><c:out value="${i}"/>" <c:if test="${i == troblOccrrncMtmp}">selected</c:if>><c:if test="${i < 10}">0</c:if><c:out value="${i}"/></option>
              </c:forEach>
            </select>분&nbsp;</label>
            <label for="troblOccrrncS"><select name="troblOccrrncS" id="troblOccrrncS">
              <c:forEach var="i" begin="0" end="59" step="1" varStatus="status">
                <option value="<c:if test="${i < 10}">0</c:if><c:out value="${i}"/>" <c:if test="${i == troblOccrrncStmp}">selected</c:if>><c:if test="${i < 10}">0</c:if><c:out value="${i}"/></option>
              </c:forEach>
            </select>초</label>
            <input type="hidden" name="troblOccrrncTime" />&nbsp;<form:errors path="troblOccrrncTime" />
        </td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>장애등록자<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="troblRqesterNm"><input name="troblRqesterNm" id="troblRqesterNm" type="text" value="<c:out value='${troblReqst.troblRqesterNm}'/>" maxLength="30" size="30" >&nbsp;<form:errors path="troblRqesterNm" /></label></td>
      </tr>
    </table>

    <table width="100%" cellpadding="8">
      <tr>
        <td align="center">
           <table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncTroblReqstUpdate(); return false;"></span></td>
              <td>&nbsp;&nbsp;</td>
              <!--
              <td><span class="button"><a href="<c:url value='/sym/tbm/removeTroblReqst.do'/>?troblId=<c:out value='${troblReqst.troblId}'/>" onclick="fncTroblReqstDelete(); return false;"><spring:message code="button.delete" /></a></span></td>
              <td>&nbsp;&nbsp;</td>
              -->
              <td><span class="button"><a href="<c:url value='/sym/tbm/selectTroblReqstList.do'/>?pageIndex=<c:out value='${troblReqstVO.pageIndex}'/>&amp;strTroblNm=<c:out value="${troblReqstVO.strTroblNm}"/>" onclick="fncSelectTroblReqstList(); return false;"><spring:message code="button.list" /></a></span></td>
            </tr>
           </table>
       </td>
      </tr>
    </table>

    <input type="hidden" name="processSttus" value="<c:out value='${troblReqst.processSttus}'/>" />
    <!-- 검색조건 유지 -->
    <input type="hidden" name="strTroblNm" value="<c:out value='${troblReqstVO.strTroblNm}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${troblReqstVO.pageIndex}'/>" >
    <input type="hidden" name="valiDay" />
</form>
</td>
</tr>
</table>

</DIV>
</body>
</html>

