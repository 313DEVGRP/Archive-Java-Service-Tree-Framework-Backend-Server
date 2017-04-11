<%
/**
 * @Class Name : EgovMemoReprtList.jsp
 * @Description : 메모보고 목록조회
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2010.07.22   장철호          최초 생성
 *
 *  @author 공통컴포넌트개발팀 장철호
 *  @since 2010.07.22
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js' />"></script>
<script type="text/javascript">

	function fn_egov_init_memoreprt(){
		if(document.frm.searchBgnDe.value != ""){
			document.frm.searchBgnDe.value = document.frm.searchBgnDe.value.substring(0,4) + "-" + document.frm.searchBgnDe.value.substring(4,6) + "-" + document.frm.searchBgnDe.value.substring(6,8);
		}

		if(document.frm.searchEndDe.value != ""){
			document.frm.searchEndDe.value = document.frm.searchEndDe.value.substring(0,4) + "-" + document.frm.searchEndDe.value.substring(4,6) + "-" + document.frm.searchEndDe.value.substring(6,8);
		}
	}

	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_memoreprt('1');
		}
	}

	function fn_egov_select_memoreprt(pageNo) {
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/cop/smt/mrm/selectMemoReprtList.do'/>";

		var bgnDe = document.frm.searchBgnDe.value.split("-").join("");
		var endDe = document.frm.searchEndDe.value.split("-").join("");

		if(bgnDe != ""){
			if(isDate(bgnDe, "검색시작일자") == false) {
		        return;
		    }
		}

		if(endDe != ""){
		    if(isDate(endDe, "검색종료일자") == false) {
		        return;
		    }
		}

		if(bgnDe != "" && endDe != ""){
			if(eval(bgnDe) > eval(endDe)){
				alert("검색종료일자가 검색시작일자보다 빠를수 없습니다.");
				return;
			}
		}

		document.frm.submit();
	}
	
	/* ********************************************************
	 * 메모보고 상세조회로 가기
	 ******************************************************** */

	function fn_egov_inqire_memoreprt(reprtId) {
		document.frm.reprtId.value = reprtId;
		document.frm.action = "<c:url value='/cop/smt/mrm/selectMemoReprt.do'/>";
		document.frm.submit();
	}
	/* ********************************************************
	 * 메모보고 등록으로 가기
	 ******************************************************** */
	function fn_egov_insert_memoreprt(){
		document.frm.action = "<c:url value='/cop/smt/mrm/addMemoReprt.do'/>";
		document.frm.submit();
	}
</script>
<title>메모보고 목록조회</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body onLoad="fn_egov_init_memoreprt()">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

	<form name="frm" method="post" action="<c:url value='/cop/smt/mrm/selectMemoReprtList.do'/>">

	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
	<input type="hidden" name="reprtId">
	<table width="100%" cellpadding="2" class="table-search" border="0">
	<tbody>
	 <tr>
	  <td width="25%" class="title_left">
	   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;메모보고 목록</h1></td>
		<td width="30%" >
			조회조건 : 
	   		<select name="searchSttus" class="select" title="승인여부 선택">
				<option value=''>--보고서상태--</option>
				<option value="0" <c:if test="${searchVO.searchSttus == '0'}">selected="selected"</c:if> >미확인</option>
				<option value="1" <c:if test="${searchVO.searchSttus == '1'}">selected="selected"</c:if> >확인</option>
		   </select>
		</td>
	  <td colspan="2">
	  	보고일자 : 
	  	<input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
	    <input name="searchBgnDe" type="text" size="10" maxlength="10" value="<c:out value="${searchVO.searchBgnDe}"/>" title="조회시작일자 입력">
	    <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].searchBgnDe);">
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" style="border:0px;vertical-align: bottom" alt="달력창팝업버튼이미지"></a>
	    ~
	    <input name="searchEndDe" type="text" size="10" maxlength="10" value="<c:out value="${searchVO.searchEndDe}"/>" title="조회종료일자 입력">
	    <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].searchEndDe);">
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" style="border:0px;vertical-align: bottom" alt="달력창팝업버튼이미지"></a>
	  </td>
	 </tr>
	 <tr>
	  <td colspan="2" align="right" >
			<select name="searchDrctMatter" class="select" title="의견등록여부 선택">
				<option value=''>--의견등록여부--</option>
				<option value="0" <c:if test="${searchVO.searchDrctMatter == '0'}">selected="selected"</c:if> >미등록</option>
				<option value="1" <c:if test="${searchVO.searchDrctMatter == '1'}">selected="selected"</c:if> >등록</option>
		   </select>
	   		<select name="searchCnd" class="select" title="조회조건 선택">
				<option value=''>--제목/내용/작성자 조회조건--</option>
				<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >보고제목</option>
				<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >보고내용</option>
				<option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >작성자</option>
		   </select>
		   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	  <td width="35%">
	    <input name="searchWrd" type="text" size="35" value="<c:out value="${searchVO.searchWrd}"/>" maxlength="35" onkeypress="press(event);" title="검색어 입력">
	  </td>
	  <th width="15%" align="right">
	   <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
	      <td><span class="button"><input type="submit" value="조회" onclick="fn_egov_select_memoreprt('1'); return false;"></span></td>
	      <td>&nbsp;</td>
	      <td><span class="button"><input type="submit" value="등록" onclick="fn_egov_insert_memoreprt('1'); return false;"></span></td>
	    </tr>
	   </table>
	  </th>
	 </tr>
	</tbody>
	</table>

	</form>
	<table width="100%" cellpadding="8" class="table-list" summary="이 표는 메모보고 정보를 제공하며, 보고일자, 보고제목, 작성자, 상태, 의견 정보로 구성되어 있습니다 ." >
	 <caption>메모보고 목록</caption>
	 <thead>
	  <tr>
	    <th scope="col" class="title" width="10%" nowrap>번호</th>
	    <th scope="col" class="title" width="15%" nowrap>보고일자</th>
	    <th scope="col" class="title" width="45%" nowrap>보고제목</th>
	    <th scope="col" class="title" width="10%" nowrap>작성자</th>
	    <th scope="col" class="title" width="10%" nowrap>상태</th>
	    <th scope="col" class="title" width="10%" nowrap>의견</th>
	  </tr>
	 </thead>
	 <tbody >
		 <c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <!--td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->
		    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.reprtDe}"/></td>
		    <td class="lt_text3L" nowrap>

		     <form name="memoReprtVO" method="post" action="<c:url value='/cop/smt/mrm/selectMemoReprt.do'/>">
		    	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
		    	<input name="searchCnd" type="hidden" value="<c:out value='${searchVO.searchCnd}'/>">
		    	<input name="searchWrd" type="hidden" value="<c:out value='${searchVO.searchWrd}'/>">
		    	<input name="searchBgnDe" type="hidden" value="<c:out value='${searchVO.searchBgnDe}'/>">
		    	<input name="searchEndDe" type="hidden" value="<c:out value='${searchVO.searchEndDe}'/>">
		    	<input name="searchSttus" type="hidden" value="<c:out value='${searchVO.searchSttus}'/>">
		    	<input name="searchDrctMatter" type="hidden" value="<c:out value='${searchVO.searchDrctMatter}'/>">
				<input type="hidden" name="reprtId" value="<c:out value="${result.reprtId}"/>">
				<span class="link" ><input type="submit" value="<c:out value="${result.reprtSj}"/>" onclick="javascript:fn_egov_inqire_memoreprt('<c:out value="${result.reprtId}"/>'); return false;"  style="text-align : left;"></span>			
 			
			 </form>
			</td>
			<td class="lt_text3" nowrap><c:out value="${result.wrterNm}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.reportrInqireDt}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.drctMatterRegistDt}"/></td>
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
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_memoreprt" />
	</div>
</div>

</body>
</html>
