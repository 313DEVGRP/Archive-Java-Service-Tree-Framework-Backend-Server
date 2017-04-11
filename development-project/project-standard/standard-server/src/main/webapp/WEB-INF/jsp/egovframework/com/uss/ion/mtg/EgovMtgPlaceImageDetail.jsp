<%
/**
 * @Class Name : EgovMtgPlaceImageDetail.java
 * @Description : EgovMtgPlaceImageDetail jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.08.02    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.08.02
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<html lang="ko">
<head>
<title>회의실 이미지</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * Window Close()  처리
 ******************************************************** */
 /*설명 : 중복체크 결과값 리턴및 화면 close */
 function fn_egov_image_close() {
		parent.window.close();
	}
 
-->
</script>
</head>

<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:420px">
<table border="0">
  <tr>
    <td width="400">
<!-- ********** 여기서 부터 본문 내용 *************** -->
<form name="imageForm" method="post">
 <div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
</form>
<!--  등록  폼 영역  -->
<table width="650" border="0" cellpadding="0" cellspacing="1" class="table-line" summary="회의실 이미지" >
<caption>회의실 이미지</caption>
 <thead>
  <tr>
    <th class="title" width="100%" >회의실 이미지</th>
  </tr>
 </thead> 
	<c:forEach var="fileVO" items="${fileList}" varStatus="status">
	<tr>
 		<td>
 		  <img src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${fileVO.atchFileId}"/>&fileSn=<c:out value="${fileVO.fileSn}"/>'  width="640" />
 		</td>
	</tr>
	</c:forEach>
<!-- 첨부파일 테이블 레이아웃 End.-->
</table>
<table width="650"  border="0" cellspacing="0" cellpadding="0">
  <tr> 
   <td width="45%">&nbsp;</td>     
   <td width="10%">&nbsp;</td> 
   <td width="45%">&nbsp;</td> 
 </tr>
 <tr> 
   <td width="45%">&nbsp;</td>     
   <td width="10%" align="center"><span class="button"><a href="" onclick="javascript:fn_egov_image_close(); return false;">닫기</a></span></td>     
   <td width="45%">&nbsp;</td> 
 </tr>
</table>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>   
</div>
</body>
</html>