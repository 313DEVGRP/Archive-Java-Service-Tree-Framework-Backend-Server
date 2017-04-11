<%
/**
 * @Class Name : EgovVcatnManageList.java
 * @Description : EgovVcatnManageList jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.07.20    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.08.05
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page import="egovframework.com.utl.fcc.service.EgovDateUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>휴가관리 목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style><script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
 /*설명 : 행사 목록 페이지 조회 */
 function linkPage(pageNo){
	var varForm				 = document.all["listForm"];
	varForm.searchCondition.value = "1";
	varForm.pageIndex.value = pageNo;
	varForm.action = "<c:url value='/uss/ion/vct/EgovVcatnManageList.do'/>";
	varForm.submit();
 }

/* ********************************************************
 * 조회 처리 
 ******************************************************** */
 /*설명 : 목록 조회 */
 function fncSelectVcatnManageList(pageNo){
	 var varForm				 = document.all["listForm"];
	 //varForm.searchCondition.value = "1";
	 varForm.pageIndex.value = pageNo;
	 varForm.action = "<c:url value='/uss/ion/vct/EgovVcatnManageList.do'/>";
	 varForm.submit();
 }

/* ********************************************************
 * 등록 화면 호출 함수 
 ******************************************************** */
function fncVcatnRegist(){
	location.href = "/uss/ion/vct/EgovVcatnRegist.do";
}

/* ********************************************************
 * 상세회면 호출함수
 ******************************************************** */
function fncVcatnManageDetail(applcntId,vcatnSe,bgnde,endde){
	var varForm				 = document.all["listForm"];
	varForm.applcntId.value  = applcntId;
	varForm.vcatnSe.value    = vcatnSe;
	varForm.bgnde.value      = bgnde.replace("-","");
	varForm.endde.value      = endde.replace("-","");
	varForm.action           = "<c:url value='/uss/ion/vct/EgovVcatnManageDetail.do'/>";
	varForm.submit();
}

-->
</script>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
<!-- ********** 여기서 부터 본문 내용 *************** -->
	
	<form name="listForm" action="<c:url value='/uss/ion/vct/EgovVcatnManageList.do'/>" method="post">
	<input type="hidden" name="searchCondition">
	<input type="hidden" name="applcntId">
	<input type="hidden" name="vcatnSe">
	<input type="hidden" name="bgnde">
	<input type="hidden" name="endde">
	<input type="hidden" name="pageIndex" value="<c:if test="${empty vcatnManageVO.pageIndex }">1</c:if><c:if test="${!empty vcatnManageVO.pageIndex }"><c:out value='${vcatnManageVO.pageIndex}'/></c:if>">
	
	<table width="700" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="40%"class="title_left">
	   <h1><img src="/images/egovframework/com/cmm/icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;휴가관리 목록</h1></td>
	  <th>
	  </th>
  <td width="50%">&nbsp;</td>
  <th width="10%" align="right">
	       <table border="0" cellspacing="0" cellpadding="0">
	          <tr> 
	              <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectVcatnManageList('1'); return false;"></span></td>
		          <td>&nbsp;&nbsp;</td>
		          <td><span class="button"><a href="<c:url value='/uss/ion/vct/EgovVcatnRegist.do'/>" onclick="fncVcatnRegist(); return false;"><spring:message code="button.create" /></a></span></td>     
	          </tr>
	       </table>
	  </th>  
	 </tr>
	</table>
	<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="휴가관리 검색조건" >
	<caption>휴가관리 검색조건</caption>
	  <tr>
	    <th width="20%" height="23" class="required_text" scope="row"><label for="searchKeyword">휴가년도</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
	    <td width="80%" nowrap >
	    	<select name="searchKeyword" title="휴가년도">
	    	<option value="" selected >전체</option>
            <c:forEach items="${yearList}" var="result" varStatus="status">
	       	   <option value="<c:out value="${result }"/>"  <c:if test="${vcatnManageVO.searchKeyword eq result}">selected</c:if>><c:out value="${result }"/></option>
            </c:forEach>
            </select>년
	    </td>
	  </tr> 
	</table>
	</form>
	<table width="700" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="3px"></td>
	</tr>
	</table>
	<table width="700" cellpadding="0" class="table-list" border="0"  summary="휴가관리 목록으로 순번 휴가구분 시작일 종료일 휴가사유 구분 승인자로 구성" >
     <caption>휴가관리 목록</caption>
	<thead>
	<tr>  
		<th class="title" width="5%"  scope="col">순번</th>
		<th class="title" width="10%" scope="col">휴가구분</th>
		<th class="title" width="15%" scope="col">시작일</th>
		<th class="title" width="10%" scope="col">종료일</th>
		<th class="title" scope="col">휴가사유</th>
		<th class="title" width="10%" scope="col">구분</th>
		<th class="title" width="15%" scope="col">승인자</th>
	</tr>
	</thead>     
	<tbody>
	<c:forEach items="${vcatnManageList}" var="resultInfo" varStatus="status">
	<tr>
		<td class="lt_text3" nowrap><c:out value="${(vcatnManageVO.pageIndex - 1) * vcatnManageVO.pageSize + status.count}"/></td>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.vcatnSeNm }"/></td>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.bgnde      }"/></td>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.endde      }"/></td>
		<td class="lt_textL" nowrap>
        <form name="item" method="post" action="<c:url value='/uss/ion/vct/EgovVcatnManageDetail.do'/>">
        	<input type="hidden" name="applcntId" value="<c:out value="${resultInfo.applcntId  }"/>">
        	<input type="hidden" name="vcatnSe"   value="<c:out value="${resultInfo.vcatnSe    }"/>">
        	<input type="hidden" name="bgnde"     value="<c:out value="${resultInfo.bgnde      }"/>">
        	<input type="hidden" name="endde"     value="<c:out value="${resultInfo.endde      }"/>">
            <span class="link"><input type="submit" value="<c:out value="${resultInfo.vcatnResn}"  escapeXml="false"/>" onclick="fncVcatnManageDetail('<c:out value="${resultInfo.applcntId}"/>','<c:out value="${resultInfo.vcatnSe}"/>','<c:out value="${resultInfo.bgnde}"/>','<c:out value="${resultInfo.endde}"/>'); return false;" style="text-align : left;"></span>
        </form>
        </td>
		<td class="lt_text3" nowrap>
          <c:if test="${resultInfo.confmAt eq 'A'}">신청중</c:if>
          <c:if test="${resultInfo.confmAt eq 'C'}">승인</c:if>
          <c:if test="${resultInfo.confmAt eq 'R'}">반려</c:if>
		</td>
		<td class="lt_textL" nowrap><c:out value="${resultInfo.sanctnerNm}"/></td>
	</tr>    
	</c:forEach>
	<c:if test="${fn:length(vcatnManageList) == 0}">
		<tr> 
			<td class="lt_text3" colspan="7">
				<spring:message code="common.nodata.msg" />
			</td>
		</tr>   	          				 			   
	</c:if>
	</tbody>  
	</table>
	
	<table width="700" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="3px"></td>
	</tr>
	</table>
	
	
	<c:if test="${!empty vcatnManageVO.pageIndex }">
	<div align="center">
	    <div>
	        <ui:pagination paginationInfo="${paginationInfo}"
	                       type="image"
	                       jsFunction="linkPage" />
	    </div>
	</div>
	</c:if>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>
</DIV>
</body>
</html>
