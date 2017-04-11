<%
 /**
  * @Class Name : EgovHpcmDetailInqure.jsp
  * @Description : EgovHpcmDetailInqure 화면
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
<title>도움말상세조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_hpcmcn(){



}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_hpcmlist() {

	document.HpcmManageForm.action = "<c:url value='/uss/olh/hpc/HpcmListInqire.do'/>";
	document.HpcmManageForm.submit();
		
}

/* ********************************************************
 * 수정처리화면
 ******************************************************** */
function fn_egov_updt_hpcmcn(hpcmId){

	// Update하기 위한 키값(recomendSiteId)을 셋팅
	document.HpcmManageForm.hpcmId.value = hpcmId;	
	document.HpcmManageForm.action = "<c:url value='/uss/olh/hpc/HpcmCnUpdtView.do'/>";
	document.HpcmManageForm.submit();	
	
}


function fn_egov_delete_hpcmcn(hpcmId){

	if	(confirm("<spring:message code="common.delete.msg" />"))	{	

		// Delete하기 위한 키값(hpcmId)을 셋팅
		document.HpcmManageForm.hpcmId.value = hpcmId;	
		document.HpcmManageForm.action = "<c:url value='/uss/olh/hpc/HpcmCnDelete.do'/>";
		document.HpcmManageForm.submit();
			
	}
	
	
}

</script>
</head>

<body onLoad="fn_egov_initl_hpcmcn();">
<DIV id="content" style="width:700px">
<!-- 상단타이틀 -->
<form name="HpcmManageForm" action="<c:url value='/uss/olh/hpc/HpcmCnUpdtView.do'/>" method="post">

<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="제목아이콘이미지">&nbsp;도움말상세조회</h1></td>
 </tr>
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="도움말에 대한 정보를 조회합니다.">
<caption>도움말상세조회</caption>
  <tr> 
    <th scope="row" height="23" class="required_text" nowrap >도움말구분&nbsp;&nbsp;</th>
    <td>
    	<c:out value="${result.hpcmSeCodeNm}"/>  
    </td>
  </tr>

  <tr> 
    <th scope="row" height="23" class="required_text" nowrap ><label for="hpcmDf">도움말정의</label>&nbsp;&nbsp;</th>
    <td>
      <textarea name="hpcmDf" class="textarea"  cols="300" rows="5"  style="width:450px;"  readonly title="도움말정의"><c:out value="${result.hpcmDf}"/>
      </textarea>                   
    </td>
  </tr>
  
  <tr> 
    <th scope="row" height="23" class="required_text" ><label for="hpcmDc">도움말설명</label>&nbsp;&nbsp;</th>
    <td>    
      <textarea name="hpcmDc" class="textarea"  cols="300" rows="30"  style="width:450px;"  readonly title="도움말설명"><c:out value="${result.hpcmDc}"/>
      </textarea>                                    
    </td>
  </tr> 

  <tr> 
    <th scope="row" height="23" class="required_text" >등록일자&nbsp;&nbsp;</th>
    <td>
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
  <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_updt_hpcmcn('<c:out value="${result.hpcmId}"/>'); return false;"></span></td>
  <td>&nbsp;&nbsp;</td>
  <td><span class="button"><a href="<c:url value='/uss/olh/hpc/HpcmCnDelete.do'/>?hpcmId=<c:out value='${result.hpcmId}'/>" onclick="fn_egov_delete_hpcmcn('<c:out value="${result.hpcmId}"/>'); return false;"><spring:message code="button.delete" /></a></span></td>
  <td>&nbsp;&nbsp;</td>
  <td><span class="button"><a href="<c:url value='/uss/olh/hpc/HpcmListInqire.do'/>" onclick="fn_egov_inqire_hpcmlist(); return false;"><spring:message code="button.list" /></a></span></td>
  <td>&nbsp;&nbsp;</td>      
</tr>
</table>

<input name="hpcmId" type="hidden" value="">
</form>
</DIV>

</body>
</html>
