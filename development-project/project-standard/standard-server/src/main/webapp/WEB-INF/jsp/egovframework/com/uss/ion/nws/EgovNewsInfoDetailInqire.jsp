<%
 /**
  * @Class Name : EgovNewsInfoDetailInqure.jsp
  * @Description : EgovNewsInfoDetailInqure 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.02.01   박정규              최초 생성
  *
  *  @author 공통서비스팀 
  *  @since 2009.02.01
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>뉴스정보목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" >
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_newsinfo(){



}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_newsinfolist() {

    document.NewsInfoManageForm.action = "<c:url value='/uss/ion/nws/NewsInfoListInqire.do'/>";
    document.NewsInfoManageForm.submit();
        
}

/* ********************************************************
 * 수정처리화면
 ******************************************************** */
function fn_egov_updt_newsinfo(newsId){

    // Update하기 위한 키값(newsId)을 셋팅
    document.NewsInfoManageForm.newsId.value = newsId;  
    document.NewsInfoManageForm.action = "<c:url value='/uss/ion/nws/NewsInfoUpdtView.do'/>";
    document.NewsInfoManageForm.submit();   
    
}


function fn_egov_delete_newsinfo(newsId){

    if  (confirm("<spring:message code="common.delete.msg" />"))    {   

        // Delete하기 위한 키값(newsId)을 셋팅
        document.NewsInfoManageForm.newsId.value = newsId;  
        document.NewsInfoManageForm.action = "<c:url value='/uss/ion/nws/NewsInfoDelete.do'/>";
        document.NewsInfoManageForm.submit();
            
    }
    
    
}

</script>
</head>

<body onLoad="fn_egov_initl_newsinfo();">
<DIV id="content" style="width:700px">
<!-- 상단타이틀 -->
<form name="NewsInfoManageForm" action="<c:url value='/uss/ion/nws/NewsInfoDetailInqire.do'/>" method="post">

<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="타이틀">&nbsp;뉴스정보 상세조회</td>
 </tr>
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="뉴스정보 정보테이블.">

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >뉴스제목&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
        <c:out value="${result.newsSj}"/>  
    </td>
  </tr>

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap ><label id="idNewsCn" for="newsCn">뉴스내용</label>&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
      <textarea name="newsCn" id="newsCn" class="textarea"  cols="300" rows="30"  style="width:450px;" readonly><c:out value="${result.newsCn}"/></textarea>                   
    </td>
  </tr>
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >뉴스출처&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
        <c:out value="${result.newsOrigin}"/>
    </td>
  </tr>

  <tr> 
    <th height="23" class="required_text" >게시일자&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
        <c:out value='${fn:substring(result.ntceDe, 0,4)}'/>-<c:out value='${fn:substring(result.ntceDe, 4,6)}'/>-<c:out value='${fn:substring(result.ntceDe, 6,8)}'/>
    </td>
  </tr> 

  
  <c:if test="${result.atchFileId != ''}">
    <tr> 
        <th height="23">첨부파일 목록</th>
            <td colspan="6">
                <c:import url="/cmm/fms/selectFileInfs.do" >
                    <c:param name="param_atchFileId" value="${result.atchFileId}" />
                </c:import>                             
            </td>
    </tr>
  </c:if>      

  
  <tr> 
    <th height="23" class="required_text" >등록일자&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
        <c:out value="${result.lastUpdusrPnttm}"/>
    </td>
  </tr> 

   
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <td height="10px"></td>
</tr>
</table>

<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr> 
    <td>
        <span class="button">
        <a href="<c:url value='/uss/ion/nws/NewsInfoUpdtView.do'/>"
           onclick="fn_egov_updt_newsinfo('<c:out value="${result.newsId}"/>'); return false;"><spring:message code="button.update" /></a>
        </span> 
    </td>
    <td><span class="button"><input type="submit" value="<spring:message code="button.delete" />" onclick="fn_egov_delete_newsinfo('<c:out value="${result.newsId}"/>'); return false;"></span></td>
    <td>
        <span class="button">
        <a href="<c:url value='/uss/ion/nws/NewsInfoListInqire.do'/>"
           onclick="fn_egov_inqire_newsinfolist(); return false;"><spring:message code="button.list" /></a>
        </span> 
    </td>

        
</tr>
</table>

<input name="newsId" type="hidden" value="">
</form>
</DIV>

</body>
</html>
