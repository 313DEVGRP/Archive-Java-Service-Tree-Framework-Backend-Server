<%--
/**
 * @Class Name  : EgovTroblReqstDetail.java
 * @Description : EgovTroblReqstDetail jsp
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<title>장애신청 상세조회</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fncSelectTroblReqstList() {
	var varFrom = document.getElementById("troblReqst");
    varFrom.action = "<c:url value='/sym/tbm/tbr/selectTroblReqstList.do'/>";
    varFrom.submit();       
}

function fncTroblReqstUpdateView(troblId) {
    var varFrom = document.getElementById("troblReqst");

    if(varFrom.processSttus.value != 'A') {
        alert("수정할 수 없는 상태입니다");
        return;
    }

    varFrom.troblId.value = troblId;
    varFrom.action = "<c:url value='/sym/tbm/tbr/updtViewTroblReqst.do'/>";
    varFrom.submit();
}

function fncTroblReqstDelete(troblId) {
    var varFrom = document.getElementById("troblReqst");

    if(varFrom.processSttus.value != 'A') {
        alert("삭제할 수 없는 상태입니다");
        return;
    }
    
    varFrom.troblId.value = troblId;
    varFrom.action = "<c:url value='/sym/tbm/tbr/removeTroblReqst.do'/>";

    if(confirm("삭제 하시겠습니까?")) {
        varFrom.submit();
    }
}

function fncTroblReqstRequst(troblId) {
    var varFrom = document.getElementById("troblReqst");

    if(varFrom.processSttus.value != 'A') {
        alert("요청 대상이 아닙니다");
        return;
    }

    varFrom.troblId.value = troblId;
    varFrom.action = "<c:url value='/sym/tbm/tbr/requstTroblReqst.do'/>";
    if(confirm("요청 하시겠습니까?")) {
        varFrom.submit();
    }
}

function fncTroblReqstRequstCancl(troblId) {
    var varFrom = document.getElementById("troblReqst");

    if(varFrom.processSttus.value != 'R') {
        alert("요청취소 대상이 아닙니다");
        return;
    }
    
    varFrom.troblId.value = troblId;
    varFrom.action = "<c:url value='/sym/tbm/tbr/requstTroblReqstCancl.do'/>";
    if(confirm("요청취소를 하시겠습니까?")) {
        varFrom.submit();
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
    <form:form commandName="troblReqst" method="post" action="${pageContext.request.contextPath}/sym/tbm/tbr/updtViewTroblReqst.do">
    <table width="100%" class="table-search" border="0">
     <tr>
      <td width="100%" class="title_left"><h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;장애신청 상세조회</h1></td>
     </tr>
     <tr>
      <td class="title_left"></td>
     </tr>     
    </table>

	<table width="100%" cellpadding="1" class="table-register" summary="장애신청에 대한 상세정보를 제공한다.">
	  <caption>장애신청 상세조회</caption>
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>장애ID<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${troblReqst.troblId}'/></td>
	  </tr>
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>장애명<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${troblReqst.troblNm}'/></td>
	  </tr>
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>장애종류<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${troblReqst.troblKndNm}'/></td>
	  </tr>
	  <tr>
	    <th class="required_text" width="20%" height="80" scope="row">장애설명<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
	    <td height="80"><label for="troblDc"><textarea name="troblDc" rows="5" cols="80" title="장애설명" readOnly><c:out value='${troblReqst.troblDc}'/></textarea></label></td>
	  </tr>
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>장애발생시간<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${troblReqst.troblOccrrncTime}'/></td>
	  </tr> 
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>장애등록자<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${troblReqst.troblRqesterNm}'/></td>
      </tr> 	  
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>장애요청시간<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${troblReqst.troblRequstTime}'/></td>
	  </tr>    
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>처리상태<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${troblReqst.processSttusNm}'/></td> 
	  </tr>
	</table>
    <br/>
    <c:if test="${troblReqst.processSttus == 'C'}">
    <table width="100%" cellpadding="1" class="table-register">
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>처리결과<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="troblProcessResult"><textarea name="troblProcessResult" rows="5" cols="80" title="처리결과" readOnly><c:out value='${troblReqst.troblProcessResult}'/></textarea></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>처리시간<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${troblReqst.troblProcessTime}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>처리자<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${troblReqst.troblOpetrNm}'/></td>
      </tr>
    </table>
    </c:if>
	<table width="100%" cellpadding="8">
	  <tr>
	    <td align="center">
		   <table border="0" cellspacing="0" cellpadding="0">
		    <tr> 
		      <c:if test="${troblReqst.processSttus == 'A'}">
		      <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fncTroblReqstUpdateView('${troblReqst.troblId}'); return false;"></span></td>
              <td>&nbsp;&nbsp;</td>
		      <td><span class="button"><a href="<c:url value='/sym/tbm/tbr/removeTroblReqst.do'/>?troblId=<c:out value='${troblReqst.troblId}'/>" onclick="fncTroblReqstDelete('${troblReqst.troblId}'); return false;"><spring:message code="button.delete" /></a></span></td>
              <td>&nbsp;&nbsp;</td>
              <td><span class="button"><a href="<c:url value='/sym/tbm/tbr/requstTroblReqst.do'/>?troblId=<c:out value='${troblReqst.troblId}'/>" onclick="fncTroblReqstRequst('${troblReqst.troblId}'); return false;">요청</a></span></td>
              <td>&nbsp;&nbsp;</td>
              </c:if>
              <c:if test="${troblReqst.processSttus == 'R'}">
              <td><span class="button"><a href="<c:url value='/sym/tbm/tbr/requstTroblReqstCancl.do'/>?troblId=<c:out value='${troblReqst.troblId}'/>" onclick="fncTroblReqstRequstCancl('${troblReqst.troblId}'); return false;">요청취소</a></span></td>
              <td>&nbsp;&nbsp;</td>
              </c:if>
              <td><span class="button"><a href="<c:url value='/sym/tbm/tbr/selectTroblReqstList.do'/>?pageIndex=<c:out value='${troblReqstVO.pageIndex}'/>&amp;strTroblNm=<c:out value="${troblManageVO.strTroblNm}"/>" onclick="fncSelectTroblReqstList(); return false;"><spring:message code="button.list" /></a></span></td>
		    </tr>
		   </table>
	</table>

	<input type="hidden" name="troblId" />
	<input type="hidden" name="processSttus" value="<c:out value='${troblReqst.processSttus}'/>" />
    <!-- 검색조건 유지 -->
    <input type="hidden" name="strTroblNm" value="<c:out value='${troblReqstVO.strTroblNm}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${troblReqstVO.pageIndex}'/>" />
</form:form>
</td>
</tr>
</table>

</DIV>
</body>
</html>

