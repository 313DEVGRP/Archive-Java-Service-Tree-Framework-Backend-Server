<%
 /**
  * @Class Name : EgovQnaAnswerListInqire.jsp
  * @Description : EgovQnaAnswerListInqire 화면
  * @Modification Information
  * @
  * @  수정일   	수정자		수정내용
  * @ ----------	------		----------------------------------------------
  * @ 2009.02.01	박정규		최초 생성
  *
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
<title>Q&amp;A답변목록 조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javaScript" language="javascript">

/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_qnaanswerlist(){

	// 첫 입력란에 포커스..
	document.QnaAnswerListForm.searchKeyword.focus();
	
}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
	
	document.QnaAnswerListForm.pageIndex.value = pageNo;
	document.QnaAnswerListForm.action = "<c:url value='/uss/olh/qnm/QnaAnswerListInqire.do'/>";
   	document.QnaAnswerListForm.submit();
   	
}

/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_qnacnanswer(){

	document.QnaAnswerListForm.pageIndex.value = 1;
	document.QnaAnswerListForm.submit();
	
}

/*********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_qnaanswercn(){

	if	(confirm("저장하시겠습니까?"))	{	

		document.QnaAnswerListForm.action = "<c:url value='/uss/olh/qnm/QnaAnswerCnRegistView.do'/>";
		document.QnaAnswerListForm.submit();
			
	}
	
	
	
}

/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_inquire_qnaanswerdetail(qaId) {		

	// Q&A ID 셋팅.
	document.QnaAnswerListForm.qaId.value = qaId;	
    document.QnaAnswerListForm.action = "<c:url value='/uss/olh/qnm/QnaAnswerDetailInqire.do'/>"; 
  	document.QnaAnswerListForm.submit();	
	   	   		
}

</script>
</head>
<body onLoad="fn_egov_initl_qnaanswerlist();">

<DIV id="content" style="width:700px">

<form name="QnaAnswerListForm" action="<c:url value='/uss/olh/qnm/QnaAnswerListInqire.do'/>" method="post">
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%" class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="제목아이콘이미지">&nbsp;Q&amp;A답변목록 조회</h1></td>
  <th>
  </th>
  <td width="10%">
   	<select name="searchCondition" class="select" title="조회조건 선택">
		   <option selected value=''>--선택하세요--</option>
		   <option value="wrterNm"  <c:if test="${searchVO.searchCondition == 'wrterNm'}">selected="selected"</c:if> >작성자명</option>
		   <option value=qnaProcessSttusCodeNm  <c:if test="${searchVO.searchCondition == 'qnaProcessSttusCodeNm'}">selected="selected"</c:if> >진행상태</option>			   
	   </select>
	</td>
  
  <td width="35%">
    <input name="searchKeyword" type="text" size="35" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="35"  title="검색어 입력"> 
  </td>
  
  <th width="10%">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td><span class="button"><input type="submit" value="조회" onclick="fn_egov_search_qnacnanswer(); return false;"></span></td>
	  <td>&nbsp;&nbsp;</td>  
    </tr>
   </table>
  </th>  
 </tr>
</table>
<input name="qaId" type="hidden" value="">
<input name="passwordConfirmAt" type="hidden" value="">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<table width="98%" cellpadding="8" class="table-line" border="0" summary="Q&amp;A에 대한 답변목록을 제공합니다.">
  <caption>Q&amp;A답변목록</caption>
<thead>
<tr>      
    <th scope="col" class="title" width="10%" nowrap>순번</th>        
    <th scope="col" class="title" width="40%" nowrap>질문제목</th>    
    <th scope="col" class="title" width="15%" nowrap>작성자</th>        
    <th scope="col" class="title" width="10%" nowrap>진행상태</th>               
    <th scope="col" class="title" width="10%" nowrap>조회수</th>        
    <th scope="col" class="title" width="15%" nowrap>작성일자</th>                   
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
		<td class="listLeft">
			<form name="subForm" method="post" action="<c:url value='/uss/olh/qnm/QnaAnswerDetailInqire.do'/>">
	    	<input name="qaId" type="hidden" value="${resultInfo.qaId}">
			<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
	    	<span class="link"><input type="submit"  value="<c:out value="${resultInfo.qestnSj}"/>" onclick="fn_egov_inquire_qnaanswerdetail('<c:out value="${resultInfo.qaId}"/>'); return false;"></span>
	    	</form>
		</td>
		<td class="lt_text3"><c:out value="${resultInfo.wrterNm}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.qnaProcessSttusCodeNm}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.inqireCo}"/></td>				
		<td class="lt_text3"><c:out value='${fn:substring(resultInfo.writngDe, 0,4)}'/>-<c:out value='${fn:substring(resultInfo.writngDe, 4,6)}'/>-<c:out value='${fn:substring(resultInfo.writngDe, 6,8)}'/>		
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
