<%
/**
 * @Class Name : EgovBndtManageDetail.java
 * @Description : EgovBndtManageDetail jsp
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>당직  상세</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<validator:javascript formName="bndtManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fncBndtManageList(){
	location.href = "/uss/ion/bnt/EgovBndtManageList.do";
}

/* ********************************************************
* 수정화면으로  바로가기
******************************************************** */
function fncEgovBndtManage() {
	var varForm = document.getElementById("bndtManage");
	varForm.action = "<c:url value='/uss/ion/bnt/EgovBndtManageDetail.do'/>";
	varForm.submit();   
}
/* ********************************************************
* 삭제처리화면
******************************************************** */

function fncDeleteBndtManage() {
   var varFrom = document.getElementById("bndtManage");
   varFrom.action = "<c:url value='/uss/ion/bnt/deleteBndtManage.do'/>";
   if(confirm("삭제 하시겠습니까?")){
       varFrom.submit();
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

<!-- ------------------------------------------------------------------ 상단타이틀 -->
<form name="bndtManage" id="bndtManage" action="<c:url value='${pageContext.request.contextPath}/uss/ion/bnt/EgovBndtManageDetail.do'/>" method="post">  
<input name="cmd" type="hidden" value="updt"/>
<input name="bndtId" type="hidden" value="<c:out value='${bndtManageVO.bndtId}'/>"/>
<input name="bndtDe" type="hidden" value="<c:out value='${bndtManageVO.bndtDe}'/>"/>

<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="30%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;당직 상세</h1></td>
  <td width="60%">&nbsp;</td>
  <th width="10%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><span class="button"><input type="submit" value="수정" onclick="fncEgovBndtManage(); return false;"></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/bnt/deleteBndtManage.do'/>?bndtId=<c:out value='${bndtManageVO.bndtId}'/>&bndtDe=<c:out value='${bndtManageVO.bndtDe}'/>" onclick="fncDeleteBndtManage(); return false;"><spring:message code="button.delete" /></a></span></td>     
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/bnt/EgovBndtManageList.do'/>" onclick="fncBndtManageList(); return false;"><spring:message code="button.list" /></a></span></td> 
        </tr>
       </table>
  </th>  
 </tr>
</table>

<!-- 등록  폼 영역  -->
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="당직 상세" >
<caption>당직 상세</caption>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row">당직자명<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" ><c:out value='${bndtManageVO.bndtTemp1}'/></td>
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text" scope="row">소속<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
    <td width="80%" ><c:out value='${bndtManageVO.bndtTemp2}'/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row">당직일자<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" ><c:out value='${bndtManageVO.bndtDe}'/></td>    
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text" scope="row">비고<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
    <td width="30%" class="title_left">
    <textarea id="remark" name="remark" class="txaClass" rows="4" cols="70" title="비고" readonly><c:out value='${bndtManageVO.remark}'/></textarea>
    </td>    
  </tr>     
</table>
</form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>   
</div>
</body>
</html>
