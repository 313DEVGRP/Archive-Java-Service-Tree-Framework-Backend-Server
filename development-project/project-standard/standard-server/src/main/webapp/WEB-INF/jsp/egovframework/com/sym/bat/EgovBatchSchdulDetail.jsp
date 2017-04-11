<%--
  Class Name : EgovBatchSchdulDetail.jsp
  Description : 배치스케줄 상세조회 페이지
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2010.08.25    김진만          최초 생성
 
    author   : 공통서비스 개발팀 김진만
    since    : 2010.08.25
   
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>배치스케줄 상세조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javaScript" language="javascript">


/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list(){
    var varForm = document.getElementById("batchSchdulForm");
    varForm.action = "<c:url value='/sym/bat/getBatchSchdulList.do' />";
    varForm.submit()
}
/* ********************************************************
 * 수정화면으로  바로가기
 ******************************************************** */
function fn_egov_update_view(){
    var varForm = document.getElementById("batchSchdulForm");
    
    varForm.action = "<c:url value='/sym/bat/getBatchSchdulForUpdate.do' />";
    varForm.submit();
}
/* ********************************************************
 * 삭제 처리
 ******************************************************** */
 function fn_egov_delete(){
        var vForm = document.batchSchdulForm;
        if(confirm("<spring:message code='common.delete.msg' />")){
            vForm.action = "<c:url value='/sym/bat/deleteBatchSchdul.do' />";
            vForm.submit();
        }
}
</script>
</head>

<body >

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<DIV id="content" style="width:712px">

<form name="batchSchdulForm"  id="batchSchdulForm" action="<c:url value='/sym/bat/getBatchSchdul.do'/>" method="post">
    <input name="batchSchdulId" type="hidden" value="<c:out value='${resultInfo.batchSchdulId}'/>"/>
    <!-- 검색조건 유지 -->
    <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}' default="1"/>"/>

    <!-- 상단 타이틀  영역 -->
    <table width="100%" cellpadding="8" class="table-search" border="0" summary="제목테이블">
     <tr>
      <td width="100%"class="title_left">
       <h1><img src="<c:out value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;배치스케줄 상세조회</h1></td>
     </tr>
    </table>
    <!--  줄간격조정  -->
    <table width="100%" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
    <tr>
        <td height="3px"></td>
    </tr>
    </table>

    <!-- 등록  폼 영역  -->
    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary=" 배치스케줄 상세정보 테이블.">
      <caption>배치스케줄 상세조회</caption>
      <tr> 
        <th width="20%" height="23" class="required_text" scope="row" nowrap="nowrap" >배치스케줄ID</th>
        <td width="80%">
            <c:out value="${resultInfo.batchSchdulId}" escapeXml="false" /> 
        </td>
      </tr>

      <tr> 
        <th height="23" class="required_text" scope="row" >배치작업ID</th>
        <td>
            <c:out value="${resultInfo.batchOpertId}" escapeXml="false" /> 
        </td>
      </tr> 

      <tr> 
        <th height="23" class="required_text" scope="row" >배치작업명</th>
        <td>
            <c:out value="${resultInfo.batchOpertNm}" escapeXml="false" /> 
        </td>
      </tr> 
    
      <tr> 
        <th height="23" class="required_text" scope="row" >실행주기</th>
        <td>
            <c:out value="${resultInfo.executCycleNm}" escapeXml="false" />&nbsp;<c:out value="${resultInfo.executSchdul}" escapeXml="false" />  
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
    <!-- 목록/저장버튼  -->
    <table border="0" cellspacing="0" cellpadding="0" align="center" summary="저장/삭제/목록 버튼을 제공한다.">
    <tr> 
        <td>
            <span class="button">
            <a href="<c:url value='/sym/bat/getBatchSchdulForUpdate.do'>
                     </c:url>"
               onclick="fn_egov_update_view(); return false;"><spring:message code="button.update" /></a>
            </span> 
        </td>
        <td><span class="button"><input type="submit" value="<spring:message code="button.delete" />" onclick="fn_egov_delete(); return false;"></span></td>
        <td>
            <span class="button">
            <a href="<c:url value='/sym/bat/getBatchSchdulList.do'>
                     </c:url>"
               onclick="fn_egov_list(); return false;"><spring:message code="button.list" /></a>
            </span> 
        </td>
    </tr>
    </table>
    </div>

</form>
</DIV>

</body>
</html>