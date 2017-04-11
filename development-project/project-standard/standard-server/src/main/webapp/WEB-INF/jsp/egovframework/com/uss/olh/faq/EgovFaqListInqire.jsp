<%
 /**
  * @Class Name : EgovFaqListInqire.jsp
  * @Description : EgovFaqListInqire 화면
  * @Modification Information
  * @
  * @  수정일   	수정자		수정내용
  * @ ----------	------		--------------------------------------------------------------
  * @ 2009.02.01	박정규		최초 생성
  *   2011.09.26    서준식              등록일자 출력문을 FMT함수에서 C:OUT함수로 변경
  *  @author 공통서비스팀 
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *  
  **/
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
<title>FAQ 목록 조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javaScript" language="javascript">

/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_faqlist(){

	// 첫 입력란에 포커스..
	document.FaqListForm.searchKeyword.focus();
	
}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
	
	document.FaqListForm.pageIndex.value = pageNo;
	document.FaqListForm.action = "<c:url value='/uss/olh/faq/FaqListInqire.do'/>";
   	document.FaqListForm.submit();
   	
}

/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_faq(){

	document.FaqListForm.pageIndex.value = 1;
	document.FaqListForm.submit();
	
}

/*********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_faq(){

	document.FaqListForm.action = "<c:url value='/uss/olh/faq/FaqCnRegistView.do'/>";
	document.FaqListForm.submit();	
	
}

/*********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_updt_faqlist(){

	document.FaqListForm.action = "<c:url value='/uss/olh/faq/FaqCnUpdtView.do'/>";
	document.FaqListForm.submit();	

}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_inquire_faqlistdetail(faqId) {		

	// Faqid
	document.FaqListForm.faqId.value = faqId;	
//  document.FaqListForm.action = "<c:url value='/uss/olh/faq/FaqListDetailInqire.do'/>";
  	document.FaqListForm.action = "<c:url value='/uss/olh/faq/FaqInqireCoUpdt.do'/>";  	
  	document.FaqListForm.submit();	
	   	   		
}


</script>
</head>
<body onLoad="fn_egov_initl_faqlist();">

<DIV id="content" style="width:712px">

<form name="FaqListForm" action="<c:url value='/uss/olh/faq/FaqListInqire.do'/>" method="post">
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%" class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="제목아이콘이미지">&nbsp;FAQ 목록 조회</h1></td>
  <th>
  </th>
  <td width="10%">
   	<select name="searchCondition" class="select" title="조회조건 선택">
		   <option selected value=''>--선택하세요--</option>
		   <option value="qestnSj"  <c:if test="${searchVO.searchCondition == 'qestnSj'}">selected="selected"</c:if> >질문제목</option>			   
	   </select>
	</td>
  
  <td width="35%">
    <input name="searchKeyword" type="text" size="35" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="35" title="검색어 입력" > 
  </td>
  
  <th width="10%">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td><span class="button"><input type="submit" value="조회" onclick="fn_egov_search_faq(); return false;"></span></td>
	  <td>&nbsp;&nbsp;</td>
	  <td><span class="button"><a href="<c:url value='/uss/olh/faq/FaqCnRegistView.do'/>" onclick="fn_egov_regist_faq(); return false;"><spring:message code="button.create" /></a></span></td>
	  <td>&nbsp;&nbsp;</td>
    </tr>
   </table>
  </th>  
 </tr>
</table>
<input name="faqId" type="hidden" value="">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<table width="100%" cellpadding="8" class="table-line" border="0" summary="FAQ에 대한 목록을 제공합니다.">
<caption>FAQ목록</caption>
<thead>
<tr>      
    <th scope="col" class="title" width="15%" nowrap>순번</th>        
    <th scope="col" class="title" width="55" nowrap>질문제목</th>                   
    <th scope="col" class="title" width="15%" nowrap>조회수</th>        
    <th scope="col" class="title" width="15%" nowrap>등록일자</th>               
</tr>
</thead>

 <c:if test="${fn:length(resultList) == 0}">
  <tr> 
  	<td class="lt_text3" colspan="4">
  		<spring:message code="common.nodata.msg" />
  	</td>
  </tr>   	          				 			   
 </c:if>
    
<tbody>      
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
  <tr>
		<td class="lt_text3"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>	        
		<td class="listLeft">
			<form name="subForm" method="post" action="<c:url value='/uss/olh/faq/FaqInqireCoUpdt.do'/>">
	    	<input name="faqId" type="hidden" value="${resultInfo.faqId}">
			<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
	    	<span class="link"><input type="submit"  value="<c:out value="${resultInfo.qestnSj}"/>" onclick="fn_egov_inquire_faqlistdetail('<c:out value="${resultInfo.faqId}"/>'); return false;"></span>
	    	</form>
		</td>		
		<td class="lt_text3"><c:out value="${resultInfo.inqireCo}"/></td>		
		<td class="lt_text3"><c:out value="${resultInfo.lastUpdusrPnttm}"/></td>			
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
