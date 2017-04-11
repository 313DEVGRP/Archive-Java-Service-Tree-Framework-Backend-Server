<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgoBkmkMenuManageList.jsp
  * @Description :  등록한 바로가기메뉴 목록 조회
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.09.25   윤성록          최초 생성
  *
  *  @author 공통컴포넌트개발팀  윤성록
  *  @since 2009.09.25
  *  @version 1.0
  *  @see
  *
  */
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript">


/* ********************************************************
 * 모두선택 처리 함수
 ******************************************************** */
function fCheckAll() {
    var checkField = document.frm.check1;
    if(document.frm.all_check.checked) {
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
/* ********************************************************
 * 멀티삭제 처리 함수
 ******************************************************** */
function fn_egov_deleteBkmkInf(){
    var checkField = document.frm.check1;
    var menuId = document.frm.checkMenuId;
    var userId = document.frm.checkUserId;
    var checkMenuIds = "";

    var checkedCount = 0;
    if(checkField) {
    	if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkMenuIds += ((checkedCount==0? "" : ",") + menuId[i].value);
                    checkedCount++;
                }
            }
            if(checkedCount == 0){
            	alert("선택된 메뉴가 없습니다.");
    			return;
            }
        } else{
            if(checkField.checked) {
                checkMenuIds = menuId.value;
            }else{
            	alert("선택된 메뉴가 없습니다.");
    			return;
            }
        }
    }

	if(confirm("삭제하시겠습니까?")){
   		document.frm.checkMenuIds.value=checkMenuIds;
    	document.frm.action = "<c:url value='/sym/mnu/bmm/EgovBkmkMenuManageDelete.do'/>";
    	document.frm.submit();
    }
}

	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_bkmkInfs('1');
		}
	}

	function fn_egov_select_bkmkInfs(pageNo){
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/sym/mnu/bmm/selectBkmkMenuManageList.do'/>";
		document.frm.submit();
	}

	function fn_egov_add_bkmkInfs(){
		document.frm.action = "<c:url value='/sym/mnu/bmm/addBkmkInf.do'/>";
		document.frm.submit();
	}

	function fn_egov_preview_bkmkInfs(){
		var retVal;
		var url = "<c:url value='/sym/mnu/bmm/openPopup.do?requestUrl=/sym/mnu/bmm/previewBkmkInf.do&width=850&height=360'/>";
		var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";
		retVal = window.showModalDialog(url,"p_userInqire", openParam);

		if(retVal != null){
			document.frm.action = retVal;
			document.frm.submit();
		}
	}

</script>
<title>바로가기 메뉴관리</title>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<form name="frm" action = "<c:url value='/sym/mnu/bmm/selectBkmkMenuManageList.do' />" method="post">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>" ></script>
<input type="hidden" name="checkMenuIds" value = "" >
<input type="hidden" name="searchCnd" value ="0" >
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">


	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="30%"class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
	   &nbsp;바로가기 메뉴관리</td>

	  <td width="10%" class="lt_text3" nowrap>메뉴명</td>
	  <td width="40%">
	    <input name="searchWrd" type="text" size="35" value="<c:out value="${searchVO.searchWrd}"/>" maxlength="35" onkeypress="press(event);" style="width: 200px" title="검색단어입력">

		 <span class="button"><input type="submit" value="조회" onclick="fn_egov_select_bkmkInfs('1'); return false;"></span>
	 </td>
	  <th width="20%">
	   <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
	    <td><span class="button"><a href="<c:url value='/sym/mnu/bmm/openPopup.do?requestUrl=/sym/mnu/bmm/previewBkmkInf.do&amp;width=850&amp;height=360'/>" onclick="fn_egov_preview_bkmkInfs(); return false;" title="새창 " >미리보기</a></span></td>
	      <td>&nbsp;&nbsp;</td>
	    <td><span class="button"><a href="<c:url value= 'fn_egov_deleteBkmkInf()'/>" onclick="fn_egov_deleteBkmkInf(); return false;">삭제</a></span></td>
	     <td>&nbsp;&nbsp;</td>
	    <td><span class="button"><a href="<c:url value='/sym/mnu/bmm/addBkmkInf.do'/>" onclick="fn_egov_add_bkmkInfs(); return false;">등록</a></span></td>
	    </tr>
	   </table>
	  </th>
	 </tr>
	</table>


	<table width="100%" cellpadding="8" class="table-line" summary="바로가기메뉴관리 목록조회">
	 <thead>
	  <tr>
	    <th class="title" width="5%" nowrap><input type="checkbox" name="all_check" class="check2" onclick = "javascript:fCheckAll();" title="체크박스"></th>
	    <th class="title" width="45%" nowrap>메뉴명</th>
	    <th class="title" width="50%" nowrap>메뉴URL</th>

	  </tr>
	 </thead>
	 <tbody>
		 <c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <!-- td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td-->
		    <td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2" title="체크박스">
		    	<input name="checkMenuId" type="hidden" value="<c:out value='${result.menuId}'/>">
		   		<input name="checkUserId" type="hidden" value="<c:out value='${result.userId}'/>"></td>
		    <td class="lt_text3" style="width:200px;text-align:left;">
		    	<span><c:out value="${result.menuNm}" escapeXml="false"/></span>
		    </td>
		    <td class="lt_text3"><c:out value="${result.progrmStrePath}"/></td>

		  </tr>
		 </c:forEach>
		 <c:if test="${fn:length(resultList) == 0}">
		  <tr>
		    <td class="lt_text3" nowrap colspan="3" ><spring:message code="common.nodata.msg" /></td>
		  </tr>
		 </c:if>
	 </tbody>

	</table>
	</form>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_adbkInfs" />
	</div>

	</div>
</body>
</html>
