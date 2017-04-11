<%
/**
 * @Class Name : EgovMtgPlaceDetail.java
 * @Description : EgovMtgPlaceDetail.jsp
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
<title>회의실 상세</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="mtgPlaceManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
<!--
	/*설명 : 회의실 목록 조회 */
	function fncSelectMtgPlaceManageList(){
		var varFrom = document.getElementById("mtgPlaceManage");
		varFrom.action = "<c:url value='/uss/ion/mtg/selectMtgPlaceManageList.do'/>";
		varFrom.submit();
	}
	
	/*설명 : 회의실 수정조회 */
	function fncSelectMtgPlaceManage() {
		var varFrom = document.getElementById("mtgPlaceManage");
		varFrom.cmd.value  = "update";
		varFrom.action = "<c:url value='/uss/ion/mtg/selectMtgPlaceManage.do'/>";
		varFrom.submit();   
	}
	
	/*설명 : 회의실 삭제 */
	function fncDeleteMtgPlace() {
	    var varFrom = document.getElementById("mtgPlaceManage");
	    varFrom.action = "<c:url value='/uss/ion/mtg/deleteMtgPlaceManage.do'/>";
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
<form:form commandName="mtgPlaceManage" name="mtgPlaceManage" method="post" action="${pageContext.request.contextPath}/uss/ion/mtg/selectMtgPlaceManageList.do">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
<input type="hidden" name="cmd" >
<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${mtgPlaceManageVO.searchCondition}'/>" >
<input type="hidden" name="searchKeyword"   value="<c:out value='${mtgPlaceManageVO.searchKeyword}'/>" >
<input type="hidden" name="pageIndex"       value="<c:out value='${mtgPlaceManageVO.pageIndex}'/>" >
<input type="hidden" name="mtgPlaceId"      value="<c:out value='${mtgPlaceManage.mtgPlaceId}'/>">

<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;회의실 상세</h1></td>
  <td width="40%">&nbsp;</td>
  <th width="10%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><span class="button"><a href="<c:url value='/uss/ion/mtg/selectMtgPlaceManage.do'/>?searchCondition=1" onclick="fncSelectMtgPlaceManage(); return false;"><spring:message code="button.update" /></a></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/mtg/deleteMtgPlaceManage.do'/>?searchCondition=1" onclick="fncDeleteMtgPlace(); return false;"><spring:message code="button.delete" /></a></span></td>     
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/mtg/selectMtgPlaceManageList.do'/>?searchCondition=1" onclick="fncSelectMtgPlaceManageList(); return false;"><spring:message code="button.list" /></a></span></td> 
        </tr>
       </table>
  </th>  
 </tr>
</table>
</form:form>

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="회의실  상세" >
<caption>회의실 상세</caption>
  <tr> 
    <th height="23" class="required_text" scope="row">회의실 명<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td colspan ="3"><c:out value='${mtgPlaceManage.mtgPlaceNm}'/></td>
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text"  scope="row">수용가능인원<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td width="20%" ><c:out value='${mtgPlaceManage.aceptncPosblNmpr}'/>명 </td>
    <th width="20%" height="23" class="required_text"  scope="row">개방시간<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td ><c:out value='${mtgPlaceManage.opnBeginTm}'/> ~ <c:out value='${mtgPlaceManage.opnEndTm}'/></td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text"  scope="row">위치<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td colspan ="3" >	 <c:out value='${mtgPlaceManage.mtgPlaceTemp3}'/> <c:out value='${mtgPlaceManage.lcDetail}'/></td> 
  </tr>
<!--  첨부파일 테이블 레이아웃 설정 Start.. -->
  <c:if test="${!empty mtgPlaceManage.atchFileId}">
	<tr> 
		<th height="23" class="required_text" scope="row">이미지 파일목록<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
		    <td colspan="3">
				<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" >
					<c:param name="param_atchFileId" value="${mtgPlaceManage.atchFileId}" />
				</c:import>								
		    </td>
	</tr>
  </c:if>	
<!--  첨부파일 테이블 레이아웃 End. /cmm/fms/selectFileInfs.do -->
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="회의실  비품정보 상세" >
<caption>회의실  비품정보 상세</caption>
  <tr> 
    <th width="20%" height="100" class="required_text"  scope="row">비품정보<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
    <td width="80%" align="center">
	<form name="fxtrsForm" method="post" action="#LINK">  
	<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
              <c:forEach var="mtgPlaceFxtrs" items="${mtgPlaceFxtrsList}" varStatus="status">
                 <c:if test="${(status.count-1)%2 == 0}"> <tr> </c:if>
                 <td width="10%" height="15" align="left"> </td>
			     <td width="20%" height="15" align="left">${mtgPlaceFxtrs.fxtrsNm}  </td> 
                 <td width="10%" height="15" align="right">${mtgPlaceFxtrs.quantity}개 </td>
                 <td width="10%" height="15" align="left"> </td>
                 <c:if test="${(status.count-1)%2 == 1}"> </tr> </c:if>
			  </c:forEach>
		</table>
	</form>
    </td>
  </tr>
</table>

<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>            
</DIV>
</body>
</html>
