<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% 
/**
 * @Class Name : EgovDeptJobBxList.jsp
 * @Description : 부서업무함 목록조회
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2010.07.06   장철호          최초 생성
 *
 *  @author 공통컴포넌트개발팀 장철호
 *  @since 2010.07.06
 *  @version 1.0 
 *  @see
 *  
 */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function fn_egov_init_deptjobbx(){
		var opener = parent.window.dialogArguments;
	}
	
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_deptjobbx('1');
		}
	}
	
	function fn_egov_select_deptjobbx(pageNo) {
		document.frm.pageIndex.value = pageNo; 
		document.frm.action = "<c:url value='/cop/smt/djm/selectDeptJobBxList.do'/>";
		document.frm.submit();	
	}

	function fn_egov_inqire_deptjobbx(deptId, deptNm, deptJobBxId, deptJobBxNm) {
		var opener = parent.window.dialogArguments;
		/*
		회의관리/주관자ID
		*/
		if(opener[1] == "typeDeptJobBx"){
			opener[0].document.getElementById("deptId").value = deptId;
			opener[0].document.getElementById("deptNm").value = deptNm;
			opener[0].document.getElementById("deptJobBxId").value = deptJobBxId;
			opener[0].document.getElementById("deptJobBxNm").value = deptJobBxNm;
		}
		parent.window.returnValue = true;
		parent.window.close();	
	}

</script>
<title>부서업무함 목록조회</title>
</head>
<body onLoad="fn_egov_init_deptjobbx()">
<div id="border" style="width:730px">

	<form name="frm" method="post" action="<c:url value='/cop/smt/djm/selectDeptJobBxList.do'/>">

	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
	<input type="hidden" name="deptId">
	<input type="hidden" name="deptJobBxId">
	<input type="hidden" name="popupCnd" value="Y">
	
	<table width="100%" cellpadding="8" class="table-search" border="0">
	<tbody>
	 <tr>
	  <td width="25%" class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;부서업무함 목록</td>
		<td width="30%" >
			<label for="searchCnd">조회조건 : </label>
	   		<select name="searchCnd" class="select" title="조회조건 선택">
				<option value=''>--선택하세요--</option>
				<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >부서명</option>
				<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >부서업무함명</option>
		   </select>
		</td>
	  <td width="35%">
	    <input name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" title="검색어 입력"> 
	  </td>
	  <th width="10%">
	   <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
	      <td><span class="button"><input type="submit" value="조회" onclick="fn_egov_select_deptjobbx('1'); return false;"></span></td>
	    </tr>
	   </table>
	  </th>  
	 </tr>
	</tbody>
	</table>
	
	</form>
		
	<table width="100%" cellpadding="8" class="table-list" summary="이 표는 부서업무함 정보를 제공하며, 부서명, 부서업무함명 정보로 구성되어 있습니다.">
	<caption>부서업무함목록</caption> 
	 <thead>
	  <tr>
	    <th scope="col" class="title" width="10%" nowrap>번호</th>
	    <th scope="col" class="title" width="35%" nowrap>부서명</th>
	    <th scope="col" class="title" width="45%" nowrap>부서업무함명</th>
	    <th scope="col" class="title" width="10%" nowrap>선택</th>      
	  </tr>
	 </thead>    
	 <tbody>
		 <c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <!--td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->
		    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>		    
		    <td class="lt_text3" nowrap><c:out value="${result.deptNm}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.deptJobBxNm}"/></td>
		    <td class="lt_text3" nowrap>
				<span class="link">
				<input type="submit" value="선택" onclick="javascript:fn_egov_inqire_deptjobbx('<c:out value="${result.deptId}"/>', '<c:out value="${result.deptNm}"/>','<c:out value="${result.deptJobBxId}"/>', '<c:out value="${result.deptJobBxNm}"/>'); return false;">
				</span>
			</td>
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
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_deptjobbx" />
	</div>
</div>

</body>
</html>
