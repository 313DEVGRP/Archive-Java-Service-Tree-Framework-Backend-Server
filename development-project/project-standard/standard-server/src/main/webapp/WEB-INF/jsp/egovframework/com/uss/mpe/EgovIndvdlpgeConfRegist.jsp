<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Description : EgovIndndlpgeConfRegist.jsp
 * @Modification Information
 * @
 * @  수정일                      수정자               수정내용
 * @ ----------    --------    ---------------------------
 * @ 2009.09.07      이창원            최초 생성
 *
 *  @author Lee changwon
 *  @since 2009.09.07
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
<title>마이페이지 설정</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="indvdlpge" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>" ></script>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 마이페이지 설정 정보 저장
 ******************************************************** */
function fncIndvdlPgeSave() {

    var varForm = document.IndvdlPgeManage; //document.getElementById("IndvdlPgeManage");
    varForm.action = "<c:url value='/uss/mpe/EgovIndvdlpgeConfSave.do' />";

    if(confirm('<spring:message code="common.save.msg" />')){
        if(!validateIndvdlpge(varForm)){           
            return;
        }else{
            varForm.submit();
        } 
    }
}

/* ********************************************************
* 서버 작업 후 혹은 마이페이지 로딩 시 메세지 화면에 보여주기
******************************************************** */
function ShowMessg(){
    if("<c:out value='${message}'/>" != ''){
    alert("<c:out value='${message}'/>");
    }
}

/* ********************************************************
* 컬러 chooser창 띄우기
******************************************************** */
function showColorTable(){
    var openParam = "dialogLeft:10;dialogTop:10;dialogWidth:228px;dialogHeight:180px;scroll:no;status:no;center:yes;resizable:no;";
    window.showModalDialog("${pageContext.request.contextPath}/html/egovframework/com/uss/mpe/EgovIndvdlpgeConfColorChooser.jsp", self, openParam);
}

</script>
</head>
<c:set var="checked" value="${indvdlConf.sortMthd}" />
<body onLoad="javascript:ShowMessg();">
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<table border="0">
  <tr>
    <td width="719">
<form method="post" Name="IndvdlPgeManage" action="<c:url value='/uss/mpe/EgovIndvdlpgeConfSave.do' />">

<table width="98%" cellpadding="8" border="0" summary="제목테이블">
 <tr>
  <td width="40%" class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;마이페이지 구성  </td>
 </tr>
</table>
<table width="98%" cellpadding="8" class="table-line2">
  <tr>
    <th class="required_text" width="20%"><label for="sortCnt">배열방식</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력" width="15" height="15"></th>
    <td nowrap>
      <input name="sortMthd" type="radio" value="R" tabindex="1" <c:if test="${checked eq 'R'}"><c:out value="checked"/></c:if> > 가로기준 배열
      <input name="sortMthd" type="radio" value="C" tabindex="2" <c:if test="${checked eq 'C'}"><c:out value="checked"/></c:if> > 세로기준 배열<form:errors path="sortMthd" /> : 개수
      <input name="sortCnt" id="sortCnt" type="text" size="5" tabindex="3" value="<c:out value="${indvdlConf.sortCnt}"/>" ><form:errors path="sortCnt" />
    </td>
  </tr>
  <tr>
    <th class="required_text"><label for="titleBarColor">타이틀 바 색상</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력" width="15" height="15"></th>
    <td nowrap>색상코드
        <input name="titleBarColor" id="titleBarColor" type="text" maxLength="7" tabindex="4" value="<c:out value="${indvdlConf.titleBarColor}"/>"><form:errors path="titleBarColor" />
        <span style="cursor:pointer;" onclick="showColorTable(); return false;" ><img src="<c:url value='/images/egovframework/com/uss/mpe/icon/cIcon.gif' />" alt="색상표아이콘" width="16" height="16" border="2" style="vertical-align: middle"></span>
    </td>
  </tr>
</table>
<table width="98%" cellpadding="8" border="0">
 <tr>
  <th width="10%" align="center">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td>
      </td>
      <td><span class="button"><input type="submit" value="<spring:message code='button.save' />" onclick="fncIndvdlPgeSave(); return false;"></span> 
      </td>
      </tr>
   </table>
  </th>  
 </tr>
</table>
</form>
</td>
</tr>
</table>    
</body>
</html>
