<%
 /**
  * @Class Name : EgovSiteListInqire.jsp
  * @Description : EgovSiteListInqire 화면
  * @Modification Information
  * @
  * @ 수정일    	수정자		수정내용
  * @ ----------    ------		---------------------------
  * @ 2009.02.01	박정규		최초 생성
  * @ 2011.07.29	옥찬우		조회페이지 내용추가(활성여부, 사용여부, 등록자)
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
<title>EgovSiteManageList</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javaScript" language="javascript">

/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_sitelist(){

    // 첫 입력란에 포커스..
    document.SiteListForm.searchKeyword.focus();
    
}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
    
    document.SiteListForm.pageIndex.value = pageNo;
    document.SiteListForm.action = "<c:url value='/uss/ion/sit/SiteListInqire.do'/>";
    document.SiteListForm.submit();
    
}

/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_siteinfo(){

    document.SiteListForm.pageIndex.value = 1;
    document.SiteListForm.submit();
    
}

/*********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_siteinfo(){

    document.SiteListForm.action = "<c:url value='/uss/ion/sit/SiteInfoRegistView.do'/>";
    document.SiteListForm.submit(); 
    
}

/*********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_updt_sitelist(){

    document.SiteListForm.action = "<c:url value='/uss/ion/sit/SiteInfoUpdtView.do'/>";
    document.SiteListForm.submit(); 

}
</script>

</head>
<body onLoad="fn_egov_initl_sitelist();">

<DIV id="content" style="width:700px">

<form name="SiteListForm" action="<c:url value='/uss/ion/sit/SiteListInqire.do'/>" method="post">
<table width="100%" cellpadding="8" class="table-search" border="0" summary="리스트 조회기능을 제공한다.">
 <tr>
  <td width="40%" class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="타이틀이미지">&nbsp;사이트목록 조회</td>
  <th>
  </th>
  <td width="10%">
    <select name="searchCondition" class="select" title="검색조건구분">
           <option selected value=''>--선택하세요--</option>
           <option value="siteNm"  <c:if test="${searchVO.searchCondition == 'siteNm'}">selected="selected"</c:if> >사이트명</option>
           <option value="siteUrl"   <c:if test="${searchVO.searchCondition == 'siteUrl'}">selected="selected"</c:if> >사이트URL</option>                             
       </select>
    </td>
  
  <td width="35%">
    <input name="searchKeyword" type="text" size="35" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="35" title="검색키워드" > 
  </td>
  
  <th width="10%">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_search_siteinfo(); return false;"></span></td>
      <td>&nbsp;&nbsp;</td>
      <td>
           <span class="button">
           <a href="<c:url value='/uss/ion/sit/SiteInfoRegistView.do'/>"
              onclick="fn_egov_regist_siteinfo(); return false;"><spring:message code="button.create" /></a>
           </span>
      </td>     
      
      <td>&nbsp;&nbsp;</td>
    </tr>
   </table>
  </th>  
 </tr>
</table>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <td height="3px"></td>
</tr>
</table>

<table width="100%" cellpadding="8" class="table-line" border="0" summary="사이트정보목록 테이블">
<thead>
<tr>      
    <th scope="col" class="title" width="5%" nowrap>순번</th>    
    <th scope="col" class="title" width="10%" nowrap>주제분류</th>    
    <th scope="col" class="title" width="20%" nowrap>사이트명</th>        
    <th scope="col" class="title" width="20%" nowrap>사이트URL</th>
    <th scope="col" class="title" width="5%" nowrap>활성여부</th>      
    <th scope="col" class="title" width="5%" nowrap>사용여부</th>      
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
        <td class="lt_text3"><c:out value="${resultInfo.siteThemaClNm}"/></td>
		<td class="lt_text3">
		<a href="<c:url value='/uss/ion/sit/SiteDetailInqire.do' />?pageIndex=${searchVO.pageIndex}&amp;siteId=${resultInfo.siteId}"><c:out value="${resultInfo.siteNm}" /></a>								
		</td>
        <td class="lt_text3"><c:out value="${resultInfo.siteUrl}"/></td>
        <td class="lt_text3"><c:out value="${resultInfo.actvtyAt}"/></td>
        <td class="lt_text3"><c:out value="${resultInfo.useAt}"/></td>
        <td class="lt_text3"><c:out value="${resultInfo.emplyrNm}"/></td>
        <td class="lt_text3"><fmt:formatDate value="${resultInfo.lastUpdusrPnttm}"  pattern="yyyy-MM-dd"/></td>     
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

<input name="siteId" type="hidden" value="">

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">

</form>

</DIV>

