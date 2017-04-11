<%--
/**
 * @Class Name  : EgovSynchrnServerList.java
 * @Description : EgovSynchrnServerList jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.07.01    lee.m.j     최초 생성
 *
 *  @author lee.m.j
 *  @since 2010.07.01
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
--%>

<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<title>동기화대상 서버  목록조회</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!--

function fncSelectSynchrnServerList(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/utl/sys/ssy/selectSynchrnServerList.do'/>";
    document.listForm.submit();
}

function fncSelectSynchrnServer(serverId) {
    document.listForm.serverId.value = serverId;
    document.listForm.action = "<c:url value='/utl/sys/ssy/getSynchrnServer.do'/>";
    document.listForm.submit();   
}

function fncAddSynchrnServerInsert() {
    if(document.listForm.pageIndex.value == "") {
        document.listForm.pageIndex.value = 1;
    } 
    document.listForm.action = "<c:url value='/utl/sys/ssy/addViewSynchrnServer.do'/>";
    document.listForm.submit(); 
}

function linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/utl/sys/ssy/selectSynchrnServerList.do'/>";
    document.listForm.submit();
}

function press() {
    if (event.keyCode==13) {
        fncSelectSynchrnServerList('1');
    }
}

function fncProcessSynchrn(){

    if(document.hiddenForm.totalRecordCount.value == null || 
       document.hiddenForm.totalRecordCount.value == '' ||
       document.hiddenForm.totalRecordCount.value == 0) {
        alert("동기화 대상목록이 없습니다");
        return; 
    }
    
    if(confirm("동기화 하시겠습니까?")) {
        document.listForm.action = "<c:url value='/utl/sys/ssy/processSynchrn.do'/>";
        document.listForm.submit();
    }
}

function fncUploadFile(){
    document.fileForm.action = "<c:url value='/utl/sys/ssy/uploadFile.do'/>";
    document.fileForm.submit();
}

function fncDeleteFile(deleteFileNm){
    if(confirm("삭제 하시겠습니까?")){
        document.fileForm.deleteFileNm.value = deleteFileNm;
        document.fileForm.action = "<c:url value='/utl/sys/ssy/deleteFile.do'/>";
        document.fileForm.submit();
    }
}

function fncCheckAll() {
    var checkField = document.deleteForm.delYn;
    if(document.deleteForm.checkAll.checked) {
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

    var checkField = document.deleteForm.delYn;
    var checkId = document.deleteForm.checkId;
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
                alert("선택된  파일이 없습니다.");
                returnBoolean = false;
            }
        } else {
            if(document.deleteForm.delYn.checked == false) {
                alert("선택된 파일이 없습니다.");
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

    document.deleteForm.deleteFiles.value = returnValue;
    return returnBoolean;
}

function fncFileListDelete() {
    if(fncManageChecked()) {
        if(confirm("삭제하시겠습니까?")) {
            document.deleteForm.action = "<c:url value='/utl/sys/ssy/deleteFile.do'/>";
            document.deleteForm.submit();
        }
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

<form name="listForm" action="<c:url value='/utl/sys/ssy/selectSynchrnServerList.do'/>" method="post">
<table width="100%" class="table-search" border="0">
 <tr>
  <td width="200" class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;동기화대상 서버 관리</h1>
  </td>
  <td width="350"><label for="strSynchrnServerNm">서버 명 : </label><input name="strSynchrnServerNm" id="strSynchrnServerNm" type="text" value="<c:out value="${synchrnServerVO.strSynchrnServerNm}"/>" size="30" title="검색" onkeypress="press();" ></td>
  <th width="150" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectSynchrnServerList('1'); return false;"></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/utl/sys/ssy/addViewSynchrnServer.do'/>?pageIndex=<c:out value='${synchrnServerVO.pageIndex}'/>&amp;strSynchrnServerNm=<c:out value="${synchrnServerVO.strSynchrnServerNm}"/>" onclick="fncAddSynchrnServerInsert(); return false;"><spring:message code="button.create" /></a></span></td>     
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/utl/sys/ssy/processSynchrn.do'/>?pageIndex=<c:out value='${synchrnServerVO.pageIndex}'/>" onclick="fncProcessSynchrn(); return false;">동기화</a></span></td>     
        </tr>
       </table>
  </th>  
 </tr>
 <tr>
  <td class="title_left" colspan="3"></td>
 </tr>   
</table>
<input type="hidden" name="serverId">
<input type="hidden" name="pageIndex" value="<c:if test="${empty synchrnServerVO.pageIndex }">1</c:if><c:if test="${!empty synchrnServerVO.pageIndex }"><c:out value='${synchrnServerVO.pageIndex}'/></c:if>">
</form>

<table width="100%" cellpadding="8" class="table-list" summary="동기화대상 서버에 대한 목록을 제공한다.">
 <caption>동기화대상 서버 목록</caption>
 <thead>
  <tr>
    <th class="title" width="25%" scope="col" nowrap>서버ID</th>
    <th class="title" width="25%" scope="col" nowrap>서버명</th>
    <th class="title" width="20%" scope="col" nowrap>서버IP</th>
    <th class="title" width="15%" scope="col" nowrap>동기화 여부</th>
    <th class="title" width="15%" scope="col" nowrap>등록자</th>
  </tr>
 </thead>
 <tbody>
 <c:forEach var="synchrnServer" items="${synchrnServerList}" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap>
        <form name="item" method="post" action="<c:url value='/utl/sys/ssy/getSynchrnServer.do'/>">
            <input type="hidden" name="serverId" value="<c:out value="${synchrnServer.serverId}"/>">
            <input type="hidden" name="pageIndex" value="<c:out value='${synchrnServerVO.pageIndex}'/>">
            <input type="hidden" name="strSynchrnServerNm" value="<c:out value="${synchrnServerVO.strSynchrnServerNm}"/>">
            <span class="link"><input type="submit" value="<c:out value="${synchrnServer.serverId}"/>" onclick="fncSelectSynchrnServer('<c:out value="${synchrnServer.serverId}"/>'); return false;"></span>
        </form>
    </td>
    <td class="lt_text3" nowrap><c:out value="${synchrnServer.serverNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${synchrnServer.serverIp}"/></td>
    <td class="lt_text3" nowrap><c:out value="${synchrnServer.reflctAt}"/></td>
    <td class="lt_text3" nowrap><c:out value="${synchrnServer.lastUpdusrId}"/></td>
  </tr>
 </c:forEach>
 </tbody>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
</table>

<form name="hiddenForm">
    <input type="hidden" name="totalRecordCount" value="<c:out value="${paginationInfo.totalRecordCount}"/>"/>
</form>

<c:if test="${!empty synchrnServerVO.pageIndex }">
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
<br>
<table border="0">
  <tr>
    <td width="325" valign="top">
         <!-- 동기화대상파일 등록 -->
        <form name="fileForm" action="<c:url value='/utl/sys/ssy/uploadFile.do'/>" method="post" enctype="multipart/form-data">
        <table width="100%" class="table-search" border="0">
         <tr>
          <td width="325" class="title_left">
           <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;동기화대상 파일 등록</h1>
          </td>
        </tr>
        <tr>
          <td class="title_left"></td>
        </tr>
        </table>      
        <table width="100%" cellpadding="8" class="table-line">
              <tr>
                <th class="required_text" width="20%" nowrap>파일 선택 : </th>
                <td class="lt_text" nowrap><input name="file" type="file" size="30" title="동기화대상파일" ></td>
                <td><span class="button"><input type="submit" value="<spring:message code="button.create" />" onclick="fncUploadFile(); return false;"></span></td>
              </tr>
        </table>
        </form>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>  
  <tr>
    <!-- 동기화대상파일 삭제-->   
    <td width="325" valign="top">
        <form name="deleteForm" action="<c:url value='/utl/sys/ssy/deleteFile.do'/>" method="post">
        <table width="100%" class="table-search" border="0">
         <tr>
          <td width="305" class="title_left">
            <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="" />&nbsp;동기화대상 파일 목록</h1>
          </td>
          <td width="20" align="right">
               <table border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td><span class="button"><input type="submit" value="<spring:message code="button.delete" />" onclick="fncFileListDelete(); return false;"></span></td>
                </tr>
               </table>
          </td> 
         </tr>
         <tr>
           <td class="title_left" colspan="2"></td>
         </tr>         
        </table>        
        <table width="100%" cellpadding="8" class="table-line" summary="동기화대상 파일에 대한 목록을 제공한다.">
          <caption>동기화대상 파일 목록</caption>
          <thead>
            <tr>
              <th class="title" width="10%" nowrap><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fncCheckAll()" title="전체선택체크박스"></th>
              <th class="title" width="10%" nowrap>순번</th>
              <th class="title" width="80%" nowrap>파일명</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach var="file" items="${fileList}" varStatus="status">
            <tr>
                <td class="lt_text3" width="10%" nowrap><input type="checkbox" name="delYn" value="<c:out value="${file}"/>"><input type="hidden" name="checkId" value="<c:out value="${file}"/>" /></td>
                <td class="lt_text3"  width="10%" nowrap><c:out value="${status.count}"/></td>
                <td class="lt_text3"  width="80%" nowrap><c:out value="${file}"/></td>
            </tr>
          </c:forEach>
          </tbody>
        </table>    
        <input type="hidden" name="pageIndex" value="<c:out value='${synchrnServerVO.pageIndex}'/>" />
        <input type="hidden" name="deleteFiles" />
        </form>
    </td>
  </tr>
</table>
</DIV>
</body>
</html>