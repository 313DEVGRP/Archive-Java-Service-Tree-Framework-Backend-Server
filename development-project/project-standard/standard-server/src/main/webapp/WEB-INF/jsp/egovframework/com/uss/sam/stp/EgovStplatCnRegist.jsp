<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 /**
  * @Class Name : EgovStplatCnRegist.jsp
  * @Description : EgovStplatCnRegist 화면
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

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>
<title>추천사이트정보 등록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="stplatManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_stplatcn(){

	// 첫 입력란에 포커스..
	stplatManageVO.useStplatNm.focus();

}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_regist_stplatcn(form){

	// 서버사이드 테스트용
	/*	
		form.action = "<c:url value='/uss/sam/stp/StplatCnRegist.do'/>";
		form.submit(); 
		return;
	*/

	if (!validateStplatManageVO(form)) {
			 			
	return;
			
	} else {

		form.action = "<c:url value='/uss/sam/stp/StplatCnRegist.do'/>";
		form.submit();
			
	} 
			
	
}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_stplatlist() {

	stplatManageVO.action = "<c:url value='/uss/sam/stp/StplatListInqire.do'/>";
	stplatManageVO.submit();

		
}

</script>

</head>
<body onLoad="fn_egov_initl_stplatcn();">
<DIV id="content" style="width:712px">
<!-- 상단타이틀 -->
<form:form commandName="stplatManageVO" action="" method="post"> 

	  
<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="제목아이콘이미지">&nbsp;약관내용 등록</h1></td>
 </tr>
</table>

<!-- 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="이 표는 약관내용 대상 정보를 제공하며, 이용약관명, 이용약관내용, 정보제공동의내용 정보로 구성되어 있습니다 .">
  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >이용약관명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>
        <form:input path="useStplatNm" title="이용약관명 입력" size="70" maxlength="70" />
    	<div><form:errors path="useStplatNm"/></div>        
    </td>
  </tr>
  
  <tr> 
    <th scope="row" height="23" class="required_text" >이용약관내용<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td>   
      <form:textarea path="useStplatCn" title="이용약관내용 입력" cols="300" rows="20" cssClass="txaClass" />   
      <div><form:errors path="useStplatCn"/></div>                                
    </td>
  </tr> 

  <tr> 
    <th scope="row" height="23" class="required_text" >정보제공동의내용<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td> 
      <form:textarea path="infoProvdAgreCn" title="정보제공동의내용 입력" cols="300" rows="20" cssClass="txaClass" />   
      <div><form:errors path="infoProvdAgreCn"/></div>                                
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
 
  <td><span class="button"><input type="submit" value="저장" onclick="fn_egov_regist_stplatcn(document.forms[0]); return false;"></span></td>       

  <td>&nbsp;</td>  
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
  <td class="btnBackground" nowrap><a href="<c:url value='/uss/sam/stp/StplatListInqire.do' />">목록</a></td>  
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" width="8" height="20" alt="버튼이미지"></td>     
        
</tr>
</table>
<input name="cmd" type="hidden" value="<c:out value='save'/>">
</form:form>
</DIV>

</body>
</html>
