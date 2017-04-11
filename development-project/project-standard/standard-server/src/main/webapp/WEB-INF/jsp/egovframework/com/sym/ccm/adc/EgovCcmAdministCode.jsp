<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 /**
  * @Class Name  : EgovCcmAdministCode.jsp
  * @Description : EgovCcmAdministCode 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.04.01   이중호              최초 생성
  *
  *  @author 공통서비스팀
  *  @since 2009.04.01
  *  @version 1.0
  *  @see
  *
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="ko">
<head>
<title>상위행정구역코드 목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialogCallee.js'/>" ></script>
<script type="text/javaScript" language="javascript">

	/* ********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit(){
		getDialogArguments();
		var varParam        = window.dialogArguments;
		var varForm			= document.getElementById("Form");
		var pForm			= parent.document.getElementById("pForm");
		if (varParam.administZoneSe) {
			var administZoneSe = varParam.administZoneSe;
			if(pForm.init.value != "OK") {
				pForm.init.value  = "OK";
				varForm.action      = "<c:url value='/sym/ccm/adc/EgovCcmAdministCode.do'/>";
				varForm.searchCondition.value  = administZoneSe;
				varForm.submit();
			}
		}
	}
	
	/* ********************************************************
	 * 페이징 처리 함수
	 ******************************************************** */
	function linkPage(pageNo){
		document.listForm.pageIndex.value = pageNo;
		document.listForm.action = "<c:url value='/sym/ccm/adc/EgovCcmAdministCode.do'/>";
	   	document.listForm.submit();
	}
	
	/* ********************************************************
	 * 조회 처리
	 ******************************************************** */
	function fnSearch(){
		document.listForm.pageIndex.value = 1;
	   	document.listForm.submit();
	}
	
	/* ********************************************************
	* 결과 반환
	******************************************************** */
	function fnReturnDay(administZoneCode,administZoneNm){
		var retVal   = new Object();
		retVal.administZoneCode = administZoneCode;
		retVal.administZoneNm   = administZoneNm;
		setReturnValue(retVal);
		parent.window.returnValue = retVal;
		parent.window.close();
	}
</script>
</head>

<body onLoad="javascript:fnInit();">
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<DIV id="content" style="display">

<form name="listForm" action="<c:url value='/sym/ccm/adc/EgovCcmAdministCode.do'/>" method="post">
<table width="700" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="35%"class="title_left"><h1 class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;상위행정구역코드 목록</h1></td>
  <th>
  </th>
	  <td width="25%">
		   <c:if test="${searchVO.searchCondition == '1'}">법정동 지역명</c:if>
		   <c:if test="${searchVO.searchCondition == '2'}">행정동 지역명</c:if>
	  </td>
  <td width="30%">
    <input name="searchKeyword" type="text" size="20" value="${searchVO.searchKeyword}"  maxlength="20" title="" id="searchKeyword">
  </td>
  <th width="10%">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><span class="button"><input type="submit" value="조회" onclick="fnSearch(); return false;"></span></td>
    </tr>
   </table>
  </th>
 </tr>
</table>

<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<table width="700" cellpadding="0" class="table-line" border="0" summary="구분, 행정구역코드, 행정구역명이 나오는 행정코드 목록을 조회한다.">
<CAPTION style="display: none;">상위행정구역코드 목록</CAPTION>
<thead>
<tr>
	<th scope="col" class="title" width="10%" nowrap>순번</th>
	<th scope="col" class="title" width="15%" nowrap>구분</th>
	<th scope="col" class="title" width="15%" nowrap>행정구역코드</th>
	<th scope="col" class="title" width="60%" nowrap>행정구역명</th>
</tr>
</thead>
<tbody>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
<tr style="cursor:pointer;cursor:hand;" onclick="javascript:fnReturnDay('${resultInfo.administZoneCode}','${resultInfo.administZoneNm}');">
	<td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/></td>
	<td class="lt_text3" nowrap>
		<c:choose>
			<c:when test='${resultInfo.administZoneSe == "1"}'>법정동</c:when>
			<c:when test='${resultInfo.administZoneSe == "2"}'>행정동</c:when>
		</c:choose>
	</td>
	<td class="lt_text3" nowrap>${resultInfo.administZoneCode}</td>
	<td class="lt_text"  nowrap>${resultInfo.administZoneNm}</td>
</tr>
</c:forEach>

<c:if test="${fn:length(resultList) == 0}">
	<tr>
		<td class="lt_text3" colspan=5>
			<spring:message code="common.nodata.msg" />
		</td>
	</tr>
</c:if>


</tbody>
</table>

<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<div align="center">
	<div>
		<ui:pagination paginationInfo = "${paginationInfo}"
				type="image"
				jsFunction="linkPage"
				/>
	</div>
</div>

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

</form>
<form name="Form" id="Form" method="post" action="<c:url value='/sym/ccm/adc/EgovCcmAdministCode.do'/>">
	<input type=hidden name="administZoneSe">
	<input type=hidden name="administZoneCode">
	<input type=hidden name="searchCondition">
	<input type="submit" id="invisible" class="invisible">
</form>
</DIV>
</body>
</html>
