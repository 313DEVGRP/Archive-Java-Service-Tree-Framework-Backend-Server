<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Description : EgovIndndlpgeCntntsUpdt.jsp
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
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<title>마이페이지 컨텐츠 수정</title>
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
* 컨텐츠 정보 수정
******************************************************** */
function fncIndvdlPgeUpdate() {
    var varFrom = document.IndvdlPgeManage; //document.getElementById("IndvdlPgeManage");
    varFrom.action = "<c:url value='/uss/mpe/EgovIndvdlpgeCntntsUpdt.do' />";
    if(confirm("수정된 내용을 저장 하시겠습니까?")){
   	       if(!validateIndvdlPgeManage(varFrom)){           
    	      return;
    	   }else{
          	  varFrom.submit();
    	   }
    }
}

/* ********************************************************
* 서버 처리 후 메세지 화면에 보여주기
******************************************************** */
function fncShowMessg(){
	if("<c:out value='${message}'/>" != ''){
	alert("<c:out value='${message}'/>");
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
<form Name="IndvdlPgeManage" method="post" action="">
<input type="hidden" name="cntntsId" value="<c:out value="${cntnts_model.cntntsId}"/>" />
<table width="98%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%" class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;마이페이지 컨텐츠 수정  </td>
 </tr>
</table>

<table width="98%" cellpadding="8" class="table-line">
  <tr>
    <th class="required_text" width="20%" nowrap>컨텐츠 명 <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력사항"></th>
    <td nowrap><input title="컨텐츠명" name="cntntsNm" id="cntntsNm" type="text" value="<c:out value="${cntnts_model.cntntsNm}"/>" maxlength="100"  size="80" tabindex="1"><form:errors path="cntntsNm" /></td>
  </tr>
  <tr>
    <th class="required_text" nowrap>연계 URL<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력사항" width="15" height="15"></th>
    <td nowrap><input title="연계 URL" name="cntcUrl" id="cntcUrl" type="text" value="<c:out value="${cntnts_model.cntcUrl}"/>"  maxLength="256"  size="80" tabindex="2"><form:errors path="cntcUrl" /></td>
  </tr>
  <tr>
    <th class="required_text" nowrap>상세보기 URL<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력사항" width="15" height="15"></th>
    <td nowrap><input title="상세보기 URL" name="cntntsLinkUrl" id="cntntsLinkUrl" type="text" value="<c:out value="${cntnts_model.cntntsLinkUrl}"/>"  maxLength="256" size="80" tabindex="3"><form:errors path="cntntsLinkUrl" /></td>
  </tr>
  <tr>
    <th class="required_text" nowrap>사용 여부 </th>
    <td nowrap>
      <input name="cntntsUseAt" type="radio" <c:if test="${cntnts_model.cntntsUseAt == 'Y'}">checked</c:if> value="Y" tabindex="4" >
      &nbsp;Y&nbsp;&nbsp;
      <input name="cntntsUseAt" type="radio" <c:if test="${cntnts_model.cntntsUseAt == 'N'}">checked</c:if> value="N" >
      N<form:errors path="cntntsUseAt" /></td>
  </tr>
    <tr>
    <th class="required_text" nowrap>컨텐츠 설명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력사항" width="15" height="15"></th>
    <td nowrap><textarea name="cntntsDc" id="cntntsDc" cols="80" rows="10" tabindex="5" title="컨텐츠설명입력"><c:out value="${cntnts_model.cntntsDc}"/></textarea><form:errors path="cntntsDc" /></td>
  </tr>
</table>
<table width="98%" cellpadding="8" class="table-search" border="0">
 <tr>
  <th width="10%" align="center">
   <table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr> 
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap><a href="javascript:fncIndvdlPgeUpdate();" style="selector-dummy:expression(this.hideFocus=false);" tabindex="6"><spring:message code="button.save" /></a> 
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" width="8" height="20" alt=""></td>
      <td>&nbsp;&nbsp;</td>
<!--
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap><a href="/uss/mpe/EgovIndvdlpgeCntntsRegistView.do" style="selector-dummy:expression(this.hideFocus=false);" tabindex="7"><spring:message code="button.create" /></a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" width="8" height="20" alt=""></td>    
      <td>&nbsp;&nbsp;</td>
-->
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap><a href="javascript:fncSelectIndvdlPgeList()" style="selector-dummy:expression(this.hideFocus=false);" tabindex="8"><spring:message code="button.list" /></a> 
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" width="8" height="20" alt=""></td>
      <td>&nbsp;&nbsp;</td>
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
</body>
</html>
