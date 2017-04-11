<%
/**
 * @Class Name : EgovBndtDiaryDetail.java
 * @Description : EgovBndtDiaryDetail jsp
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
<title>당직일지 상세</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="bndtDiary" staticJavascript="false" xhtml="true" cdata="false"/>
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
function fncEgovBndtDiary() {
		var varFrom = document.getElementById("bndtDiary");
		varFrom.cmd.value  = "updt";
		varFrom.action = "<c:url value='/uss/ion/bnt/selectBndtDiary.do'/>";
		varFrom.submit();   
}

/* ********************************************************
 * 삭제처리화면
 ******************************************************** */
function fncDeleteBndtDiary() {
    var varFrom = document.getElementById("bndtDiary");
    varFrom.action = "<c:url value='/uss/ion/bnt/deleteBndtDiary.do'/>";
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
<form:form commandName="bndtDiary" name="bndtDiary" method="post" action="${pageContext.request.contextPath}/uss/ion/bnt/selectBndtDiary.do">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
<input name="cmd" type="hidden" value="<c:out value='detail'/>"/>
<input name="bndtId" type="hidden" value="<c:out value='${bndtDiaryVO.bndtId}'/>"/>
<input name="bndtDe" type="hidden" value="<c:out value='${bndtDiaryVO.bndtDe}'/>"/>


<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="30%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;당직일지 상세</h1></td>
  <td width="60%">&nbsp;</td>
  <th width="10%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><span class="button"><a href="<c:url value='/uss/ion/bnt/selectBndtDiary.do'/>?cmd=updt&bndtId=<c:out value='${bndtDiaryVO.bndtId}'/>&bndtDe=<c:out value='${bndtCeckManageVO.bndtDe}'/>" onclick="fncEgovBndtDiary(); return false;"><spring:message code="button.update" /></a></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/bnt/deleteBndtDiary.do'/>?bndtId=<c:out value='${bndtDiaryVO.bndtId}'/>&bndtDe=<c:out value='${bndtDiaryVO.bndtDe}'/>" onclick="fncDeleteBndtDiary(); return false;"><spring:message code="button.delete" /></a></span></td>     
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/bnt/EgovBndtManageList.do'/>" onclick="fncBndtManageList(); return false;"><spring:message code="button.list" /></a></span></td>     
        </tr>
       </table>
  </th>  
 </tr>
</table>

<!-- ------------------------------------------------------------------ 등록  폼 영역  -->
	<table width="700" cellpadding="0" class="table-line" border="0"  summary="당직일지 상세" >
       <caption>당직일지 상세</caption>
	<thead>
	<tr>  
		<th class="title" width="40%" scope="col">당직체크목록</th>
		<th class="title" width="30%" scope="col">양호</th>
		<th class="title" width="30%" scope="col">불량</th>
	</tr>
	</thead>     
	<tbody>
	<c:forEach items="${bndtDiaryList}" var="resultInfo" varStatus="status">
	<input name="bndtCeckCd" type="hidden" value="<c:out value='${resultInfo.bndtCeckCd}'/>"/>
	<input name="bndtCeckSe" type="hidden" value="<c:out value='${resultInfo.bndtCeckSe}'/>"/>
	<tr>
		<td class="lt_text3" ><c:out value="${resultInfo.bndtCeckCdNm}"/></td>
		<c:if test="${resultInfo.bndtCeckSe == '99'}">
		        <td class="lt_text3"  colspan=4>
		           <input name="chckSttus${resultInfo.bndtCeckSe}${resultInfo.bndtCeckCd}" type="text" size="70" value="<c:out value='${resultInfo.chckSttus}'/>" maxlength="2000" style="width:90%;" title="<c:out value="${resultInfo.bndtCeckCdNm}"/>"  readOnly>
		        </td>
		</c:if>
		<c:if test="${resultInfo.bndtCeckSe != '99'}">
			<c:if test="${resultInfo.chckSttus == '1'}">
			   <td class="lt_text3" ><input name="chckSttus${resultInfo.bndtCeckSe}${resultInfo.bndtCeckCd}" type="radio" value="1" title="양호"   disabled checked></td>
			   <td class="lt_text3" ><input name="chckSttus${resultInfo.bndtCeckSe}${resultInfo.bndtCeckCd}" type="radio" value="2" title="불량"   disabled></td>
			</c:if>
			<c:if test="${resultInfo.chckSttus == '2'}">
			   <td class="lt_text3" ><input name="chckSttus${resultInfo.bndtCeckSe}${resultInfo.bndtCeckCd}" type="radio" value="1" title="양호"   disabled></td>
			   <td class="lt_text3" ><input name="chckSttus${resultInfo.bndtCeckSe}${resultInfo.bndtCeckCd}" type="radio" value="2" title="불량"   disabled checked></td>
			</c:if>
		</c:if>
	</tr>   
	</c:forEach>
	</tbody>  
	</table>

</form:form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>  
</DIV>
</body>
</html>