<%
/**
 * @Class Name : EgovMtgPlaceResveDetail.java
 * @Description : EgovMtgPlaceResveDetail.jsp
 * @Modification Information 
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.06.29    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.06.29
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
<title>회의실 예약상세</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="mtgPlaceManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>" ></script>
<script type="text/javaScript" language="javascript">

	function fncSelectMtgPlaceResveManageList() {
	    var varFrom = document.getElementById("mtgPlaceResve");
	    varFrom.action = "<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageList.do'/>";
	    varFrom.submit();       
	}

	<c:if test="${mtgPlaceManageVO.resveManId eq mtgPlaceManageVO.usidTemp}">
		/*설명 : 회의실 예약 수정조회 */
		function fncSelectMtgPlaceResveManage() {
			var varFrom = document.getElementById("mtgPlaceResve");
			varFrom.cmd.value  = "updt";
			varFrom.action = "<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>";
			varFrom.submit();   
		}
		
		/*설명 : 회의실 예약 삭제 */
		function fncDeleteMtgPlaceResve() {
		    var varFrom = document.getElementById("mtgPlaceResve");
		    varFrom.action = "<c:url value='/uss/ion/mtg/deleteMtgPlaceResve.do'/>";
		    if(confirm("삭제 하시겠습니까?")){
		        varFrom.submit();
		    }
		}
	</c:if>

	/* ********************************************************
	* 회의실 이미지  팝업창열기
	* fn_egov_dplact_ceck
	* ******************************************************** */
	function fn_mtgPlace_image(){
		var varFrom = document.getElementById("mtgPlaceResve");
		var arrParam = new Array(1);
		arrParam[0] = window;
	    sTempValue = "sTmMtgPlaceId="+varFrom.mtgPlaceId.value;
	 	window.showModalDialog("/uss/ion/mtg/selectMtgPlaceImage.do?"+sTempValue, arrParam,"dialogWidth=720px;dialogHeight=400px;resizable=yes;center=yes");
	}
</script>
</head> 
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">

<!-- ********** 여기서 부터 본문 내용 *************** -->
<form:form commandName="mtgPlaceResve" name="mtgPlaceResve" method="post" action="${pageContext.request.contextPath}/uss/ion/mtg/selectMtgPlaceResveManage.do"> 
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
<input type="hidden" name="cmd" value="updt" >
<input type="hidden" name="mtgPlaceId" value ="<c:out value='${mtgPlaceManageVO.mtgPlaceId}'/>">
<input type="hidden" name="resveDe"    value ="<c:out value='${mtgPlaceManageVO.resveDe   }'/>"/>
<input type="hidden" name="resveId"    value ="<c:out value='${mtgPlaceManageVO.resveId   }'/>"/>
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left">
   <h1><img src="/images/egovframework/com/uss/ion/mtg/icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;회의실 예약상세</h1></td>
  <td width="50%">&nbsp;</td>
  <th width="10%" align="right">

       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
<c:if test="${mtgPlaceManageVO.resveManId eq mtgPlaceManageVO.usidTemp}">
          <td><span class="button"><a href="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>?searchCondition=1" onclick="fncSelectMtgPlaceResveManage(); return false;"><spring:message code="button.update" /></a></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/mtg/deleteMtgPlaceResve.do'/>?searchCondition=1" onclick="fncDeleteMtgPlaceResve(); return false;"><spring:message code="button.delete" /></a></span></td>     
</c:if> 
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageList.do'/>?searchCondition=1" onclick="fncSelectMtgPlaceResveManageList(); return false;"><spring:message code="button.list" /></a></span></td> 
        </tr>
       </table>
  </th>  
 </tr>
</table>


<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="회의실예약 상세" >
	<caption>회의실예약 상세</caption>

  <tr> 
    <th width="20%" height="23" class="required_text" scope="row">제목<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td colspan ="3"><c:out value='${mtgPlaceManageVO.mtgSj}'/></td>
  </tr> 
  <tr> 
    <th height="23" class="required_text" scope="row">회의실명<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td colspan ="3"><c:out value='${mtgPlaceManageVO.mtgPlaceNm}'/></td>
  </tr> 
  <tr> 
    <th height="23" class="required_text" scope="row">회의실 위치<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td colspan ="3"><c:out value='${mtgPlaceManageVO.mtgPlaceTemp3}'/> <c:out value='${mtgPlaceManageVO.lcDetail}'/>
	    <c:if test="${!empty mtgPlaceManageVO.atchFileId}"> 
	    	<span class="button"><a href="#LINK" onclick="fn_mtgPlace_image(); return false;" title="새창으로">회의실 이미지</a></span>
	    </c:if>   
    </td>
  </tr>  
  <tr> 
    <th width="20%" height="23" class="required_text" scope="row">예약자<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td width="30%"><c:out value='${mtgPlaceManageVO.mtgPlaceTemp4}'/></td>
    <th width="20%" height="23" class="required_text" scope="row">소속<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
    <td width="30%"><c:out value='${mtgPlaceManageVO.mtgPlaceTemp5}'/></td>
  </tr> 
  <tr> 
    <th height="23" class="required_text" scope="row">예약시간<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td colspan ="3"><c:out value='${mtgPlaceManageVO.resveDe}'/> &nbsp;&nbsp;<c:out value='${mtgPlaceManageVO.resveBeginTm}'/> ~ <c:out value='${mtgPlaceManageVO.resveEndTm}'/></td>
  </tr>
  <tr> 
    <th height="23" class="required_text" scope="row">참석인원<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
    <td colspan ="3"><c:out value='${mtgPlaceManageVO.atndncNmpr}'/>명</td>
  </tr>
  <tr> 
    <th height="23" class="required_text" scope="row">회의내용<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
    <td colspan ="3">
      <textarea id="mtgCn" name="mtgCn" class="txaClass" rows="4" cols="70" disabled title="회의내용"><c:out value='${mtgPlaceManageVO.mtgCn}'/></textarea>
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