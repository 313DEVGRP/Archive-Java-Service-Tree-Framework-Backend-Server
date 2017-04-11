<%--
/**
 * @Class Name  : EgovLoginScrinImageRegist.java
 * @Description : EgovLoginScrinImageRegist.jsp
 * @Modification Information
 * @
 * @  수정일         수정자          수정내용
 * @ -------    --------    ---------------------------
 * @ 2009.02.01    lee.m.j          최초 생성
 *
 *  @author lee.m.j
 *  @since 2009.08.11
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
 --%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<title>로그인화면이미지 등록</title>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="loginScrinImage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">

function fncSelectLoginScrinImageList() {
    var varFrom = document.getElementById("loginScrinImage");
    varFrom.action = "<c:url value='/uss/ion/lsi/selectLoginScrinImageList.do'/>";
    varFrom.submit();       
}

function fncLoginScrinImageInsert() {

    var varFrom = document.getElementById("loginScrinImage");
    varFrom.action = "<c:url value='/uss/ion/lsi/addLoginScrinImage.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateLoginScrinImage(varFrom)){           
            return;
        }else{
            if(varFrom.image.value != '') {
                varFrom.submit();
            } else {
                alert("이미지는 필수 입력값입니다.");            
                return;
            }
        } 
    }
}

function fncOnChangeImage() {
    var varFrom = document.getElementById("loginScrinImage");
    varFrom.image.value = varFrom.file_1.value;
}

</script>
</head>

<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
<form:form commandName="loginScrinImage" method="post" action="${pageContext.request.contextPath}/uss/ion/lsi/addLoginScrinImage.do' />" enctype="multipart/form-data"> 
<input type="hidden" name="posblAtchFileNumber" value="1" >
<input type="hidden" name="image" >
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%" class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;로그인화면이미지 등록</h1>
  </td>
 </tr>
</table>

<table width="100%" cellpadding="8" class="table-line" summary="로그인화면이미지를 등록한다.">
  <caption>로그인화면이미지 등록</caption>
  <tr>
    <th class="required_text" width="20%" scope="row"><label for="imageId">이미지ID</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
    <td class="lt_text" nowrap><input name="imageId" id="imageId" title="이미지ID" type="text" value="<c:out value='${loginScrinImage.imageId}'/>" size="20" class="readOnlyClass" readonly ></td>
  </tr>
  <tr>
    <th class="required_text" width="20%" scope="row"><label for="imageNm">이미지명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
    <td class="lt_text" nowrap><input name="imageNm" id="imageNm" title="이미지명" type="text" value="<c:out value='${loginScrinImage.imageNm}'/>" maxLength="10" size="30" >&nbsp;<form:errors path="imageNm" /></td>
  </tr>
  <tr>
    <th class="required_text" width="20%" scope="row"><label for="egovComFileUploader">이미지</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
    <td class="lt_text" nowrap>
        <input type="file" name="file_1" id="egovComFileUploader" title="이미지" onchange="javascript:fncOnChangeImage();">
    </td>
  </tr>
  <tr>
    <th class="required_text" width="20%" scope="row"><label for="imageDc">이미지설명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택입력표시"></th>
    <td class="lt_text" nowrap><input name="imageDc" id="imageDc" title="이미지설명" type="text" value="<c:out value='${loginScrinImage.imageDc}'/>" maxLength="100" size="80" ></td>
  </tr>  
  <tr>
    <th class="required_text" width="20%" scope="row"><label for="reflctAt">반영여부</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
    <td class="lt_text" nowrap>
      <select name="reflctAt" id="reflctAt" title="반영여부">
          <option value="Y" <c:if test="${loginScrinImage.reflctAt == 'Y'}">selected</c:if> >Y</option>
          <option value="N" <c:if test="${loginScrinImage.reflctAt == 'N'}">selected</c:if> >N</option>
      </select>
   </td> 
  </tr>  
  <tr>
    <th class="required_text" width="20%" scope="row"><label for="regDate">등록일시</label><img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택입력표시"></th>
    <td class="lt_text" nowrap><input name="regDate" id="regDate" title="등록일시" type="text" value="<c:out value="${loginScrinImage.regDate}"/>" size="20" class="readOnlyClass" readonly></td>
  </tr>
</table>

<table width="100%" cellpadding="8">
  <tr>
    <td align="center">
	   <table border="0" cellspacing="0" cellpadding="0">
	    <tr> 
	      <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncLoginScrinImageInsert(); return false;"></span></td>
	      <td>&nbsp;&nbsp;</td>
	      <td><span class="button"><a href="<c:url value='/uss/ion/lsi/selectLoginScrinImageList.do'/>?pageIndex=<c:out value='${loginScrinImageVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${loginScrinImageVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncSelectLoginScrinImageList(); return false;"><spring:message code="button.list" /></a></span></td>
	    </tr>
	   </table>  
   </td>
  </tr>  
</table>
<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${loginScrinImageVO.searchCondition}'/>">
<input type="hidden" name="searchKeyword" value="<c:out value='${loginScrinImageVO.searchKeyword}'/>">
<input type="hidden" name="pageIndex" value="<c:out value='${loginScrinImageVO.pageIndex}'/>">
<!-- 검색조건 유지 -->
</form:form>

</td>
</tr>
</table>            
</DIV>
</body>
</html>

