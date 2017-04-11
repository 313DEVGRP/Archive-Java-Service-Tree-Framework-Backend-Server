<%--
  Class Name : EgovAdministrationWordManageModify.jsp
  Description : 행정전문용어사전관리 수정 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

    Copyright (C) 2009 by MOPAS  All right reserved.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/" />
<%pageContext.setAttribute("crlf", "\r\n"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>행정전문용어사전관리 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="administrationWordManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_AdministrationWordManage(){

}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_AdministrationWordManage(){
	var varFrom = document.administrationWordManage;
	varFrom.action =  "<c:url value='/uss/olh/awm/updtAdministrationWordManage.do' />";

	if(confirm("<spring:message code="common.save.msg" />")){
		if(!validateAdministrationWordManage(varFrom)){
			return;
		}else{
			varFrom.submit();
		}
	}
}

/* ********************************************************
* 영문일때 첫글자를 대문자로 변환
******************************************************** */
function change(str) {
	  leng =str.length;
	  for (i =0; i <=leng; i++) {
	    if (i==0) {
	      if (str.charAt(i) !=" "){
	        done =str.substring(0,1).toUpperCase();
	      } else {
	        done =" ";
	      }
	    } else {
	      if (str.charAt(i) ==" "){
	        done+=" ";
	      } else {
	        if (str.charAt(i-1)==" ") {
	          done+=str.substring(i,i+1).toUpperCase();
	        } else {
	          done+=str.substring(i,i+1).toLowerCase();
	        }
	      }  // if 종료
	    }  // for 종료
	  }
	  document.administrationWordManage.administWordNm.value=done;
	  return done;
	}

</script>
</head>
<body onLoad="fn_egov_init_AdministrationWordManage();">
<DIV id="content" style="width:712px">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!--  상단타이틀 -->
<form:form commandName="administrationWordManage" name="administrationWordManage" action="" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0" summary="상단 타이틀을 제공한다.">
 <tr>
  <td width="100%"class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt=" ">&nbsp;행정전문용어사전관리 수정</td>
 </tr>
</table>
<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!--  등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="행정전문용어사전관리 수정을 제공한다.">

  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label id="IdAdministWordNm">행정용어명</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td width="80%">
      <form:input path="administWordNm" size="73" cssClass="txaIpt" maxlength="255" onchange ="change(this.va lue)" />
      <form:errors path="administWordNm" cssClass="error"/>
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label id="IdAdministWordEngNm">행정용어영문명</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td width="80%">
      <form:input path="administWordEngNm" size="73" cssClass="txaIpt" maxlength="255"/>
      <form:errors path="administWordEngNm" cssClass="error"/>
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label id="IdAdministWordAbrv">행정용어약어명</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td width="80%">
      <form:input path="administWordAbrv" size="73" cssClass="txaIpt" maxlength="255"/>
      <form:errors path="administWordAbrv" cssClass="error"/>
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label id="IdAhemaRelm">주제영역</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td width="80%">
      <form:input path="themaRelm" size="73" cssClass="txaIpt" maxlength="255"/>
      <form:errors path="themaRelm" cssClass="error"/>
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label id="IdAordDomn">용어구분</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td width="80%">
			<select name="wordDomn" title="용어구분선택">
			<option value="">선택</option>
			<option value="1" <c:if test="${administrationWordManage.wordDomn == '1'}">selected</c:if>>표준어</option>
			<option value="2" <c:if test="${administrationWordManage.wordDomn == '2'}">selected</c:if>>동의어</option>
			</select>
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap >
    <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;"><label id="IdAtdWord">관련표준용어</label></DIV></th>
    <td width="80%">
      <form:input path="stdWord" size="73" cssClass="txaIpt" maxlength="255"/>
      <form:errors path="stdWord" cssClass="error"/>
    </td>
  </tr>

  <tr>
        <th height="23" class="required_text" >
    <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;"><label id="IdAdministWordDf">행정전문용어 <br>정의</label></DIV></th>
    <td>
        <form:textarea path="administWordDf" rows="3" cols="20" cssClass="txaClass"/>
    	<form:errors path="administWordDf" cssClass="error"/>
    </td>
  </tr>

  <tr>
        <th height="23" class="required_text" >
    <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;"><label id="IdAdministWordDc">행정전문용어 <br>설명</label></DIV></th>
    <td>
        <form:textarea path="administWordDc" rows="3" cols="20" cssClass="txaClass"/>
    	<form:errors path="administWordDc" cssClass="error"/>
    </td>
  </tr>

</table>

<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
<tr>
	<td height="3px"></td>
</tr>
</table>
<center>
<!--  목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center" summary="목록/저장/삭제 버튼을 제공한다.">
<tr>

  <td>
  <span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_save_AdministrationWordManage(); return false;" ></span>
  </td>

  <td>&nbsp;</td>
  <td><img src="${ImgUrl}btn/bu2_left.gif"  width="8" height="20" alt="버튼이미지"></td>
  <td class="btnBackground" nowrap><a href="<c:url value='/uss/olh/awm/listAdministrationWordManage.do' />"><spring:message code="button.list" /></a>
  </td>
  <td><img src="${ImgUrl}btn/bu2_right.gif"  width="8" height="20" alt="버튼이미지"></td>
</tr>
</table>
</center>
<input name="administWordId" type="hidden" value="${administrationWordManage.administWordId}">
<input name="cmd" type="hidden" value="<c:out value='save'/>"/>
</form:form>
</DIV>

</body>
</html>
