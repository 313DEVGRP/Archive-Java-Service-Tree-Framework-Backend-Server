<%--
  Class Name : EgovDbMntrngLogDetail.jsp
  Description : DB서비스모니터링로그 상세조회 페이지
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2010.08.07    김진만          최초 생성
 
    author   : 공통서비스 개발팀 김진만
    since    : 2010.08.07
   
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%pageContext.setAttribute("crlf", "\r\n"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>DB서비스모니터링로그 상세조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javaScript" language="javascript">


/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list(){
    var varForm = document.getElementById("dbMntrngLogForm");
    varForm.action = "<c:url value='/utl/sys/dbm/getDbMntrngLogList.do'/>";
    varForm.submit()
}
</script>
</head>

<body >

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<DIV id="content" style="width:712px">

<form name="dbMntrngLogForm"  id="dbMntrngLogForm" action="<c:url value='/utl/sys/dbm/getDbMntrngLog.do'/>" method="post">
    <input name="logId" type="hidden" value="<c:out value='${resultInfo.logId}'/>"/>
    <!-- 검색조건 유지 -->
    <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}' default='1' />"/>
    <input type="hidden" name="searchKeywordFrom" value="<c:out value='${searchVO.searchKeywordFrom}'/>">
    <input type="hidden" name="searchKeywordTo" value="<c:out value='${searchVO.searchKeywordTo}'/>">

    <!-- 상단 타이틀  영역 -->
    <table width="100%" cellpadding="8" class="table-search" border="0" summary="제목테이블">
     <tr>
      <td width="100%"class="title_left">
       <img src="<c:out value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;DB서비스모니터링로그 상세조회</td>
     </tr>
    </table>
    <!--  줄간격조정  -->
    <table width="100%" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
    <tr>
        <td height="3px"></td>
    </tr>
    </table>

    <!-- 등록  폼 영역  -->
    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="등록된 DB서비스모니터링로그에 대한 상세정보를 제공합니다.">
      <tr> 
        <th width="20%" height="23" class="required_text" nowrap="nowrap" >로그ID</th>
        <td width="80%">
            <c:out value="${resultInfo.logId}" escapeXml="false" /> 
        </td>
      </tr>
    
      <tr> 
        <th width="20%" height="23" class="required_text" nowrap="nowrap" >데이타소스명</th>
        <td width="80%">
            <c:out value="${resultInfo.dataSourcNm}" escapeXml="false" /> 
        </td>
      </tr>
    
      <tr> 
        <th height="23" class="required_text" >서버명</th>
        <td>
            <c:out value="${resultInfo.serverNm}" escapeXml="false" /> 
        </td>
      </tr> 
      
      <tr> 
        <th height="23" class="required_text" >DBMS종류</th>
        <td>
            <c:out value="${resultInfo.dbmsKindNm}" escapeXml="false" /> 
        </td>
      </tr> 
      
      <tr> 
        <th height="23" class="required_text" >체크SQL</th>
        <td>
            <c:out value="${resultInfo.ceckSql}" escapeXml="false" /> 
        </td>
      </tr> 
      
      <tr> 
        <th height="23" class="required_text" >관리자명</th>
        <td>
            <c:out value="${resultInfo.mngrNm}" escapeXml="false" /> 
        </td>
      </tr> 
      <tr> 
        <th height="23" class="required_text" >관리자이메일주소</th>
        <td>
            <c:out value="${resultInfo.mngrEmailAddr}" escapeXml="false" /> 
        </td>
      </tr> 
      <tr> 
        <th height="23" class="required_text" >모니터링상태</th>
        <td>
            <c:out value="${resultInfo.mntrngSttusNm}" escapeXml="false" /> 
        </td>
      </tr> 
      <tr> 
        <th height="23" class="required_text" >로그정보</th>
        <td>
            <c:out value="${resultInfo.logInfo}" escapeXml="false" /> 
        </td>
      </tr> 
      <tr> 
        <th height="23" class="required_text" >모니터링시각</th>
        <td>
            <c:out value="${resultInfo.creatDt}" escapeXml="false" /> 
        </td>
      </tr> 
    </table>
    <!--  줄간격조정  -->
    <table width="100%" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
    <tr>
        <td height="10"></td>
    </tr>
    </table>
    <div align="center">
    <!-- 목록버튼  -->
    <table border="0" cellspacing="0" cellpadding="0" align="center" summary="목록 버튼을 제공한다.">
    <tr> 
        <td>
            <span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list(); return false;"></span>
        </td>
    </tr>
    </table>
    </div>

</form>
</DIV>

</body>
</html>