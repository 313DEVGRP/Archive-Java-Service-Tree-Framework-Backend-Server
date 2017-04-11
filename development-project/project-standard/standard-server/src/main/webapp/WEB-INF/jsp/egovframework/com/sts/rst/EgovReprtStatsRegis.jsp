<%--
/**
 * @Class Name  : EgovReprtStatsRegis.java
 * @Description : EgovReprtStatsRegis jsp
 * @Modification Information
 * @
 * @  수정일       수정자          수정내용
 * @ -------      --------    ---------------------------
 * @ 2009.02.01    lee.m.j         최초 생성
 * @ 2011.07.17    이기하          패키지 분리(sts -> sts.rst)
 *
 *  @author lee.m.j
 *  @since 2009.07.01
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
<title>보고서통계자료 등록</title>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="reprtStats" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">

function fncSelectReprtStatsList() {
    var varFrom = document.getElementById("reprtStats");
    varFrom.action = "<c:url value='/sts/rst/selectReprtStatsList.do'/>";
    varFrom.submit();
}

function fncReprtStatsInsert() {

    var varFrom = document.getElementById("reprtStats");
    varFrom.action = "<c:url value='/sts/rst/addReprtStats.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateReprtStats(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncReprtStatsUpdate() {
    var varFrom = document.getElementById("reprtStats");
    varFrom.action = "<c:url value='/sts/rst/updtReprtStats.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateRoleManage(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncReprtStatsDelete() {
    var varFrom = document.getElementById("reprtStats");
    varFrom.action = "<c:url value='/sts/rst/removeReprtStats.do'/>";
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
<form:form commandName="reprtStats" method="post" action="${pageContext.request.contextPath}/sts/rst/addReprtStats.do' />">
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%" class="title_left"><h1 class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;보고서 등록</h1>
  </td>
 </tr>
</table>

<table width="100%" cellpadding="8" class="table-line" summary="보고서명, 보고서유형, 진행상태를 입력하여 보고서통계자료를 등록한다.">
<CAPTION style="display: none;">보고서 등록</CAPTION>
  <tr>
    <th scope="row" class="required_text" width="20%" nowrap><label for="reprtId">보고서ID</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
    <td class="lt_text" nowrap><input name="reprtId" id="reprtId" type="text" size="30" class="readOnlyClass" readonly title="<spring:message code="sts.reprtId" />"></td>
  </tr>
  <tr>
    <th scope="row" class="required_text" width="20%" nowrap><label for="reprtNm">보고서명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
    <td class="lt_text" nowrap><input name="reprtNm" id="reprtNm" type="text" maxLength="10" size="30" title="<spring:message code="sts.title" />">&nbsp;<form:errors path="reprtNm" /></td>
  </tr>
  <tr>
    <th scope="row" class="required_text" width="20%" nowrap><label for="reprtTy">보고서유형</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
    <td class="lt_text" nowrap>
        <select name="reprtTy" id="reprtTy" title="<spring:message code="sts.category" />">
            <c:forEach var="cmmCode040" items="${cmmCode040List}" varStatus="status">
            <option value="<c:out value="${cmmCode040.code}"/>" ><c:out value="${cmmCode040.codeNm}"/></option>
            </c:forEach>
        </select>
    </td>
  </tr>
  <tr>
    <th scope="row" class="required_text" width="20%" nowrap><label for="reprtSttus">진행상태</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
    <td class="lt_text" nowrap>
        <select name="reprtSttus" id="reprtSttus" title="<spring:message code="sts.status" />">
            <c:forEach var="cmmCode036" items="${cmmCode036List}" varStatus="status">
            <option value="<c:out value="${cmmCode036.code}"/>" ><c:out value="${cmmCode036.codeNm}"/></option>
            </c:forEach>
        </select>
    </td>
  </tr>
  <tr>
    <th scope="row" class="required_text" width="20%" nowrap><label for="regDate">등록일시</label><img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택입력표시"></th>
    <td class="lt_text" nowrap><input name="regDate" id="regDate" type="text" maxLength="20" size="20" class="readOnlyClass" readonly title="<spring:message code="sts.regDate" />"></td>
  </tr>
</table>

<table width="100%" cellpadding="8">
  <tr>
    <td align="center">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncReprtStatsInsert(); return false;"></span></td>
      <td>&nbsp;&nbsp;</td>
      <td><span class="button"><a href="<c:url value='/sts/rst/selectReprtStatsList.do'/>?pageIndex=<c:out value='${reprtStatsVO.pageIndex}'/>&amp;pmReprtTy=<c:out value="${reprtStatsVO.pmReprtTy}"/>&amp;pmDateTy=<c:out value="${reprtStatsVO.pmDateTy}"/>&amp;pmFromDate=<c:out value="${reprtStatsVO.pmFromDate}"/>&amp;pmToDate=<c:out value="${reprtStatsVO.pmToDate}"/>" onclick="fncSelectReprtStatsList(); return false;"><spring:message code="button.list" /></a></span></td>
    </tr>
   </table>
   </td>
  </tr>
</table>

<!-- 검색조건 유지 -->
<input type="hidden" name="pmReprtTy" value="<c:out value='${reprtStatsVO.pmReprtTy}'/>">
<input type="hidden" name="pmDateTy" value="<c:out value='${reprtStatsVO.pmDateTy}'/>">
<input type="hidden" name="pmFromDate" value="<c:out value='${reprtStatsVO.pmFromDate}'/>">
<input type="hidden" name="pmToDate" value="<c:out value='${reprtStatsVO.pmToDate}'/>">
<input type="hidden" name="pageIndex" value="<c:out value='${reprtStatsVO.pageIndex}'/>">
<!-- 검색조건 유지 -->
</form:form>

</td>
</tr>
</table>
</DIV>
</body>
</html>

