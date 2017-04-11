<%
/**
 * @Class Name : EgovEventRceptManageList.java
 * @Description : EgovEventRceptManageList jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.07.20    이      용                최초 생성
 *   2011.08.17    	정진오		선택입력사항을 표시하는 이미지 icon 경로가
 * 								다른 패키지로 되어 있던 것을 당해 패키지 경로로 수정함*
 *  @author 이      용
 *  @since 2010.07.20
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>행사접수관리 목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
 /*설명 : 행사접수목록 페이지 조회 */
 function linkPage(pageNo){
	var varForm				 = document.all["listForm"];
	 if(varForm.searchMonth.value !=""){
		 if(varForm.searchYear.value ==""){
			 alert("전체년도에 월만 조회할 수 없습니다. 년도는 선택해주세요");
			 return;
		 } 
	 }
	varForm.searchCondition.value = "1";
	varForm.pageIndex.value = pageNo;
	varForm.action = "<c:url value='/uss/ion/evt/EgovEventRcrptManageList.do'/>";
	varForm.submit();
 }

/* ********************************************************
 * 조회 처리 
 ******************************************************** */
 /*설명 : 목록 조회 */
 function fncSelectEventRceptManageList(pageNo){
	 var varForm				 = document.all["listForm"];
	 if(varForm.searchMonth.value !=""){
		 if(varForm.searchYear.value ==""){
			 alert("전체년도에 월만 조회할 수 없습니다. 년도는 선택해주세요");
			 return;
		 } 
	 }
	 varForm.pageIndex.value = pageNo;
	 varForm.action = "<c:url value='/uss/ion/evt/EgovEventRcrptManageList.do'/>";
	 varForm.submit();
 }

/* ********************************************************
 * 등록 화면 호출 함수 
 ******************************************************** */
function fncEventRceptRegist(eventId){
	var varForm				 = document.all["listForm"];
	varForm.eventId.value          = eventId;
	varForm.action           = "<c:url value='/uss/ion/evt/EgovEventRceptRegist.do'/>";
	varForm.submit();
}

/* ********************************************************
 * 상세회면 호출함수
 ******************************************************** */
function fncEventRceptManageDetail(eventId, applcntId){
	var varForm				 = document.all["listForm"];
	varForm.eventId.value    = eventId;
	varForm.applcntId.value  = applcntId;
	varForm.action           = "<c:url value='/uss/ion/evt/EgovEventRcrptDetail.do'/>";
	varForm.submit();
}

/* ********************************************************
 * 행사 상세회면 팝업 호출함수
 ******************************************************** */
function fncEventReqstDetailPop(eventId){
	var varForm				 = document.all["listFormPop"];
	var openParam            = "left=10, top=0, width=750, height=420";
	varForm.eventId.value    = eventId;
	varForm.cmd.value        = "popup";
	var myWin = window.open("about:blank","EventReqstDetailPop",openParam);
	
	varForm.method ="post";
	varForm.action = "<c:url value='/uss/ion/evt/EgovEventReqstDetail.do'/>";
	varForm.target ="EventReqstDetailPop";
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
	<form name="listFormPop" action="#LINK" method="post">
	<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
	    <input type="hidden" name="eventId">
	    <input type="hidden" name="cmd">
	</form>
	<form name="listForm" action="<c:url value='/uss/ion/evt/selectEventRceptList.do'/>" method="post">
    <div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
	<input type="hidden" name="searchCondition">
	<input type="hidden" name="eventId">
	<input type="hidden" name="applcntId">
	<input type="hidden" name="pageIndex" value="<c:if test="${empty eventManageVO.pageIndex }">1</c:if><c:if test="${!empty eventManageVO.pageIndex }"><c:out value='${eventManageVO.pageIndex}'/></c:if>">
	
	<table width="700" cellpadding="8" class="table-search" border="0" >
	 <tr>
	  <td width="40%"class="title_left">
	   <h1><img src="/images/egovframework/com/cmm/icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;행사접수관리 목록</h1></td>
	  <th> </th>
	  <td width="50%">&nbsp;</td>
	  <th width="10%">
	       <table border="0" cellspacing="0" cellpadding="0">
	        <tr> 
	          <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectEventRceptManageList('1'); return false;"></span></td>
	        </tr>
	       </table>
	  </th>  
	 </tr>
	</table>

	<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="행사접수관리 검색조건" >
	<caption>행사접수관리 검색조건</caption>
	  <tr>
	    <th width="20%" height="23" class="required_text" scope="row"><label for="searchSe">행사구분</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
	    <td width="30%" >
	    
	        <select name="searchSe" title="행사구분">
	        	<option value="" <c:if test="${eventManageVO.searchSe eq '' }">selected</c:if>>전체</option>
	            <c:forEach items="${eventSeCode}" var="result" varStatus="status">
		       	   <option value="<c:out value="${result.code }"/>" <c:if test="${eventManageVO.searchSe eq result.code }">selected</c:if>><c:out value="${result.codeNm }"/></option>
	            </c:forEach>
	      	</select>
	    </td>

	    <th width="20%" height="23" class="required_text" scope="row"><label for="searchYear">행사년월</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
	    <td width="30%">
	    
	    	<select name="searchYear" title="행사년">
	    	<option value="" <c:if test="${eventManageVO.searchYear eq '' }">selected</c:if>>전체</option>
            <c:forEach items="${yearList}" var="result" varStatus="status">
	       	   <option value="<c:out value="${result }"/>"  <c:if test="${eventManageVO.searchYear eq result}">selected</c:if>><c:out value="${result }"/></option>
            </c:forEach>
            </select>년
	        <select name="searchMonth" title="행사월">
		       	<option value="" <c:if test="${eventManageVO.searchMonth eq '' }">selected</c:if>>전체</option>
		       	<option value="01" <c:if test="${eventManageVO.searchMonth eq '01' }">selected</c:if>>01</option>
		       	<option value="02" <c:if test="${eventManageVO.searchMonth eq '02' }">selected</c:if>>02</option>
		       	<option value="03" <c:if test="${eventManageVO.searchMonth eq '03' }">selected</c:if>>03</option>
		       	<option value="04" <c:if test="${eventManageVO.searchMonth eq '04' }">selected</c:if>>04</option>
		       	<option value="05" <c:if test="${eventManageVO.searchMonth eq '05' }">selected</c:if>>05</option>
		       	<option value="06" <c:if test="${eventManageVO.searchMonth eq '06' }">selected</c:if>>06</option>
		       	<option value="07" <c:if test="${eventManageVO.searchMonth eq '07' }">selected</c:if>>07</option>
		       	<option value="08" <c:if test="${eventManageVO.searchMonth eq '08' }">selected</c:if>>08</option>
		       	<option value="09" <c:if test="${eventManageVO.searchMonth eq '09' }">selected</c:if>>09</option>
		       	<option value="10" <c:if test="${eventManageVO.searchMonth eq '10' }">selected</c:if>>10</option>
		       	<option value="11" <c:if test="${eventManageVO.searchMonth eq '11' }">selected</c:if>>11</option>
		       	<option value="12" <c:if test="${eventManageVO.searchMonth eq '12' }">selected</c:if>>12</option>
	      	</select>월
	    </td>
	  </tr> 
	  <tr>
	    <th width="20%" height="23" class="required_text" scope="row"><label for="searchNm">행사명</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
	    <td width="30%" >
	    	<input name="searchNm" type="text" size="20" value="${eventManageVO.searchNm}"  maxlength="100" title="행사명"> 
	    </td>
	    <th width="20%" height="23" class="required_text" scope="row"><label for="searchConfmAt">진행구분</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
	    <td width="30%">
	        <select name="searchConfmAt" title="승인구분">
		       	<option value=""  <c:if test="${eventManageVO.searchConfmAt eq '' }">selected</c:if>>전체</option>
		       	<option value="NON" <c:if test="${eventManageVO.searchConfmAt eq 'NON' }">selected</c:if>>신청전</option>
		       	<option value="A" <c:if test="${eventManageVO.searchConfmAt eq 'A' }">selected</c:if>>신청중</option>
		       	<option value="C" <c:if test="${eventManageVO.searchConfmAt eq 'C' }">selected</c:if>>승인</option>
		       	<option value="R" <c:if test="${eventManageVO.searchConfmAt eq 'R' }">selected</c:if>>반려</option>
	      	</select>
	    </td>
	  </tr> 
	</table>

	</form>
	<table width="700" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="3px"></td>
	</tr>
	</table>
	
	<table width="700" cellpadding="0" class="table-list" border="0" summary="행사접수관리 목록으로 행사명, 행사장소, 행사구분, 행사일자, 기간, 참여/정원, 행사접수기간, 신청(상세)로 구성." >
	<caption>행사접수관리 목록</caption>
	<thead>
	<tr>  
		<th class="title" width="5%"  scope="col">순번</th>
		<th class="title" scope="col">행사명</th>
		<th class="title" width="14%" scope="col">행사장소</th>
		<th class="title" width="8%"  scope="col">행사구분</th>
		<th class="title" width="12%" scope="col">행사일자</th>
		<th class="title" width="8%"  scope="col">기간</th>
		<th class="title" width="11%" scope="col">참여/정원</th>
		<th class="title" width="12%" scope="col">행사접수기간</th>
		<th class="title" width="15%" scope="col">신청(상세)</th>
	</tr>
	</thead>     
	<tbody>
	<c:forEach items="${eventManageList}" var="resultInfo" varStatus="status">
	<tr>
		<td class="lt_text3" nowrap><c:out value="${(eventManageVO.pageIndex - 1) * eventManageVO.pageSize + status.count}"/></td>
		<td class="lt_text3" nowrap><span class="link"><a href="<c:url value='/uss/ion/evt/EgovEventReqstDetail.do?cmd=popup&'/>eventId=${resultInfo.eventId}" target="_blank" title="새창으로" onclick="fncEventReqstDetailPop('<c:out value="${resultInfo.eventId}"/>'); return false;"><c:out value="${resultInfo.eventNm}"/></a></span></td>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.eventPlace}"/></td>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.eventTemp3}"/></td>
		<td class="lt_textL" nowrap><c:out value="${resultInfo.eventBeginDe}"/> ~ <br><c:out value="${resultInfo.eventEndDe}"/></td>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.eventTemp1}"/>일간</td>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.eventTemp2}"/>/<c:out value="${resultInfo.psncpa}"/></td>
		<td class="lt_textL" nowrap><c:out value="${resultInfo.rceptBeginDe}"/> ~ <br><c:out value="${resultInfo.rceptEndDe}"/></td>
		<td class="lt_text3" nowrap>
		<c:if test="${empty resultInfo.confmAt}"> 
	        <form name="item" method="post" action="<c:url value='/uss/ion/evt/EgovEventRceptRegist.do'/>">
	        	<input type="hidden" name="eventId" value="<c:out value="${resultInfo.eventId      }"/>">
	            <span class="button"><input type="submit" value="신청" onclick="fncEventRceptRegist('<c:out value="${resultInfo.eventId}"/>'); return false;"></span>
	        </form>
        </c:if>
        <c:if test="${!empty resultInfo.confmAt}">
        <form name="item" method="post" action="<c:url value='/uss/ion/evt/EgovEventRcrptDetail.do'/>">
        	<input type="hidden" name="eventId"   value="<c:out value="${resultInfo.eventId      }"/>">
        	<input type="hidden" name="applcntId" value="<c:out value="${resultInfo.applcntId    }"/>">
            <span class="link"><input type="submit" value="<c:if test="${resultInfo.confmAt eq 'A'}">신청중</c:if><c:if test="${resultInfo.confmAt eq 'C'}">승인</c:if><c:if test="${resultInfo.confmAt eq 'R'}">반려</c:if>" onclick="fncEventRceptManageDetail('<c:out value="${resultInfo.eventId}"/>','<c:out value="${resultInfo.applcntId}"/>'); return false;"></span>
        </form>
        </c:if>
		</td>
	</tr>    
	</c:forEach>
	
	<c:if test="${fn:length(eventManageList) == 0}">
		<tr> 
			<td class="lt_text3" colspan="9">
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
	
	
	<c:if test="${!empty eventManageVO.pageIndex }">
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
