<%
 /**
  * @Class Name  : EgovCcmCmmnCodeRegist.jsp
  * @Description : EgovCcmCmmnCodeRegist 화면
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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>공통코드 등록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="cmmnCode" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_CmmnCode(){
	location.href = "<c:url value='/sym/ccm/cca/EgovCcmCmmnCodeList.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
 function fn_egov_regist_CmmnCode(form){
	if(confirm("<spring:message code='common.save.msg'/>")){
		if(!validateCmmnCode(form)){ 			
			return;
		}else{
			form.submit();
		}
	}
}
-->
</script>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<DIV id="content" style="width:712px">
<!--  상단타이틀 -->
<form:form commandName="cmmnCode" name="cmmnCode" method="post">
<!--  상단 타이틀  영역 -->
<table width="700" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left"><h1 class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;공통코드 등록</h1></td>
 </tr>
</table>
<!-- 줄간격조정  -->
<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="분류코드, 코드ID, 코드ID명, 코드ID설명, 사용여부를 입력하는 공통코드 등록 테이블이다.">
<CAPTION style="display: none;">공통코드 등록</CAPTION>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row" nowrap ><label for="clCode">분류코드</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" nowrap colspan="3">
		<select name="clCode" class="select" id="clCode">
			<c:forEach var="result" items="${cmmnClCode}" varStatus="status">
				<option value='<c:out value="${result.clCode}"/>'><c:out value="${result.clCodeNm}"/></option>
			</c:forEach>			  		   
		</select>
    </td>
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text" scope="row" nowrap ><label for="codeId">코드ID</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" nowrap colspan="3">
      <form:input  path="codeId" size="6" maxlength="6" id="codeId"/>
      <form:errors path="codeId"/>
    </td>
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text" scope="row" nowrap ><label for="codeIdNm">코드ID명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" nowrap>
      <form:input  path="codeIdNm" size="60" maxlength="60" id="codeIdNm"/>
      <form:errors path="codeIdNm"/>
    </td>    
  </tr> 
  <tr> 
    <th height="23" class="required_text" scope="row" ><label for="codeIdDc">코드ID설명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td>
      <form:textarea path="codeIdDc" rows="3" cols="60" id="codeIdDc"/>
      <form:errors   path="codeIdDc"/>
    </td>
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text" scope="row" nowrap ><label for="useAt">사용여부</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="30%" nowrap class="title_left" colspan="3">
      <form:select path="useAt" id="useAt">
	      <form:option value="Y" label="Yes"/>
	      <form:option value="N" label="No"/>
      </form:select>
    </td>    
  </tr>     
</table>
<table width="700" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
</table>

<!-- 줄간격조정  -->
<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr> 
  <!-- 
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" alt="목록" width="8" height="20"></td>
  <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap><a href="#noscript" onclick="fn_egov_list_CmmnCode(); return false;">목록</a></td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" alt="목록" width="8" height="20"></td>      
  <td width="10"></td>
  -->
  <td><span class="button"><input type="submit" value="목록" onclick="fn_egov_list_CmmnCode(); return false;"></span></td>
  <td><span class="button"><input type="submit" value="저장" onclick="fn_egov_regist_CmmnCode(document.cmmnCode); return false;"></span></td>     
</tr>
</table>

<input name="cmd" type="hidden" value="<c:out value='save'/>">
</form:form>
</DIV>
</body>
</html>
