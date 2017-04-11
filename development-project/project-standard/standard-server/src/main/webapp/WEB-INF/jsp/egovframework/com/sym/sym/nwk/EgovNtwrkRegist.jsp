<%--
/**
 * @Class Name  : EgovNtwrkRegist.java
 * @Description : EgovNtwrkRegist jsp
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
<title>네트워크 등록</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="ntwrk" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fncSelectNtwrkList() {
    var varFrom = document.getElementById("ntwrk");
    varFrom.action = "<c:url value='/sym/sym/nwk/selectNtwrkList.do'/>";
    varFrom.submit();
}

function fncNtwrkInsert() {


    var varFrom = document.getElementById("ntwrk");

    varFrom.action = "<c:url value='/sym/sym/nwk/addNtwrk.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateNtwrk(varFrom)){
            return;
        } else {
        	if(!ipValidate(varFrom.ntwrkIp.value, ''))
                return;
            else if(!ipValidate(varFrom.gtwy.value, '게이트웨이'))
                return;
            else if(!ipValidate(varFrom.subnet.value, '서브넷'))
                return;
            else if(!ipValidate(varFrom.domnServer.value, 'DNS'))
                return;
            else
            	varFrom.submit();
        }
    }
}

function ipValidate(ipValue, ipName) {

    var varFrom = document.getElementById("ntwrk");
    // var IPvalue = varFrom.gtwy.value;
    var IPvalue = ipValue;
    var IPName = ipName;

    var ipPattern = /^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/;
    var ipArray = IPvalue.match(ipPattern);

    var result = true;
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
        alert(IPName+" IP 형식이 일치 하지않습니다. ");
        result = false;
    } else {
        for (var i=1; i<5; i++) {

            thisSegment = ipArray[i];

            if (thisSegment > 255) {
                alert(IPName+" IP 형식이 일치 하지않습니다. ");
                result = false;
            }

            if ((i == 0) && (thisSegment > 255)) {
                alert(IPName+" IP 형식이 일치 하지않습니다. ");
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
    <form name="ntwrk" id="ntwrk" method="post" action="${pageContext.request.contextPath}/sym/sym/nwk/addNtwrk.do">
    <table width="100%" class="table-search" border="0">
     <tr>
      <td width="700" class="title_left"><h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;네트워크 등록</h1></td>
     </tr>
     <tr>
      <td class="title_left"></td>
     </tr>
    </table>

    <table width="100%" cellpadding="1" class="table-register" summary="네트워크 정보를 등록한다.">
      <caption>네트워크 등록</caption>
      <!--
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>네트워크ID<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="ntwrkId"><input name="ntwrkId" id="ntwrkId" type="text" size="30" class="readOnlyClass" readOnly></label></td>
      </tr>
       -->
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>IP<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="ntwrkIp"><input name="ntwrkIp" id="ntwrkIp" type="text" maxLength="23" size="23" >&nbsp;<form:errors path="ntwrkIp" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>게이트웨이<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="gtwy"><input name="gtwy" id="gtwy" type="text" maxLength="23" size="23" >&nbsp;<form:errors path="gtwy" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>서브넷<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="subnet"><input name="subnet" id="subnet" type="text" maxLength="23" size="23" >&nbsp;<form:errors path="subnet" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>DNS<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="domnServer"><input name="domnServer" id="domnServer" type="text" maxLength="23" size="23" >&nbsp;<form:errors path="domnServer" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>관리항목<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="" /></th>
        <td class="lt_text" nowrap><label for="manageIem">
	      <select name="manageIem">
	        <c:forEach var="cmmCodeDetail" items="${cmmCodeDetailList}" varStatus="status">
	          <option value="<c:out value="${cmmCodeDetail.code}"/>" <c:if test="${cmmCodeDetail.code == ntwrk.manageIem}">selected</c:if> ><c:out value="${cmmCodeDetail.codeNm}"/></option>
	        </c:forEach>
	      </select>
        </label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>사용자명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="" /></th>
        <td class="lt_text" nowrap><label for="userNm"><input name="userNm" id="userNm" type="text" maxLength="30" size="30" >&nbsp;<form:errors path="userNm" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>사용여부<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="useAt">
          <select name="useAt">
              <option value="Y" <c:if test="${ntwrk.useAt == 'Y'}">selected</c:if> >Y</option>
              <option value="N" <c:if test="${ntwrk.useAt == 'N'}">selected</c:if> >N</option>
          </select>
       </label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>등록일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="regstYmd">
        	<input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
            <!--  <input type="text" name="regstYmd" id="regstYmd" size="10" maxlength="10" title="등록일자" class="readOnlyClass" readonly onClick="javascript:fn_egov_NormalCalendar(document.ntwrk, document.ntwrk.registerDate, document.ntwrk.regstYmd);" onKeyDown="javascript:if (event.keyCode == 13) { fn_egov_NormalCalendar(document.ntwrk, document.ntwrk.registerDate, document.ntwrk.regstYmd); }" > -->
            <input type="text" name="regstYmd" id="regstYmd" size="10" maxlength="10" title="등록일자">
            <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.ntwrk, document.ntwrk.registerDate, document.ntwrk.regstYmd);" style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/sym/cal/bu_icon_carlendar.gif' />" title="새창" alt="달력창팝업버튼이미지"></a>
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
              <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncNtwrkInsert(); return false;"></span></td>
              <td>&nbsp;&nbsp;</td>
              <td><span class="button"><a href="<c:url value='/sym/sym/nwk/selectNtwrkList.do'/>?pageIndex=<c:out value='${ntwrkVO.pageIndex}'/>&amp;strManageIem=<c:out value="${ntwrkVO.strManageIem}"/>&amp;strUserNm=<c:out value="${ntwrkVO.strUserNm}"/>" onclick="fncSelectNtwrkList(); return false;"><spring:message code="button.list" /></a></span></td>
            </tr>
           </table>
       </td>
      </tr>
    </table>

    <!-- 검색조건 유지 -->
    <input type="hidden" name="strManageIem" value="<c:out value='${ntwrkVO.strManageIem}'/>" />
    <input type="hidden" name="strUserNm" value="<c:out value='${ntwrkVO.strUserNm}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${ntwrkVO.pageIndex}'/>" >
</form>
</td>
</tr>
</table>

</DIV>
</body>
</html>

