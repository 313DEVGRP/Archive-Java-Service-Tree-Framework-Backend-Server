<%
/**
 * @Class Name : EgovBndtCeckManageUpdt.java
 * @Description : EgovBndtCeckManageUpdt jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.07.20    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.07.20
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>당직체크 수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="bndtCeckManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
* 목록 으로 가기
******************************************************** */
	function fncBndtCeckManageList() {
	    var varFrom = document.getElementById("bndtCeckManage");
	    varFrom.action = "<c:url value='/uss/ion/bnt/EgovBndtCeckManageList.do'/>";
	    varFrom.submit();       
	}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
	 function fncUpdtBndtCeckManage() {
	     var varFrom = document.getElementById("bndtCeckManage");
	     varFrom.action = "<c:url value='/uss/ion/bnt/updtBndtCeckManage.do'/>";
	
	     if(confirm("저장 하시겠습니까?")){
		     if(!validateBndtCeckManage(varFrom)){           
		         return;
		     }else{
		         varFrom.submit();
		     } 
	     }
	}
-->
</script>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">

<!-- ********** 여기서 부터 본문 내용 *************** -->
<form:form commandName="bndtCeckManage" name="bndtCeckManage" method="post" action="${pageContext.request.contextPath}/uss/ion/bnt/updtBndtCeckManage.do"> 
<input type="hidden" name="cmd" value="updt" >
<input type="hidden" name="bndtCeckSe" value ="<c:out value='${bndtCeckManageVO.bndtCeckSe}'/>">
<input type="hidden" name="bndtCeckCd" value ="<c:out value='${bndtCeckManageVO.bndtCeckCd  }'/>"/>

<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;당직체크 수정</h1></td>
  <td width="50%">&nbsp;</td>
  <th width="10%" align="right">

       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
	      <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncUpdtBndtCeckManage(); return false;"></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/bnt/EgovBndtCeckManageList.do'/>" onclick="fncBndtCeckManageList(); return false;"><spring:message code="button.list" /></a></span></td> 
        </tr>
       </table>
  </th>  
 </tr>
</table>

<!-- 등록  폼 영역  -->
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="당직체크 수정" >
<caption>당직체크 수정</caption>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="bndtCeckTemp1">당직체크구분</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" colspan="3"><c:out value='${bndtCeckManageVO.bndtCeckTemp1}'/></td>
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text" scope="row"><label for="bndtCeckCd">당직체크코드</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%"><c:out value='${bndtCeckManageVO.bndtCeckCd}'/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="useAt">당직체크코드명</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%">
      <form:input  path="bndtCeckCdNm" size="80" maxlength="100" title="당직체크코드명"/>
      <form:errors path="bndtCeckCdNm"/>
    </td>    
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text" scope="row"><label for="useAt">사용여부</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>
    <td width="30%" class="title_left" colspan="3">
      <form:select path="useAt" title="사용여부 ">
	      <form:option value="Y" label="사용"/>
	      <form:option value="N" label="미사용"/>
      </form:select>
    </td>    
  </tr>     
</table>
</form:form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>            
</DIV>
</body>
</html>