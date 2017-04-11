<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Class Name : EgovIndvdlpgeDetail.java
 * @Description : EgovIndvdlpgeDetail jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2009.09.01    이창원                최초 생성
 *
 *  @author 이창원
 *  @since 2009.09.01
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
<title>마이페이지 </title>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 마이페이지 보기에서 불필요한 컨텐츠 마이페이지에서 삭제하기
 ******************************************************** */
function delIndvdlCntnts(id){
    var varForm = document.delCntntsFrm;    
    varForm.cntntsId.value = id;
    varForm.submit();
}

/* ********************************************************
* 서버 처리 후 메세지 화면에 보여주기
******************************************************** */
function fncShowMessg(){
	if("<c:out value='${message}'/>" != ''){
	alert("<c:out value='${message}'/>");
	}
}
</script>
</head>
<body onLoad="javascript:fncShowMessg();">
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<table border="0" summary="마이페이지를 조회한다.">
    <tbody>
   <tr valign="top">
    <td width="700">
        <table width="100%" cellpadding="8" border="0">
         <tr valign="top">
          <td width="100%" height="30" style="background-image:URL(<c:url value='/images/egovframework/com/uss/mpe/upload/temple_top01.jpg'/>);" >
            <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;마이페이지
          </td>
         </tr>
          <tr valign="top">
          <td width="100%" class="title_right" align="right" height="10">
            <a href="<c:url value='/uss/mpe/EgovIndvdlpgeConfRegist.do'/>"><U>마이페이지 설정 변경</U></a>&nbsp;&nbsp;<a href="<c:url value='/uss/mpe/EgovIndvdlpgeAddCntntsList.do' />?cntntsId=<c:out value='${indvdlPgeDetail.cntntsId}' />"><U>컨텐츠 추가</U></a>&nbsp;
          </td>
         </tr>
        </table>
   </td>
  </tr>
  <tr valign="top">
    <td width="700">
<!-- 가로배열 처리 -->
<c:if test="${indvdlpgeResult.sortMthd eq 'R'}">
<table border="0" cellpadding="8" width="100%" >
    <tr valign="top">
    <c:set var="namuzi" value="${indvdlPgeDetailListCount%indvdlpgeResult.sortCnt}"/><!-- 나머지 -->
    <c:set var="startwith" value="0"/>
    <c:set var="endwith" value="${indvdlpgeResult.sortLineCnt-1}"/>
    <c:choose>
        <c:when test="${indvdlPgeDetailListCount < indvdlpgeResult.sortCnt}">
        <c:set var="i" value="${indvdlPgeDetailListCount}"/>
        </c:when>
        <c:otherwise>
        <c:set var="i" value="${indvdlpgeResult.sortCnt}"/>
        </c:otherwise>
    </c:choose>
    <c:forEach var="td" begin="1" end="${i}" step="1">
       <td>
            <table>
            <c:forEach var="indvdlPgeDetail" items="${indvdlPgeDetailList}" begin="${startwith}" end="${endwith}" step="1" >
                <tr>
                <td width="200" align="center" valign="middle">
                    <table cellpadding="0" cellspacing="0" style="border:${indvdlpgeResult.titleBarColor} 2px solid" >
                        <tr>
                            <td bgcolor="${indvdlpgeResult.titleBarColor}" height="30px">&nbsp;<c:out value="${indvdlPgeDetail.cntntsNm}"/></td> 
                            <td bgcolor="${indvdlpgeResult.titleBarColor}" height="30px" align="right" valign="middle"><a href="<c:out value="${indvdlPgeDetail.cntntsLinkUrl}" />">more..</a><input type="image" src="<c:url value='/images/egovframework/com/uss/mpe/icon/bu5_close.gif' />" alt="삭제" onClick="javascript:delIndvdlCntnts('<c:out value="${indvdlPgeDetail.cntntsId}" />');"></td> 
                        </tr>
                        <tr valign="top">
                            <td colspan="2" valign="top"><c:import url="${indvdlPgeDetail.cntcUrl}" charEncoding="utf-8" /></td>
                        </tr>
                    </table>
                </td>
                </tr>
            </c:forEach>
            <c:set var="startwith" value="${endwith+1}"/>
                <c:choose>
                    <c:when test="${td eq namuzi}">
                    <c:set var="endwith" value="${endwith+indvdlpgeResult.sortLineCnt-1}"/>
                    </c:when>
                    <c:when test="${td > namuzi && namuzi != 0}">
                    <c:set var="endwith" value="${endwith+indvdlpgeResult.sortLineCnt-1}"/>
                    </c:when>
                    <c:otherwise>
                    <c:set var="endwith" value="${endwith+indvdlpgeResult.sortLineCnt}"/>
                    </c:otherwise>  
                </c:choose>
            </table>
       </td>
    </c:forEach> 
    </tr>
</table>
</c:if>
<!-- 세로배열 처리 -->
<c:if test="${indvdlpgeResult.sortMthd eq 'C'}">
<table border="0" cellpadding="8" width="100%" >
    <tr>
    <c:forEach var="tr" begin="1" end="${indvdlpgeResult.sortLineCnt}" step="1"> 
      <td width="200" align="center" valign="top">
      <table border="0" cellpadding="8">
        <c:forEach var="indvdlPgeDetail" items="${indvdlPgeDetailList}" begin="${(tr-1)*indvdlpgeResult.sortCnt}" end="${(tr)*indvdlpgeResult.sortCnt-1}" step="1" >
          <tr>
            <td width="200" align="center" valign="middle">
            <table cellpadding="0" cellspacing="0" style="border:${indvdlpgeResult.titleBarColor} 2px solid" >
              <tr>
                  <td bgcolor="${indvdlpgeResult.titleBarColor}" height="30px">&nbsp;<c:out value="${indvdlPgeDetail.cntntsNm}"/></td> 
                  <td bgcolor="${indvdlpgeResult.titleBarColor}" height="30px" align="right"><a href="<c:out value="${indvdlPgeDetail.cntntsLinkUrl}" />">more..</a>&nbsp;<input type="image" src="<c:url value='/images/egovframework/com/uss/mpe/icon/action_delete.gif' />" alt="삭제" onClick="javascript:delIndvdlCntnts('<c:out value="${indvdlPgeDetail.cntntsId}" />');"></td> 
              </tr>              
              <tr>
                  <td colspan="2"><c:import url="${indvdlPgeDetail.cntcUrl}" charEncoding="utf-8" /></td>
              </tr>
            </table>
            </td>
          </tr>
        </c:forEach>
      </table>
      </td>
    </c:forEach> 
    </tr>
</table>   
</c:if>
</td>
</tr>
</tbody>
</table>
<form name="delCntntsFrm" id="listForm" action="<c:url value='/uss/mpe/EgovIndvdlpgeDelCntnts.do'/>" method="post">
<input type="hidden" name="cntntsId" value="">
</form>
</body>
</html>
