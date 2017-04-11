<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% 
/**
 * @Class Name : EgovSanctnerList.jsp
 * @Description : 약식결재자 목록조회
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2010.06.28   장철호          최초 생성
 *
 *  @author 공통컴포넌트개발팀 장철호
 *  @since 2010.06.28
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
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialogCallee.js'/>" ></script>
<script type="text/javascript">
	function fnInit(){
		getDialogArguments();
		
		var openerdata = parent.window.dialogArguments;
		document.frm.title.value = openerdata[1]; 
		parent.document.title = openerdata[1] + " 목록조회"; 
	}
	
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_sanctner('1');
		}
	}
	
	function fn_egov_select_sanctner(pageNo) {
		document.frm.pageIndex.value = pageNo; 
		document.frm.action = "<c:url value='/uss/ion/ism/selectSanctnerList.do'/>";
		document.frm.submit();	
	}
	
	function fn_egov_inqire_sanctner(uniqId, emplNo, emplyrNm, orgnztNm) {
		getDialogArguments();
		
		var openerdata = parent.window.dialogArguments;

		if(openerdata[2] != '' && openerdata[0].document.getElementById(openerdata[2]) != null){
			openerdata[0].document.getElementById(openerdata[2]).value = uniqId;
		}

		if(openerdata[3] != '' && openerdata[0].document.getElementById(openerdata[3]) != null){
			openerdata[0].document.getElementById(openerdata[3]).value = emplNo;
		}

		if(openerdata[4] != '' && openerdata[0].document.getElementById(openerdata[4]) != null){
			openerdata[0].document.getElementById(openerdata[4]).value = emplyrNm;
		}

		if(openerdata[5] != '' && openerdata[0].document.getElementById(openerdata[5]) != null){
			openerdata[0].document.getElementById(openerdata[5]).value = orgnztNm;
		}

		setReturnValue(true);
		
		parent.window.returnValue = true;
		parent.window.close();
	}
</script>
<title>사용자 목록조회</title>
</head>
<body onLoad="fnInit()" topmargin="0" leftmargin="0">

<div id="border" style="width:730px">

	<form name="frm" method="post" action="<c:url value='/uss/ion/ism/selectSanctnerList.do'/>">

	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
	
	<table width="100%" cellpadding="8" class="table-search" border="0">
	<tbody>
	 <tr>
	  <td width="25%" class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;<input name="title" id="title" type="text" size="10" value="" style="font-weight:bold;border : 0px solid;color : black;vertical-align: middle" title="제목" readonly>선택</td>
		<td width="30%" >
			<label for="searchCnd">조회조건 : </label>
	   		<select name="searchCnd" class="select" title="조회조건 선택">
				<option value=''>--선택하세요--</option>
				<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >부서명</option>
				<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >사원명</option>
		   </select>
		</td>
	  <td width="35%">
	    <input name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" title="검색어 입력"> 
	  </td>
	  <th width="10%">
	   <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
	      <td><span class="button"><input type="submit" value="조회" onclick="fn_egov_select_sanctner('1'); return false;"></span></td>
	    </tr>
	   </table>
	  </th>  
	 </tr>
	</tbody>
	</table>
	
	</form>
		
	<table width="100%" cellpadding="8" class="table-list"  summary="이 표는 사용자 정보를 제공하며, 부서, 직위, 사번, 사원명 정보로 구성되어 있습니다 .">
	 <caption>사용자 목록</caption>
	 <thead>
	  <tr>
	    <th scope="col" class="title" width="10%" nowrap>번호</th>
	    <th scope="col" class="title" width="25%" nowrap>부서</th>
	    <th scope="col" class="title" width="15%" nowrap>직위</th>
	    <th scope="col" class="title" width="15%" nowrap>사번</th>
	    <th scope="col" class="title" width="20%" nowrap>사원명</th> 
	    <th scope="col" class="title" width="15%" nowrap>선택</th>      
	  </tr>
	 </thead>    
	 <tbody>
		 <c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <!--td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->
		    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>		    
		    <td class="lt_text3" nowrap><c:out value="${result.orgnztNm}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.ofcpsNm}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.emplNo}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.emplyrNm}"/></td>
		    <td class="lt_text3" nowrap>
				<span class="link"><input type="submit" value="선택" onclick="javascript:fn_egov_inqire_sanctner('<c:out value="${result.uniqId}"/>', '<c:out value="${result.emplNo}"/>', '<c:out value="${result.emplyrNm}"/>', '<c:out value="${result.orgnztNm}"/>'); return false;"></span>
			</td>
		  </tr>
		 </c:forEach>	  
		 <c:if test="${fn:length(resultList) == 0}">
		  <tr>
		    <td class="lt_text3" nowrap colspan="6"><spring:message code="common.nodata.msg" /></td>  
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
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_sanctner" />
	</div>
</div>

</body>
</html>