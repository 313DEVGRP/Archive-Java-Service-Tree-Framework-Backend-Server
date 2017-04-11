<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%

/**
 * @Class Name : EgovLoginScrinImageList.java
 * @Description : EgovLoginScrinImageList jsp
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
<title>로그인화면이미지 목록조회</title>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

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
                alert("선택된  로그인화면 이미지가 없습니다.");
                returnBoolean = false;
            }
        } else {
            if(document.listForm.delYn.checked == false) {
                alert("선택된로그인화면 이미지가 없습니다.");
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

function fncSelectLoginScrinImageList(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/ion/lsi/selectLoginScrinImageList.do'/>";
    document.listForm.submit();
}

function fncSelectLoginScrinImage(imageId) {
    document.listForm.imageId.value = imageId;
    document.listForm.action = "<c:url value='/uss/ion/lsi/getLoginScrinImage.do'/>";
    document.listForm.submit();
}

function fncAddLoginScrinImageInsert() {
    if(document.listForm.pageIndex.value == "") {
        document.listForm.pageIndex.value = 1;
    }
    document.listForm.action = "<c:url value='/uss/ion/lsi/addViewLoginScrinImage.do'/>";
    document.listForm.submit();
}

function fncLoginScrinImageListDelete() {
	if(fncManageChecked()) {
        if(confirm("삭제하시겠습니까?")) {
            document.listForm.action = "<c:url value='/uss/ion/lsi/removeLoginScrinImageList.do'/>";
            document.listForm.submit();
        }
    }
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/ion/lsi/selectLoginScrinImageList.do'/>";
    document.listForm.submit();
}

function press() {

    if (event.keyCode==13) {
    	fncSelectLoginScrinImageList('1');
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

<form name="listForm" action="<c:url value='/uss/ion/lsi/selectLoginScrinImageList.do'/>" method="post">
<table width="100%" cellpadding="8" class="table-search" border="0">
   <tr>
       <td width="30%"class="title_left">
           <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;로그인화면이미지 관리</h1></td>
       <td width="50%"><label for="searchKeyword">이미지 명 : </label><input name="searchKeyword" id="searchKeyword" type="text" value="<c:out value="${loginScrinImageVO.searchKeyword}"/>" size="25" title="검색" onkeypress="press();" ></td>
       <th width="20%" align="right">
           <table border="0" cellspacing="0" cellpadding="0">
               <tr>
                   <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectLoginScrinImageList('1'); return false;"></span></td>
                   <td>&nbsp;&nbsp;</td>
                   <td><span class="button"><a href="<c:url value='/uss/ion/lsi/addViewLoginScrinImage.do'/>?pageIndex=<c:out value='${loginScrinImageVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${loginScrinImageVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncAddLoginScrinImageInsert(); return false;"><spring:message code="button.create" /></a></span></td>
               </tr>
           </table>
       </th>
   </tr>
</table>
<input type="hidden" name="imageId">
<input type="hidden" name="pageIndex" value="<c:if test="${empty loginScrinImageVO.pageIndex }">1</c:if><c:if test="${!empty loginScrinImageVO.pageIndex }"><c:out value='${loginScrinImageVO.pageIndex}'/></c:if>">
<input type="hidden" name="searchCondition" value="1">
</form>


<table width="100%" cellpadding="8" class="table-list" summary="로그인화면이미지에 대한 목록을 제공한다.">
 <caption>로그인화면이미지 관리</caption>
 <thead>
  <tr>
    <th class="title" width="25%" scope="col">이미지 명</th>
    <th class="title" width="25%" scope="col">이미지</th>
    <th class="title" width="40%" scope="col">이미지설명</th>
    <th class="title" width="10%" scope="col">반영여부</th>
  </tr>
 </thead>
 <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
 <c:if test="${fn:length(loginScrinImageList) == 0}">
 <tr>
 <td class="lt_text3" colspan="9">
	<spring:message code="common.nodata.msg" />
 </td>
 </tr>
 </c:if>
 <tbody>
 <c:forEach var="loginScrinImage" items="${loginScrinImageList}" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap>
        <form name="item" method="post" action="<c:url value='/uss/ion/lsi/getLoginScrinImage.do'/>">
            <input type="hidden" name="imageId" value="<c:out value="${loginScrinImage.imageId}"/>">
            <input type="hidden" name="pageIndex" value="<c:out value='${loginScrinImageVO.pageIndex}'/>">
            <input type="hidden" name="searchCondition" value="<c:out value='${loginScrinImageVO.searchCondition}'/>">
            <input type="hidden" name="searchKeyword" value="<c:out value="${loginScrinImageVO.searchKeyword}"/>">
            <span class="link"><input type="submit" value="<c:out value="${loginScrinImage.imageNm}"/>" onclick="fncSelectLoginScrinImage('<c:out value="${loginScrinImage.imageId}"/>'); return false;"></span>
        </form>
    </td>
    <td class="lt_text3" nowrap><c:out value="${loginScrinImage.image}"/></td>
    <td class="lt_text3" nowrap><c:out value="${loginScrinImage.imageDc}"/></td>
    <td class="lt_text3" nowrap><c:out value="${loginScrinImage.reflctAt}"/></td>
  </tr>
 </c:forEach>
 </tbody>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>

<c:if test="${!empty loginScrinImageVO.pageIndex }">
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
