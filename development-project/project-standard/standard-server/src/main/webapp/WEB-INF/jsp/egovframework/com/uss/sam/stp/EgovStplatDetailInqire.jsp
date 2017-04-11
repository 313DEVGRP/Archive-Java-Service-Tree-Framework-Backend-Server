<%
 /**
  * @Class Name : EgovStplatDetailInqure.jsp
  * @Description : EgovStplatDetailInqure 화면
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
<title>약관 상세조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_stplatlist() {

	document.StplatManageForm.action = "<c:url value='/uss/sam/stp/StplatListInqire.do'/>";
	document.StplatManageForm.submit();
		
}

/* ********************************************************
 * 수정처리화면
 ******************************************************** */
function fn_egov_updt_stplatcn(useStplatId){

	// Update하기 위한 키값을 셋팅
	document.StplatManageForm.useStplatId.value = useStplatId;	
	document.StplatManageForm.action = "<c:url value='/uss/sam/stp/StplatCnUpdtView.do'/>";
	document.StplatManageForm.submit();	
	
}

 /* ********************************************************
  * 삭제처리
  ******************************************************** */
  function fn_egov_delete_stplatcn(useStplatId){
		
		if	(confirm("<spring:message code="common.delete.msg" />"))	{	

			// Delete하기 위한 키값을 셋팅
			document.StplatManageForm.useStplatId.value = useStplatId;	
			document.StplatManageForm.action = "<c:url value='/uss/sam/stp/StplatCnDelete.do'/>";
			document.StplatManageForm.submit();
				
		}	
		
	}	

</script>
</head>

<body>
<DIV id="content" style="width:712px">

<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!-- 상단타이틀 -->
<form name="StplatManageForm" action="<c:url value='/uss/sam/stp/StplatDetailInqire.do'/>" method="post">

<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="제목아이콘이미지">&nbsp;약관 상세조회</h1></td>
 </tr>
</table>

<!-- 등록  폼 영역  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="이 표는 약관내용 대상 정보를 제공하며, 이용약관명, 이용약관내용, 정보제공동의내용 정보로 구성되어 있습니다 .">

  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >이용약관명&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.useStplatNm}"/>  
    </td>
  </tr>

  <tr> 
    <th scope="row" height="23" class="required_text" >이용약관내용&nbsp;&nbsp;</th>
    <td width="80%" nowrap>    
      <textarea name="useStplatCn" class="textarea" title="이용약관내용 입력"  cols="300" rows="20"  style="width:450px;" readonly><c:out value="${result.useStplatCn}"/></textarea>                 
    </td>
  </tr> 

  <tr> 
    <th scope="row" height="23" class="required_text" >정보제공동의내용&nbsp;&nbsp;</th>
    <td width="80%" nowrap>    
      <textarea name="infoProvdAgreCn" class="textarea" title="정보제공동의내용 입력" cols="300" rows="20"  style="width:450px;" readonly><c:out value="${result.infoProvdAgreCn}"/></textarea>                 
    </td>
  </tr> 

  <tr> 
    <th scope="row" height="23" class="required_text" >등록일자</th>
    <td width="80%" nowrap>
    	<c:out value="${result.lastUpdusrPnttm}"/>
    </td>
  </tr> 
   
</table>

<input name="useStplatId" type="hidden" value="<c:out value="${resultList[0].useStplatId}" />">
<input name="cmd" type="hidden" value="">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
</form>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="10px"></td>
</tr>
</table>

<!-- 수정/삭제/목록 버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>   
  <td> 
	<span class="button"><input type="submit" value="<spring:message code="button.update" />"
	 onclick="fn_egov_updt_stplatcn('<c:out value="${result.useStplatId}"/>'); return false;"></span>
  </td>  
  
  <td width="3"></td>  
  
  <td><span class="button"><input type="submit" value="<spring:message code="button.delete" />"
   onclick="fn_egov_delete_stplatcn('<c:out value="${result.useStplatId}"/>'); return false;"></span>
  </td>

  <td width="3"></td>  
  
  <td> 
	<form name="formList" action="<c:url value='/uss/sam/stp/StplatListInqire.do'/>" method="post">
	<span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_inqire_stplatlist(); return false;"></span>
	</form>
  </td>
  
</tr>
</table>
</DIV>

</body>
</html>
