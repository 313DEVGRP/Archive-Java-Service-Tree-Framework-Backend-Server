<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%

/**
 * @Class Name : EgovIntnetSvcGuidanceList.jsp
 * @Description : EgovIntnetSvcGuidanceList jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2009.07.01    lee.m.j     최초 생성
 *
 *  @author lee.m.j
 *  @since 2009.08.14
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
<title>인터넷서비스안내 목록조회</title>

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
                alert("선택된 인터넷서비스 ID가 없습니다.");
                returnBoolean = false;
            }
        } else {
            if(document.listForm.delYn.checked == false) {
                alert("선택된 인터넷서비스 ID가 없습니다.");
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

    document.listForm.intnetSvcIds.value = returnValue;
    return returnBoolean;
}

function fncInsertCheckId() {

	var checkedCounter = 0;
	var checkIds = document.listForm.delYn;
	var checkIdv = document.listForm.checkId;

	for(var i=0; i<checkIds.length; i++) {
        if(checkIds[i].checked) {
		    checkedCounter++;
		    document.listForm.userId.value = checkIdv[i].value;
        }
	}

	if(checkedCounter > 1) {
        alert("등록대상 하나만 선택하십시오");
        return false;
	} else if(checkedCounter < 1) {
        alert("선택된 등록대상이  없습니다");
        return false;
    }

    return true;
}

function fncSelectIntnetSvcGuidanceList(pageNo) {
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/ion/isg/selectIntnetSvcGuidanceList.do'/>";
    document.listForm.submit();
}

function fncSelectIntnetSvcGuidance(intnetSvcId) {
    document.listForm.intnetSvcId.value = intnetSvcId;
    document.listForm.action = "<c:url value='/uss/ion/isg/getIntnetSvcGuidance.do'/>";
    document.listForm.submit();
}

function fncAddIntnetSvcGuidanceInsert() {
    if(document.listForm.pageIndex.value == "") {
        document.listForm.pageIndex.value = 1;
    }
    document.listForm.action = "<c:url value='/uss/ion/isg/addViewIntnetSvcGuidance.do'/>";
    document.listForm.submit();
}

function fncIntnetSvcGuidanceListDelete() {
	if(fncManageChecked()) {
        if(confirm("삭제하시겠습니까?")) {
            document.listForm.action = "<c:url value='/uss/ion/isg/removeIntnetSvcGuidanceList.do'/>";
            document.listForm.submit();
        }
    }
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/ion/isg/selectIntnetSvcGuidanceList.do'/>";
    document.listForm.submit();
}

function press() {

    if (event.keyCode==13) {
    	fncSelectIntnetSvcGuidance('1');
    }
}

function fncViewIntnetSvcGuidance() {

	var url = "<c:url value='/uss/ion/isg/selectIntnetSvcGuidanceResultList.do'/>";
    var openParam = "dialogWidth:800px;dialogHeight:600px;scroll:yes;status:no;center:yes;resizable:yes;";
    window.open(url,"인터넷서비스안내",'width=800,height=600,scrollbars=yes,resizable=no,status=no,center:yes');
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

<form name="listForm" action="<c:url value='/uss/ion/isg/selectIntnetSvcGuidanceList.do'/>" method="post">
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="30%"class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;인터넷서비스안내 관리</td>

  <td width="50%"><label for="searchKeyword">인터넷서비스 명 : </label><input name="searchKeyword" id="searchKeyword" type="text" value="<c:out value="${intnetSvcGuidanceVO.searchKeyword}"/>" size="25" title="검색" ></td>
  <th width="20%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectIntnetSvcGuidanceList('1'); return false;"></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/isg/addViewIntnetSvcGuidance.do'/>?pageIndex=<c:out value='${intnetSvcGuidanceVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${intnetSvcGuidanceVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncAddIntnetSvcGuidanceInsert(); return false;"><spring:message code="button.create" /></a></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/isg/selectIntnetSvcGuidanceResultList.do'/>" onclick="fncViewIntnetSvcGuidance(); return false;" target="_blank"  title="새 창으로 이동" ><spring:message code="button.confirm" /></a></span></td>
        </tr>
       </table>
  </th>
 </tr>
</table>
<input type="hidden" name="intnetSvcId">
<input type="hidden" name="pageIndex" value="<c:if test="${empty intnetSvcGuidanceVO.pageIndex }">1</c:if><c:if test="${!empty intnetSvcGuidanceVO.pageIndex }"><c:out value='${intnetSvcGuidanceVO.pageIndex}'/></c:if>">
<input type="hidden" name="searchCondition" value="1">
</form>

<table width="100%" cellpadding="8" class="table-list" summary="인터넷서비스안내에 대한 목록을 제공한다.">
<caption>인터넷서비스안내 관리</caption>
 <thead>
  <tr>
    <th class="title" width="25%" scope="col" nowrap>인터넷서비스 ID</th>
    <th class="title" width="40%" scope="col" nowrap>인터넷서비스 명</th>
    <th class="title" width="10%" scope="col" nowrap>반영여부</th>
    <th class="title" width="25%" scope="col" nowrap>등록일시</th>
  </tr>
 </thead>
 <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
 <c:if test="${fn:length(intnetSvcGuidanceList) == 0}">
 <tr>
 <td class="lt_text3" colspan="4">
	<spring:message code="common.nodata.msg" />
 </td>
 </tr>
 </c:if>
 <tbody>
 <c:forEach var="intnetSvcGuidance" items="${intnetSvcGuidanceList}" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap>
        <form name="item" method="post" action="<c:url value='/uss/ion/isg/getIntnetSvcGuidance.do'/>">
            <input type="hidden" name="intnetSvcId" value="<c:out value="${intnetSvcGuidance.intnetSvcId}"/>">
            <input type="hidden" name="pageIndex" value="<c:out value='${intnetSvcGuidanceVO.pageIndex}'/>">
            <input type="hidden" name="searchCondition" value="<c:out value='${intnetSvcGuidanceVO.searchCondition}'/>">
            <input type="hidden" name="searchKeyword" value="<c:out value="${intnetSvcGuidanceVO.searchKeyword}"/>">
            <span class="link"><input type="submit" value="<c:out value="${intnetSvcGuidance.intnetSvcId}"/>" onclick="fncSelectIntnetSvcGuidance('<c:out value="${intnetSvcGuidance.intnetSvcId}"/>'); return false;"></span>
        </form>
    </td>
    <td class="lt_text3" nowrap><c:out value="${intnetSvcGuidance.intnetSvcNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${intnetSvcGuidance.reflctAt}"/></td>
    <td class="lt_text3" nowrap><c:out value="${intnetSvcGuidance.regDate}"/></td>
  </tr>
 </c:forEach>
 </tbody>

</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>

<c:if test="${!empty intnetSvcGuidanceVO.pageIndex }">
<div align="center">
    <div>
        <ui:pagination paginationInfo = "${paginationInfo}" type="image"  jsFunction="linkPage"  />
    </div>
</div>
</c:if>



</td>
</tr>
</table>
</DIV>
</body>
</html>
