<%
 /**
  * @Class Name : EgovNewsInfoListInqire.jsp
  * @Description : EgovNewsInfoListInqire 화면
  * @Modification Information
  * @
  * @  수정일   	수정자		수정내용
  * @ ----------	------		---------------------------
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
<title>EgovNewsInfoManageList</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javaScript" language="javascript">

/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_newsinfolist(){

    // 첫 입력란에 포커스..
    document.NewsInfoListForm.searchKeyword.focus();
    
}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
    
    document.NewsInfoListForm.pageIndex.value = pageNo;
    document.NewsInfoListForm.action = "<c:url value='/uss/ion/nws/NewsInfoListInqire.do'/>";
    document.NewsInfoListForm.submit();
    
}

/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_newsinfo(){

    document.NewsInfoListForm.pageIndex.value = 1;
    document.NewsInfoListForm.submit();
    
}

/*********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_newsinfo(){

    document.NewsInfoListForm.action = "<c:url value='/uss/ion/nws/NewsInfoRegistView.do'/>";
    document.NewsInfoListForm.submit(); 
    
}

/*********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_updt_newsinfolist(){

    document.NewsInfoListForm.action = "<c:url value='/uss/ion/nws/NewsInfoUpdtView.do'/>";
    document.NewsInfoListForm.submit(); 

}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_inquire_newsinfolistdetail(newsId) {       

    // 뉴스id
    document.NewsInfoListForm.newsId.value = newsId;    
    document.NewsInfoListForm.action = "<c:url value='/uss/ion/nws/NewsInfoDetailInqire.do'/>";
    document.NewsInfoListForm.submit(); 
                
}


</script>
</head>
<body onLoad="fn_egov_initl_newsinfolist();">

<DIV id="content" style="width:700px">

<form name="NewsInfoListForm" action="<c:url value='/uss/ion/nws/NewsInfoListInqire.do'/>" method="post">
<table width="100%" cellpadding="8" class="table-search" border="0" summary="리스트 조회기능을 제공한다.">
 <tr>
  <td width="40%" class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="타이틀이미지">&nbsp;뉴스정보목록 조회</td>
  <th>
  </th>
  <td width="10%">
    <select name="searchCondition" class="select" title="검색조건구분">
           <option selected value=''>--선택하세요--</option>
           <option value="newsSj"  <c:if test="${searchVO.searchCondition == 'newsSj'}">selected="selected"</c:if> >뉴스제목</option>
           <option value="newsOrigin" <c:if test="${searchVO.searchCondition == 'newsOrigin'}">selected="selected"</c:if> >뉴스출처</option>               
       </select>
    </td>
  
  <td width="35%">
    <input name="searchKeyword" type="text" size="35" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="35" title="검색키워드"> 
  </td>
  
  <th width="10%">
   <table border="0" cellspacing="0" cellpadding="0" >
    <tr> 
      <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_search_newsinfo(); return false;"></span></td>
      <td>&nbsp;&nbsp;</td>
      <td>
           <span class="button">
           <a href="<c:url value='/uss/ion/nws/NewsInfoRegistView.do'/>"
              onclick="fn_egov_regist_newsinfo(); return false;"><spring:message code="button.create" /></a>
           </span>
      </td>     
      
      <td>&nbsp;&nbsp;</td>
        
    </tr>
   </table>
  </th>  
 </tr>
</table>

<table width="100%" cellspacing="0" cellpadding="0" border="0" >
<tr>
    <td height="3px"></td>
</tr>
</table>

<table width="100%" cellpadding="8" class="table-line" border="0" summary="뉴스목록을 제공한다.">
<thead>
<tr>      
    <th scope="col" class="title" width="10%" nowrap>순번</th>        
    <th scope="col" class="title" width="40%" nowrap>뉴스제목</th>        
    <th scope="col" class="title" width="20%" nowrap>뉴스출처</th>           
    <th scope="col" class="title" width="15%" nowrap>게시일자</th>        
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
            <a href="<c:url value='/uss/ion/nws/NewsInfoDetailInqire.do'/>"
               onclick="fn_egov_inquire_newsinfolistdetail('<c:out value="${resultInfo.newsId}"/>'); return false;"><c:out value="${resultInfo.newsSj}"/></a>
        </td>       
        <td class="lt_text3"><c:out value="${resultInfo.newsOrigin}"/></td>
        <td class="lt_text3"><c:out value='${fn:substring(resultInfo.ntceDe, 0,4)}'/>-<c:out value='${fn:substring(resultInfo.ntceDe, 4,6)}'/>-<c:out value='${fn:substring(resultInfo.ntceDe, 6,8)}'/>
        </td>       
        <td class="lt_text3"><fmt:formatDate value="${resultInfo.lastUpdusrPnttm}"  pattern="yyyy-MM-dd"/></td>         
  </tr>   
</c:forEach>
</tbody>  
</table>


<table width="100%" cellspacing="0" cellpadding="0" border="0" >
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

<input name="newsId" type="hidden" value="">

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">

</form>

</DIV>
