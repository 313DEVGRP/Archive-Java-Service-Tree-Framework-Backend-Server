<%--
  Class Name : EgovQustnrQestnManageList.jsp
  Description : 설문문항 목록 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.19

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>설문문항 목록 팝업</title>
<base target="_self">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialogCallee.js'/>" ></script>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageListPopup.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_QustnrQestnManage(){
	var vFrom = document.listForm;
	vFrom.cmd.value = '';
	vFrom.action = "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageRegist.do' />";
	vFrom.submit();
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_modify_QustnrQestnManage(){
	location.href = "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageModify.do' />";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_QustnrQestnManage(qestnrQesitmId){
	var vFrom = document.listForm;
	vFrom.qestnrQesitmId.value = qestnrQesitmId;
	vFrom.action = "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageDetail.do' />";
	vFrom.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_QustnrQestnManage(qestnrId){
	var vFrom = document.listForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.qestnrId.value = qestnrId;
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageList.do' />";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_QustnrQestnManage(){
	var vFrom = document.listForm;

	vFrom.action = "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageListPopup.do' />";
	vFrom.submit();

}
/* ********************************************************
 * 선택 처리 함수
 ******************************************************** */
function fn_egov_open_QustnrQestnManage(qestnrQesitmId,  cnt, qestnTyCode){
	getDialogArguments();

	/* var opener = window.dialogArguments; */
	var opener;
 
	if (window.dialogArguments) {
	    opener = window.dialogArguments; // Support IE
	} else {
	    opener = window.opener;    // Support Chrome, Firefox, Safari, Opera
	}

	opener.document.getElementById("qestnrQesitmId").value = qestnrQesitmId;
	opener.document.getElementById("qestnrQesitmCn").value = document.getElementById("iptText_"+ cnt).value;

	if( opener.document.getElementById("divQestnTyCode") != null ){

		if(qestnTyCode == '1')
			opener.document.getElementById("divQestnTyCode").innerText = '객관식';
		else if(qestnTyCode == '2')
			opener.document.getElementById("divQestnTyCode").innerText = '주관식';
	}
	window.returnValue=true;
	window.close();

}
</script>
</head>

<DIV id="content" style="width:712px">
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<form name="listForm" id="listForm" action="<c:url value='/uss/olp/qqm/EgovQustnrQestnManageListPopup.do'/>" method="post">
<table width="100%" cellpadding="1" border="0" summary="타이틀/검색폼/조회 버튼을 제공한다.">
<caption>타이틀/검색폼/조회 버튼을 제공한다.</caption>
 <tr>
  <td class="title_left">
   <h1><img src="<c:out value="${ImgUrl}" />icon/tit_icon.gif" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle; display:inline-block;" alt="제목아이콘이미지">&nbsp;설문문항 목록 팝업</h1>
   </td>
  <th scope="col">&nbsp;</th>
  <td width="110px">
   	<select name="searchCondition" class="select" style="width:100%" title="검색조건선택">
		   <option value=''>--선택하세요--</option>
		   <option value='QESTN_CN' <c:if test="${searchVO.searchCondition == 'QESTN_CN'}">selected</c:if>>질문내용</option>
		   <option value='MXMM_CHOISE_CO' <c:if test="${searchVO.searchCondition == 'MXMM_CHOISE_CO'}">selected</c:if>>최대선택건수</option>
	   </select>
	</td>
  <td width="180px">
<!--     <input name="searchKeyword" type="text" size="10" value="${searchVO.searchKeyword}" maxlength="35" style="width:100%" title="검색어 입력">  -->
     <input name="searchKeyword" type="text" size="10" value="" maxlength="35" style="width:100%" title="검색어 입력">
  </td>
  <th width="70px" align="center">
   <table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
      <td><img src="${ImgUrl}btn/bu2_left.gif"  width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground" nowrap><input type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_search_QustnrQestnManage(); return false;" class="btnNew" style="height:20px;width:26px;padding:0px 0px 0px 0px;" ></td>
      <td><img src="<c:out value="${ImgUrl}" />btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
    </tr>
   </table>
  </th>
 </tr>
</table>

<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<table width="100%" cellpadding="0" class="table-line" summary="목록 을 제공한다.">
<caption>목록 을 제공한다</caption>
 <thead>
  <tr>
    <th scope="col" class="title" width="10%" nowrap>번호</th>
    <th scope="col" class="title" nowrap>질문내용</th>
    <th scope="col" class="title" width="20%" nowrap>질문유형</th>
    <th scope="col" class="title" width="15%" nowrap>등록자</th>
    <th scope="col" class="title" width="15%" nowrap>등록일자</th>
    <th scope="col" class="title" width="30px" nowrap></th>
  </tr>
 </thead>
 <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
<c:if test="${fn:length(resultList) == 0}">
<tr>
<td class="lt_text3" colspan="9">
	<spring:message code="common.nodata.msg" />
</td>
</tr>
</c:if>
 <tbody>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap>${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}</td>
    <td class="lt_text3L" nowrap>
    <div class="divDotText" style="width:320px; border:solid 0px;">
    	<a href="#LINK" onClick="fn_egov_open_QustnrQestnManage('${resultInfo.qestnrQesitmId}', '${status.count}', '${resultInfo.qestnTyCode}')">${resultInfo.qestnCn}</a></div>
    </td>
    <td class="lt_text3" nowrap>
    <c:if test="${resultInfo.qestnTyCode == '1'}">객관식</c:if>
    <c:if test="${resultInfo.qestnTyCode == '2'}">주관식</c:if>
    </td>
    <td class="lt_text3" nowrap>${resultInfo.frstRegisterNm}</td>
    <td class="lt_text3" nowrap>${fn:substring(resultInfo.frstRegisterPnttm, 0, 10)}</td>
    <td class="lt_text3" nowrap>
    <a href="#LINK" onClick="fn_egov_open_QustnrQestnManage('${resultInfo.qestnrQesitmId}', '${status.count}', '${resultInfo.qestnTyCode}')">선택</a>
    <input name="iptText_${status.count}" id="iptText_${status.count}" type="hidden" value="${resultInfo.qestnCn}">
    </td>

  </tr>
</c:forEach>
 </tbody>
</table>

<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<div align="center">
	<div>
		<ui:pagination paginationInfo = "${paginationInfo}"
				type="image"
				jsFunction="linkPage"
				/>
	</div>
</div>

<c:if test="${qustnrQestnManageVO.searchMode == 'Y'}">
<input name="qestnrTmplatId" id="qestnrTmplatId" type="hidden" value="${qustnrQestnManageVO.qestnrTmplatId}">
<input name="qestnrId" id="qestnrId" type="hidden" value="${qustnrQestnManageVO.qestnrId}">
<input name="searchMode" id="qestnrId" type="hidden" value="${qustnrQestnManageVO.searchMode}">
</c:if>

<input name="qestnrQesitmId" id="qestnrQesitmId" type="hidden" value="">
<input name="cmd" type="hidden" value="">

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">

</form>

</DIV>

