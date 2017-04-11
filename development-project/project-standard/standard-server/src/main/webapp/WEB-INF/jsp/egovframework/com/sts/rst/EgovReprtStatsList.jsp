<%--
/**
 * @Class Name  : EgovReprtStatsList.java
 * @Description : EgovReprtStatsList jsp
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

<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<title>보고서통계 조회</title>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--

function fncSelectReprtStatsList(pageNo) {
	if(!checkDateTy()) return;
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sts/rst/selectReprtStatsList.do'/>";
    document.listForm.submit();
}

function fncSelectReprtStats(reprtTy, reprtSttus) {
    document.listForm.reprtTy.value = reprtTy;
    document.listForm.reprtSttus.value = reprtSttus;
    document.listForm.action = "<c:url value='/sts/rst/getReprtStats.do'/>";
    document.listForm.submit();
}

function fncAddReprtStatsInsert() {
    if(document.listForm.pageIndex.value == "") {
        document.listForm.pageIndex.value = 1;
    }
    document.listForm.action = "<c:url value='/sts/rst/addViewReprtStats.do'/>";
    document.listForm.submit();
}

function linkPage(pageNo){
	if(!checkDateTy()) return;
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sts/rst/selectReprtStatsList.do'/>";
    document.listForm.submit();
}

function initDate() {

    var fromDate = '<c:out value="${pmReprtStats.pmFromDate}"/>';
    var toDate = '<c:out value="${pmReprtStats.pmToDate}"/>';

    var pmFromDate = document.listForm.pmFromDate.value;
    var pmToDate = document.listForm.pmToDate.value;

    if(document.listForm.pmFromDate.value == null || document.listForm.pmFromDate.value == '') {
        document.listForm.pmFromDate.value = fromDate;
        document.listForm.pmToDate.value = toDate;

        document.listForm.pmTyFromDate.value = fromDate.substring(0,4) + '-' + fromDate.substring(4,6) + '-' + fromDate.substring(6,8);
        document.listForm.pmTyToDate.value = toDate.substring(0,4) + '-' + toDate.substring(4,6) + '-' + toDate.substring(6,8);
    } else {
    	document.listForm.pmTyFromDate.value = pmFromDate.substring(0,4) + '-' + pmFromDate.substring(4,6) + '-' + pmFromDate.substring(6,8);
        document.listForm.pmTyToDate.value = pmToDate.substring(0,4) + '-' + pmToDate.substring(4,6) + '-' + pmToDate.substring(6,8);
    }
}

function checkDateTy() {

	var fromDate = document.listForm.pmFromDate.value;
	var toDate = document.listForm.pmToDate.value;

	if(document.listForm.pmDateTy.value == '') {
        alert("기간구분을 선택하세요.");
		return false;
	} else if(fromDate > toDate) {
        alert("종료일자는 시작일자보다  이후날짜로 선택하세요.");
        return false;
    }
	else
		return true;
}

function press() {

    if (event.keyCode==13) {
    	fncSelectReprtStatsList('1');
    }
}
-->
</script>

</head>
<body onLoad="javascript:initDate();">
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<h1 class="invisible">보고서통계</h1>

<table border="0">
  <tr>
    <td width="700">

<form name="listForm" action="<c:url value='/sts/rst/selectReprtStatsList.do'/>" method="post">
<input type="hidden" name="pmFromDate" value="<c:out value="${reprtStatsVO.pmFromDate}"/>" >
<input type="hidden" name="pmToDate" value="<c:out value="${reprtStatsVO.pmToDate}"/>" >
<table width="100%" cellpadding="1" class="table-search" border="0">
 <tr>
  <td width="18%" class="title_left"><h2 class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;보고서통계</h2></td>

  <td width="20%"><label for="pmReprtTy">유형: </label><select name="pmReprtTy" title="유형" id = "pmReprtTy">
                            <option value="00">전체</option>
                            <c:forEach var="cmmCode040" items="${cmmCode040List}" varStatus="status">
                                <option value="<c:out value="${cmmCode040.code}"/>" <c:if test="${cmmCode040.code == reprtStatsVO.pmReprtTy}">selected</c:if> ><c:out value="${cmmCode040.codeNm}"/></option>
                            </c:forEach>
                        </select>
  </td>
  <td width="20%"><label for="pmDateTy">기간구분: </label><select name="pmDateTy" title="기간구분" id="pmDateTy">
                                 <option value="">선택</option>
                                <c:forEach var="cmmCode042" items="${cmmCode042List}" varStatus="status">
                                  <option value="<c:out value="${cmmCode042.code}"/>" <c:if test="${cmmCode042.code == reprtStatsVO.pmDateTy}">selected</c:if> ><c:out value="${cmmCode042.codeNm}"/></option>
                                </c:forEach>
                              </select>
  </td>
  <td width="36%"><label for="pmTyFromDate">기간:</label>
  <input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
  <input type="text" id="pmTyFromDate" name="pmTyFromDate" size="10" maxlength="10" title="시작일자(새창)"  >
  <a href="#noscript" onclick="fn_egov_NormalCalendar(document.listForm, document.listForm.pmFromDate, document.listForm.pmTyFromDate); return false;" style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"></a>~<input type="text" name="pmTyToDate" size="10" maxlength="10" title="종료일자(새창)">
  <a href="#noscript" onclick="fn_egov_NormalCalendar(document.listForm, document.listForm.pmToDate, document.listForm.pmTyToDate); return false;" style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"></a>
  </td>
  <th width="5%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectReprtStatsList('1'); return false;"></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/sts/rst/addViewReprtStats.do'/>?pageIndex=<c:out value='${reprtStatsVO.pageIndex}'/>&amp;pmReprtTy=<c:out value="${reprtStatsVO.pmReprtTy}"/>&amp;pmDateTy=<c:out value="${reprtStatsVO.pmDateTy}"/>&amp;pmFromDate=<c:out value="${reprtStatsVO.pmFromDate}"/>&amp;pmToDate=<c:out value="${reprtStatsVO.pmToDate}"/>" onclick="fncAddReprtStatsInsert(); return false;"><spring:message code="button.create" /></a></span></td>
        </tr>
       </table>
  </th>
 </tr>
</table>
<input type="hidden" name="reprtTy">
<input type="hidden" name="reprtSttus">
<input type="hidden" name="pageIndex" value="<c:if test="${empty reprtStatsVO.pageIndex }">1</c:if><c:if test="${!empty reprtStatsVO.pageIndex }"><c:out value='${reprtStatsVO.pageIndex}'/></c:if>">
<input type="hidden" name="searchCondition" value="1">
</form>

<table width="100%" cellpadding="8" class="table-list" summary="보고서통계에 대한 보고서유형, 진행상태 건수에 대한 정보를 제공한다.">
<CAPTION style="display: none;">보고서 통계</CAPTION>
 <thead>
  <tr>
    <th scope="col" class="title" width="50%" nowrap>보고서유형</th>
    <th scope="col" class="title" width="30%" nowrap>진행상태</th>
    <th scope="col" class="title" width="20%" nowrap>건수</th>
  </tr>
 </thead>
 <tbody>
 <c:forEach var="reprtStats" items="${reprtStatsList}" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap>
        <form name="item" method="post" action="<c:url value='/sts/rst/getReprtStats.do'/>">
            <input type="hidden" name="reprtTy" value="<c:out value="${reprtStats.reprtTy}"/>">
            <input type="hidden" name="reprtSttus" value="<c:out value="${reprtStats.reprtSttus}"/>">
            <input type="hidden" name="pmFromDate" value="<c:out value="${reprtStatsVO.pmFromDate}"/>">
            <input type="hidden" name="pmToDate" value="<c:out value='${reprtStatsVO.pmToDate}'/>">
            <input type="hidden" name="pmReprtTy" value="<c:out value="${reprtStatsVO.pmReprtTy}"/>">
            <input type="hidden" name="pmDateTy" value="<c:out value='${reprtStatsVO.pmDateTy}'/>">
            <input type="hidden" name="pageIndex" value="<c:out value='${reprtStatsVO.pageIndex}'/>">
            <span class="link"><input type="submit" value="<c:out value="${reprtStats.reprtTyNm}"/>" onclick="fncSelectReprtStats('<c:out value="${reprtStats.reprtTy}"/>', '<c:out value="${reprtStats.reprtSttus}"/>'); return false;"></span>
        </form>
    </td>
    <td class="lt_text3" nowrap><c:out value="${reprtStats.reprtSttusNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${reprtStats.cnt}"/></td>
  </tr>
  </c:forEach>
  <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
	<c:if test="${fn:length(reprtStatsList) == 0}">
	<tr>
	<td class="lt_text3" colspan="3">
		<spring:message code="common.nodata.msg" />
	</td>
	</tr>
	</c:if>
 </tbody>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>

<c:if test="${!empty reprtStatsVO.pageIndex }">
<div align="center">
    <div>
        <ui:pagination paginationInfo = "${paginationInfo}"
            type="default"
            jsFunction="linkPage"
            />
    </div>
</div>
</c:if>

<table width="100%" border="0" cellspacing="2" cellpadding="0">
    <tr>
      <td width="15%" class="title_left" colspan="2"><h2 class="title_left">
      <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;기간별 통계 결과</h2></td>
    </tr>
    <c:forEach var="reprtStatsBar" items="${reprtStatsBarList}" varStatus="status">
    <tr>
      <td class="lt_text3" width="10%"><c:out value="${reprtStatsBar.grpRegDate}"/></td>
      <td width="90%"><img src="<c:url value='/images/egovframework/com/cmm/left_bg.gif' />" width="<c:out value='${reprtStatsBar.grpCnt * reprtStatsVO.maxUnit}' />" height="10" align="left" alt="">&nbsp;&nbsp;<c:out value="${reprtStatsBar.grpCnt}" /> 개</td>
    </tr>
    </c:forEach>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="2" cellpadding="0">
    <tr>
      <td width="15%" class="title_left" colspan="2"><h2 class="title_left">
      <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;보고서유형별 통계 결과</h2></td>
    </tr>
    <c:forEach var="reprtStatsByReprtTy" items="${reprtStatsByReprtTyList}" varStatus="status">
    <tr>
      <td class="lt_text3" width="10%"><c:out value="${reprtStatsByReprtTy.grpReprtTyNm}"/></td>
      <td width="90%"><img src="<c:url value='/images/egovframework/com/cmm/left_bg.gif' />" width="<c:out value='${reprtStatsByReprtTy.grpReprtTyCnt * reprtStatsVO.maxUnit}' />" height="10" align="left" alt="">&nbsp;&nbsp;<c:out value="${reprtStatsByReprtTy.grpReprtTyCnt}" /> 개</td>
    </tr>
    </c:forEach>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="2" cellpadding="0">
    <tr>
      <td width="15%" class="title_left" colspan="2"><h2 class="title_left">
      <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;진행상태별 통계 결과</h2></td>
    </tr>
    <c:forEach var="reprtStatsByReprtSttus" items="${reprtStatsByReprtSttusList}" varStatus="status">
    <tr>
      <td class="lt_text3" width="10%"><c:out value="${reprtStatsByReprtSttus.grpReprtSttusNm}"/></td>
      <td width="90%"><img src="<c:url value='/images/egovframework/com/cmm/left_bg.gif' />" width="<c:out value='${reprtStatsByReprtSttus.grpReprtSttusCnt * reprtStatsVO.maxUnit}' />" height="10" align="left" alt="">&nbsp;&nbsp;<c:out value="${reprtStatsByReprtSttus.grpReprtSttusCnt}" /> 개</td>
    </tr>
    </c:forEach>
</table>

</td>
</tr>
</table>
</DIV>
</body>
</html>
