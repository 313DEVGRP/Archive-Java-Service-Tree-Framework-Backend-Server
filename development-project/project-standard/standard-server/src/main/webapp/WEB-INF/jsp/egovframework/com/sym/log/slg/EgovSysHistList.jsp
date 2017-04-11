<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovSysHistList.jsp
  * @Description : 시스템 이력 정보목록 화면
  * @Modification Information
  * @
  * @  수정일         수정자          수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.03.06      이삼섭          최초 생성
  * @ 2011.07.08      이기하          패키지 분리로 경로 수정(sym.log -> sym.log.slg)
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.03.06
  *  @version 1.0
  *  @see
  *
  */
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript">
function fn_egov_insert_sysHist(){
	document.frm.action = "<c:url value='/sym/log/slg/AddSysHistory.do'/>";
	document.frm.submit();
}

function fn_egov_select_sysHist(pageNo){
	document.frm.pageIndex.value = pageNo;
	document.frm.action = "<c:url value='/sym/log/slg/SelectSysHistoryList.do'/>";
	document.frm.submit();
}

function fn_egov_inqire_sysHist(histId){
	document.frm.histId.value = histId;
	document.frm.action = "<c:url value='/sym/log/slg/InqireSysHistory.do'/>";
	document.frm.submit();
}
</script>

<title>시스템 이력 목록</title>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<DIV id="main" style="display:">
<form name="frm" action ="<c:url value='/sym/log/slg/SelectSysHistoryList.do'/>" method="post">
<input name="histId" type="hidden" />

<table width="700" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%" class="title_left"><h1 class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
   <label for="searchWrd">&nbsp;시스템이력 조회</label></h1></td>
  <th>
  </th>
  <td width="10%" >
   	<select name="searchCnd" class="select" title="">
		   <option selected value=''>--선택하세요--</option>
		   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >시스템명</option>
		   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >이력구분</option>

	   </select>
	</td>
  <td width="35%">
    <input name="searchWrd" type="text" size="35" value="<c:out value='${searchVO.searchWrd}'/>"  maxlength="35"  id="searchWrd">
  </td>
  <th width="10%">
   <table border="0" cellspacing="0" cellpadding="0" summary="이력ID, 시스템명, 이력구분, 등록자, 등록일자를 나타내는 시스템 이력 목록 테이블이다.">
   <CAPTION style="display: none;">시스템이력 조회</CAPTION>
    <tr>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap>
      <a href="#noscript" onclick="fn_egov_select_sysHist('1'); return false;">조회</a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      <td>&nbsp;&nbsp;</td>
      <!--
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt=""></td>
      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap>
      <a href="javascript:fn_egov_insert_sysHist()">등록</a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      -->
      <td><span class="button"><input type="submit" value="등록" onclick="fn_egov_insert_sysHist(); return false;"></span></td>
    </tr>
   </table>
  </th>
 </tr>
</table>
<table width="700" cellpadding="8" class="table-line">
 <thead>
  <tr>
    <!-- th class="title" width="3%" nowrap><input type="checkbox" name="all_check" class="check2"></th-->
    <th class="title" width="10%" scope="col" nowrap>번호</th>
    <th class="title" width="25%" scope="col" nowrap>이력 ID</th>
    <th class="title" width="15%" scope="col" nowrap>시스템명</th>
    <th class="title" width="15%" scope="col" nowrap>이력구분</th>
    <th class="title" width="10%" scope="col" nowrap>등록자</th>
    <th class="title" width="20%" scope="col" nowrap>등록일자</th>
    <th class="title" width="5%"  scope="col" nowrap>상세보기</th>
  </tr>
 </thead>
 <tbody>
 <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
 <c:if test="${fn:length(resultList) == 0}">
 <tr>
 <td class="lt_text3" colspan="9">
	<spring:message code="common.nodata.msg" />
 </td>
 </tr>
 </c:if>
 <c:forEach var="result" items="${resultList}" varStatus="status">
  <tr>
    <!--td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->
    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
    <td class="lt_text3" nowrap><c:out value="${result.histId}"/></td>
    <td class="lt_text3" nowrap><c:out value="${result.sysNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${result.histSeCodeNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${result.frstRegisterNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${result.frstRegisterPnttm}"/></td>
    <td class="lt_text3" nowrap>
    <a href="#noscript" onclick="fn_egov_inqire_sysHist('<c:out value="${result.histId}"/>'); return false;"
       style="selector-dummy:expression(this.hideFocus=false);">
   	<img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif'/>"  alt="상세보기"
    	 width="15" height="15" style="vertical-align: middle"></a>
    </td>
  </tr>
 </c:forEach>
 </tbody>

 <!--tfoot>
  <tr class="">
   <td colspan=6 align="center"></td>
  </tr>
 </tfoot -->
</table>
<table width="700" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
  <tr><td>
	<div align="center">
		<ui:pagination paginationInfo = "${paginationInfo}"
				       type="image" jsFunction="fn_egov_select_sysHist"	/>
	</div>
  </td></tr>
</table>
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form>
</DIV>
</body>
</html>
