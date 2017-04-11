<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /** 
  * 
  * @Description : EgovIndvdlPgeList 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2009.09.08    이창원                 최초 생성
  *
  *  @author Lee changwon
  *  @since 2009.09.08
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
<title>마이페이지 컨텐츠 추가</title>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>" ></script>
<script type="text/javaScript" language="javascript" defer="defer">
/* ********************************************************
 * 마이페이지에 컨텐츠 추가하기
 ******************************************************** */
function fncAddCntntsIndvdlpge(id) {
    var varForm = document.IndvdlPgeManageAdd; //document.getElementById("IndvdlPgeManage");
    varForm.cntntsId.value = id;
    if("<c:out value='${indvdlPgeCntntsVO.pageIndex}'/>"=="") varForm.pageIndex.value = 1;
    else varForm.pageIndex.value = "<c:out value='${indvdlPgeVO.pageIndex}'/>";
    varForm.submit(); 
}

/* ********************************************************
* 페이징 처리
******************************************************** */
function linkPage(pageNo){
    var varForm = document.IndvdlPgeManage;//document.getElementById("IndvdlPgeManage");
    varForm.searchCondition.value = "1";
    if(pageNo=="") varForm.pageIndex.value = 1;
    else varForm.pageIndex.value=pageNo;
    varForm.submit();
}

/* ********************************************************
* 컨텐츠 검색
******************************************************** */
function fncSearch(){
    var varForm = document.IndvdlPgeManage;//document.getElementById("IndvdlPgeManage");
    varForm.pageIndex.value = 1;
    varForm.submit();
}

/* ********************************************************
* 컨텐츠 미리보기 팝업창 띄우기
******************************************************** */
function preview(cntcUrl,cntntsNm){
    var openParam = "dialogLeft:10;dialogTop:10;dialogWidth:500px;dialogHeight:400px;scroll:yes;status:no;center:yes;resizable:yes;";
    window.showModalDialog(cntcUrl, self, openParam);
}
</script>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<form name="IndvdlPgeManage" action="<c:url value='/uss/mpe/EgovIndvdlpgeAddCntntsList.do' />" method="post">
<table border="0">
<tbody>
  <tr>
    <td width="700">
<table width="100%" cellpadding="8" border="0" summary="제목테이블">
 <tr>
  <td width="27%" class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />"
                    width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목 아이콘">&nbsp;마이페이지 컨텐츠 목록 </td>

  <td width="73%" >
    <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>컨텐츠 명 <input title="검색" name="searchKeyword" type="text" value="<c:out value="${indvdlPgeVO.searchKeyword}"/>"  size="25" title="검색"></td>
      <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSearch(); return false;"></span></td>
        <!--
      <td> <img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
          <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap><a href="javascript:fncSearch();" style="selector-dummy:expression(this.hideFocus=false);" tabindex="4">조회</a> 
          </td>
          <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" width="8" height="20" alt=""></td>
          -->
      <td>&nbsp;&nbsp;</td>
     </tr>
     </table>
  </td>
 </tr>
</table>
<table width="100%" cellpadding="8" class="table-line" summary="마이페이지에 추가 가능한 컨텐츠  목록을 제공한다.">
 <c:forEach var="cntntslist" items="${indvdlCntntsList}" varStatus="status">
  <tr>
    <td width="250" height="100">
        <table border="1" style="bordercolor:#0099ff"><tr><td width="240">
        <iframe width="240" name="preN<c:out value='${cntntslist.cntntsId}'/>" id="preI<c:out value='${cntntslist.cntntsId}'/>" title="마이페이지 컨텐츠 미리보기"  src = "<c:url value='${cntntslist.cntntsLinkUrl}'/>" frameborder="0" marginwidth="0" marginheight="0" scrolling="no">
        </iframe>               
        </td></tr></table>
    </td>
    <td>
        <table width="450" cellpadding="5">
        <tr>
            <td class="lt_text2"><u><c:out value="${cntntslist.cntntsNm}"/></u></td>
        </tr>
        <tr>
            <td class="lt_text"><c:out value="${cntntslist.cntntsDc}"/></td>
        </tr>
        <tr>
            <td class="lt_text"><c:out value="${cntntslist.cntntsLinkUrl}"/></td>
        </tr>
        <tr>
            <td>
            <span class="button"><input type="submit" value="<spring:message code='button.add' />" onclick="fncAddCntntsIndvdlpge('<c:out value='${cntntslist.cntntsId}'/>'); return false;"></span>
            &nbsp;<span class="button"><input type="submit" value="<spring:message code='button.preview' />" onclick="javascript:preview('<c:url value='${cntntslist.cntntsLinkUrl}'/>','<c:out value='${cntntslist.cntntsNm}'/>'); return false;"></span>
            </td>
        </tr>
        </table>
    </td>
  </tr>
 </c:forEach>
  <c:if test="${fn:length(indvdlCntntsList) == 0}">
   <tr>
     <td width="450" height="50"class="lt_text3" valign="middle" align="center" colspan="2">조회된 컨텐츠가 없습니다.</td>  
   </tr>         
 </c:if>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
</table>
<!--페이징 시작-->
<c:if test="${!empty indvdlPgeVO.pageIndex }">
    <div align="center">
        <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
    </div>
</c:if>
<!--페이징 끝-->
<input type="hidden" name="cntntsId" value="">
<input type="hidden" name="pageIndex" value="<c:out value='${indvdlPgeVO.pageIndex}'/>">
</td>
</tr>
</tbody>
</table>
<INPUT TYPE="hidden" name="searchCondition" value="1">
</form>
<form name="IndvdlPgeManageAdd" action="<c:url value='/uss/mpe/EgovIndvdlpgeAddCntnts.do' />" method="post">
<input type="hidden" name="cntntsId" value="">
<input type="hidden" name="pageIndex" value="<c:out value='${indvdlPgeVO.pageIndex}'/>">
<INPUT TYPE="hidden" name="searchCondition" value="1">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
</form>
</body>
</html>
