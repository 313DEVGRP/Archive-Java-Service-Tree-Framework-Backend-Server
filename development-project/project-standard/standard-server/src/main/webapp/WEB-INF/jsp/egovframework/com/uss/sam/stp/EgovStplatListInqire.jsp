<%
 /**
  * @Class Name : EgovStplatListInqire.jsp
  * @Description : EgovStplatListInqire 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.02.01   박정규              최초 생성
  *   2011.09.19   서준식              등록일자 Char 변경으로 fmt기능 사용안함
  *  @author 공통서비스팀
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>약관목록 조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javaScript" language="javascript">

/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_stplatlist(){

	// 첫 입력란에 포커스..
	document.StplatListForm.searchKeyword.focus();

}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){

	document.StplatListForm.pageIndex.value = pageNo;
	document.StplatListForm.action = "<c:url value='/uss/sam/stp/StplatListInqire.do'/>";
   	document.StplatListForm.submit();

}

/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_stplatcn(){

	document.StplatListForm.pageIndex.value = 1;
	document.StplatListForm.submit();

}

/*********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_stplatcn(){

	document.StplatListForm.action = "<c:url value='/uss/sam/stp/StplatCnRegistView.do'/>";
	document.StplatListForm.submit();

}

/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_inquire_stplatdetail(useStplatId) {

	// 사이트 키값(siteId) 셋팅.
	document.StplatListForm.useStplatId.value = useStplatId;
  	document.StplatListForm.action = "<c:url value='/uss/sam/stp/StplatDetailInqire.do'/>";
  	document.StplatListForm.submit();

}


</script>
</head>
<body onLoad="fn_egov_initl_stplatlist();">

<DIV id="content" style="width:712px">

<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<form name="StplatListForm" action="<c:url value='/uss/sam/stp/StplatListInqire.do'/>" method="post">
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%" class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="제목아이콘이미지">&nbsp;약관목록 조회</h1></td>
  <th>
  </th>
  <td width="10%">
   	<select name="searchCondition" class="select" title="검색조건선택">
		   <option selected value=''>--선택하세요--</option>
		   <option value="useStplatNm"  <c:if test="${searchVO.searchCondition == 'useStplatNm'}">selected="selected"</c:if> >이용약관명</option>
		   <option value="useStplatCn"  <c:if test="${searchVO.searchCondition == 'useStplatCn'}">selected="selected"</c:if> >이용약관내용</option>
	   </select>
	</td>

  <td width="35%">
    <input name="searchKeyword" type="text" size="35" title="검색어 입력" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="35" >
  </td>

  <th width="10%">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground" nowrap><input type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_search_stplatcn(); return false;" class="btnNew" style="height:20px;width:26px;padding:0px 0px 0px 0px;" ></td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" width="8" height="20" alt="버튼이미지"></td>
      <td>&nbsp;&nbsp;</td>

      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground" nowrap><a href="<c:url value='/uss/sam/stp/StplatCnRegistView.do' />"><spring:message code="button.create" /></a></td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" width="8" height="20" alt="버튼이미지"></td>
      <td>&nbsp;&nbsp;</td>
    </tr>
   </table>
  </th>
 </tr>
</table>

<table width="98%" cellpadding="8" class="table-line" border="0" summary="이 표는 약관내용 대상 정보를 제공하며, 이용약관명, 이용약관내용, 등록일자 내용 정보로 구성되어 있습니다 .">
<thead>
<tr>
    <th scope="col" class="title" width="5%" nowrap>순번</th>
    <th scope="col" class="title" width="25%" nowrap>이용약관명</th>
    <th scope="col" class="title" width="55%" nowrap>이용약관내용</th>
    <th scope="col" class="title" width="15%" nowrap>등록일자</th>

</tr>
</thead>

 <c:if test="${fn:length(resultList) == 0}">
  <tr>
  	<td class="lt_text3" colspan=10>
  		<spring:message code="common.nodata.msg" />
  	</td>
  </tr>
 </c:if>

<tbody>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
  <tr style="cursor:hand;" onClick="fn_egov_inquire_stplatdetail('<c:out value="${resultInfo.useStplatId}"/>')">
		<td class="lt_text3"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.useStplatNm}"/></td>
   		<td class="lt_text3"><c:out value='${fn:substring(resultInfo.useStplatCn, 0, 40)}'/></td>

		<td class="lt_text3"><c:out value='${resultInfo.lastUpdusrPnttm}'/></td>	

  </tr>
</c:forEach>
</tbody>
</table>


<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<div align="center">
	<div>
		<ui:pagination paginationInfo = "${paginationInfo}"
				type="image"
				jsFunction="fn_egov_select_linkPage"
				/>
	</div>
</div>

<input name="useStplatId" type="hidden" value="">

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">

</form>

</DIV>
</body>
</html>