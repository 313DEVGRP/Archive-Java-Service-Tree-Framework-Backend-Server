<%--
  Class Name : EgovQustnrItemManageDetail.jsp
  Description : 설문항목 상세보기
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성
 
    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09
   
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
<title>설문항목 상세보기</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javaScript" language="javascript">


/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_QustnrItemManage(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrItemManage(){
	location.href = "<c:url value='/uss/olp/qim/EgovQustnrItemManageList.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_QustnrItemManage(){
	var vFrom = document.QustnrItemManageForm;
	vFrom.cmd.value = '';
	vFrom.action = "<c:url value='/uss/olp/qim/EgovQustnrItemManageModify.do' />";;
	vFrom.submit();

}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_QustnrItemManage(){
	var vFrom = document.QustnrItemManageForm;
	if(confirm("삭제시   설문항목, 설문조사(설문결과)\n정보가 함께 삭제됩니다!\n\n삭제 하시겠습니까?")){
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/uss/olp/qim/EgovQustnrItemManageDetail.do' />";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
</script>
</head>
<body onLoad="fn_egov_init_QustnrItemManage();">
<DIV id="content" style="width:712px">
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 상단타이틀 -->
<form name="QustnrItemManageForm" id="QustnrItemManageForm" action="<c:url value='/uss/olp/qim/EgovQustnrItemManageModify.do'/>" method="post">
<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <h1><img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="middle" alt="">&nbsp;설문항목 상세보기</h1></td>
 </tr>
</table>
<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!-- 등록  폼 영역  -->

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="이 표는 설문항목 목록 정보를 제공하며, 설문정보, 설문문항정보, 질문순번, 질문내용, 기타답변여부 정보로 구성되어 있습니다 .">
<tr> 
<th scope="row" width="20%" height="23" class="required_text" nowrap>설문정보<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
<td width="80%">
  <c:out value="${fn:replace(resultList[0].qestnrCn , crlf , '<br/>')}" escapeXml="false" />
  <input name="qestnrId" type="hidden" value="<c:out value="${resultList[0].qestnrId}" />">
  <input name="qestnrTmplatId" type="hidden" value="<c:out value="${resultList[0].qestnrTmplatId}" />">  
</td>
</tr>
<tr> 
<th scope="row" width="20%" height="23" class="required_text" nowrap>설문문항정보<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
<td width="80%">
  <c:out value="${fn:replace(resultList[0].qestnrQesitmCn , crlf , '<br/>')}" escapeXml="false" />
  <input name="qestnrQesitmId" type="hidden" value="<c:out value="${resultList[0].qestnrQesitmId}" />">
</td>
</tr>
<tr> 
<th scope="row" height="23" class="required_text" >질문 순번<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
<td>
   <c:out value="${resultList[0].iemSn}" />
</td>
</tr> 
<tr> 
<th scope="row" height="23" class="required_text" >질문 내용<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
<td>
   <br>
  <c:out value="${fn:replace(resultList[0].iemCn , crlf , '<br/>')}" escapeXml="false" />
  <br><br>
</td>
</tr> 
<tr> 
<th scope="row" width="20%" height="23" class="required_text" nowrap >기타답변여부<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
<td width="80%">
   <c:out value=" ${resultList[0].etcAnswerAt}" />
</td>
</tr>
</table>
<input name="qustnrIemId" type="hidden" value="<c:out value="${resultList[0].qustnrIemId}" />">
<input name="cmd" type="hidden" value="">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
</form>

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
  <td> 
	<form name="formList" action="<c:url value='/uss/olp/qim/EgovQustnrItemManageList.do'/>" method="post">
	<span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list_QustnrItemManage(); return false;"></span>
	</form>
  </td>
  <td width="3"></td>
  <td>
	<form name="formDelete" action="<c:url value='/uss/olp/qim/EgovQustnrItemManageDetail.do'/>" method="post"> 
	<span class="button"><input type="submit" value="<spring:message code="button.delete" />" onclick="fn_egov_delete_QustnrItemManage(); return false;"></span>
	<input name="qestnrTmplatId" type="hidden" value="${resultList[0].qustnrIemId}">
	<input name="cmd" type="hidden" value="del">
	</form>
  </td>  
  <td width="3"></td>
  <td>
	<form name="formUpdt" action="<c:url value='/uss/olp/qim/EgovQustnrItemManageModify.do'/>" method="post"> 
	<span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_modify_QustnrItemManage(); return false;"></span>
	<input name="qestnrTmplatId" type="hidden" value="${resultList[0].qustnrIemId}">
	</form>
  </td>
</tr>
</table>
</center>
</DIV>

</body>
</html>
