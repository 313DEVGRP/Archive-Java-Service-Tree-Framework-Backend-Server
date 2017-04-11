<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% 
 /**
  * @Class Name : EgovNcrdInqirePopup.jsp
  * @Description : 명함정보조회팝업	
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.03.30   이삼섭           최초 생성
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.03.30
  *  @version 1.0
  *  @see
  *  
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<title>명함정보조회</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body>
	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목버튼이미지">
	   &nbsp;명함정보조회</td>
	 </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
	  <tr> 
	    <th width="20%" height="23" class="required_text" nowrap >이름<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="not required"></th>
	    <td width="80%" nowrap colspan="3"><c:out value="${ncrdVO.ncrdNm}" /></td>
	  </tr>
	  <tr> 
	    <th width="20%" height="23" class="required_text" nowrap >회사명<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="not required"></th>
	    <td width="30%" nowrap><c:out value="${ncrdVO.cmpnyNm}" /></td>
	    <th width="20%" height="23" class="required_text" nowrap >부서명<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="not required"></th>
	    <td width="30%" nowrap><c:out value="${ncrdVO.deptNm}" /></td>    
	  </tr>
	  <tr> 
	    <th width="20%" height="23" class="required_text" nowrap >직위<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="not required"></th>
	    <td width="30%" nowrap><c:out value="${ncrdVO.ofcpsNm}" /></td>
	    <th width="20%" height="23" class="required_text" nowrap >직급<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="not required"></th>
	    <td width="30%" nowrap><c:out value="${ncrdVO.clsfNm}" /></td>    
	  </tr>    
	  <tr> 
	    <th width="20%" height="23" class="required_text" nowrap >이메일주소<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="not required"></th>
	    <td width="80%" nowrap colspan="3"><c:out value="${ncrdVO.emailAdres}" /></td>
	  </tr>
	  <tr> 
	    <th width="20%" height="23" class="required_text" nowrap >전화번호<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="not required"></th>
	    <td width="80%" nowrap colspan="3">
	    <c:out value="${ncrdVO.nationNo}" />-<c:out value="${ncrdVO.areaNo}" />-
	    <c:out value="${ncrdVO.middleTelNo}" />-<c:out value="${ncrdVO.endTelNo}" />
	    </td>
	  </tr>  
	  <tr> 
	    <th width="20%" height="23" class="required_text" nowrap >휴대폰번호<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="not required"></th>
	    <td width="80%" nowrap colspan="3">
	    <c:out value="${ncrdVO.idntfcNo}" />-<c:out value="${ncrdVO.middleMbtlNum}" />-
	    <c:out value="${ncrdVO.endMbtlNum}" />
	    </td>
	  </tr> 
	  <tr> 
	    <th width="20%" height="23" class="required_text" nowrap >주소<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="not required"></th>
	    <td width="80%" nowrap colspan="3"><c:out value="${ncrdVO.adres}" /></td>
	  </tr>   
	  <tr> 
	    <th width="20%" height="23" class="required_text" nowrap >외부사용자여부<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="not required"></th>
	    <td width="30%" nowrap colspan="3">
	    <c:choose>
	    	<c:when test="${ncrdVO.extrlUserAt == 'Y'}">
	    		<spring:message code="cop.extrlUser" />
	    	</c:when>
	    	<c:otherwise>
	    		<spring:message code="cop.intrlUser" />
	    	</c:otherwise>
	    </c:choose>
	    </td>
	  </tr> 
	  <tr> 
	    <th width="20%" height="23" class="required_text" nowrap >비고<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="not required"></th>
	    <td width="80%" nowrap colspan="3"><c:out value="${ncrdVO.remark}" /></td>
	  </tr>  
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
	<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr> 
      
      <td>
      <span class="button"><input type="button" onClick="window.close();" value="닫기"/></span> 
      </td>
       
	</tr>
	</table>
	</div>
</body>
</html>
