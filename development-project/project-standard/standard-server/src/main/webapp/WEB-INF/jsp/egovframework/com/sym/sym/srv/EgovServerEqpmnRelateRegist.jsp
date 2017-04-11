<%--
/**
 * @Class Name : EgovServerEqpmnRelateRegist.java
 * @Description : EgovServerEqpmnRelateRegist jsp
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
<title>서버H/W관계 등록</title>

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

    var checkId = document.listForm.checkId;
    var checkRegYn = document.listForm.regYn;
    var checkOrgRegYn = document.listForm.orgRegYn;
    
    var returnValue = "";
    var returnRegYns = "";
    var checkedCount = 0;
    var returnBoolean = false;

    if(checkId) {
        if(checkId.length > 1) {
            for(var i=0; i<checkId.length; i++) {
                if(checkRegYn[i].value != checkOrgRegYn[i].value) {
                    checkedCount++;

                    if(returnValue == "") {
                        returnValue = checkId[i].value;
                        returnRegYns = checkRegYn[i].value;
                    } else { 
                        returnValue = returnValue + ";" + checkId[i].value;
                        returnRegYns = returnRegYns + ";" + checkRegYn[i].value;
                    }
                }
            }

            if(checkedCount > 0) 
                returnBoolean = true;
            else {
                alert("변경된  서버H/W가 없습니다.");
                returnBoolean = false;
            }

        } else {

            returnValue = checkId.value;
            returnRegYns = checkRegYn.value;
            returnBoolean = true;

        }
    } else {
        alert("조회된 결과가 없습니다.");
    }

    document.listForm.serverEqpmnIds.value = returnValue;
    document.listForm.regYns.value = returnRegYns;

    return returnBoolean;
}

function fncSelectServerEqpmnRelateList(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sym/sym/srv/selectServerEqpmnRelateList.do'/>";
    document.listForm.submit();
}

function fncSelectServerList(){
    // document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sym/sym/srv/selectServerList.do'/>";
    document.listForm.submit();
}

function fncAddServerEqpmnRelateInsert() {
    if(fncManageChecked()) {
        if(confirm("저장하시겠습니까?")) {
            document.listForm.action = "<c:url value='/sym/sym/srv/saveServerEqpmnRelate.do'/>";
            document.listForm.submit();
        }
    } else return;
}

function linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sym/sym/srv/selectServerEqpmnRelateList.do'/>";
    document.listForm.submit();
}

function press() {
    if (event.keyCode==13) {
        fncSelectServerEqpmnRelateList('1');
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
<form name="listForm" action="<c:url value='/sym/sym/srv/selectServerEqpmnRelateList.do'/>" method="post">
<table width="100%" class="table-search" border="0">
 <tr>
  <td width="150" class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;서버H/W 등록</h1>
  </td>
  <td width="400"><label for="strServerNm">서버S/W 명 : </label><input type="text" value="<c:out value="${server.serverId}"/>" size="20" class="readOnlyClass" readOnly>&nbsp;<input type="text" id="strServerNm" value="<c:out value="${server.serverNm}"/>" size="20" title="검색" onkeypress="press();" class="readOnlyClass" readOnly></td>
  <td width="150" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><span class="button"><a href="<c:url value='/sym/sym/srv/saveServerEqpmnRelate.do'/>?pageIndex=<c:out value='${serverEqpmnRelateVO.pageIndex}'/>" onclick="fncAddServerEqpmnRelateInsert(); return false;"><spring:message code="button.save" /></a></span></td>     
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="#" onclick="javascript:self.close();">닫기</a></span></td>
        </tr>
       </table>
  </td>  
 </tr>
</table>

<table width="100%" cellpadding="8" class="table-list" summary="서버장비와 서버와의 관계를 등록한다.">
 <caption>서버H/W 등록</caption>
 <thead>
  <tr>
    <th class="title" width="25%" scope="col" nowrap>서버H/W ID</th>
    <th class="title" width="25%" scope="col" nowrap>서버H/W 명</th>
    <th class="title" width="20%" scope="col" nowrap>서버H/W IP</th>
    <th class="title" width="14%" scope="col" nowrap>관리자</th>
    <th class="title" width="15%" scope="col" nowrap>등록여부</th>
    <th class="title" width="1%" scope="col" nowrap></th>
  </tr>
 </thead>
 <tbody>
 <c:forEach var="serverEqpmnRelate" items="${serverEqpmnRelateList}" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap><c:out value="${serverEqpmnRelate.serverEqpmnId}"/></td>
    <td class="lt_text3" nowrap><c:out value="${serverEqpmnRelate.serverEqpmnNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${serverEqpmnRelate.serverEqpmnIp}"/></td>
    <td class="lt_text3" nowrap><c:out value="${serverEqpmnRelate.serverEqpmnMngrNm}"/></td>
    <td class="lt_text3" nowrap><label for="regYn">
        <select name="regYn" id="regYn">
            <option value="Y" <c:if test="${serverEqpmnRelate.regYn == 'Y' }">selected</c:if>>등록</option>
            <option value="N" <c:if test="${serverEqpmnRelate.regYn == 'N' }">selected</c:if>>미등록</option>
        </select>
    </label>
    </td>
    <td>
    <input type="hidden" name="checkId" value="<c:out value="${serverEqpmnRelate.serverEqpmnId}"/>" />
    <input type="hidden" name="orgRegYn" value="<c:out value="${serverEqpmnRelate.regYn}"/>"/>
    </td>
  </tr>
 </c:forEach>
 </tbody>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
</table>

<c:if test="${!empty serverEqpmnRelateVO.pageIndex }">
<div align="center">
    <div>
        <ui:pagination paginationInfo = "${paginationInfo}"
            type="image"
            jsFunction="linkPage"
            />
    </div>
</div>
</c:if>
<input type="hidden" name="serverId" value="<c:out value="${server.serverId}"/>"/>
<input type="hidden" name="strServerId" value="<c:out value="${server.serverId}"/>"/>
<input type="hidden" name="serverEqpmnIds"/>
<input type="hidden" name="regYns"/>
<input type="hidden" name="pageIndex" value="<c:if test="${empty serverEqpmnRelateVO.pageIndex }">1</c:if><c:if test="${!empty serverEqpmnRelateVO.pageIndex }"><c:out value='${serverEqpmnRelateVO.pageIndex}'/></c:if>">
</form>
</td>
</tr>
</table>
</DIV>
</body>
</html>
 