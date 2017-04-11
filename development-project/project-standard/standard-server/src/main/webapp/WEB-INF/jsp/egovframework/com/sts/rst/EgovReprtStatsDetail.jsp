<%--
/**
 * @Class Name  : EgovReprtStatsDetail.java
 * @Description : EgovReprtStatsDetail jsp
 * @Modification Information
 * @
 * @  수정일       수정자          수정내용
 * @ -------      --------    ---------------------------
 * @ 2009.08.01    lee.m.j         최초 생성
 * @ 2011.07.17    이기하          패키지 분리(sts -> sts.rst)
 *
 *  @author lee.m.j
 *  @since 2009.08.17
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
<title>보고서통계 상세목록 조회</title>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>

<script type="text/javaScript" language="javascript">

function fncSelectReprtStatsList() {
    var varFrom = document.getElementById("reprtStats");
    varFrom.action = "<c:url value='/sts/rst/selectReprtStatsList.do'/>";
    varFrom.submit();
}

function fncReprtStatsInsert() {

    var varFrom = document.getElementById("reprtStats");
    varFrom.action = "<c:url value='/uss/ion/isg/addIntnetSvcGuidance.do'/>";

    if(confirm("저장 하시겠습니까?")){
        varFrom.submit();
    }
}

function fncReprtStatsDelete() {
    var varFrom = document.getElementById("reprtStats");
    varFrom.action = "<c:url value='/uss/ion/isg/removeIntnetSvcGuidance.do'/>";
    if(confirm("삭제 하시겠습니까?")){
        varFrom.submit();
    }
}

</script>
</head>

<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

<table border="0">
  <tr>
    <td width="700">
<form:form commandName="reprtStats" method="post" action="${pageContext.request.contextPath}/sts/rst/selectReprtStatsList.do' />">
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%" class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;보고서통계상세정보
  </td>
  <th width="10%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fncSelectReprtStatsList(); return false;"></span></td>
        </tr>
       </table>
  </th>
 </tr>
</table>

<table width="100%" cellpadding="8" class="table-list" summary="보고서통계에 대한 상세정보 목록을 제공한다.">
 <thead>
  <tr>
    <th class="title" width="3%"  nowrap></th>
    <th class="title" width="15%" nowrap>보고서ID</th>
    <th class="title" width="30%" nowrap>보고서명</th>
    <th class="title" width="20%" nowrap>보고서유형</th>
    <th class="title" width="10%" nowrap>진행상태</th>
    <th class="title" width="20%" nowrap>등록일시</th>
    <th class="title" width="2%"  nowrap></th>
  </tr>
 </thead>
 <tbody>
 <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
<c:if test="${fn:length(reprtStats) == 0}">
<tr>
<td class="lt_text3" colspan="7">
	<spring:message code="common.nodata.msg" />
</td>
</tr>
</c:if>
 <c:forEach var="reprt" items="${reprtStats}" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap></td>
    <td class="lt_text3" nowrap><c:out value="${reprt.reprtId}"/></td>
    <td class="lt_text3" nowrap><c:out value="${reprt.reprtNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${reprt.reprtTyNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${reprt.reprtSttusNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${reprt.regDate}"/></td>
    <td class="lt_text3" nowrap></td>
  </tr>
 </c:forEach>
 </tbody>
</table>

<input type="hidden" name="pmReprtTy" value="<c:out value='${reprtStatsVO.pmReprtTy}'/>">
<input type="hidden" name="pmDateTy" value="<c:out value='${reprtStatsVO.pmDateTy}'/>">
<input type="hidden" name="pmFromDate" value="<c:out value='${reprtStatsVO.pmFromDate}'/>">
<input type="hidden" name="pmToDate" value="<c:out value='${reprtStatsVO.pmToDate}'/>">
<input type="hidden" name="pageIndex" value="<c:out value='${reprtStatsVO.pageIndex}'/>">
</form:form>

</td>
</tr>
</table>

</DIV>
</body>
</html>

