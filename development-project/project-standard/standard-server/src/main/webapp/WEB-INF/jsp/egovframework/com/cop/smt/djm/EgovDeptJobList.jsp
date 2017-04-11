<% 
/**
 * @Class Name : EgovDeptJobList.jsp
 * @Description : 부서업무 목록조회
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2010.07.09   장철호          최초 생성
 *
 *  @author 공통컴포넌트개발팀 장철호
 *  @since 2010.07.09
 *  @version 1.0 
 *  @see
 *  
 */
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="tmpDeptId" value=""/>
<c:set var="tmpDeptNm" value=""/>
<c:set var="wtText" value=""/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript">

	function fn_egov_init_deptjob(){
		fn_egov_hide_ListStyle();
		var idsrc = document.getElementById(document.frm.searchDeptId.value);
		idsrc.style.display="";
	}

	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_deptjob('1');
		}
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	
	function fn_egov_select_deptjob(pageNo) {
		document.frm.pageIndex.value = pageNo; 
		document.frm.action = "<c:url value='/cop/smt/djm/selectDeptJobList.do'/>";
		document.frm.submit();	
	}

	function fn_egov_select_deptjobbx(deptId, deptJobBxId, deptJobBxNm) {
		document.frm.searchDeptId.value = deptId; 
		document.frm.searchDeptJobBxId.value = deptJobBxId; 
		document.frm.deptJobBxNm.value = deptJobBxNm; 
		document.frm.action = "<c:url value='/cop/smt/djm/selectDeptJobList.do'/>";
		document.frm.submit();	
	}
	/* ********************************************************
	* 부서업무 상세조회
	******************************************************** */
	function fn_egov_inqire_deptjob(deptJobId) {
		document.frm.deptJobId.value = deptJobId;
		document.frm.action = "<c:url value='/cop/smt/djm/selectDeptJob.do'/>";
		document.frm.submit();	
	}

	/* ********************************************************
	* 부서업무 등록창 가기
	******************************************************** */
	function fn_egov_insert_deptjob(){	
		document.frm.action = "<c:url value='/cop/smt/djm/addDeptJob.do'/>";
		document.frm.submit();
	}

	function fn_egov_change_ListStyle(list){
		fn_egov_hide_ListStyle();

		var idsrc = document.getElementById(list);
		idsrc.style.display="";
	}

	function fn_egov_hide_ListStyle(){
		<c:forEach var="resultBxFn" items="${resultBxList}" varStatus="st">
		<c:if test="${tmpDeptId != resultBxFn.deptId}">
		<c:set var="tmpDeptId" value="${resultBxFn.deptId}"/>
		var idsrc${st.count} = document.getElementById("${resultBxFn.deptId}");
		idsrc${st.count}.style.display="none";
		</c:if>
		</c:forEach>	 
	}
</script>
<title>부서업무 목록조회</title>
</head>
<body onLoad="fn_egov_init_deptjob()">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

	<form name="frm" method="post" action="<c:url value='/cop/smt/djm/selectDeptJobList.do'/>">

	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
	<input type="hidden" id="deptJobId" name="deptJobId">
	<input type="hidden" id="searchDeptId" name="searchDeptId" value="<c:out value='${searchVO.searchDeptId}'/>">
	<input type="hidden" id="searchDeptJobBxId" name="searchDeptJobBxId" value="<c:out value='${searchVO.searchDeptJobBxId}'/>">
	<input type="hidden" id="deptJobBxNm" name="deptJobBxNm" value="<c:out value='${searchVO.deptJobBxNm}'/>">
	
	<table width="100%" cellpadding="8" class="table-search" border="0">
	<tbody>
	 <tr>
	  <td width="25%" class="title_left">
	   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;부서업무 목록</h1></td>
		<td width="30%" >
			조회조건 : 
	   		<select name="searchCnd" class="select" title="조회조건 선택">
				<option value=''>--선택하세요--</option>
				<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
				<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>
				<option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >담당자</option>
		   </select>
		</td>
	  <td width="35%">
	    <input name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" title="검색어 입력"> 
	  </td>
	  <th width="10%">
	   <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
	      <td><span class="button"><input type="submit" value="조회" onclick="fn_egov_select_deptjob('1'); return false;"></span></td>
	      <td>&nbsp;&nbsp;</td>
	      <td><span class="button"><a href="<c:url value='/cop/smt/djm/addDeptJob.do'/>" onclick="fn_egov_insert_deptjob('1'); return false;"><spring:message code="button.create" /></a></span></td>
	    </tr>
	   </table>
	  </th>  
	 </tr>
	</tbody>
	</table>
	
	</form>
	<table border="0" width="100%" cellpadding="0" cellspacing="0">
	  <tr>
		<td width="26%" valign="top">
			<div id="scale" style="width:160px">
				<c:forEach var="resultBx" items="${resultBxList}" varStatus="st">
				<c:if test="${tmpDeptNm != resultBx.deptNm}">
				<c:set var="tmpDeptNm" value="${resultBx.deptNm}"/>
				<table width="100%" cellpadding="1" class="table-line">
				<tbody>
				  <tr> 
				    <th align="left" class="title" nowrap onClick="fn_egov_change_ListStyle('<c:out value="${resultBx.deptId}"/>')" style="cursor:hand">&nbsp;<c:out value='${resultBx.deptNm}'/></th>
				  </tr>
				 </tbody>   
				 </table>
				 <div id="<c:out value="${resultBx.deptId}"/>">
				 <table width="100%" cellpadding="1" class="table-list" summary="부서업무함에 대한 목록을 제공합니다.">
				 </c:if>
					  <tr>
					  	<td class="lt_text2" nowrap>&nbsp;&nbsp;
					  	<form name="searchVO" method="post" action="<c:url value='/cop/smt/djm/selectDeptJobList.do'/>">
					    	<input type="hidden" class="searchDeptId" value="<c:out value="${resultBx.deptId}"/>">
					    	<input type="hidden" class="searchDeptJobBxId" value="<c:out value="${resultBx.deptJobBxId}"/>">
					    	<input type="hidden" class="deptJobBxNm" value="<c:out value="${resultBx.deptJobBxNm}"/>">
							<span class="link"><input type="submit" value="<c:out value="${resultBx.deptJobBxNm}"/>" onclick="javascript:fn_egov_select_deptjobbx('<c:out value="${resultBx.deptId}"/>', '<c:out value="${resultBx.deptJobBxId}"/>', '<c:out value="${resultBx.deptJobBxNm}"/>'); return false;"  style="text-align : left;"></span>
						</form>
					  	</td>		    
					  </tr>
				 <c:if test="${tmpDeptNm != resultBxList[st.count].deptNm}">
				 </table>
				 </div>
				 </c:if>
				 </c:forEach>	  
			</div>
		</td>
		<td width="74%" valign="top">	
			<table width="100%" cellpadding="8" class="table-list"  summary="이 표는 부서업무 정보를 제공하며, 제목, 담당자, 작성일 정보로 구성되어 있습니다 .">
			 <caption>부서업무 목록</caption>
			 <thead>
			  <tr>
			    <th scope="col" class="title" width="10%" nowrap>번호</th>
			    <th scope="col" class="title" width="60%" nowrap>제목</th>
			    <th scope="col" class="title" width="15%" nowrap>담당자</th>
			    <th scope="col" class="title" width="15%" nowrap>작성일</th>
			  </tr>
			 </thead>    
			 <tbody>
				 <c:forEach var="result" items="${resultList}" varStatus="status">
				  <c:if test="${result.priort == '1'}">
				  	<c:set var="wtText" value="font-weight : bold; text-align : left; "/>
				  </c:if>
				  <c:if test="${result.priort == '2'}">
				  	<c:set var="wtText" value="text-align : left;"/>
				  </c:if>
				  <c:if test="${result.priort == '3'}">
				  	<c:set var="wtText" value="text-align : left;"/>
				  </c:if>
				  <tr>
				    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>		    
				    <td class="lt_text3L" nowrap>
				     <form name="deptJobVO" method="post" action="<c:url value='/cop/smt/djm/selectDeptJob.do'/>">
				    	<input type="hidden" name="searchDeptId" value="<c:out value='${searchVO.searchDeptId}'/>">
						<input type="hidden" name="searchDeptJobBxId" value="<c:out value='${searchVO.searchDeptJobBxId}'/>">
						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
				    	<input name="searchCnd" type="hidden" value="<c:out value='${searchVO.searchCnd}'/>">
				    	<input name="searchWrd" type="hidden" value="<c:out value='${searchVO.searchWrd}'/>">
						<input type="hidden" name="deptJobId" value="<c:out value="${result.deptJobId}"/>">
						<span class="link"><input type="submit" value="<c:out value="${result.deptJobNm}"/>" onclick="javascript:fn_egov_inqire_deptjob('<c:out value="${result.deptJobId}"/>'); return false;" style="${wtText}"></span>
					 </form>
					</td>
					<td class="lt_text3" nowrap><c:out value="${result.chargerNm}"/></td>
				    <td class="lt_text3" nowrap><c:out value="${fn:substring(result.frstRegisterPnttm, 0, 10)}"/></td>
				  </tr>
				 </c:forEach>	  
				 <c:if test="${fn:length(resultList) == 0}">
				  <tr>
				    <td class="lt_text3" nowrap colspan="4"><spring:message code="common.nodata.msg" /></td>  
				  </tr>		 
				 </c:if>
			 </tbody>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr> 
			    <td height="10"></td>
			  </tr>
			</table>
			<div align="center">
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_deptjob" />
			</div>
		</td>
		</tr>
	</table>
</div>

</body>
</html>
