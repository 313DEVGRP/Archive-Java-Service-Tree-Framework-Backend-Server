<%--
/**
 * @Class Name  : EgovDtaUseStatsList.java
 * @Description : EgovDtaUseStatsList jsp
 * @Modification Information
 * @
 * @  수정일       수정자          수정내용
 * @ -------      --------    ---------------------------
 * @ 2009.08.01    lee.m.j         최초 생성
 * @ 2011.07.17    이기하          패키지 분리(sts -> sts.dst)
 *   2011.09.16    서준식          기간에 날짜가 없을때도 -가 표시되는 현상 수정
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
<title>자료이용현황통계 조회</title>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--

function initDate() {

    var fromDate = '<c:out value="${pmDtaUseStats.pmFromDate}"/>';
    var toDate = '<c:out value="${pmDtaUseStats.pmToDate}"/>';

    var pmFromDate = document.listForm.pmFromDate.value;
    var pmToDate = document.listForm.pmToDate.value;

    if(document.listForm.pmFromDate.value == null || document.listForm.pmFromDate.value == '') {

        if(fromDate == '' || fromDate == null){

        }else{
        	document.listForm.pmFromDate.value = fromDate;
            document.listForm.pmToDate.value = toDate;

            document.listForm.pmTyFromDate.value = fromDate.substring(0,4) + '-' + fromDate.substring(4,6) + '-' + fromDate.substring(6,8);
            document.listForm.pmTyToDate.value = toDate.substring(0,4) + '-' + toDate.substring(4,6) + '-' + toDate.substring(6,8);
        }


    } else {
        document.listForm.pmTyFromDate.value = pmFromDate.substring(0,4) + '-' + pmFromDate.substring(4,6) + '-' + pmFromDate.substring(6,8);
        document.listForm.pmTyToDate.value = pmToDate.substring(0,4) + '-' + pmToDate.substring(4,6) + '-' + pmToDate.substring(6,8);
    }
}

function fncSelectDtaUseStatsList(pageNo) {
	if(!checkDateTy()) return;
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sts/dst/selectDtaUseStatsList.do'/>";
    document.listForm.submit();
}

function fncSelectDtaUseStats(bbsId, nttId, atchFileId, fileSn) {
    document.listForm.bbsId.value = bbsId;
    document.listForm.nttId.value = nttId;
    document.listForm.atchFileId.value = atchFileId;
    document.listForm.fileSn.value = fileSn;
    document.listForm.action = "<c:url value='/sts/dst/getDtaUseStats.do'/>";
    document.listForm.submit();
}

function linkPage(pageNo){
	if(!checkDateTy()) return;
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sts/dst/selectDtaUseStatsList.do'/>";
    document.listForm.submit();
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
    	fncSelectDtaUseStatsList('1');
    }
}
-->
</script>

</head>
<body onLoad="javascript:initDate();">
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<h1 class="invisible">자료이용현황통계</h1>

<div id="border" style="width:730px">

<table border="0">
  <tr>
    <td width="700">

<form name="listForm" action="<c:url value='/sts/dst/selectDtaUseStatsList.do'/>" method="post">
<input type="hidden" name="pmFromDate" value="<c:out value="${dtaUseStatsVO.pmFromDate}"/>" >
<input type="hidden" name="pmToDate" value="<c:out value="${dtaUseStatsVO.pmToDate}"/>" >
<table width="100%" cellpadding="1" class="table-search" border="0">
 <tr>
  <td width="22%" class="title_left"><h2 class="title_left">
    <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;자료이용현황통계</h2></td>
  <td width="21%"><label for="searchKeyword">게시판명: </label><input type="text" id="searchKeyword" name="searchKeyword" size="10" maxlength="20" title="게시판명" value="<c:out value="${dtaUseStatsVO.searchKeyword}"/>" ></td>

  <td width="19%"><label for="pmDateTy">기간구분: </label><select name="pmDateTy" title="기간구분" id="pmDateTy">
                                <option value="">선택</option>
                                <c:forEach var="cmmCode042" items="${cmmCode042List}" varStatus="status">
                                  <option value="<c:out value="${cmmCode042.code}"/>" <c:if test="${cmmCode042.code == dtaUseStatsVO.pmDateTy}">selected</c:if> ><c:out value="${cmmCode042.codeNm}"/></option>
                                </c:forEach>
                              </select>
  </td>
  <td width="36%"><label for="pmTyFromDate">기간:</label>
  <input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
  <input type="text" id="pmTyFromDate" name="pmTyFromDate" size="10" maxlength="10" title="시작일자(새창)"  >
  <a href="#noscript" onclick="fn_egov_NormalCalendar(document.listForm, document.listForm.pmFromDate, document.listForm.pmTyFromDate); return false;" style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"></a>
  ~
  <input type="text" name="pmTyToDate" size="10" maxlength="10" title="종료일자(새창)">
  <a href="#noscript" onclick="fn_egov_NormalCalendar(document.listForm, document.listForm.pmToDate, document.listForm.pmTyToDate); return false;" style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"></a>
  </td>
  <th width="2%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectDtaUseStatsList('1'); return false;"></span></td>
        </tr>
       </table>
  </th>
 </tr>
</table>

<input type="hidden" name="bbsId" >
<input type="hidden" name="nttId" >
<input type="hidden" name="atchFileId" >
<input type="hidden" name="fileSn" >
<input type="hidden" name="pageIndex" value="<c:if test="${empty dtaUseStatsVO.pageIndex }">1</c:if><c:if test="${!empty dtaUseStatsVO.pageIndex }"><c:out value='${dtaUseStatsVO.pageIndex}'/></c:if>">
<input type="hidden" name="searchCondition" value="1">
</form>

<table width="100%" cellpadding="8" class="table-list" summary="자료이용현황통계에 대한 게시판명, 글번호, 글제목, 첨부파일명, 다운횟수에 대한 정보를 제공한다.">
<CAPTION style="display: none;">자료이용현황통계</CAPTION>
 <thead>
  <tr>
    <th scope="col" class="title" width="25%" nowrap>게시판명</th>
    <th scope="col" class="title" width="10%" nowrap>글번호</th>
    <th scope="col" class="title" width="30%" nowrap>글제목</th>
    <th scope="col" class="title" width="25%" nowrap>첨부파일명</th>
    <th scope="col" class="title" width="10%" nowrap>다운횟수</th>
  </tr>
 </thead>

 <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
 <c:if test="${fn:length(dtaUseStatsList) == 0}">
 <tr>
 <td class="lt_text3" colspan="9">
	<spring:message code="common.nodata.msg" />
 </td>
 </tr>
 </c:if>

 <tbody>
 <c:forEach var="dtaUseStats" items="${dtaUseStatsList}" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap>
        <form name="item" method="post" action="<c:url value='/sts/dst/getDtaUseStats.do'/>">
            <input type="hidden" name="bbsId" value="<c:out value="${dtaUseStats.bbsId}"/>">
            <input type="hidden" name="nttId" value="<c:out value="${dtaUseStats.nttId}"/>">
            <input type="hidden" name="atchFileId" value="<c:out value="${dtaUseStats.atchFileId}"/>">
            <input type="hidden" name="fileSn" value="<c:out value='${dtaUseStats.fileSn}'/>">
            <input type="hidden" name="pmDateTy" value="<c:out value='${dtaUseStatsVO.pmDateTy}'/>">
            <input type="hidden" name="pmFromDate" value="<c:out value='${dtaUseStatsVO.pmFromDate}'/>">
            <input type="hidden" name="pmToDate" value="<c:out value='${dtaUseStatsVO.pmToDate}'/>">
            <input type="hidden" name="searchKeyword" value="<c:out value='${dtaUseStatsVO.searchKeyword}'/>">
            <input type="hidden" name="pageIndex" value="<c:out value='${dtaUseStatsVO.pageIndex}'/>">
            <span class="link"><input type="submit" value="<c:out value="${dtaUseStats.bbsNm}"/>" onclick="fncSelectDtaUseStats('<c:out value="${dtaUseStats.bbsId}"/>', '<c:out value="${dtaUseStats.nttId}"/>', '<c:out value="${dtaUseStats.atchFileId}"/>', '<c:out value="${dtaUseStats.fileSn}"/>'); return false;"></span>
        </form>
    </td>
    <td class="lt_text3" nowrap><c:out value="${dtaUseStats.nttId}"/></td>
    <td class="lt_text3" nowrap><c:out value="${dtaUseStats.nttSj}"/></td>
    <td class="lt_text3" nowrap><c:out value="${dtaUseStats.fileNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${dtaUseStats.downCnt}"/></td>
  </tr>
 </c:forEach>
 <c:if test="${fn:length(dtaUseStatsList) == 0}">
 </c:if>
 </tbody>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>

<c:if test="${!empty dtaUseStatsVO.pageIndex }">
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
    <c:forEach var="dtaUseStatsBar" items="${dtaUseStatsBarList}" varStatus="status">
    <tr>
      <td class="lt_text3" width="10%"><c:out value="${dtaUseStatsBar.grpRegDate}"/></td>
      <td width="90%"><img src="<c:url value='/images/egovframework/com/cmm/left_bg.gif'/>" width="<c:out value='${dtaUseStatsBar.grpCnt * dtaUseStatsVO.maxUnit}'/>" height="10" align="left" alt="">&nbsp;&nbsp;<c:out value="${dtaUseStatsBar.grpCnt}"/> 개</td>
    </tr>
    </c:forEach>
</table>


</td>
</tr>
</table>
</DIV>
</body>
</html>
