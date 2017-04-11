<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Class Name : EgovPrivacyLogInqire.jsp
 * @Description : 개인정보조회 로그 정보 상세조회 화면
 * @Modification Information
 * @
 * @  수정일         수정자          수정내용
 * @ -------        --------    ---------------------------
 * @ 2014.09.11      표준프레임워크          최초 생성
 *  @author Vincent Han
 *  @since 2014.09.11
 *  @version 3.5
 */
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<title>개인정보조회 로그 상세보기</title>
</head>
<body>
	<table width="700" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;개인정보조회 로그 정보</td>
	 </tr>
	</table>
	<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register">
	 <tr>
	    <th width="20%" height="23" align="center">요청ID</th>
	    <td width="80%" nowrap >&nbsp;&nbsp;
	      <c:out value="${result.requestId}"/>
	    </td>
	  </tr>
	 <tr>
	    <th width="20%" height="23" align="center">발생일자</th>
	    <td width="80%" nowrap >&nbsp;&nbsp;
	      <c:out value="${result.inquiryDatetime}"/>
	    </td>
	  </tr>
	 <tr>
	    <th width="20%" height="23" align="center">서비스명</th>
	    <td width="80%" nowrap >&nbsp;&nbsp;
	      <c:out value="${result.serviceName}"/>
	    </td>
	  </tr>
	 <tr>
	    <th width="20%" height="23" align="center">조회정보</th>
	    <td width="80%" nowrap >&nbsp;&nbsp;
	      <c:out value="${result.inquiryInfo}"/>
	    </td>
	  </tr>	  
	 <tr>
	    <th width="20%" height="23" align="center">요청자</th>
	    <td width="80%" nowrap >&nbsp;&nbsp;
	      <c:out value="${result.requesterName}"/>
	    </td>
	  </tr>
	 <tr>
	    <th width="20%" height="23" align="center">요청자IP</th>
	    <td width="80%" nowrap >&nbsp;&nbsp;
	      <c:out value="${result.requesterIp}"/>
	    </td>
	  </tr>
	</table>
	<table width="700" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
	<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
      <td><span class="button"><input type="submit" value="닫기" onclick="javascript:window.close()"></span></td>
	</tr>
	</table>
</body>
</html>
