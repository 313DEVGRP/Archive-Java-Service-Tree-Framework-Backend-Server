<%--
  Class Name : EgovQustnrQestnManageDetail.jsp
  Description : 설문문항 상세보기
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.19

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/"/>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>회의정보 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css" >
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css" >
<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_QustnrQestnManage(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrQestnManage(){
	var vFrom = document.QustnrQestnManageForm;
	vFrom.cmd.value = '';
	vFrom.action = "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageList.do' />";
	vFrom.submit();
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_QustnrQestnManage(){
	var vFrom = document.QustnrQestnManageForm;
	vFrom.cmd.value = '';
	vFrom.action = "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageModify.do' />";;
	vFrom.submit();

}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_QustnrQestnManage(){
	var vFrom = document.QustnrQestnManageForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageDetail.do' />";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
</script>
</head>
<body onLoad="fn_egov_init_QustnrQestnManage();">
<DIV id="content" style="width:712px">
<!-- 상단타이틀 -->
<form name="QustnrQestnManageForm" action="<c:url value=''/>" method="post">
<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;설문문항 통계</td>
 </tr>
</table>
<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!-- 등록  폼 영역  -->

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr>
    <th width="20%" height="23" class="required_text" nowrap>설문지정보(제목)<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%" nowrap>
      ${resultList[0].qestnrSj}
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap>질문순번<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%" nowrap>
      ${resultList[0].qestnSn}
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >질문유형<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%" nowrap>
	    <c:if test="${resultList[0].qestnTyCode == '1'}">객관식</c:if>
	    <c:if test="${resultList[0].qestnTyCode == '2'}">주관식</c:if>
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text" >질문 내용<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td>
      <br>
      <c:out value="${fn:replace(resultList[0].qestnCn , crlf , '<br/>')}" escapeXml="false" />
	  <br><br>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >최대선택건수<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%" nowrap>
    ${resultList[0].mxmmChoiseCo}
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >설문항목 결과<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%" nowrap>
    <br>
    <table border="0" cellpadding="0" cellspacing="0">
    <c:forEach items="${statisticsList}" var="statisticsList" varStatus="status">
	    <tr>
	    <td height="25px">
	    	${statisticsList.iemCn}
	    </td>
	    <td>
	    <img src="/images/egovframework/com/uss/olp/qqm/chart/chart${status.count}.JPG" width="${statisticsList.qustnrPercent}px" height="8" alt="차트이미지"> ${statisticsList.qustnrPercent}%
	    </td>
	    </tr>
    </c:forEach>
    </table>
    <br>
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap >응답자답변내용 결과<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%" nowrap>

    <table border="0" cellpadding="0" cellspacing="0">
    <c:forEach items="${statisticsList2}" var="statisticsList2" varStatus="status">
     <c:if test="${statisticsList2.respondAnswerCn ne ''}">
	    <tr>
		    <td>
		    	 <c:out value="${fn:replace(statisticsList2.respondAnswerCn , crlf , '<br/>')}" escapeXml="false" />
		    </td>
	    </tr>
	  </c:if>
    </c:forEach>
    </table>

    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >기타답변내용 결과<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%" nowrap>
    <table border="0" cellpadding="0" cellspacing="0">
    <c:forEach items="${statisticsList2}" var="statisticsList2" varStatus="status">
     <c:if test="!${statisticsList2.etcAnswerCn ne ''}">
	    <tr>
		    <td>
		    	 <c:out value="${fn:replace(statisticsList2.etcAnswerCn , crlf , '<br/>')}" escapeXml="false" />
		    </td>
	    </tr>
	  </c:if>
    </c:forEach>
    <tr><td></td></tr>
    </table>
    </td>
  </tr>
<!--
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >최초등록시점</th>
    <td width="80%" nowrap>
    ${resultList[0].mxmmChoiseCo}
    </td>
  </tr>
	<tr>
    <th width="20%" height="23" class="required_text" nowrap >최초등록아이디</th>
    <td width="80%" nowrap>
    ${resultList[0].frstRegisterId}
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >최종수정시점</th>
    <td width="80%" nowrap>
    ${resultList[0].lastUpdusrPnttm}
    </td>
  </tr>
	<tr>
    <th width="20%" height="23" class="required_text" nowrap >최종수정아이디</th>
    <td width="80%" nowrap>
    ${resultList[0].lastUpdusrId}
    </td>
  </tr>
 -->
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<center>
<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td><span class="button"><a href="JavaScript:fn_egov_list_QustnrQestnManage();"><spring:message code="button.list" /></a></span>
  </td>
  <td>&nbsp;</td>
</tr>
</table>
</center>
<input name="qestnrQesitmId" type="hidden" value="${resultList[0].qestnrQesitmId}">
<input name="cmd" type="hidden" value="<c:out value=''/>"/>
<%-- 설문지정보 상태유지 --%>
<c:if test="${qustnrQestnManageVO.searchMode == 'Y'}">
<input name="qestnrTmplatId" id="qestnrTmplatId" type="hidden" value="${qustnrQestnManageVO.qestnrTmplatId}">
<input name="qestnrId" id="qestnrId" type="hidden" value="${qustnrQestnManageVO.qestnrId}">
<input name="searchMode" id="searchMode" type="hidden" value="${qustnrQestnManageVO.searchMode}">
</c:if>

</form>
</DIV>

</body>
</html>
