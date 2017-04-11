<%--
/**
 * @Class Name  : EgovServerRegist.java
 * @Description : EgovServerRegist jsp
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
<title>서버정보 등록</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="server" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fncSelectServerList() {
    var varFrom = document.getElementById("server");
    varFrom.action = "<c:url value='/sym/sym/srv/selectServerList.do'/>";
    varFrom.submit();
}

function fncServerInsert() {
    var varFrom = document.getElementById("server");
    varFrom.action = "<c:url value='/sym/sym/srv/addServer.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateServer(varFrom)){
            return;
        }else{
        	varFrom.submit();
        }
    }
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
    <form name="server" id="server" method="post" action="${pageContext.request.contextPath}/sym/sym/srv/addServer.do">
    <table width="100%" class="table-search" border="0">
     <tr>
      <td width="100%" class="title_left"><h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">서버S/W 등록</h1></td>
     </tr>
     <tr>
      <td class="title_left"></td>
     </tr>
    </table>

    <table width="100%" cellpadding="1" class="table-register" summary="서버S/W를 등록한다.">
      <caption>서버S/W 등록</caption>
      <!--
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>서버ID<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="serverId"><input name="serverId" id="serverId" type="text" size="30" class="readOnlyClass" readOnly></label></td>
      </tr>
       -->
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>서버S/W 명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="serverNm"><input name="serverNm" id="serverNm" type="text" maxLength="23" size="23" >&nbsp;<form:errors path="serverNm" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>서버S/W 종류<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="serverKnd">
          <select name="serverKnd">
            <c:forEach var="cmmCodeDetail" items="${cmmCodeDetailList}" varStatus="status">
              <option value="<c:out value="${cmmCodeDetail.code}"/>"><c:out value="${cmmCodeDetail.codeNm}"/></option>
            </c:forEach>
          </select>
        </label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>등록일자<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="regstYmd">
        	<input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
            <!--  <input type="text" name="regstYmd" id="regstYmd" size="10" maxlength="10" title="등록일자" class="readOnlyClass" readonly onClick="javascript:fn_egov_NormalCalendar(document.server, document.server.registerDate, document.server.regstYmd);" onKeyDown="javascript:if (event.keyCode == 13) { fn_egov_NormalCalendar(document.server, document.server.registerDate, document.server.regstYmd); }" >-->
            <input type="text" name="regstYmd" id="regstYmd" size="10" maxlength="10" title="등록일자">
            <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.server, document.server.registerDate, document.server.regstYmd);" style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/sym/cal/bu_icon_carlendar.gif' />" title="새창" alt="달력창팝업버튼이미지"></a>
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
              <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncServerInsert(); return false;"></span></td>
              <td>&nbsp;&nbsp;</td>
              <td><span class="button"><a href="<c:url value='/sym/sym/srv/selectServerList.do'/>?pageIndex=<c:out value='${serverVO.pageIndex}'/>&amp;strServerNm=<c:out value="${serverVO.strServerNm}"/>" onclick="fncSelectServerList(); return false;"><spring:message code="button.list" /></a></span></td>
            </tr>
           </table>
       </td>
      </tr>
    </table>

    <!-- 검색조건 유지 -->
    <input type="hidden" name="strServerNm" value="<c:out value='${serverVO.strServerNm}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${serverVO.pageIndex}'/>" >
</form>
</td>
</tr>
</table>

</DIV>
</body>
</html>

