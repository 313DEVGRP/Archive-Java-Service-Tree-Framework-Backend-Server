<%
 /**
  * @Class Name : EgovWordDicaryListInqire.jsp
  * @Description : EgovWordDicaryListInqire 화면
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
<title>용어사전목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javaScript" language="javascript">

/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_worddicary(){

	// 첫 입력란에 포커스..
	document.WordDicaryForm.searchKeyword.focus();
	
}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
	
	document.WordDicaryForm.pageIndex.value = pageNo;
	document.WordDicaryForm.action = "<c:url value='/uss/olh/wor/WordDicaryListInqire.do'/>";
   	document.WordDicaryForm.submit();
   	
}

/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_worddicary(){

	document.WordDicaryForm.pageIndex.value = 1;
	document.WordDicaryForm.submit();
	
}

/*********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_worddicary(){

	document.WordDicaryForm.action = "<c:url value='/uss/olh/wor/addWordDicaryView.do'/>";
	document.WordDicaryForm.submit();	
	
}

/*********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_updt_worddicary(){

	document.WordDicaryForm.action = "<c:url value='/uss/olh/wor/updateWordDicaryView.do'/>";
	document.WordDicaryForm.submit();	

}
/* ********************************************************
 * 용어사서전 상세회면 처리 함수
 ******************************************************** */
function fn_egov_inquire_worddicarydetail(wordId) {		

	// 용어사전 키값(wordId) 셋팅.
	document.WordDicaryForm.wordId.value = wordId;	
  	document.WordDicaryForm.action = "<c:url value='/uss/olh/wor/WordDicaryDetailInqire.do'/>";
  	document.WordDicaryForm.submit();	
	   	   		
}


</script>
</head>
<body onLoad="fn_egov_initl_worddicary();">

<DIV id="content" style="width:700px">

<form name="WordDicaryForm" action="<c:url value='/uss/olh/wor/WordDicaryListInqire.do'/>" method="post">
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%" class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="제목아이콘이미지">&nbsp;용어사전목록조회</h1></td>
  <th>
  </th>
  <td width="10%">
   	<select name="searchCondition" class="select" title="조회조건 선택">
		   <option selected value=''>--선택하세요--</option>
		   <option value="wordNm"  <c:if test="${searchVO.searchCondition == 'wordNm'}">selected="selected"</c:if> >용어명</option>
		   <option value="engNm"   <c:if test="${searchVO.searchCondition == 'engNm'}">selected="selected"</c:if> >영문명</option>			   		   
	   </select>
	</td>
  
  <td width="35%">
    <input name="searchKeyword" type="text" size="35" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="35" title="검색어 입력" > 
  </td>
  
  <th width="10%">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td><span class="button"><input type="submit" value="조회" onclick="fn_egov_search_worddicary(); return false;"></span></td>
	  <td>&nbsp;&nbsp;</td>
	  <td><span class="button"><a href="<c:url value='/uss/olh/wor/addWordDicaryView.do'/>" onclick="fn_egov_regist_worddicary(); return false;"><spring:message code="button.create" /></a></span></td>
	  <td>&nbsp;&nbsp;</td>    
    </tr>
   </table>
  </th>  
 </tr>
</table>
<input name="wordId" type="hidden" value="">

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

</form>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<table width="98%" cellpadding="8" class="table-line" border="0" summary="용어사전에 대한 목록을 제공합니다.">
<caption>용어사전목록</caption>
<thead>
<tr>      
    <th scope="col" class="title" width="10%" nowrap>순번</th>    
    <th scope="col" class="title" width="20%" nowrap>용어명</th>        
    <th scope="col" class="title" width="30%" nowrap>영문명</th>       
    <th scope="col" class="title" width="10%" nowrap>동의어</th>
    <th scope="col" class="title" width="15%" nowrap>등록자</th>    
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
  <tr>
		<td class="lt_text3"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>	        
		<td class="lt_text3">
			<form name="subForm" method="post" action="<c:url value='/uss/olh/wor/WordDicaryDetailInqire.do'/>">
	    	<input name="wordId" type="hidden" value="${resultInfo.wordId}">
			<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
	    	<span class="link"><input type="submit"  value="<c:out value="${resultInfo.wordNm}"/>" onclick="fn_egov_inquire_worddicarydetail('<c:out value="${resultInfo.wordId}"/>'); return false;"></span>
	    	</form>
		</td>
		<td class="lt_text3"><c:out value="${resultInfo.engNm}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.synonm}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.emplyrNm}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.frstRegisterPnttm}"/></td>					
			
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



</DIV>
</body>
</html>
