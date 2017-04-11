<%
/**
 * @Class Name : EgovFileSysMntrngLogList.jsp
 * @Description : 파일시스템모니터링 로그 목록조회
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2010.08.18   장철호          최초 생성
 *
 *  @author 공통컴포넌트개발팀 장철호
 *  @since 2010.08.18
 *  @version 1.0
 *  @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

	function fn_egov_init_filesysmntrng(){
		document.frm.searchBgnHour.value = '<c:out value="${searchVO.searchBgnHour}"/>';
		document.frm.searchEndHour.value = '<c:out value="${searchVO.searchEndHour}"/>';
	}

	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_filesysmntrnglog('1');
		}
	}

	function fn_egov_select_filesysmntrnglog(pageNo) {
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/utl/sys/fsm/selectFileSysMntrngLogList.do'/>";

		var bgnDe = document.frm.searchBgnDe.value;
		var endDe = document.frm.searchEndDe.value;

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

		if(bgnDe.length == 8){
			bgnDe = bgnDe.substring(0,4) + "-" + bgnDe.substring(4,6) + "-" + bgnDe.substring(6,8);
			document.frm.searchBgnDe.value = bgnDe;
		}

		if(endDe.length == 8){
			endDe = endDe.substring(0,4) + "-" + endDe.substring(4,6) + "-" + endDe.substring(6,8);
			document.frm.searchEndDe.value = endDe;
		}

		var bgnHour = document.frm.searchBgnHour.value;
		var endHour = document.frm.searchEndHour.value;

		var bgnDeHour = "";
		var endDeHour = "";
		if(bgnDe != "" && endDe != ""){
			if(bgnHour == ""){
				document.frm.searchBgnHour.value = "00";
				bgnHour = "00";
			}
			if(endHour == ""){
				document.frm.searchEndHour.value = "00";
				endHour = "00";
			}
			bgnDeHour = bgnDe + bgnHour;
			endDeHour = endDe + endHour;

			if(bgnDeHour > endDeHour){
				alert("검색종료일시가 검색시작일시보다 빠를수 없습니다.");
				return;
			}
		}
		document.frm.submit();
	}

	function fn_egov_inqire_filesysmntrnglog(fileSysId, logId) {
		document.frm.fileSysId.value = fileSysId;
		document.frm.logId.value = logId;
		document.frm.action = "<c:url value='/utl/sys/fsm/selectFileSysMntrngLog.do'/>";
		document.frm.submit();
	}

	function fn_egov_select_filesysmntrng(){
		document.frm.action = "<c:url value='/utl/sys/fsm/selectFileSysMntrngList.do'/>";
		document.frm.submit();
	}


</script>
<title>파일시스템모니터링 로그 목록조회</title>
</head>
<body onLoad="fn_egov_init_filesysmntrng()">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

	<form name="frm" method="post" action="<c:url value='/utl/sys/fsm/selectFileSysMntrngLogList.do'/>">

	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
	<input type="hidden" name="fileSysId">
	<input type="hidden" name="logId">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	<tbody>
	 <tr>
	   <td width="40%" class="title_left"><h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;파일시스템모니터링로그 목록</h1></td>
	   <td colspan="2" width="50%" class="title_left">
	   <input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
		<input name="searchBgnDe" type="text" size="10" maxlength="10" value="<c:out value="${searchVO.searchBgnDe}"/>" title="조회시작일자 입력">
	    <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].searchBgnDe);">
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" style="border:0px;vertical-align: bottom" alt="달력창팝업버튼이미지"></a>
	    <select name="searchBgnHour" class="select" title="조회시작 시 선택">
	    	<c:forEach var="bgnHour" items="${searchBgnHour}" varStatus="status">
            <option value="<c:out value="${bgnHour.code}"/>"><c:out value="${bgnHour.codeNm}"/></option>
            </c:forEach>
        </select>
	    ~
	    <input name="searchEndDe" type="text" size="10" maxlength="10" value="<c:out value="${searchVO.searchEndDe}"/>" title="조회종료일자 입력">
	    <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].searchEndDe);">
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" style="border:0px;vertical-align: bottom" alt="달력창팝업버튼이미지"></a>
	  	<select name="searchEndHour" class="select" title="조회종료 시 선택">
	  		<c:forEach var="endHour" items="${searchEndHour}" varStatus="status">
            <option value="<c:out value="${endHour.code}"/>"><c:out value="${endHour.codeNm}"/></option>
            </c:forEach>
        </select>
	  </td>
	  <td width="10%">&nbsp;</td>
	 </tr>
	 <tr>
	  <td width="40%" class="title_left">&nbsp;</td>
		<td width="25%" >
			<select name="searchCnd" class="select" title="조회조건 선택">
				<option value=''>--선택하세요--</option>
				<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >파일시스템명</option>
				<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >파일시스템관리명</option>
				<option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >관리자명</option>
				<option value="3" <c:if test="${searchVO.searchCnd == '3'}">selected="selected"</c:if> >상태</option>
		   </select>
		</td>
	  <td width="25%">
	    <input name="searchWrd" type="text" size="27" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" title="검색어 입력">
	  </td>
	  <td width="10%">
		<table border="0" cellspacing="0" cellpadding="0">
	    <tr>
	      <td><span class="button"><input type="submit" value="조회" onclick="fn_egov_select_filesysmntrnglog('1'); return false;"></span></td>
	      <td><span class="button"><a href="<c:url value='/utl/sys/fsm/selectFileSysMntrngList.do'/>" onclick="fn_egov_select_filesysmntrng(); return false;">목록</a></span></td>
	    </tr>
	   </table>
	  </td>
	 </tr>

	</tbody>
	</table>

	</form>
	<table width="100%" cellpadding="8" class="table-list"  summary="이 표는 파일시스템모니터링 로그 정보를 제공하며, 파일시스템명, 파일시스템관리명, 크기, 임계치, 사용량, 상태, 생성일시 정보로 구성되어 있습니다 .">
	 <thead>
	  <tr>
	    <th scope="col" class="title" width="10%" nowrap>번호</th>
	    <th scope="col" class="title" width="17%" nowrap>파일시스템명</th>
	    <th scope="col" class="title" width="17%" nowrap>파일시스템관리명</th>
	    <th scope="col" class="title" width="8%" nowrap>크기</th>
	    <th scope="col" class="title" width="11%" nowrap>임계치</th>
	    <th scope="col" class="title" width="11%" nowrap>사용량</th>
	    <th scope="col" class="title" width="10%" nowrap>상태</th>
	    <th scope="col" class="title" width="16%" nowrap>생성일시</th>
	  </tr>
	 </thead>
	 <tbody>
		 <c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <!--td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->
		    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.fileSysNm}"/></td>
		    <td class="lt_text3" nowrap>
		     <form name="fileSysMntrngLogVO" method="post" action="<c:url value='/utl/sys/fsm/selectFileSysMntrngLog.do'/>">
		    	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
		    	<input name="searchCnd" type="hidden" value="<c:out value='${searchVO.searchCnd}'/>">
		    	<input name="searchWrd" type="hidden" value="<c:out value='${searchVO.searchWrd}'/>">
		    	<input name="searchBgnDe" type="hidden" value="<c:out value='${searchVO.searchBgnDe}'/>">
		    	<input name="searchEndDe" type="hidden" value="<c:out value='${searchVO.searchEndDe}'/>">
		    	<input name="searchBgnHour" type="hidden" value="<c:out value='${searchVO.searchBgnHour}'/>">
		    	<input name="searchEndHour" type="hidden" value="<c:out value='${searchVO.searchEndHour}'/>">
				<input type="hidden" name="fileSysId" value="<c:out value="${result.fileSysId}"/>">
				<span class="link"><input type="submit" value="<c:out value="${result.fileSysManageNm}"/>" onclick="javascript:fn_egov_inqire_filesysmntrnglog('<c:out value="${result.fileSysId}"/>', '<c:out value="${result.logId}"/>'); return false;" style="text-align : left;"></span>
			 </form>
			</td>
			<td class="lt_text3" nowrap><c:out value="${result.fileSysMg}"/>G</td>
			<td class="lt_text3" nowrap><c:out value="${result.fileSysThrhldRt}"/>%(<c:out value="${result.fileSysThrhld}"/>G)</td>
			<td class="lt_text3" nowrap><c:out value="${result.fileSysUsgRt}"/>%(<c:out value="${result.fileSysUsgQty}"/>G)</td>
			<td class="lt_text3" nowrap><c:out value="${result.mntrngSttus}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.creatDt}"/></td>
		  </tr>
		 </c:forEach>
		 <c:if test="${fn:length(resultList) == 0}">
		  <tr>
		    <td class="lt_text3" nowrap colspan="8"><spring:message code="common.nodata.msg" /></td>
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
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_filesysmntrnglog" />
	</div>
</div>

</body>
</html>