<%
 /**
  * @Class Name : EgovSiteInfoUpdt.jsp
  * @Description : EgovSiteInfoUpdt 화면
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>용어사전수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" >

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="siteManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_siteinfo(){

    // 첫 입력란에 포커스..
    siteManageVO.siteNm.focus();
    
}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_updt_siteinfo(form, siteId){

    // 서버사이드 테스트용
    /*  
        form.action = "<c:url value='/uss/ion/sit/SiteInfoUpdt.do'/>";
        form.submit(); 
        return;
    */

        if (!validateSiteManageVO(form)) {
                        
            return;
            
        } else {

            form.siteId.value = siteId;
            form.action = "<c:url value='/uss/ion/sit/SiteInfoUpdt.do'/>";
            form.submit();
            
        } 
        
}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_sitelist() {

    siteManageVO.action = "<c:url value='/uss/ion/sit/SiteListInqire.do'/>";
    siteManageVO.submit();
        
}


</script>
</head>
<body onLoad="fn_egov_initl_siteinfo();">
<DIV id="content" style="width:700px">
<!-- 상단타이틀 -->
<form:form commandName="siteManageVO" action="" method="post"> 
      
<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0" summary="제목테이블">
 <tr>
  <td width="100%"class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목이미지">&nbsp;사이트정보 수정</td>
 </tr>
</table>

<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="사이트정보 수정테이블">
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap ><label id="idSiteNm" for="siteNm">사이트명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력"></th>
    <td width="80%" nowrap>
        <form:input path="siteNm" size="70" maxlength="70" />
        <div><form:errors path="siteNm"/></div>           
    </td>
  </tr>
  
  <tr> 
    <th height="23" class="required_text" ><label id="idSiteUrl" for="siteUrl">사이트 URL</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력"></th>
    <td>
        <form:input path="siteUrl" size="70" maxlength="70" />
        <div><form:errors path="siteUrl"/></div>                
    </td>
  </tr> 
  
  <tr> 
    <th height="23" class="required_text" ><label id="idSiteDc" for="siteDc">사이트 설명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력"></th>
    <td> 
      <form:textarea path="siteDc" cols="200" rows="10" cssClass="txaClass" />   
      <div><form:errors path="siteDc"/></div>                                
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" ><label id="idSiteThemaClCode" for="siteThemaClCode">사이트주제분류</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력"></th>
    <td>
        <form:select path="siteThemaClCode">
            <form:options items="${resultList}" itemValue="code" itemLabel="codeNm"/>
        </form:select>
        <div><form:errors path="siteThemaClCode"/></div>                                                                  
    </td>
  </tr> 

  <tr> 
    <th height="23" class="required_text" ><label id="idActvtyAt" for="actvtyAt">활성여부</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력"></th>
    <td>
        활성:   <input type="radio" name="actvtyAt" class="radio1" value="Y" <c:if test="${result.actvtyAt == 'Y'}">checked</c:if> >&nbsp;
        비활성: <input type="radio" name="actvtyAt" class="radio1" value="N" <c:if test="${result.actvtyAt == 'N'}">checked</c:if> >&nbsp;                                      
    </td>
        
    
  </tr> 

  <tr> 
    <th height="23" class="required_text" ><label id="idUseAt" for="useAt">사용여부</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력"></th>
    <td>
        사용:   <input type="radio" name="useAt" class="radio2" value="Y" <c:if test="${result.useAt == 'Y'}">checked</c:if> >&nbsp;
        미사용: <input type="radio" name="useAt" class="radio2" value="N" <c:if test="${result.useAt == 'N'}">checked</c:if> >&nbsp;     
    </td>
  </tr> 
  
   
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <td height="3px"></td>
</tr>
</table>

<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
    <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_updt_siteinfo(document.forms[0],'<c:out value="${result.siteId}"/>'); return false;"></span></td>
    <td>&nbsp;&nbsp;</td>
    <td>
        <span class="button">
        <a href="<c:url value='/uss/ion/sit/SiteListInqire.do'/>"
           onclick="javascript:fn_egov_inqire_sitelist(); return false;"><spring:message code="button.list" /></a>
        </span> 
    </td>
    
</tr>
</table>

<input name="siteId" type="hidden" value="">

</form:form>
</DIV>

</body>
</html>
