<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Description : EgovIndndlpgeCntntsRegist.jsp
 * @Modification Information
 * @
 * @  수정일                      수정자               수정내용
 * @ ----------    --------    ---------------------------
 * @ 2009.09.01      이창원            최초 생성
 *
 *  @author Lee changwon
 *  @since 2009.09.01
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
<title>마이페이지 컨텐츠 등록</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="IndvdlPgeManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript" defer="defer">
/* ********************************************************
 * 컨텐츠 목록 보기 화면으로 이동
 ******************************************************** */
function fncSelectIndvdlPgeList() {
    var varFrom = document.IndvdlPgeManage; //document.getElementById("IndvdlPgeManage");
    varFrom.action = "<c:url value='/uss/mpe/EgovIndvdlpgeCntntsList.do' />";
    varFrom.submit();       
}

/* ********************************************************
* 컨텐츠 정보 등록
******************************************************** */
function fncIndvdlPgeInsert() {

    var varForm = document.IndvdlPgeManage; //document.getElementById("IndvdlPgeManage");
    varForm.action = "<c:url value='/uss/mpe/EgovIndvdlpgeCntntsRegist.do' />";

    if(confirm("저장 하시겠습니까?")){
       if(!validateIndvdlPgeManage(varForm)){           
            return;
        }else{
            varForm.submit();
        } 
    }
}
</script>
</head>

<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<DIV id="main">
<form Name="IndvdlPgeManage" method="post" action="<c:url value='/uss/mpe/EgovIndvdlpgeCntntsRegist.do' />">
<table border="0">
  <tr>
    <td width="719">
<table width="98%" cellpadding="8" class="table-search" border="0" summary="제목테이블">
 <tr>
  <td width="40%" class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목이미지">&nbsp;마이페이지 컨텐츠 등록  </td>
 </tr>
</table>

<table width="98%" cellpadding="8" class="table-line" summary="마이페이지 컨텐츠 등록테이블">
  <tr>
    <th class="required_text" width="20%" nowrap><label for="cntntsNm">컨텐츠 명</label> <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="컨텐츠 명 필수 입력사항"></th>
    <td nowrap><input name="cntntsNm" id="cntntsNm" type="text" maxLength="100" size="80" tabindex="1"><form:errors path="cntntsNm" /></td>
  </tr>
  <tr>
    <th class="required_text" nowrap><label for="cntcUrl">연계 URL</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력사항" width="15" height="15"></th>
    <td nowrap><input name="cntcUrl" id="cntcUrl" type="text" maxLength="256" size="80" tabindex="2"><form:errors path="cntcUrl" /></td>
  </tr>
  <tr>
    <th class="required_text" nowrap><label for="cntntsLinkUrl">상세보기 URL</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력사항" width="15" height="15"></th>
    <td nowrap><input name="cntntsLinkUrl" id="cntntsLinkUrl" type="text" maxLength="256" size="80" tabindex="3"><form:errors path="cntntsLinkUrl" /></td>
  </tr>
  <tr>
    <th class="required_text" nowrap>사용 여부 </th>
    <td>
      <input name="cntntsUseAt" type="radio" tabindex="4" value="Y" checked>
      &nbsp;Y&nbsp;&nbsp;
      <input name="cntntsUseAt" type="radio" value="N">
      N<form:errors path="cntntsUseAt" /></td>
  </tr>
    <tr>
    <th class="required_text" nowrap><label for="cntntsDc">컨텐츠 설명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력사항" width="15" height="15"></th>
    <td nowrap><textarea name="cntntsDc" id="cntntsDc" cols="80" rows="10" tabindex="5"></textarea><form:errors path="cntntsDc" /></td>
  </tr>
</table>

<table width="98%" cellpadding="8" class="table-search" border="0">
 <tr>
  <th width="10%" align="center">
   <table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr> 
        
        <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncIndvdlPgeInsert(); return false;"></span></td>
        <td>&nbsp;&nbsp;</td>
        <td>
            <span class="button">
            <a href="<c:url value='/uss/mpe/EgovIndvdlpgeCntntsList.do'/>"><spring:message code="button.list" /></a>
            </span> 
        </td>

    </tr>
   </table>
  </th>  
 </tr>
</table>
</td>
</tr>
</table>    
</form>
</DIV>
</body>
</html>
