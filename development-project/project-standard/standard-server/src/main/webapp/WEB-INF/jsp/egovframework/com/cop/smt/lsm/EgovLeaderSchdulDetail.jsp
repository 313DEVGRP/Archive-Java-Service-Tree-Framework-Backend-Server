<%--
  Class Name : EgovLeaderSchdulDetail.jsp
  Description : 간부일정관리 상세보기
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2010.06.29    장철호          최초 생성
     2010.09.01    장철호          수정 (보안관련 분리)
 
    author   : 공통서비스 개발팀 장철호
    since    : 2010.06.29
   
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<%
String sLinkType = request.getParameter("linkType") == null ? "" : (String)request.getParameter("linkType");
%>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cop/smt/lsm/"/>
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/cop/smt/lsm/"/> 
<c:set var="sLinkType" value="<%=sLinkType %>"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javaScript" language="javascript">


/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_LeaderSchdul(){

}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_LeaderSchdul(){
	var vFrom = document.leaderSchdulVO;
	vFrom.action = "<c:url value='/cop/smt/lsm/usr/selectLeaderSchdulList.do' />";
	vFrom.submit();
}
/* ********************************************************
 * 수정화면으로가기
 ******************************************************** */
function fn_egov_modify_LeaderSchdul(){
	var vFrom = document.leaderSchdulVO;
	vFrom.action = "<c:url value='/cop/smt/lsm/mng/modifyLeaderSchdul.do' />";;
	vFrom.submit();

}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_LeaderSchdul(){
	var vFrom = document.leaderSchdulVO;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.action = "<c:url value='/cop/smt/lsm/mng/deleteLeaderSchdul.do' />";
		vFrom.submit();
	}
}
</script>
<title>간부일정관리 상세조회</title>
</head>
<body onLoad="fn_egov_init_LeaderSchdul();">
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<DIV id="content" style="width:712px">
<!-- 상단타이틀 -->
<form name="leaderSchdulVO" id="leaderSchdulVO" action="<c:url value='/cop/smt/lsm/mng/modifyLeaderSchdul.do'/>" method="post">
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
  <h1><img src="${ImgUrl}icon/tit_icon.gif"  width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;간부일정관리 상세보기</h1></td>
 </tr>
</table>
<!-- //상단타이틀 -->
<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!-- //줄간격조정  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="이 표는 간부일정정보를 상세조회하기 위한 표이며, 일정구분, 간부, 일정명, 일정내용, 일정장소, 반복구분, 날짜/시간, 담당자 정보로 구성되어 있습니다 .">
<caption>간부일정관리 상세조회</caption>
  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >일정구분<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
    <td width="80%" >
    <c:forEach items="${schdulSe}" var="schdulSeInfo" varStatus="status">
    <c:if test="${schdulSeInfo.code eq leaderSchdulVO.schdulSe}">	
     <c:out value="${fn:replace(schdulSeInfo.codeNm , crlf , '<br/>')}" escapeXml="false" />
    </c:if>
    </c:forEach>
    </td>
 </tr>
 <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >간부<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
    <td width="80%" >
    <c:out value="${fn:replace(leaderSchdulVO.leaderName , crlf , '<br/>')}" escapeXml="false" />
    </td>
  </tr>
 <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >일정명<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
    <td width="80%" >
      <c:out value="${fn:replace(leaderSchdulVO.schdulNm , crlf , '<br/>')}" escapeXml="false" />
    </td>
  </tr>
  <tr> 
    <th scope="row" height="23" class="required_text" >일정내용<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
    <td>
        <br/>
    	<c:out value="${fn:replace(leaderSchdulVO.schdulCn , crlf , '<br/>')}" escapeXml="false" />
    	<br/><br/>
    </td>
  </tr>
  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >일정장소<img src="${ImgUrl}icon/no_required.gif" width="15" height="15" alt="선택항목"></th>
    <td width="80%" >
      <c:out value="${fn:replace(leaderSchdulVO.schdulPlace , crlf , '<br/>')}" escapeXml="false" />
    </td>
  </tr>
  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >반복구분<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
    <td width="80%">
    <c:forEach items="${reptitSeCode}" var="schdulSeInfo" varStatus="status">
    <c:if test="${schdulSeInfo.code eq leaderSchdulVO.reptitSeCode}">	
     <c:out value="${fn:replace(schdulSeInfo.codeNm , crlf , '<br/>')}" escapeXml="false" />
    </c:if>
    </c:forEach>
    </td>
  </tr>
  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >날짜/시간<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
    <td width="80%" >
    ${fn:substring(leaderSchdulVO.schdulBgnDe, 0, 4)}-${fn:substring(leaderSchdulVO.schdulBgnDe, 4, 6)}-${fn:substring(leaderSchdulVO.schdulBgnDe, 6, 8)}  
    ~ 
    <c:choose>
    <c:when test="${leaderSchdulVO.reptitSeCode eq '1'}">	
    	
    </c:when>
    <c:otherwise>
	${fn:substring(leaderSchdulVO.schdulEndDe, 0, 4)}-${fn:substring(leaderSchdulVO.schdulEndDe, 4, 6)}-${fn:substring(leaderSchdulVO.schdulEndDe, 6, 8)}  
	</c:otherwise>   
    </c:choose>
    ${fn:substring(leaderSchdulVO.schdulBgnDe, 8, 10)}시  ${fn:substring(leaderSchdulVO.schdulBgnDe, 10, 12)}분
    ~
    ${fn:substring(leaderSchdulVO.schdulEndDe, 8, 10)}시  ${fn:substring(leaderSchdulVO.schdulEndDe, 10, 12)}분 
    </td>
  </tr>
  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >담당자<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
    <td width="80%" >
    <c:out value="${fn:replace(leaderSchdulVO.schdulChargerName , crlf , '<br/>')}" escapeXml="false" />
    </td>
  </tr>
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="10"></td>
</tr>
</table>
<!-- //줄간격조정  -->
<center>
<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr> 
 <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_modify_LeaderSchdul(); return false;"></span></td>
  <td>&nbsp;&nbsp;</td>
 <td><span class="button"><a href="<c:url value='/cop/smt/lsm/mng/deleteLeaderSchdul.do'/>?schdulId=<c:out value='${leaderSchdulVO.schdulId}'/>" onclick="fn_egov_delete_LeaderSchdul(); return false;"><spring:message code="button.delete" /></a></span></td>
 <td>&nbsp;&nbsp;</td>
 <td><span class="button"><a href="<c:url value='/cop/smt/lsm/usr/selectLeaderSchdulList.do'/>" onclick="fn_egov_list_LeaderSchdul(); return false;"><spring:message code="button.list" /></a></span></td>
</tr>
</table>
<!-- //목록/저장버튼  -->
</center>
<input name="schdulId" type="hidden" value="${leaderSchdulVO.schdulId}">
<input name="schdulDe" type="hidden" value="${leaderSchdulVO.schdulDe}">
<input name="linkType" type="hidden" value="${sLinkType}">
<input name="searchMode" type="hidden" value="${leaderSchdulVO.searchMode}">
<input name="year" type="hidden" value="${leaderSchdulVO.year}">
<input name="month" type="hidden" value="${leaderSchdulVO.month}">
<input name="week" type="hidden" value="${leaderSchdulVO.week}">
<input name="day" type="hidden" value="${leaderSchdulVO.day}">
</form>
</DIV>

</body>
</html>
