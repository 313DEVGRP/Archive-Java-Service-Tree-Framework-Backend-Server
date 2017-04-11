<%--
/**
 * @Class Name  : EgovIntnetSvcGuidanceUpdt.jsp
 * @Description : EgovIntnetSvcGuidanceUpdt.jsp
 * @Modification Information
 * @
 * @  수정일         수정자          수정내용
 * @ -------    --------    ---------------------------
 * @ 2009.02.01    lee.m.j          최초 생성
 *
 *  @author lee.m.j
 *  @since 2009.03.11
 *  @version 1.0
 *  @see
 *
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
 --%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<title>인터넷서비스안내</title>
<script type="text/javascript">
_editor_area = "intnetSvcDc";
_editor_url = "<c:url value='/html/egovframework/com/cmm/utl/htmlarea3.0/'/>";
</script>
<script type="text/javascript" src="<c:url value='/html/egovframework/com/cmm/utl/htmlarea3.0/htmlarea.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="intnetSvcGuidance" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">

function fncSelectIntnetSvcGuidanceList() {
    var varFrom = document.getElementById("intnetSvcGuidance");
    varFrom.action = "<c:url value='/uss/ion/isg/selectIntnetSvcGuidanceList.do'/>";
    varFrom.submit();
}

function fncIntnetSvcGuidanceUpdate() {

	document.intnetSvcGuidance.onsubmit();

    var varFrom = document.getElementById("intnetSvcGuidance");
    varFrom.action = "<c:url value='/uss/ion/isg/updtIntnetSvcGuidance.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateIntnetSvcGuidance(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncIntnetSvcGuidanceDelete() {
    var varFrom = document.getElementById("intnetSvcGuidance");
    varFrom.action = "<c:url value='/uss/ion/isg/removeIntnetSvcGuidance.do'/>";
    if(confirm("삭제 하시겠습니까?")){
        varFrom.submit();
    }
}

</script>


<style type="text/css">
  .noStyle {background:ButtonFace; BORDER-TOP:0px; BORDER-bottom:0px; BORDER-left:0px; BORDER-right:0px;}
  .noStyle th{background:ButtonFace; padding-left:0px;padding-right:0px}
  .noStyle td{background:ButtonFace; padding-left:0px;padding-right:0px}
</style>

</head>

<body onload="javascript:HTMLArea.init(); HTMLArea.onload = initEditor;">
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
<form:form commandName="intnetSvcGuidance" name="intnetSvcGuidance" method="post" action="${pageContext.request.contextPath}/uss/ion/isg/updtIntnetSvcGuidance.do' />" >
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%" class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;인터넷서비스안내 수정</h1>
  </td>
 </tr>
</table>

<table width="100%" cellpadding="8" class="table-line" summary="인터넷서비스정보를 수정한다">
  <caption>인터넷서비스안내 수정</caption>
  <tr>
    <th class="required_text" width="20%" scope="row" nowrap>인터넷서비스ID<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
    <td class="lt_text" nowrap><input name="intnetSvcId" id="intnetSvcId" title="인터넷서비스ID" type="text" value="<c:out value='${intnetSvcGuidance.intnetSvcId}'/>" size="30" class="readOnlyClass" readonly></td>
  </tr>
  <tr>
    <th class="required_text" width="20%" scope="row" nowrap>인터넷서비스명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
    <td class="lt_text" nowrap><input name="intnetSvcNm" id="intnetSvcNm" title="인터넷서비스명" type="text" value="<c:out value='${intnetSvcGuidance.intnetSvcNm}'/>" maxLength="30" size="40">&nbsp;<form:errors path="intnetSvcNm" /></td>
  </tr>
  <tr>
    <th class="required_text" width="20%" scope="row" nowrap>인터넷서비스설명<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택입력표시"></th>
    <td>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="noStyle">
          <tr>
            <td>
              <textarea id="intnetSvcDc" name="intnetSvcDc" title="인터넷서비스설명" class="textarea" rows="15" cols="80"><c:out value="${intnetSvcGuidance.intnetSvcDc}" escapeXml="false" /></textarea>
            </td>
          </tr>
        </table>
    </td>
  </tr>
  <tr>
    <th class="required_text" width="20%" scope="row" nowrap>반영여부<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
    <td class="lt_text" nowrap>
      <select name="reflctAt" id="reflctAt" title="반영여부">
          <option value="Y" <c:if test="${intnetSvcGuidance.reflctAt == 'Y'}">selected</c:if> >Y</option>
          <option value="N" <c:if test="${intnetSvcGuidance.reflctAt == 'N'}">selected</c:if> >N</option>
      </select>
   </td>
  </tr>
  <tr>
    <th class="required_text" width="20%" scope="row" nowrap>등록일시<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택입력표시"></th>
    <td class="lt_text" nowrap><input name="regDate" id="regDate" title="등록일시" type="text" value="<c:out value="${intnetSvcGuidance.regDate}"/>" maxLength="50" size="20" class="readOnlyClass" readonly></td>
  </tr>
</table>

<table width="100%" cellpadding="8">
  <tr>
    <td align="center">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncIntnetSvcGuidanceUpdate(); return false;"></span></td>
      <td>&nbsp;&nbsp;</td>
      <td><span class="button"><a href="<c:url value='/uss/ion/isg/removeIntnetSvcGuidance.do'/>?intnetSvcId=<c:out value='${intnetSvcGuidanceVO.intnetSvcId}'/>" onclick="fncIntnetSvcGuidanceDelete(); return false;"><spring:message code="button.delete" /></a></span></td>
      <td>&nbsp;&nbsp;</td>
      <td><span class="button"><a href="<c:url value='/uss/ion/isg/selectIntnetSvcGuidanceList.do'/>?pageIndex=<c:out value='${intnetSvcGuidanceVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${intnetSvcGuidanceVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncSelectIntnetSvcGuidanceList(); return false;"><spring:message code="button.list" /></a></span></td>
    </tr>
   </table>
   </td>
  </tr>
</table>

<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${intnetSvcGuidanceVO.searchCondition}'/>">
<input type="hidden" name="searchKeyword" value="<c:out value='${intnetSvcGuidanceVO.searchKeyword}'/>">
<input type="hidden" name="pageIndex" value="<c:out value='${intnetSvcGuidanceVO.pageIndex}'/>">
</form:form>

</td>
</tr>
</table>

</DIV>
</body>
</html>

