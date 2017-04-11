<%--
  Class Name : EgovAdministrationWordMainList.jsp
  Description : 행정전문용어사전 메인 목록 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.09.21    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.09.21

    Copyright (C) 2009 by MOPAS  All right reserved.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>행정전문용어사전 메인 목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fncSelectWord(wordId) {
    document.wordForm.administWordId.value = wordId;
    document.wordForm.submit();
}
-->
</script>
</head>
<body>
<form name="wordForm" method="post" action="<c:url value='/uss/olh/awm/detailAdministrationWord.do'/>">
<DIV id="divEgovAdministrationWordMainList" style="width:200px;" align="left" >
<!--리스트역영 -->
<table width="100%" cellpadding="0" class="table-line" border="0">
<tbody>
<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
<c:if test="${fn:length(resultList) == 0}">
<tr>
<td class="lt_text6" colspan="3">
	<spring:message code="common.nodata.msg" />
</td>
</tr>
</c:if>
 <%-- 데이터를 화면에 출력해준다 --%>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
<tr>
    <td class="lt_text6">
    <div class="divDotText" style="width:60px; border:solid 0px;">
    	<span class="link"><input type="text" size="15" value="<c:out value="${resultInfo.administWordNm}"/>" onclick="fncSelectWord('<c:out value="${resultInfo.administWordId}"/>');" title="용어명"></span>
    </div>
    </td>
    <td class="lt_text6" width="60px"><c:out value="${fn:substring(resultInfo.frstRegisterPnttm, 0, 10)}"/></td>
</tr>
</c:forEach>
</tbody>
</table>
</DIV>
<input name="administWordId" type="hidden" value="" />
<input name="pageIndex" type="hidden" value="1"/>
</form>
</body>
</html>

