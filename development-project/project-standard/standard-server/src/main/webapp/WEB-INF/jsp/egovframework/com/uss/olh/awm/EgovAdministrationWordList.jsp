<%--
  Class Name : EgovAdministrationWordList.jsp
  Description : 행정전문용어사전 목록 페이지
  Modification Information

      수정일        수정자          수정내용
     -----------   ---------    ---------------------------
     2008.03.09    	장동한          최초 생성
   	 2011.09.05		이기하			Tag 변수값수정( ADMINIST_WORD_ENG -> ADMINIST_WORD_ENG_NM
													ADMINIST_WORD_ABRV -> ADMINIST_WORD_ABRV_NM
													ADMINIST_WORD_DF -> ADMINIST_WORD_DFN )

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>행정전문용어사전 목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/olh/awm/listAdministrationWord.do'/>";
   	document.listForm.submit();
}

/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_AdministrationWord(qestnrRespondId){
	var vFrom = document.listForm;
	vFrom.qestnrRespondId.value = qestnrRespondId;
	vFrom.action = "<c:url value='/uss/olh/awm/detailAdministrationWord.do'/>";
	vFrom.submit();
}

/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_AdministrationWord(){
	var vFrom = document.listForm;
	vFrom.choseongA.value = '';
	vFrom.choseongB.value = '';
	vFrom.cmd.value = '';
	vFrom.action = "<c:url value='/uss/olh/awm/listAdministrationWord.do'/>";
	vFrom.submit();

}
/* ********************************************************
* 초성검색
******************************************************** */
function fn_egov_choseong_AdministrationWordManage(choseongA, choseongB, cmd){
	var vFrom = document.listForm;

	vFrom.choseongA.value = choseongA;
	vFrom.choseongB.value = choseongB;
	vFrom.cmd.value = cmd;

	vFrom.action = "<c:url value='/uss/olh/awm/listAdministrationWord.do'/>";
	vFrom.submit();

}
</script>
<style TYPE="text/css">
.choseongTxt {font-weight: bold;}
</style>
</head>
<body>
<DIV id="content" style="width:712px">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<form name="listForm" action="<c:url value=''/>" method="post">
<table width="100%" cellpadding="1" class="table-search" border="0">
 <tr>
  <td class="title_left">

   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;행정전문용어사전 목록</td>
  <th>
  </th>
  <td width="110px">
   	<select name="searchCondition" class="select" style="width:100%" title="검색조건선택">
		   <option value=''>--선택하세요--</option>
		   <option value='ADMINIST_WORD_NM' <c:if test="${searchCondition == 'ADMINIST_WORD_NM'}">selected</c:if>>행정용어명</option>
		   <option value='ADMINIST_WORD_ENG_NM' <c:if test="${searchCondition == 'ADMINIST_WORD_ENG_NM'}">selected</c:if>>행정용어영문명</option>
		   <option value='ADMINIST_WORD_ABRV_NM' <c:if test="${searchCondition == 'ADMINIST_WORD_ABRV_NM'}">selected</c:if>>행정용어약어명</option>
		   <option value='ADMINIST_WORD_DFN' <c:if test="${searchCondition == 'ADMINIST_WORD_DFN'}">selected</c:if>>행정용어정의</option>
		   <option value='ADMINIST_WORD_DC' <c:if test="${searchCondition == 'ADMINIST_WORD_DC'}">selected</c:if>>행정용어설명</option>

	   </select>
	</td>
  <td width="180px">
    <input name="searchKeyword" type="text" size="10" value="" maxlength="35" style="width:100%" title="검색단어입력">
  </td>
  <th width="35px" align="center">
   <table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
      <td>&nbsp;</td>
      <td><span class="button">
      	  <a href="JavaScript:fn_egov_search_AdministrationWord()">
      	  <spring:message code="button.inquire" /></a></span>
      </td>
    </tr>
   </table>
  </th>
 </tr>
</table>
<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="5px"></td>
</tr>
</table>
<!--  검색버튼 -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td colspan="5" height="2" bgcolor="#479B0F"></td>
</tr>
<tr>
	<td bgcolor="#DCFAC9" width="20px"></td>
	<td bgcolor="#DCFAC9"><b>한글</b></td>
	<td bgcolor="#DCFAC9">
		<table cellspacing="0" cellpadding="0" border="0">
		<tr>

			<td <c:if test="${choseongA eq '가' && choseongB eq '나'}">class="choseongTxt"</c:if>><a href="#" onClick="fn_egov_choseong_AdministrationWordManage('가', '나', 'H')">ㄱ</a></td>
			<td <c:if test="${choseongA eq '나' && choseongB eq '다'}">class="choseongTxt"</c:if>><a href="#" onClick="fn_egov_choseong_AdministrationWordManage('나', '다', 'H')">ㄴ</a></td>
			<td <c:if test="${choseongA eq '다' && choseongB eq '라'}">class="choseongTxt"</c:if>><a href="#" onClick="fn_egov_choseong_AdministrationWordManage('다', '라', 'H')">ㄷ</a></td>
			<td <c:if test="${choseongA eq '라' && choseongB eq '마'}">class="choseongTxt"</c:if>><a href="#" onClick="fn_egov_choseong_AdministrationWordManage('라', '마', 'H')">ㄹ</a></td>
			<td <c:if test="${choseongA eq '마' && choseongB eq '바'}">class="choseongTxt"</c:if>><a href="#" onClick="fn_egov_choseong_AdministrationWordManage('마', '바', 'H')">ㅁ</a></td>
			<td <c:if test="${choseongA eq '바' && choseongB eq '사'}">class="choseongTxt"</c:if>><a href="#" onClick="fn_egov_choseong_AdministrationWordManage('바', '사', 'H')">ㅂ</a></td>
			<td <c:if test="${choseongA eq '사' && choseongB eq '아'}">class="choseongTxt"</c:if>><a href="#" onClick="fn_egov_choseong_AdministrationWordManage('사', '자', 'H')">ㅅ</a></td>
			<td <c:if test="${choseongA eq '아' && choseongB eq '자'}">class="choseongTxt"</c:if>><a href="#" onClick="fn_egov_choseong_AdministrationWordManage('사', '자', 'H')">ㅇ</a></td>
			<td <c:if test="${choseongA eq '자' && choseongB eq '차'}">class="choseongTxt"</c:if>><a href="#" onClick="fn_egov_choseong_AdministrationWordManage('자', '차', 'H')">ㅈ</a></td>
			<td <c:if test="${choseongA eq '차' && choseongB eq '카'}">class="choseongTxt"</c:if>><a href="#" onClick="fn_egov_choseong_AdministrationWordManage('차', '카', 'H')">ㅊ</a></td>
			<td <c:if test="${choseongA eq '카' && choseongB eq '타'}">class="choseongTxt"</c:if>><a href="#" onClick="fn_egov_choseong_AdministrationWordManage('카', '타', 'H')">ㅋ</a></td>
			<td <c:if test="${choseongA eq '타' && choseongB eq '파'}">class="choseongTxt"</c:if>><a href="#" onClick="fn_egov_choseong_AdministrationWordManage('타', '파', 'H')">ㅌ</a></td>
			<td <c:if test="${choseongA eq '파' && choseongB eq '하'}">class="choseongTxt"</c:if>><a href="#" onClick="fn_egov_choseong_AdministrationWordManage('파', '하', 'H')">ㅍ</a></td>
			<td <c:if test="${choseongA eq '하' && choseongB eq '하'}">class="choseongTxt"</c:if>><a href="#" onClick="fn_egov_choseong_AdministrationWordManage('하', '하', 'H')">ㅎ</a></td>
		</tr>
		</table>
	</td>
	<td bgcolor="#DCFAC9"><b>영문</b></td>
	<td bgcolor="#DCFAC9">
		<table cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td <c:if test="${choseongA eq 'A' && choseongB eq 'E'}">class="choseongTxt"</c:if>><a href="#" onClick="fn_egov_choseong_AdministrationWordManage('A', 'E', 'E')">A-E</a></td>
			<td width="3"></td>
			<td <c:if test="${choseongA eq 'F' && choseongB eq 'J'}">class="choseongTxt"</c:if>><a href="#" onClick="fn_egov_choseong_AdministrationWordManage('F', 'J', 'E')">F-J</a></td>
			<td width="3"></td>
			<td <c:if test="${choseongA eq 'K' && choseongB eq 'O'}">class="choseongTxt"</c:if>><a href="#" onClick="fn_egov_choseong_AdministrationWordManage('K', 'O', 'E')">K-O</a></td>
			<td width="3"></td>
			<td <c:if test="${choseongA eq 'P' && choseongB eq 'T'}">class="choseongTxt"</c:if>><a href="#" onClick="fn_egov_choseong_AdministrationWordManage('P', 'T', 'E')">P-T</a></td>
			<td width="3"></td>
			<td <c:if test="${choseongA eq 'U' && choseongB eq 'Z'}">class="choseongTxt"</c:if>><a href="#" onClick="fn_egov_choseong_AdministrationWordManage('U', 'Z', 'E')">U-Z</a></td>
		</tr>
		</table>
	</td>
</tr>
<tr>
	<td colspan="5" height="2" bgcolor="#479B0F"></td>
</tr>
</table>
<input name="choseongA" type="hidden" value="<c:out value='${choseongA}'/>">
<input name="choseongB" type="hidden" value="<c:out value='${choseongB}'/>">
<input name="administWordId" type="hidden" value="">
<input name="searchMode" type="hidden" value="">
<input name="cmd" type="hidden" value="<c:out value='${cmd}'/>">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form>


<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="5px"></td>
</tr>
</table>
<!--  리스트역영 -->
<table width="100%" cellpadding="0" class="table-line" border="0">
<thead>
  <tr>
    <th class="title" width="35px" nowrap>순번</th>

    <th class="title" width="60px" nowrap>구분</th>
    <th class="title" width="150px" nowrap>주제영역</th>
    <th class="title" nowrap>용어명</th>

    <th class="title" width="150px" nowrap>영문약어명</th>
    <th class="title" width="70px" nowrap>등록일자</th>
  </tr>
</thead>
<tbody>
<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
<c:if test="${fn:length(resultList) == 0}">
<tr>
<td class="lt_text3" colspan="6">
	<spring:message code="common.nodata.msg" />
</td>
</tr>
</c:if>

 <%-- 데이터를 화면에 출력해준다 --%>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
<tr>
    <td class="lt_text3"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>

    <td class="lt_text3">
    <c:if test="${resultInfo.wordDomn == '1'}">표준어</c:if>
    <c:if test="${resultInfo.wordDomn == '2'}">동의어</c:if>
    </td>
    <td class="lt_text3"><c:out value="${resultInfo.themaRelm}"/></td>

    <td class="lt_text3L">
    <form name="subForm" method="post" action="<c:url value='/uss/olh/awm/detailAdministrationWord.do'/>">
   		<input name="administWordId" type="hidden" value="${resultInfo.administWordId}">
   		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
   		<span class="link"><input type="submit" style="width:220px;text-align:left;" value="<c:out value="${resultInfo.administWordNm}"/>" onclick="fn_egov_detail_AdministrationWordManage('<c:out value="${resultInfo.onlineMnlId}"/>'); return false;"></span>
    </form>

    </td>
    <td class="lt_text3"><c:out value="${resultInfo.administWordAbrv}"/></td>
    <td class="lt_text3"><c:out value="${fn:substring(resultInfo.frstRegisterPnttm, 0, 10)}"/></td>
</tr>
</c:forEach>
</tbody>
</table>
<!--  페이지 내비게이셔션 -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<div align="center">
	<div>
		<ui:pagination paginationInfo = "${paginationInfo}"
				type="image"
				jsFunction="linkPage"
				/>
	</div>
</div>


</DIV>

</body>
</html>