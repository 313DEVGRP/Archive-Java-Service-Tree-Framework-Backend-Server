<%
 /**
  * @Class Name : EgovRoughMApInfoList.jsp
  * @Description : EgovNewsInfoList 화면
  * @Modification Information
  * @
  * @  수정일   	수정자		수정내용
  * @ ----------	------		---------------------------
  * @ 2014.08.28	옥찬우		최초 생성
  *
  *  @author 유지보수팀 
  *  @since 2014.08.28
  *  @version 1.0
  *  @see
  */
%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>약도 목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javaScript" language="javascript">
	
	/*********************************************************
	 * 초기화
	 ******************************************************** */
	function fn_egov_init_roughmaplist(){
	    // 첫 입력란에 포커스..
	    document.searchVO.searchKeyword.focus();
	}
	
	/*********************************************************
	 * 페이징 처리 함수
	 ******************************************************** */
	function fn_egov_select_linkPage(pageNo){
	    document.RoughMapForm.pageIndex.value = pageNo;
	    document.RoughMapForm.action = "<c:url value='/com/uss/ion/rmm/selectRoughMapList.do'/>";
	    document.RoughMapForm.submit();
	}
	
	/*********************************************************
	 * 조회 처리 함수
	 ******************************************************** */
	function fn_egov_search_roughmap(){
	    document.RoughMapForm.pageIndex.value = 1;
	    document.RoughMapForm.submit();
	}

	/* ********************************************************
	 * 상세회면 처리 함수
	 ******************************************************** */
	function fn_egov_inquire_roughmapdetail(roughMapId) {       
	    // 뉴스id
	    document.RoughMapForm.roughMapId.value = roughMapId;    
	    document.RoughMapForm.action = "<c:url value='/com/uss/ion/rmm/selectRoughMapDetail.do'/>";
	    document.RoughMapForm.submit(); 
	}
	
	/*********************************************************
	 * 등록 처리 함수
	 ******************************************************** */
	function fn_egov_regist_roughmap(){
	    document.RoughMapForm.action = "<c:url value='/com/uss/ion/rmm/registRoughMap.do'/>";
	    document.RoughMapForm.submit(); 
	}
	
	/*********************************************************
	 * 수정 처리 함수
	 ******************************************************** */
	function fn_egov_updt_roughmap(){
	    document.RoughMapForm.action = "<c:url value='/com/uss/ion/rmm/updateRoughMapView.do'/>";
	    document.RoughMapForm.submit(); 
	}
	
</script>
</head>
<body onLoad="fn_egov_init_roughmaplist();">

	<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

	<div id="content" style="width:700px">
	
		<form name="searchVO" action="<c:url value='/com/uss/ion/rmm/selectRoughMapList.do'/>" method="post">
			<table width="100%" cellpadding="8" class="table-search" border="0">
				<tr>
					<td width="40%" class="title_left">
						<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="제목아이콘이미지">&nbsp;약도 목록 조회</h1>
					</td>
					<td width="10%">
				 		<select name="searchCondition" class="select" title="조회조건 선택">
							<option selected value=''>--선택하세요--</option>
							<option value="roughMapSj" <c:if test="${searchVO.searchCondition == 'roughmapsj'}">selected="selected"</c:if> >약도제목</option>			   
							<option value="roughMapAddress" <c:if test="${searchVO.searchCondition == 'roughmapaddress'}">selected="selected"</c:if> >약도주소</option>
						</select>
					</td>
				 	<td width="35%">
						<input name="searchKeyword" type="text" size="35" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="35" title="검색어 입력" > 
					</td>
					<td width="10%">
						<table border="0" cellspacing="0" cellpadding="0">
					  		<tr> 
								<td><span class="button"><input type="submit" value="조회" onclick="fn_egov_search_roughmap(); return false;"></span></td>
								<td>&nbsp;&nbsp;</td>
								<td><span class="button"><a href="<c:url value='/com/uss/ion/rmm/registRoughMap.do'/>" onclick="fn_egov_regist_roughmap(); return false;"><spring:message code="button.create" /></a></span></td>
						  		<td>&nbsp;&nbsp;</td>
					    	</tr>
						</table>
				  	</td>  
			 	</tr>
			</table>
			<input name="roughMapId" type="hidden" value="">
			<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
		</form>
	
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td height="3px"></td>
			</tr>
		</table>
	
		<table width="100%" cellpadding="8" class="table-line" border="0" summary="약도에 대한 목록을 제공합니다.">
			<caption>약도목록</caption>
			<thead>
			<tr>      
			    <th scope="col" class="title" width="15%" nowrap>순번</th>        
			    <th scope="col" class="title" width="20%" nowrap>약도제목</th>                   
			    <th scope="col" class="title" width="50%" nowrap>약도상세주소</th>        
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
						<td class="lt_text3">
							<form name="roughMap" method="post" action="<c:url value='/com/uss/ion/rmm/selectRoughMapDetail.do'/>">
								<input id="roughMapId" name="roughMapId" type="hidden" value="${resultInfo.roughmapId}">
								<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
								<span class="link">
									<input type="submit"  value="<c:out value="${resultInfo.roughmapsj}"/>" onclick="fn_egov_inquire_roughmapdetail('<c:out value="${resultInfo.roughmapId}"/>'); return false;">
								</span>
					   			</form>
						</td>		
						<td class="lt_left"><c:out value="${resultInfo.roughmapaddress}"/></td>		
						<td class="lt_text3"><c:out value="${resultInfo.lastUpdtPnttm}"/></td>			
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
				<ui:pagination
					paginationInfo = "${paginationInfo}"
					type="image"
					jsFunction="fn_egov_select_linkPage"/>
			</div>
		</div>
	</div>
</body>
</html>
