<%
/**
 * @Class Name  : EgovComUtlHttpMonLogList.jsp
 * @Description : EgovComUtlHttpMonLogList 화면
 * @Modification Information
 * @
 * @  수정일             수정자                   수정내용
 * @ -------    --------    ---------------------------
 * @ 2010.09.7    박종선                  최초 생성
 *
 *  @author 공통서비스팀
 *  @since 2010.05.01
 *  @version 1.0
 *  @see
 *
 *  Copyright (C) 2009 by MOPAS  All right reserved.
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
		<title>HTTP모니터링 로그 목록</title>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
		<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js' />"></script>

		<script type="text/javascript">

		function fn_egov_init_httpMonLog(){
			document.frm.searchBgnHour.value = '<c:out value="${searchVO.searchBgnHour}"/>';
			document.frm.searchEndHour.value = '<c:out value="${searchVO.searchEndHour}"/>';
		}

		function press(event) {
			if (event.keyCode==13) {
				fn_egov_select_httpMonLog('1');
			}
		}

		function fn_egov_select_httpMonLog(pageNo) {
			document.frm.pageIndex.value = pageNo;
			document.frm.action = "<c:url value='/utl/sys/htm/EgovComUtlHttpMonLogList.do'/>";

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

		function fn_egov_inqire_httpMonLog(webKind, logId) {
			document.frm.webKind.value = webKind;
			document.frm.logId.value = logId;
			document.frm.action = "<c:url value='/utl/sys/htm/EgovComUtlHttpMonDetailLog.do'/>";
			document.frm.submit();
		}

		/* ********************************************************
		 * 마스터목록조회 함수
		 ******************************************************** */
		function fnSearch(){
			location.href = "<c:url value='/utl/sys/htm/EgovComUtlHttpMonList.do'/>";
		}
		</script>
	</head>

	<body onLoad="fn_egov_init_httpMonLog()">

	<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

		<div id="border" style="width:730px">

			<form name="frm" method="post" action="<c:url value='/utl/sys/prm/EgovComUtlProcessMonLogList.do'/>">

			<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
			<input type="hidden" name="webKind">
			<input type="hidden" name="logId">

				<table width="100%" cellpadding="8" class="table-search" border="0">
					<tbody>
		 				<tr>
		   					<td width="40%" class="title_left">
   							<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="absmiddle" alt="">&nbsp;HTTP모니터링 로그 목록</h1></td>
		   					<td colspan="2" width="50%" class="title_left">
		   					<input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
							<input name="searchBgnDe" type="text" size="10" maxlength="10" value="<c:out value="${searchVO.searchBgnDe}"/>" title="조회시작일자 입력">
		    				<a href="#" onClick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].searchBgnDe);">
		    				<img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" style="border:0px;vertical-align: bottom" alt="달력창팝업버튼이미지"></a>
		    				<select name="searchBgnHour" class="select" title="조회시작 시 선택">
			    				<c:forEach var="bgnHour" items="${searchBgnHour}" varStatus="status">
		            			<option value="<c:out value="${bgnHour.code}"/>"><c:out value="${bgnHour.codeNm}"/></option>
		            			</c:forEach>
	        				</select>
		    				~
		    				<input name="searchEndDe" type="text" size="10" maxlength="10" value="<c:out value="${searchVO.searchEndDe}"/>" title="조회종료일자 입력">
						    <a href="#" onClick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].searchEndDe);">
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
							<select name="searchCondition" class="select" title="조회조건 선택">
								<option value=''>--선택하세요--</option>
								<option value="1" <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if> >웹서비스종류</option>
								<option value="2" <c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if> >상태</option>
						   	</select>
						   	</td>
						   	<td width="25%">
		    				<input name="searchKeyword" type="text" size="27" value='<c:out value="${searchVO.searchKeyword}"/>' maxlength="35" onkeypress="press(event);" title="검색어 입력">
		  					</td>
		  					<td width="10%">
								<table border="0" cellspacing="0" cellpadding="0">
								    <tr>
								      	<td><span class="button"><input type="submit" value="조회" onclick="fn_egov_select_httpMonLog('1'); return false;"></span></td>
		      							<td>&nbsp;</td>
			      						<td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" alt="조회버튼" title="조회버튼" width="8" height="20"></td>
		      							<td class="btnBackground"><input type="submit" value="목록"
		      							 onclick="fnSearch(); return false;" class="btnNew" style="height:20px;width:26px;padding:0px 0px 0px 0px;" >
		      							</td>
			      						<td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" alt="조회버튼" title="조회버튼" width="8" height="20"></td>
								    </tr>
		   						</table>
		  					</td>
		 				</tr>
					</tbody>
				</table>
			</form>

			<table width="100%" cellpadding="2" class="table-list" summary="이 표는 HTTP모니터링 로그 정보를 제공하며, 순번, 로그ID, 웹서비스종류, 시스템URL, 상태, 생성일시 정보로 구성되어 있습니다 .">
		 		<thead>
		  			<tr>
		    			<th scope="col" class="title" width="9%">순번</th>
					    <th scope="col" class="title" width="22%">로그ID</th>
					    <th scope="col" class="title" width="15%">웹서비스종류</th>
					    <th scope="col" class="title" width="22%">시스템URL</th>
					    <th scope="col" class="title" width="9%">상태</th>
					    <th scope="col" class="title" width="23%">생성일시</th>
		  			</tr>
		 		</thead>
		 		<tbody>
				 	<c:forEach var="result" items="${resultList}" varStatus="status">
				  		<tr>
						    <!--td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->
						    <td class="lt_text3"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
							<td class="lt_text3"><c:out value="${result.logId}"/></td>
						    <td class="lt_text3">
						    	<form name="httpMonLogVO" method="post" action="<c:url value='EgovComUtlHttpMonLogList.do'/>">
						    	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
						    	<input name="searchCondition" type="hidden" value="<c:out value='${searchVO.searchCondition}'/>">
						    	<input name="searchKeyword" type="hidden" value="<c:out value='${searchVO.searchKeyword}'/>">
						    	<input name="searchBgnDe" type="hidden" value="<c:out value='${searchVO.searchBgnDe}'/>">
						    	<input name="searchEndDe" type="hidden" value="<c:out value='${searchVO.searchEndDe}'/>">
						    	<input name="searchBgnHour" type="hidden" value="<c:out value='${searchVO.searchBgnHour}'/>">
						    	<input name="searchEndHour" type="hidden" value="<c:out value='${searchVO.searchEndHour}'/>">
								<span class="link"><input type="submit" value="<c:out value="${result.webKind}"/>"
								onclick="javascript:fn_egov_inqire_httpMonLog('<c:out value="${result.webKind}"/>'
								, '<c:out value="${result.logId}"/>'); return false;" style="text-align : left;"></span>
							 	</form>
							</td>
							<td class="lt_text3"><c:out value="${result.siteUrl}"/></td>
							<td class="lt_text3"><c:out value="${result.httpSttusCd}"/></td>
						    <td class="lt_text3"><c:out value="${result.creatDt}"/></td>
				  		</tr>
				 	</c:forEach>
				 	<c:if test="${fn:length(resultList) == 0}">
				 		<tr>
				    		<td class="lt_text3" colspan="6"><spring:message code="common.nodata.msg" /></td>
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
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_httpMonLog" />
			</div>
		</div>
	</body>
</html>