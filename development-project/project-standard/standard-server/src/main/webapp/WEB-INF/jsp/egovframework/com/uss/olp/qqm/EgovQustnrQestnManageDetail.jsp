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
<title>설문문항 상세조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
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
	if(confirm("삭제시  설문문항, 설문항목, 설문조사(설문결과)\n정보가 함께 삭제됩니다!\n\n삭제 하시겠습니까?")){
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
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 상단타이틀 -->
<form name="QustnrQestnManageForm" id="QustnrQestnManageForm" action="<c:url value='/uss/olp/qqm/EgovQustnrQestnManageDetail.do'/>" method="post">
<!-- 상단 타이틀  영역 -->
<div class="title_left" style="width:100%;margin:0 0 0 0;">
	<h1><img src="<c:out value="${ImgUrl}" />icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt="제목아이콘이미지">&nbsp;설문문항 상세보기</h1>
</div>

<!-- 줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<!-- 등록  폼 영역  -->

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="상세조회 목록을 제공한다.">
<caption>상세조회 목록을 제공한다</caption>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap>설문지정보(제목)<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%">
      ${resultList[0].qestnrSj}
    </td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap>질문순번<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%">
      ${resultList[0].qestnSn}
    </td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >질문유형<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%">

<c:forEach items="${cmmCode018}" var="comCodeList" varStatus="status">
<c:if test="${comCodeList.code eq resultList[0].qestnTyCode}">
<c:out value="${fn:replace(comCodeList.codeNm , crlf , '<br/>')}" escapeXml="false" />
</c:if>
</c:forEach>

    </td>
  </tr>
  <tr>
    <th scope="row" height="23" class="required_text" >질문 내용<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td>
      <br>
      <c:out value="${fn:replace(resultList[0].qestnCn , crlf , '<br/>')}" escapeXml="false" />
	  <br><br>
    </td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >최대선택건수<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%">
    ${resultList[0].mxmmChoiseCo}
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
<input name="qestnrQesitmId" type="hidden" value="${resultList[0].qestnrQesitmId}">
<input name="cmd" type="hidden" value="<c:out value=''/>">
<%-- 설문지정보 상태유지 --%>
<c:if test="${qustnrQestnManageVO.searchMode == 'Y'}">
<input name="qestnrTmplatId" id="qestnrTmplatId" type="hidden" value="${qustnrQestnManageVO.qestnrTmplatId}">
<input name="qestnrId" id="qestnrId" type="hidden" value="${qustnrQestnManageVO.qestnrId}">
<input name="searchMode" id="searchMode" type="hidden" value="${qustnrQestnManageVO.searchMode}">
</c:if>

<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
</form>
<!-- 줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<center>
<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center" summary="수정/삭제/목록 버튼을 제공한다.">
<caption>수정/삭제/목록 버튼을 제공한다</caption>
<tr>
	<td>
		<form name="formUpdt" action="<c:url value='/uss/olp/qqm/EgovQustnrQestnManageModify.do'/>" method="post">
		<span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_modify_QustnrQestnManage(); return false;"></span>
		<c:if test="${qustnrQestnManageVO.searchMode == 'Y'}">
		<input name="qestnrTmplatId" id=""qestnrTmplatId type="hidden" value="${qustnrQestnManageVO.qestnrTmplatId}">
		<input name="qestnrId" id="qestnrId" type="hidden" value="${qustnrQestnManageVO.qestnrId}">
		<input name="searchMode" id="searchMode" type="hidden" value="${qustnrQestnManageVO.searchMode}">
		</c:if>
		<input name="qestnrQesitmId" id="qestnrQesitmId" type="hidden" value="${resultList[0].qestnrQesitmId}">
		</form>
	</td>
	<td width="3"></td>
	<td>
		<form name="formDelete" action="<c:url value='/uss/olp/qqm/EgovQustnrQestnManageDetail.do'/>" method="post">
		<span class="button"><input type="submit" value="<spring:message code="button.delete" />" onclick="fn_egov_delete_QustnrQestnManage(); return false;"></span>
		<input name="qestnrQesitmId" type="hidden" value="${resultList[0].qestnrQesitmId}">
		<input name="cmd" type="hidden" value="del">
		</form>
	</td>
	<th scope="col" width="3"></th>
	<td>
		<form name="formList" action="<c:url value='/uss/olp/qqm/EgovQustnrQestnManageList.do'/>" method="post">
		<span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list_QustnrQestnManage(); return false;"></span>
		</form>
	</td>
</tr>
</table>
</center>

</DIV>

</body>
</html>
