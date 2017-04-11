<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
 /**
  * @Class Name : EgovBookMarkMenuPopup.jsp
  * @Description : 바로가기메뉴 미리보기 화면
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.09.25    윤성록          최초 생성
  *
  *  @author 공통컴포넌트팀 윤성록
  *  @since 2009.09.25
  *  @version 1.0
  *  @see
  *
  */

  /* Image Path 설정 */
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/com/sym/mnu/bmm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/sym/mnu/bmm/"/>
<%
String imagePath_icon   = "/images/egovframework/com/sym/mnu/bmm/icon/";
String imagePath_button = "/images/egovframework/com/sym/mnu/bmm/button/";
%>
<html lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${CssUrl}com.css' />" type="text/css" >
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<title>바로가기메뉴미리보기</title>
<script type="text/javascript">

/* ********************************************************
 * 파일검색 화면 호출 함수
 ******************************************************** */


 function fn_egov_move(progrmStrePath){

 		var retVal = progrmStrePath;
		parent.fn_egov_returnValue(retVal);

}

</script>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<form name="menuListForm" action ="" method="post">
<input type="hidden" name="req_RetrunPath" value="<c:url value='/sym/mnu/bmm/EgovMenuList'/>">

<div id="border" style="width:200px">

<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
	  <td width="30%" class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
	   &nbsp;바로가기 메뉴관리</td>
 </tr>
</table>

<table width="200" cellpadding="8" class="table-search" border="0">
    <tr>
    	<td width="10%" >
		    <img src="<c:url value='/images/egovframework/com/sym/mnu/bmm/icon/menu_base.gif' />" width="20" height="20" hspace="3" style="vertical-align: middle" alt = "base icon">
		    </td>
		 <td class="lt_text2" width="90%" colspan = "2"> 바로가기</td>
    </tr>
	 <c:forEach var="result" items="${list_menulist}" varStatus="status">
		  <tr>
		    <td width = "10px">
		    </td>
		    <td >
		    <img src="<c:url value='/images/egovframework/com/sym/mnu/bmm/icon/menu_page.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt = "menu_page icon" >
		   		    </td>
		    <td class="lt_text1">
				<a href="javascript:fn_egov_move('<c:url value="${result.progrmStrePath}"/>')">
				<c:out value="${result.menuNm}" escapeXml="false"/></a>
    		</td>
		 </tr>
	 </c:forEach>

  </table>
  </div>
</form>
</body>
</html>

