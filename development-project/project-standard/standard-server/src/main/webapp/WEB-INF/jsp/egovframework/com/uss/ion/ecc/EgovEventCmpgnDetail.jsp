<%--
  Class Name : EgovEventCmpgnDetail.jsp
  Description : 행사/이벤트/캠페인 수정
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.12    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.12

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>행사/이벤트/캠페인</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css'/>" >
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_EventCmpgn(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_EventCmpgn(){
	location.href = "<c:url value='/uss/ion/ecc/EgovEventCmpgnList.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_EventCmpgn(){
	var vFrom = document.MeetingManageForm;
	vFrom.cmd.value = '';
	vFrom.action = "<c:url value='/uss/ion/ecc/EgovEventCmpgnModify.do' />";;
	vFrom.submit();

}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_EventCmpgn(){
	var vFrom = document.MeetingManageForm;

	if(confirm("삭제시 행사/이벤트/캠페인, 외부인사정보 \n정보가 함께 삭제됩니다!\n\n삭제 하시겠습니까?")){
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/uss/ion/ecc/EgovEventCmpgnDetail.do' />";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
</script>
</head>
<body onLoad="fn_egov_init_EventCmpgn();">
<DIV id="content" style="width:712px">
<!-- 상단타이틀 -->
<form name="MeetingManageForm" id="MeetingManageForm" action="<c:url value='/uss/olp/mgt/EgovMeetingManageRegist.do'/>" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;행사/이벤트/캠페인  상세보기</td>
 </tr>
</table>
<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!-- 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">

  <tr>
    <th width="20%" height="23" class="required_text" nowrap >행사유형<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%" nowrap>

<c:forEach items="${comCode035}" var="comCodeList" varStatus="status">
<c:if test="${comCodeList.code eq fn:trim(resultList[0].eventTyCode)}">
<c:out value="${fn:replace(comCodeList.codeNm , crlf , '<br/>')}" escapeXml="false" />
</c:if>
</c:forEach>

    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap >행사내용<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
     	 ${resultList[0].eventCn}
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap >행사시작일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
     ${resultList[0].eventSvcBeginDe}
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap >행사종료일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
   ${resultList[0].eventSvcEndDe}
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap >서비스이용인원수</th>
    <td width="80%">
     	${resultList[0].svcUseNmprCo}
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap >담당자명</th>
    <td width="80%">
     	${resultList[0].chargerNm}
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap >준비물내용</th>
    <td width="80%">
     	${resultList[0].prparetgCn}
    </td>
  </tr>
  <c:if test="${SUserSe eq 'USR'}">
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >승인여부</th>
    <td width="80%" nowrap>

     	<c:if test="${resultList[0].eventConfmAt eq 'Y'}">승인</c:if>
     	<c:if test="${resultList[0].eventConfmAt eq 'N'}">미승인</c:if>

    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap >승인일</th>
    <td width="80%" nowrap>
		${resultList[0].eventConfmDe}
    </td>
  </tr>
</c:if>
<!--
  <tr>
    <th height="23" class="required_text" nowrap>파일첨부</th>
    <td>
      <input type="file" name="upFile">
    </td>
  </tr>
-->
</table>
<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<center>
<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
<!-- 
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
  <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>" class="text_left" nowrap><a href="JavaScript:fn_egov_list_EventCmpgn();">목록</a>
  </td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
  <td>&nbsp;</td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
  <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>" class="text_left" nowrap><a href="JavaScript:fn_egov_delete_EventCmpgn();">삭제</a>
  </td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
  <td>&nbsp;</td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
  <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>" class="text_left" nowrap><a href="JavaScript:fn_egov_modify_EventCmpgn();">수정</a>
  </td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지" /></td>
 -->
  <td><span class="button"><input type="submit" value="목록" title="목록" onclick="javascript:fn_egov_list_EventCmpgn();return false;"></span></td>
  <td>&nbsp;</td>
  <td><span class="button"><input type="submit" value="삭제" title="삭제" onclick="javascript:fn_egov_delete_EventCmpgn();return false;"></span></td>
  <td>&nbsp;</td>
  <td><span class="button"><input type="submit" value="수정" title="수정" onclick="javascript:fn_egov_modify_EventCmpgn();return false;"></span></td>
 
</tr>
</table>
</center>
<input name="eventId" type="hidden" value="${resultList[0].eventId}">
<input name="cmd" type="hidden" value="<c:out value=''/>"/>
</form>
</DIV>

</body>
</html>
