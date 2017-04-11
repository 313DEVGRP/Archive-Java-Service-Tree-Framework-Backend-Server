<%--
  Class Name : EgovPopupDetail.jsp
  Description : 팝업창관리 상세보기
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.09.16    장동한          최초 생성
 
    author   : 공통서비스 개발팀 장동한
    since    : 2009.09.16
   
    Copyright (C) 2009 by MOPAS  All right reserved.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/" />
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/" />
<%pageContext.setAttribute("crlf", "\r\n"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>팝업창관리 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_PopupManage(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_PopupManage(){
	location.href = "<c:url value='/uss/ion/pwm/listPopup.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_PopupManage(){
	var vFrom = document.PopupManageForm;
	vFrom.cmd.value = '';
	vFrom.action = "<c:url value='/uss/ion/pwm/updtPopup.do' />";;
	vFrom.submit();

}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_PopupManage(){
	var vFrom = document.PopupManageForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/uss/ion/pwm/detailPopup.do' />";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
</script>
</head>
<body onLoad="fn_egov_init_PopupManage();">
<DIV id="content" style="width:712px">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!--  상단타이틀 -->
<form name="PopupManageForm" action="<c:url value=''/>" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="middle" alt="팝업창관리  상세보기">&nbsp;팝업창관리 상세보기</td>
 </tr>
</table>
<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!--  등록  폼 영역  -->

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >팝업창명<img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td width="80%">
	<c:out value="${popupManageVO.popupTitleNm}" />
    </td>
  </tr>
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >팝업창URL<img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td width="80%">
	<c:out value="${popupManageVO.fileUrl}" />
    </td>
  </tr>
  <tr> 
    <th height="23" class="required_text" >팝업창위치<img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td>
       가로<c:out value="${popupManageVO.popupWlc}" />  세로<c:out value="${popupManageVO.popupHlc}" escapeXml="false" />

        
    </td>
  </tr>
  <tr> 
    <th height="23" class="required_text" >팝업창사이즈<img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td>
       WIDTH<c:out value="${popupManageVO.popupWSize}" />  HEIGHT<c:out value="${popupManageVO.popupHSize}" escapeXml="false" />

        
    </td>
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >게시 기간<img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td width="80%">
 	<c:out value="${fn:substring(popupManageVO.ntceBgnde, 0, 4)}"/>-<c:out value="${fn:substring(popupManageVO.ntceBgnde, 4, 6)}"/>-<c:out value="${fn:substring(popupManageVO.ntceBgnde, 6, 8)}"/> <c:out value="${fn:substring(popupManageVO.ntceBgnde, 8, 10)}"/>H <c:out value="${fn:substring(popupManageVO.ntceBgnde, 10, 12)}"/>M 
 	~
 	<c:out value="${fn:substring(popupManageVO.ntceEndde, 0, 4)}"/>-<c:out value="${fn:substring(popupManageVO.ntceEndde, 4, 6)}"/>-<c:out value="${fn:substring(popupManageVO.ntceEndde, 6, 8)}"/> <c:out value="${fn:substring(popupManageVO.ntceEndde, 8, 10)}"/>H <c:out value="${fn:substring(popupManageVO.ntceEndde, 10, 12)}"/>M
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >그만보기 설정 여부<img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td width="80%">
    <c:out value="${popupManageVO.stopVewAt}"/>
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >계시 상태<img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td width="80%">
    <c:out value="${popupManageVO.ntceAt}"/>
    </td>
  </tr>
</table>
<input name="popupId" type="hidden" value="${popupManageVO.popupId}">
<input name="cmd" type="hidden" value="<c:out value=''/>"/>
</form>

<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<center>
<!--  목록/저장버튼  -->

<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
	<td>
		<form name="formUpdt" action="<c:url value='/uss/ion/pwm/updtPopup.do'/>" method="post"> 
		<span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_modify_PopupManage(); return false;"></span>
		<input name="popupId" type="hidden" value="${popupManageVO.popupId}">
		</form>
	</td>
	<td width="3"></td>
	<td>
		<form name="formDelete" action="<c:url value='/uss/ion/pwm/detailPopup.do'/>" method="post"> 
		<span class="button"><input type="submit" value="<spring:message code="button.delete" />" onclick="fn_egov_delete_PopupManage(); return false;"></span>
		<input name="popupId" type="hidden" value="${popupManageVO.popupId}">
		<input name="cmd" type="hidden" value="<c:out value='del'/>"/>
		</form>
	</td>
	<td width="3"></td>
	<td> 
		<form name="formList" action="<c:url value='/uss/ion/pwm/listPopup.do'/>" method="post">
		<span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list_PopupManage(); return false;"></span>
		</form>
	</td>
</tr>
</table>



<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

</center>

</DIV>

</body>
</html>
