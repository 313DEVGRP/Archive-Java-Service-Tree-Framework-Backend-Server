<%
 /**
  * @Class Name : EgovHpcmListInqire.jsp
  * @Description : EgovHpcmListInqire 화면
  * @Modification Information
  * @
  * @  수정일   	수정자		수정내용
  * @ ----------	------		----------------------------------------------
  * @ 2009.02.01	박정규		최초 생성
  *   2011.09.19    서준식              등록일자 Char 변경으로 fmt기능 사용안함
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
<title>EgovHpcmManageList</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javaScript" language="javascript">

/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_hpcmlist(){

	// 첫 입력란에 포커스..
	document.HpcmListForm.searchKeyword.focus();
	
}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
	
	document.HpcmListForm.pageIndex.value = pageNo;
	document.HpcmListForm.action = "<c:url value='/uss/olh/hpc/HpcmListInqire.do'/>";
   	document.HpcmListForm.submit();
   	
}

/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_hpcmcn(){

	document.HpcmListForm.pageIndex.value = 1;
	document.HpcmListForm.submit();
	
}

/*********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_hpcmcn(){

	document.HpcmListForm.action = "<c:url value='/uss/olh/hpc/HpcmCnRegistView.do'/>";
	document.HpcmListForm.submit();	
	
}

/*********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_updt_hpcmlist(){

	document.HpcmListForm.action = "<c:url value='/uss/ion/rec/HpcmCnUpdtView.do'/>";
	document.HpcmListForm.submit();	

}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_inquire_hpcmdetail(hpcmId) {		

	// 도움말 키값(hpcmId) 셋팅.
	document.HpcmListForm.hpcmId.value = hpcmId;	
  	document.HpcmListForm.action = "<c:url value='/uss/olh/hpc/HpcmDetailInqire.do'/>";
  	document.HpcmListForm.submit();	
	   	   		
}


</script>
</head>
<body onLoad="fn_egov_initl_hpcmlist();">

<DIV id="content" style="width:700px">

<form name="HpcmListForm" action="<c:url value='/uss/olh/hpc/HpcmListInqire.do'/>" method="post">
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%" class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="제목아이콘이미지">&nbsp;도움말목록조회</h1></td>
  <th>
  </th>
  <td width="10%">
   	<select name="searchCondition" class="select" title="조회조건 선택">
		   <option selected value=''>--선택하세요--</option>
		   <option value="hpcmSeCodeNm"  <c:if test="${searchVO.searchCondition == 'hpcmSeCodeNm'}">selected="selected"</c:if> >도움말구분</option>
		   <option value="hpcmDf"  <c:if test="${searchVO.searchCondition == 'hpcmDf'}">selected="selected"</c:if> >도움말정의</option>			   		   
	   </select>
	</td>
  
  <td width="35%">
    <input name="searchKeyword" type="text" size="35" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="35" title="검색어 입력" > 
  </td>
  
  <th width="10%">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td><span class="button"><input type="submit" value="조회" onclick="fn_egov_search_hpcmcn(); return false;"></span></td>
	  <td>&nbsp;&nbsp;</td>
	  <td><span class="button"><a href="<c:url value='/uss/olh/hpc/HpcmCnRegistView.do'/>" onclick="fn_egov_regist_hpcmcn(); return false;"><spring:message code="button.create" /></a></span></td>
	  <td>&nbsp;&nbsp;</td>    
    </tr>
   </table>
  </th>  
 </tr>
</table>

<input name="hpcmId" type="hidden" value="">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

</form>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<table width="98%" cellpadding="8" class="table-line" border="0" summary="도움말에 대한 목록을 제공합니다.">
<caption>도움말목록</caption>
<thead>
<tr>      
    <th scope="col" class="title" width="10%" nowrap>순번</th>        
    <th scope="col" class="title" width="25%" nowrap>도움말구분</th>        
    <th scope="col" class="title" width="50%" nowrap>도움말정의</th>                   
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
		<td class="lt_text3"><c:out value="${resultInfo.hpcmSeCodeNm}"/></td>		
		<td class="lt_text3">
			<form name="subForm" method="post" action="<c:url value='/uss/olh/hpc/HpcmDetailInqire.do'/>">
	    	<input name="hpcmId" type="hidden" value="${resultInfo.hpcmId}">
			<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
	    	<span class="link"><input type="submit"  value="<c:out value="${resultInfo.hpcmDf}"/>" onclick="fn_egov_inquire_hpcmdetail('<c:out value="${resultInfo.hpcmId}"/>'); return false;"></span>
	    	</form>
		</td>
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
