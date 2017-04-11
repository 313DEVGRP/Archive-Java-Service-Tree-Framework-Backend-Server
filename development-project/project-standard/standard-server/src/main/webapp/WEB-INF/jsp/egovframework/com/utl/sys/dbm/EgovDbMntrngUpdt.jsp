<%--
  Class Name : EgovDbMntrngUpdate.jsp
  Description : DB서비스모니터링 수정 페이지
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2010.07.09    김진만          최초 생성
 
    author   : 공통서비스 개발팀 김진만
    since    : 2010.07.09
   
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>DB서비스모니터링 수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="dbMntrng" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">


/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_db_mntrng(){
    var varForm = document.getElementById("dbMntrng");
    varForm.action = "<c:url value='/utl/sys/dbm/getDbMntrngList.do'/>";
    varForm.submit()
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_db_mntrng(){
    var varForm = document.getElementById("dbMntrng");

    if(confirm("<spring:message code='common.save.msg' />")){
        varForm.action =  "<c:url value='/utl/sys/dbm/updateDbMntrng.do'/>";

        if(!validateDbMntrng(varForm)){             
            return;
        }else{
            varForm.submit();
        } 
    }
}

</script>
</head>
<body>
<%-- noscript 태그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<DIV id="content" style="width:712px">
<!-- 상단타이틀 -->
<form:form commandName="dbMntrng" id="dbMntrng" action="<c:url value='/utl/sys/dbm/updateDbMntrng.do'/>" method="post">

    <!-- 검색조건 유지 -->
    <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}' default='1' />"/>
    
    <input type="hidden" name="mntrngSttus" value="<c:out value='${dbMntrng.mntrngSttus}'/>"/>
    <!-- 상단 타이틀  영역 -->
    <table width="100%" cellpadding="8" class="table-search" border="0" summary="제목테이블">
     <tr>
      <td width="100%"class="title_left">
       <img src="<c:out value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;DB서비스모니터링 수정</td>
     </tr>
    </table>
    <!-- 줄간격조정  -->
    <table width="100%" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
    <tr>
        <td height="3px"></td>
    </tr>
    </table>
    <!-- 등록  폼 영역  -->
    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="DB서비스모니터링 수정기능을 제공한다.">
      <tr> 
        <th width="20%" height="23" class="required_text" nowrap ><label id="IdDataSourcNm" for="dataSourcNm">데이타소스명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력" title="필수입력" width="15" height="15"></th>
        <td width="80%" nowrap>
            <form:input path="dataSourcNm" size="60"  maxlength="60" readonly="true"  cssClass="readOnlyClass"/>
            <div><form:errors path="dataSourcNm" cssClass="error" /></div>  
        </td>
      </tr>
      
      <tr> 
        <th width="20%" height="23" class="required_text" nowrap ><label id="IdServerNm"  for="serverNm">서버명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력" title="필수입력" width="15" height="15"></th>
        <td>
            <form:input path="serverNm" size="60"  maxlength="60" />
            <div><form:errors path="serverNm" cssClass="error" /></div>  
        </td>
      </tr> 
      
      <tr> 
        <th width="20%" height="23" class="required_text" nowrap ><label id="IdDbmsKind"  for="dbmsKind">DBMS종류</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력" title="필수입력" width="15" height="15"></th>
        <td>
             <form:select path="dbmsKind">
                 <form:option value="" label="--선택하세요--"/>
                 <form:options items="${dbmsKindList}" itemValue="code" itemLabel="codeNm"/>
             </form:select>
             <div><form:errors path="dbmsKind" cssClass="error"/></div>
        </td>
      </tr> 
      
      <tr> 
        <th width="20%" height="23" class="required_text" nowrap ><label id="IdCeckSql"  for="ceckSql">체크SQL</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력" title="필수입력" width="15" height="15"></th>
        <td>
          <form:input path="ceckSql" size="60" maxlength="250" cssStyle="width:95%;" />
          <div><form:errors path="ceckSql" cssClass="error" /></div>  
        </td>
      </tr> 
      
      <tr> 
        <th width="20%" height="23" class="required_text" nowrap ><label id="IdMngrNm"  for="mngrNm">관리자명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력" title="필수입력" width="15" height="15"></th>
        <td>
          <form:input path="mngrNm" size="60" maxlength="60" />
          <div><form:errors path="mngrNm" cssClass="error" /></div>  
        </td>
      </tr> 
      <tr> 
        <th width="20%" height="23" class="required_text" nowrap ><label id="IdMngrEmailAddr"  for="mngrEmailAddr">관리자이메일주소</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력" title="필수입력" width="15" height="15"></th>
        <td>
          <form:input path="mngrEmailAddr" size="50" maxlength="50" />
          <div><form:errors path="mngrEmailAddr" cssClass="error" /></div>
        </td>
      </tr> 
    
    </table>
    <!-- 줄간격조정  -->
    <table width="100%" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
    <tr>
        <td height="10"></td>
    </tr>
    </table>
    <div align="center">
    <!-- 목록/저장버튼  -->
    <table border="0" cellspacing="0" cellpadding="0" align="center" summary="목록/저장 버튼을 제공한다.">
    <tr> 
        <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_save_db_mntrng(); return false;"></span></td>
        <td>
            <span class="button">
            <a href="<c:url value='/utl/sys/dbm/getDbMntrngList.do'>
                     </c:url>"
               onclick="fn_egov_list_db_mntrng(); return false;"><spring:message code="button.list" /></a>
            </span> 
        </td>

    </tr>
    </table>
    </div>
</form:form>
</DIV>

</body>
</html>