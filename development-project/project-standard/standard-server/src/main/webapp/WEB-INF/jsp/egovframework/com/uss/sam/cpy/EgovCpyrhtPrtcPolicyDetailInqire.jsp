<%
 /**
  * @Class Name : EgovCpyrhtPrtcPolicyDetailInqure.jsp
  * @Description : EgovCpyrhtPrtcPolicyDetailInqure 화면
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
<title>저작권보호정책 상세조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_cpyrhtprtcpolicylist() {

	document.CpyrhtPrtcPolicyForm.action = "<c:url value='/uss/sam/cpy/CpyrhtPrtcPolicyListInqire.do'/>";
	document.CpyrhtPrtcPolicyForm.submit();
		
}

/* ********************************************************
 * 수정처리화면
 ******************************************************** */
function fn_egov_updt_cpyrhtprtcpolicycn(cpyrhtId){

	// Update하기 위한 키값을 셋팅
	document.CpyrhtPrtcPolicyForm.cpyrhtId.value = cpyrhtId;	
	document.CpyrhtPrtcPolicyForm.action = "<c:url value='/uss/sam/cpy/CpyrhtPrtcPolicyCnUpdtView.do'/>";
	document.CpyrhtPrtcPolicyForm.submit();	
	
}

/**********************************************************
 * 삭제처리화면
 ******************************************************** */
function fn_egov_delete_cpyrhtprtcpolicycn(cpyrhtId){

	if	(confirm("<spring:message code="common.delete.msg" />"))	{	

		// Delete하기 위한 키값을 셋팅
		document.CpyrhtPrtcPolicyForm.cpyrhtId.value = cpyrhtId;	
		document.CpyrhtPrtcPolicyForm.action = "<c:url value='/uss/sam/cpy/CpyrhtPrtcPolicyCnDelete.do'/>";
		document.CpyrhtPrtcPolicyForm.submit();
			
	}	
	
}

</script>
</head>

<body>
<DIV id="content" style="width:712px">
<!-- 상단타이틀 -->
<form name="CpyrhtPrtcPolicyForm" action="<c:url value='/uss/sam/cpy/CpyrhtPrtcPolicyDetailInqire.do'/>" method="post">

<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="제목아이콘이미지">&nbsp;저작권보호정책 상세조회</h1></td>
 </tr>
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="이 표는 저작권보호정책 정보를 제공하며, 저작권보호정책내용 정보로 구성되어 있습니다 .">
  <caption>저작권보호정책 상세조회</caption>	 
  <tr> 
    <th scope="row" height="23" class="required_text" width="25%"><label for="cpyrhtPrtcPolicyCn">저작권보호정책내용</label>&nbsp;&nbsp;</th>
    <td width="75%" nowrap>    
      <textarea name="cpyrhtPrtcPolicyCn" class="textarea"  cols="70" rows="25"  style="width:450px;" readonly  title="저작권보호정책내용"><c:out value="${result.cpyrhtPrtcPolicyCn}"/></textarea>                 
    </td>
  </tr> 


  <tr> 
    <th scope="row" height="23" class="required_text" >등록일자&nbsp;&nbsp;</th>
    <td width="75%" nowrap>
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
  <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_updt_cpyrhtprtcpolicycn('<c:out value="${result.cpyrhtId}"/>'); return false;"></span></td>
  <td>&nbsp;&nbsp;</td>
  <td><span class="button"><a href="<c:url value='/uss/sam/cpy/CpyrhtPrtcPolicyCnDelete.do'/>?cpyrhtId=<c:out value='${result.cpyrhtId}'/>" onclick="fn_egov_delete_cpyrhtprtcpolicycn('<c:out value="${result.cpyrhtId}"/>'); return false;"><spring:message code="button.delete" /></a></span></td>
  <td>&nbsp;&nbsp;</td>
  <td><span class="button"><a href="<c:url value='/uss/sam/cpy/CpyrhtPrtcPolicyListInqire.do'/>" onclick="fn_egov_inqire_cpyrhtprtcpolicylist(); return false;"><spring:message code="button.list" /></a></span></td>
  <td>&nbsp;&nbsp;</td>     
</tr>
</table>

<input name="cpyrhtId" type="hidden" value="">
</form>
</DIV>

</body>
</html>
