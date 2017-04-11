<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Description : EgovIndndlpgeCntntsDetail.jsp
 * @Modification Information
 * @
 * @  수정일                      수정자               수정내용
 * @ ----------    --------    ---------------------------
 * @ 2009.09.07      이창원            최초 생성
 *
 *  @author Lee changwon
 *  @since 2009.09.07
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<title>마이페이지 컨텐츠 상세보기</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="IndvdlPgeManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript" defer="defer">
/* ********************************************************
 * 컨텐츠 목록 보기 화면으로 이동
 ******************************************************** */
function fncSelectIndvdlPgeList() {
    var varFrom = document.IndvdlPgeManage; //document.getElementById("IndvdlPgeManage");
    varFrom.action = "<c:url value='/uss/mpe/Egovcntnts_modelCntntsList.do' />";
    varFrom.submit();       
}

/* ********************************************************
* 컨텐츠 정보 수정
******************************************************** */
function fncIndvdlPgeUpdate() {
    var varFrom = document.IndvdlPgeManage;  //document.getElementById("IndvdlPgeManage");
    varFrom.action = "<c:url value='/uss/mpe/EgovIndvdlpgeCntntsForUpdt.do' />";
    if(confirm("수정 하시겠습니까?")){
       if(!validateIndvdlPgeManage(varFrom)){           
          return;
       }else{
          varFrom.submit();
       }
 }
}

/* ********************************************************
* 서버 작업 후 메세지 화면에 보여주기
******************************************************** */
function fncShowMessg(){
    if("<c:out value='${message}'/>" != ''){
    alert("<c:out value='${message}'/>");
    }
}
/* ********************************************************
* 컨텐츠  완전삭제(사용 유무 N으로 변경하는게 아니라 디비에서 완전삭제)
******************************************************** */
function fncDeleteCntnts() {
    var varForm = document.IndvdlPgeManageDel; //document.getElementById("IndvdlPgeManage");
        if(confirm("완전 삭제하시겠습니까? 삭제된 컨텐츠는 복구 될 수 없습니다.")) {
            //varForm.action = "<c:url value='/uss/mpe/EgovIndvdlpgeCntntsDel.do' />";
            varForm.submit();
        }
}
</script>
</head>

<body onLoad="javascript:fncShowMessg();">
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<DIV id="main">
<table border="0">
  <tr>
    <td width="719">
<form name="IndvdlPgeManage" id="IndvdlPgeManage" method="post" action="<c:url value='/uss/mpe/EgovIndvdlpgeCntntsDetail.do' />" >
<input type="hidden" name="cntntsId" value="<c:out value="${cntnts_model.cntntsId}"/>" >
<table width="98%" cellpadding="8" class="table-search" border="0" summary="제목테이블">
 <tr>
  <td width="40%" class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목이미지">&nbsp;마이페이지 컨텐츠 상세보기  </td>
 </tr>
</table>

<table width="98%" cellpadding="8" class="table-line">
  <tr>
    <th class="required_text" width="20%" nowrap>컨텐츠 명 <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15"  alt="필수입력"></th>
    <td nowrap><input title="컨텐츠명" name="cntntsNm" id="cntntsNm" type="text" value="<c:out value="${cntnts_model.cntntsNm}"/>"  maxLength="100"  size="80" tabindex="1" disabled><form:errors path="cntntsNm" /></td>
  </tr>
  <tr>
    <th class="required_text" nowrap>연계 URL<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력사항" width="15" height="15"></th>
    <td nowrap><input title="연계 URL" name="cntcUrl" id="cntcUrl" type="text" value="<c:out value="${cntnts_model.cntcUrl}"/>"  maxLength="256" size="80" tabindex="2" disabled><form:errors path="cntcUrl" /></td>
  </tr>
  <tr>
    <th class="required_text" nowrap>상세보기 URL<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력사항" width="15" height="15"></th>
    <td nowrap><input title="상세보기 URL" name="cntntsLinkUrl" id="cntntsLinkUrl" type="text" value="<c:out value="${cntnts_model.cntntsLinkUrl}"/>" maxLength="256" size="80" tabindex="3" disabled><form:errors path="cntntsLinkUrl" /></td>
  </tr>
  <tr>
    <th class="required_text" nowrap>사용 여부 </th>
    <td nowrap>
      <input name="cntntsUseAt" type="radio" <c:if test="${cntnts_model.cntntsUseAt == 'Y'}">checked</c:if> value="Y" tabindex="4"  disabled>
      &nbsp;Y&nbsp;&nbsp;
      <input name="cntntsUseAt" type="radio" <c:if test="${cntnts_model.cntntsUseAt == 'N'}">checked</c:if> value="N"  disabled>
      N<form:errors path="cntntsUseAt" /></td>
  </tr>
    <tr>
    <th class="required_text" nowrap>컨텐츠 설명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력사항" width="15" height="15"></th>
    <td nowrap><textarea name="cntntsDc" id="cntntsDc"  cols="80" rows="10" title="컨텐츠 설명" tabindex="5" disabled><c:out value="${cntnts_model.cntntsDc}"/></textarea><form:errors path="cntntsDc" /></td>
  </tr>
</table>
<table width="98%" cellpadding="8" class="table-search" border="0">
 <tr>
  <th width="10%" align="center">
   <table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr> 
        
        <td>
            <span class="button">
            <a href="<c:url value='/uss/mpe/EgovIndvdlpgeCntntsForUpdt.do'/>"
               onclick="fncIndvdlPgeUpdate(); return false;"><spring:message code="button.update" /></a>
            </span> 
        </td>
        <td><span class="button"><input type="submit" value="<spring:message code="button.delete" />" onclick="fncDeleteCntnts(); return false;"></span></td>
        <td>
            <span class="button">
            <a href="<c:url value='/uss/mpe/EgovIndvdlpgeCntntsList.do' />?pageIndex=<c:out value='${indvdlPge.pageIndex}' />"><spring:message code="button.list" /></a>
            </span>
        </td>

    </tr>
   </table>
  </th>  
 </tr>
</table>
</form>

</td>
</tr>
</table>    
</DIV>
<form name="IndvdlPgeManageDel" id="IndvdlPgeManageDel" action="<c:url value='/uss/mpe/EgovIndvdlpgeCntntsDelDB.do' />" method="post">
<input type="hidden" name="cntntsId" value="<c:out value='${cntnts_model.cntntsId}'/>">
<input type="hidden" name="pageIndex" value="<c:out value='${indvdlPge.pageIndex}'/>">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
</form>
</body>
</html>
