<%--
  Class Name : EgovOnlinePollPartcptnStatistics.jsp
  Description : 온라인POLL관리 통계 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/com/uss/olp/opp/"/>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<%-- 온라인POLL관리 목록 페이지 --%>
<c:if test="${linkType eq '1'}">
<c:set var="returnUrl" value="<c:url value='/uss/olp/opm/listOnlinePollManage.do' />" />
</c:if>
<%-- 온라인POLL참여 목록 페이지 --%>
<c:if test="${linkType eq '2'}">
<c:set var="returnUrl" value="<c:url value='/uss/olp/opp/listOnlinePollPartcptn.do' />" />
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>온라인POLL참여 통계</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_OnlinePollPartcptnStatistics(){

}

</script>
</head>
<body onLoad="fn_egov_init_OnlinePollPartcptnStatistics">
<DIV id="content" style="width:712px">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 상단타이틀 -->
<form name="QustnrQestnManageForm" action="<c:url value=''/>" method="post">
<!-- 단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;
 <%-- 온라인POLL관리 목록 페이지 --%>
<c:if test="${linkType eq '1'}">
   온라인POLL관리 통계
</c:if>
<%-- 온라인POLL참여 목록 페이지 --%>
<c:if test="${linkType eq '2'}">
   온라인POLL참여 통계
</c:if>

</td>
 </tr>
</table>
<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!-- 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >POLL명<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
		&nbsp;<c:out value="${PollManageList[0].pollNm}" />
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >POLL시작일자<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
    	&nbsp;<c:out value="${fn:substring(PollManageList[0].pollBeginDe, 0, 10)}"/>

    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >POLL종료일자<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
    	&nbsp;<c:out value="${fn:substring(PollManageList[0].pollEndDe, 0, 10)}"/>

    </td>
  </tr>
  <tr>
    <th height="23" class="required_text" >POLL종류<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td>
		<c:forEach items="${pollKindCodeList}" var="resultInfo" varStatus="pollKindStatus">
			<c:if test="${resultInfo.code eq PollManageList[0].pollKindCode}">
				&nbsp;<c:out value="${resultInfo.codeNm}" />
			</c:if>
		</c:forEach>
    </td>
  </tr>
</table>

<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!-- 그래프출력  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
<tr>
    <td colspan="2">
    	<table width="100%" border="0" cellpadding="2" cellspacing="0">
		<tr>
			<td colspan="2" height="1"></td>
		</tr>
    	<tr>
    	<td style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;background-color:#E3E3E3;">


   		<table width="100%" border="0" cellpadding="0" cellspacing="0">

   			<c:set var="chartCheck" value="0" />
   			<c:forEach items="${PollItemList}" var="resultInfo" varStatus="status2">

   			<tr>
   				<td style="background-color:#E3E3E3;" width="10px" height="28px"></td>
   				<td style="background-color:#E3E3E3;" width="100px"><c:out value="${resultInfo.pollIemNm}" escapeXml="false" /></td>
   				<td style="background-color:#E3E3E3;">



   						<c:forEach items="${statisticsList}" var="statisticsInfo" varStatus="status3">
   						<c:if test="${resultInfo.pollIemId eq statisticsInfo.pollIemId}">
   						<img src="<c:url value='/images/egovframework/com/cmm/chart/chart'/>${status2.count}.JPG" width="${statisticsInfo.pollIemPercent}px" height="8" alt="차트"> (${statisticsInfo.pollIemIdCnt})건
   						<c:set var="chartCheck" value="${chartCheck+1}" />
   						</c:if>
   						</c:forEach>
						<c:if test="${chartCheck eq '0'}">
		   				<img src="<c:url value='/images/egovframework/com/cmm/chart/chart'/>${status2.count}.JPG" width="1 px" height="8" alt="차트"> (0)건
		   				</c:if>
   				</td>
   			</tr>
    		<c:set var="chartCheck" value="${0}" />
			</c:forEach>


    		</table>
    	</td>
    	</tr>
		<tr>
			<td colspan="2" height="1"></td>
		</tr>
    	</table>

    </td>
</tr>
<tr>
	<td colspan="2" height="1"></td>
</tr>
</table>
<center>
<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
  <td class="btnBackground" nowrap><a href="<c:url value='/uss/olp/opp/listOnlinePollPartcptn.do' />"><spring:message code="button.list" /></a>
  </td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
  <td>&nbsp;</td>
</tr>
</table>
</center>
</form>
</DIV>

</body>
</html>
