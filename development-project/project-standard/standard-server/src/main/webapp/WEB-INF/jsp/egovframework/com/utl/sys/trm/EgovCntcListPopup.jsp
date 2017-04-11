<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% 
/**
 * @Class Name : EgovCntcListPopup.jsp
 * @Description : 연계 목록조회
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2010.07.22   김진만          최초 생성
 *
 *  @author 김진만
 *  @since 2010.07.22
 *  @version 1.0 
 *  @see
 *  
 */
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>연계 조회</title>
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
        document.frm.action = "<c:url value='/utl/sys/trm/getCntcList.do'/>";
        document.frm.submit();  
    }

    // 팝업검색 결과를 호출자에게 리턴하고 화면을 닫는다.
    function fn_egov_return_cntc(cntcId, cntcNm, provdInsttNm, provdSysNm, provdSvcNm, requstInsttNm, requstSysNm) {
    	getDialogArguments();
        var opener = parent.window.dialogArguments;

        opener.document.getElementById("cntcId").value = cntcId;
        opener.document.getElementById("cntcNm").value = cntcNm;
        opener.document.getElementById("provdInsttNm").innerHTML = provdInsttNm;
        opener.document.getElementById("provdSysNm").innerHTML = provdSysNm;
        opener.document.getElementById("provdSvcNm").innerHTML = provdSvcNm;
        opener.document.getElementById("requstInsttNm").innerHTML = requstInsttNm;
        opener.document.getElementById("requstSysNm").innerHTML = requstSysNm;

        setReturnValue(true);
        parent.window.returnValue = true;
        parent.window.close();
    }
    
</script>

</head>
<body>

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:712px">

    <form name="frm" id="frm" action="<c:url value='/utl/sys/trm/getCntcList.do'/>" method="post">
    <table width="100%" cellpadding="8" class="table-search" border="0" summary="리스트 조회기능을 제공한다.">
     <tr>
      <td width="35%"class="title_left">
       <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;연계 조회
      </td>
      <td width="10%" >
            <select name="searchCondition" class="select" title="검색조건">
                <option value=''>--선택하세요--</option>
                <option value="0" <c:if test="${searchVO.searchCondition == '0'}">selected="selected"</c:if> >연계명</option>
           </select>
        </td>
      <td width="35%">
        <input name="searchKeyword" type="text" size="35" value='<c:out value="${searchVO.searchKeyword}"/>' maxlength="35" onkeypress="press(event);" title="검색조건"> 
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
    <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
    <input name="cntcId" type="hidden" value="">
    </form>


    <table width="100%" cellpadding="8" class="table-list" summary="등록된 연계정보에 대한 목록을 제공합니다.">
     <thead>
      <tr>
        <th class="title" width="15%" nowrap="nowrap">연계명</th>
        <th class="title" width="15%" nowrap="nowrap">제공기관</th>
        <th class="title" width="15%" nowrap="nowrap">제공시스템</th>
        <th class="title" width="20%" nowrap="nowrap">제공서비스</th>
        <th class="title" width="15%" nowrap="nowrap">요청기관</th>
        <th class="title" width="15%" nowrap="nowrap">요청시스템</th>   
        <th class="title" width="5%" nowrap="nowrap">&nbsp;</th>
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
              <td class="lt_text3">${resultInfo.cntcNm}</td>
              <td class="lt_text3">${resultInfo.provdInsttNm}</td>
              <td class="lt_text3">${resultInfo.provdSysNm}</td>
              <td class="lt_text3">${resultInfo.provdSvcNm}</td>
              <td class="lt_text3">${resultInfo.requstInsttNm}</td>
              <td class="lt_text3">${resultInfo.requstSysNm}</td>
              <td class="lt_text3" nowrap="nowrap">
                <span class="link">
                <input type="submit" value="선택" 
                    onclick="fn_egov_return_cntc('<c:out value="${resultInfo.cntcId}"/>', '<c:out value="${resultInfo.cntcNm}"/>', 
                                                 '<c:out value="${resultInfo.provdInsttNm}"/>', '<c:out value="${resultInfo.provdSysNm}"/>', 
                                                 '<c:out value="${resultInfo.provdSvcNm}"/>', '<c:out value="${resultInfo.requstInsttNm}"/>',
                                                 '<c:out value="${resultInfo.requstSysNm}"/>'); return false;">
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