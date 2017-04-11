<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% 
/**
 * @Class Name : EgovBatchOpertListPopup.jsp
 * @Description : 배치작업관리 목록조회팝업
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2010.08.24   김진만          최초 생성
 *
 *  @author 김진만
 *  @version 1.0 
 *  @see
 *  
 */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>배치작업조회팝업</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialogCallee.js'/>" ></script>
<script type="text/javascript">

    function press(event) {
        if (event.keyCode==13) {
            fn_egov_get_list('1');
        }
    }

    function fn_egov_get_list(pageNo) {
        if (document.frm.searchKeyword.value != "") {
            if (document.frm.searchCondition.value == "") {
                alert("검색조건을 선택하세요.");
                return;
            }
        }
        document.frm.pageIndex.value = pageNo; 
        document.frm.action = "<c:url value='/sym/bat/getBatchOpertList.do?popupAt=Y'/>";
        document.frm.submit();  
    }
    
    // 팝업검색 결과를 호출자에게 리턴하고 화면을 닫는다.
    function fn_egov_return_batch_opert(batchOpertId, batchOpertNm) {
    	getDialogArguments();
        var opener = parent.window.dialogArguments;

        opener.document.getElementById("batchOpertId").value = batchOpertId;
        opener.document.getElementById("batchOpertNm").value = batchOpertNm;

        setReturnValue(true);
        
        parent.window.returnValue = true;
        parent.window.close();
    }
    
</script>

</head>
<body>

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:712px">

    <form name="frm" id="frm" action="<c:url value='/sym/bat/getBatchOpertList.do?popupAt=Y'/>" method="post">
    <table width="100%" cellpadding="8" class="table-search" border="0" summary="리스트 조회기능을 제공한다.">
     <tr>
      <td width="35%"class="title_left">
       <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;배치작업 조회</h1>
      </td>
      <td width="10%" >
            <select name="searchCondition" class="select" title="검색조건구분" >
                <option value=''>--선택하세요--</option>
                <option value="0" <c:if test="${searchVO.searchCondition == '0'}">selected="selected"</c:if> >배치작업명</option>
                <option value="1" <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if> >배치프로그램</option>
           </select>
        </td>
      <td width="35%">
        <input name="searchKeyword" type="text" size="35" value='<c:out value="${searchVO.searchKeyword}"/>' maxlength="35" onkeypress="press(event);" title="검색키워드" > 
      </td>
      <th width="20%" align="right">
           <table border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_get_list('1'); return false;"></span></td>
              <td>&nbsp;&nbsp;</td>
            </tr>
           </table>
      </th>  
     </tr>
    </table>
    <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}' default="1"/>">
    <input name="batchOpertId" type="hidden" value="">
    </form>


    <table width="100%" cellpadding="8" class="table-list" summary="배치작업에 대한 목록을 제공합니다.">
     <caption>배치작업 조회</caption>
     <thead>
      <tr>
        <th class="title" width="20%" scope="col" nowrap="nowrap">배치작업ID</th>
        <th class="title" width="20%" scope="col" nowrap="nowrap">배치작업명</th>
        <th class="title" width="40%" scope="col" nowrap="nowrap">배치프로그램</th>
        <th class="title" width="15%" scope="col" nowrap="nowrap">파라미터</th>
        <th class="title" width="5%" scope="col" nowrap="nowrap">&nbsp;</th>
      </tr>
     </thead>    
     <tbody>
        <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
        <c:if test="${fn:length(resultList) == 0}">
        <tr> 
            <td class="lt_text3" colspan="9">
            <spring:message code="common.nodata.msg" />
            </td>
        </tr>                                              
        </c:if>
         <%-- 데이터를 화면에 출력해준다 --%>
        <c:forEach items="${resultList}" var="resultInfo" varStatus="status">
          <tr>
                <td class="lt_text3">${resultInfo.batchOpertId}</td>
                <td class="lt_text6">${resultInfo.batchOpertNm}</td>
                <td class="lt_text6">${resultInfo.batchProgrm}</td>
                <td class="lt_text6">${resultInfo.paramtr}</td>
                <td class="lt_text3" nowrap="nowrap">
                  <span class="link">
                  <input type="submit" value="선택" 
                    onclick="fn_egov_return_batch_opert('<c:out value="${resultInfo.batchOpertId}"/>', '<c:out value="${resultInfo.batchOpertNm}"/>'); return false;">
                  </span>
                </td>
          </tr>   
        </c:forEach>
     
     </tbody>
    </table>
    <table width="100%" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
      <tr> 
        <td height="10"></td>
      </tr>
    </table>
    <div align="center">
        <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_get_list" />
    </div>
</div>

</body>
</html>