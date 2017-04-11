<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%

/**
 * @Class Name : EgovAnnvrsryManageList.java
 * @Description : EgovAnnvrsryManageList jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.06.29    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.06.29
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>기념일관리 목록 조회</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>" ></script>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javaScript" language="javascript" defer="defer">

	/*설명 : 기념일 목록 조회 */
	function fncSelectAnnvrsryManageList(pageNo){
	    document.listForm.searchCondition.value = "1";
	    document.listForm.pageIndex.value = pageNo;
	    document.target="main_right";
	    document.listForm.action = "<c:url value='/uss/ion/ans/selectAnnvrsryManageList.do'/>";
	    document.listForm.submit();
	}

	/*설명 : 기념일 상세조회 */
	function fncSelectAnnvrsryManage(annId) {
	    document.listForm.annId.value = annId;
	    document.listForm.action = "<c:url value='/uss/ion/ans/selectAnnvrsryManage.do'/>";
	    document.listForm.submit();   
	}
	
	/*설명 : 기념일 신규등록 화면 호출 */
	function fncInsertAnnvrsry() {
		if(document.listForm.pageIndex.value == "") {
			document.listForm.pageIndex.value = 1;
		} 
	    document.listForm.action = "<c:url value='/uss/ion/ans/insertViewAnnvrsry.do'/>";
	    document.listForm.submit(); 
	}
	
	/*설명 : 기념일 목록 페이지 조회 */
	function linkPage(pageNo){
	    document.listForm.searchCondition.value = "1";
	    document.listForm.pageIndex.value = pageNo;
	    document.listForm.action = "<c:url value='/uss/ion/ans/selectAnnvrsryManageList.do'/>";
	    document.listForm.submit();
	}

	/*설명 : 기념일 엑셀등록 PopUp 화면 호출	 */
	function fncAnnvrsryManageBnde() {
	/*
		var varForm	   = document.all["listForm"];
		var openParam  = "left=10, top=0, width=750, height=780, scroll=auto";
		var myWin      = window.open("about:blank","winName",openParam);
		varForm.method = "post";
		varForm.action = "<c:url value='/uss/ion/ans/EgovAnnvrsryManageListPop.do'/>";
		//varForm.target = "winName";
		varForm.submit();
	*/
		var arrParam = new Array(6);
		arrParam[0] = window;
		arrParam[1] = '기념일일괄처리';
	 	window.showModalDialog("/uss/ion/ans/EgovAnnvrsryManageListPop.do", arrParam,"dialogWidth=750px;dialogHeight=500px;resizable=yes;center=yes");
	}

</script>

</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:700px">
<!-- ********** 여기서 부터 본문 내용 *************** -->

<form name="listForm" action="<c:url value='/uss/ion/ans/selectAnnvrsryManageList.do'/>" method="post">    
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;기념일관리 목록</h1></td>
  <td width="50%">&nbsp;</td>
  <th width="10%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectAnnvrsryManageList('1'); return false;"></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/ans/insertViewAnnvrsry.do'/>?searchCondition=1" onclick="fncInsertAnnvrsry(); return false;"><spring:message code="button.create" /></a></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="/uss/ion/ans/EgovAnnvrsryManageListPop.do" target="_blank" title="새 창으로 이동" onclick="fncAnnvrsryManageBnde(); return false;">기념일엑셀등록</a></span></td>
        </tr>
       </table>
  </th>  
 </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="기념일관리목록 검색조건" >
<caption>기념일관리목록 검색조건</caption>
  <tr> 
    <th width="20%" height="23" scope="row" class="required_text"><label for="searchKeyword">년도</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
    <td width="80%">
  		 <select name="searchKeyword" title="년도">
         <c:forEach items="${yearList}" var="result" varStatus="status">
     	   <option value="<c:out value="${result }"/>"  <c:if test="${annvrsryManageVO.searchKeyword eq result}">selected</c:if>><c:out value="${result }"/></option>
         </c:forEach>
         </select>년
    </td>
  </tr>
</table>
<input type="hidden" name="annId">
<input type="hidden" name="pageIndex" value="<c:if test="${empty annvrsryManageVO.pageIndex }">1</c:if><c:if test="${!empty annvrsryManageVO.pageIndex }"><c:out value='${annvrsryManageVO.pageIndex}'/></c:if>">
<input type="hidden" name="searchCondition" value="1">
</form>
<br>

<table width="700" cellpadding="0" class="table-list" summary="이 표는 기념일관리리스트의 정보를 제공하며 기념일제목, 기념일(양/음), 메모, 알림여부, D-day로 구성되어 있습니다." >
<caption>기념일관리 목록</caption>
 <thead>
  <tr>
    <th class="title" width="5%"  scope="col" nowrap>No</th>
    <th class="title" width="20%" scope="col" nowrap>기념일제목</th>
    <th class="title" width="15%" scope="col" nowrap>기념일(양/음)</th>
    <th class="title" scope="col" nowrap>메모</th>
    <th class="title" width="10%" scope="col" nowrap>알림여부</th>
    <th class="title" width="10%" scope="col" nowrap>D-day</th>  
    <th class="title" width="10%" scope="col" nowrap>반복여부</th> 
  </tr>
 </thead>  
 <tbody>
 <c:forEach var="annvrsryManage" items="${annvrsryManageList}" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap><c:out value="${(annvrsryManageVO.pageIndex - 1) * annvrsryManageVO.pageSize + status.count}"/></td>
    <td class="lt_text3" nowrap>
        <form name="item" method="post" action="<c:url value='/uss/ion/ans/selectAnnvrsryManage.do'/>">
            <input type="hidden" name="annId"      value="<c:out value="${annvrsryManage.annId     }"/>">
            <span class="link"><input type="submit" value="<c:out value="${annvrsryManage.annvrsryNm}"/>" onclick="fncSelectAnnvrsryManage('<c:out value="${annvrsryManage.annId}"/>'); return false;" style="text-align : left;"></span>
        </form>
    </td>
    <td class="lt_text3" nowrap><c:out value="${annvrsryManage.annvrsryDe}"/>
    <c:if test="${!empty annvrsryManage.cldrSe }">(<c:if test='${annvrsryManage.cldrSe == "1"}'>양</c:if><c:if test='${annvrsryManage.cldrSe == "2"}'>음</c:if>)</c:if>
    </td>
    <td class="lt_text3" nowrap><c:out value="${annvrsryManage.memo}"/></td>
    <td class="lt_text3" nowrap><c:if test='${annvrsryManage.annvrsrySetup == "Y"}'>ON</c:if>
								<c:if test='${annvrsryManage.annvrsrySetup == "N"}'>OFF</c:if></td> <!-- 알림여부 -->
    <td class="lt_text3" nowrap><c:if test="${!empty annvrsryManage.annvrsryBeginDe }">D-<c:out value='${annvrsryManage.annvrsryBeginDe}'/>일전</c:if>
	</td> <!-- D-day -->
    <td class="lt_text3" nowrap>
    <c:choose>
    	<c:when test="${'1' eq annvrsryManage.reptitSe }">Y</c:when>
    	<c:otherwise>N</c:otherwise>
    </c:choose>
 
    </td>
  </tr>
 </c:forEach>
 
 	<c:if test="${fn:length(annvrsryManageList) == 0}">
		<tr> 
			<td class="lt_text3" colspan="7">
				<spring:message code="common.nodata.msg" />
			</td>
		</tr>   	          				 			   
	</c:if>
 
 </tbody>  
 </table>
 <br>
<c:if test="${!empty annvrsryManageVO.pageIndex }">
<div align="center">
    <div>
        <ui:pagination paginationInfo="${paginationInfo}"
                       type="image"
                       jsFunction="linkPage" />
    </div>
</div>
</c:if>
<!-- ********** 여기까지 내용 *************** -->
</DIV>
</body>
</html>