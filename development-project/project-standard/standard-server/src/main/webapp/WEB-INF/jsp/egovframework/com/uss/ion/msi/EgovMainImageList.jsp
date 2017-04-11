<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%

/**
 * @Class Name : EgovMainImageList.java
 * @Description : EgovMainImageList jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2009.07.01    lee.m.j     최초 생성
 *
 *  @author lee.m.j
 *  @since 2009.07.01
 *  @version 1.0
 *  @see
 *
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<title>메인화면이미지 목록조회</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!--

function fncCheckAll() {
    var checkField = document.listForm.delYn;
    if(document.listForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}

function fncManageChecked() {

    var checkField = document.listForm.delYn;
    var checkId = document.listForm.checkId;
    var returnValue = "";
    var returnBoolean = false;
    var checkCount = 0;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                	checkCount++;
                    checkField[i].value = checkId[i].value;
                    if(returnValue == "")
                        returnValue = checkField[i].value;
                    else
                        returnValue = returnValue + ";" + checkField[i].value;
                }
            }
            if(checkCount > 0)
                returnBoolean = true;
            else {
                alert("선택된  메인화면 이미지가 없습니다.");
                returnBoolean = false;
            }
        } else {
            if(document.listForm.delYn.checked == false) {
                alert("선택된  메인화면 이미지가 없습니다.");
                returnBoolean = false;
            }
            else {
                returnValue = checkId.value;
                returnBoolean = true;
            }
        }
    } else {
    	alert("조회된 결과가 없습니다.");
    }

    document.listForm.imageIds.value = returnValue;
    return returnBoolean;
}

function fncSelectMainImageList(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/ion/msi/selectMainImageList.do'/>";
    document.listForm.submit();
}

function fncSelectMainImage(imageId) {
    document.listForm.imageId.value = imageId;
    document.listForm.action = "<c:url value='/uss/ion/msi/getMainImage.do'/>";
    document.listForm.submit();
}

function fncAddMainImageInsert() {

    if(document.listForm.pageIndex.value == "") {
        document.listForm.pageIndex.value = 1;
    }
    document.listForm.action = "<c:url value='/uss/ion/msi/addViewMainImage.do'/>";
    document.listForm.submit();
}

function fncLoginMainImageListDelete() {
	if(fncManageChecked()) {
        if(confirm("삭제하시겠습니까?")) {
            document.listForm.action = "<c:url value='/uss/ion/msi/removeMainImageList.do'/>";
            document.listForm.submit();
        }
    }
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/ion/msi/selectMainImageList.do'/>";
    document.listForm.submit();
}

function press() {

    if (event.keyCode==13) {
    	fncSelectMainImageList('1');
    }
}
-->
</script>

</head>

<body>

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

<table border="0">
  <tr>
    <td width="700">

<form name="listForm" action="<c:url value='/uss/ion/msi/selectMainImageList.do'/>" method="post">
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="30%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;메인화면이미지 관리</h1></td>
  <td width="50%"><label for="searchKeyword">이미지 명 : </label><input id="searchKeyword" name="searchKeyword" type="text" value="<c:out value="${mainImageVO.searchKeyword}"/>" size="25" title="검색" onkeypress="press();" ></td>
  <th width="20%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectMainImageList('1'); return false;"></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/msi/addViewMainImage.do'/>?pageIndex=<c:out value='${mainImageVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${mainImageVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncAddMainImageInsert(); return false;"><spring:message code="button.create" /></a></span></td>
        </tr>
       </table>
  </th>
 </tr>
</table>
<input type="hidden" name="imageId">
<input type="hidden" name="pageIndex" value="<c:if test="${empty mainImageVO.pageIndex }">1</c:if><c:if test="${!empty mainImageVO.pageIndex }"><c:out value='${mainImageVO.pageIndex}'/></c:if>" >
<input type="hidden" name="searchCondition" value="1" >
</form>

<table width="100%" cellpadding="8" class="table-list" summary="메인화면이미지에 대한 목록을 제공한다.">
 <caption>메인화면이미지 관리</caption>
 <thead>
  <tr>
    <th class="title" width="25%" scope="col" nowrap>이미지 명</th>
    <th class="title" width="25%" scope="col" nowrap>이미지</th>
    <th class="title" width="40%" scope="col" nowrap>이미지설명</th>
    <th class="title" width="10%" scope="col" nowrap>반영여부</th>
  </tr>
 </thead>
 <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
 <c:if test="${fn:length(mainImageList) == 0}">
 <tr>
 <td class="lt_text3" colspan="9">
	 <spring:message code="common.nodata.msg" />
 </td>
 </tr>
 </c:if>
 <tbody>
 <c:forEach var="mainImage" items="${mainImageList}" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap>
        <form name="item" method="post" action="<c:url value='/uss/ion/msi/getMainImage.do'/>">
            <input type="hidden" name="imageId" value="<c:out value="${mainImage.imageId}"/>">
            <input type="hidden" name="pageIndex" value="<c:out value='${mainImageVO.pageIndex}'/>">
            <input type="hidden" name="searchCondition" value="<c:out value='${mainImageVO.searchCondition}'/>">
            <input type="hidden" name="searchKeyword" value="<c:out value="${mainImageVO.searchKeyword}"/>">
            <span class="link"><input type="submit" value="<c:out value="${mainImage.imageNm}"/>" onclick="fncSelectMainImage('<c:out value="${mainImage.imageId}"/>'); return false;"></span>
        </form>
    </td>
    <td class="lt_text3" nowrap><c:out value="${mainImage.image}"/></td>
    <td class="lt_text3" nowrap><c:out value="${mainImage.imageDc}"/></td>
    <td class="lt_text3" nowrap><c:out value="${mainImage.reflctAt}"/></td>
  </tr>
 </c:forEach>
 </tbody>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>

<c:if test="${!empty mainImageVO.pageIndex }">
<div align="center">
    <div>
        <ui:pagination paginationInfo = "${paginationInfo}"
            type="image"
            jsFunction="linkPage"
            />
    </div>

</div>
</c:if>

</td>
</tr>
</table>
</DIV>
</body>
</html>
