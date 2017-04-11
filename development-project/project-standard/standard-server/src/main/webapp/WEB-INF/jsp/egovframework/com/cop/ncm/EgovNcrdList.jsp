<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovNcrdList.jsp
  * @Description : 명함목록 조회
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.03.30   이삼섭          최초 생성
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.03.30
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
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_ncrdInfs('1');
		}
	}
	function fn_egov_select_ncrdInfs(pageNo) {
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/cop/ncm/selectNcrdInfs.do'/>";
		document.frm.submit();
	}

	function fn_egov_addNcrdInf() {
		document.frm.action = "<c:url value='/cop/ncm/addNcrdInf.do'/>";
		document.frm.submit();
	}

	function fn_egov_popupNcrdInf(ncrdId){
		window.open("<c:url value='/cop/ncm/selectNcrdInfPopup.do' />?ncrdId="+ncrdId,"명함조회","width=640, height=350");
	}

	function fn_egov_registNcrd(ncrdId){
		document.frm.ncrdId.value = ncrdId;
		document.frm.action = "<c:url value='/cop/ncm/insertNcrdUseInf.do'/>";
		document.frm.submit();
	}
</script>
<title>공개 명함목록</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}

	A:link    { color: #000000; text-decoration:none; }
	A:visited { color: #000000; text-decoration:none; }
	A:active  { color: #000000; text-decoration:none; }
	A:hover   { color: #fa2e2e; text-decoration:none; }
</style>


</head>
<body>
<form name="frm" method="post" action="<c:url value='/cop/ncm/insertNcrdUseInf.do'/>">
<div style="visibility:hidden;display:none;">
<input name="iptSubmit" type="submit" value="전송" title="전송">
</div>
<input type="hidden" name="ncrdId" />

<div id="border" style="width:730px">
	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="40%"class="title_left">
	  	<h1>
	  		<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목버튼이미지">&nbsp;공개 명함목록
	  	</h1>
	  </td>
	  <th >
	  </th>
	  <td width="10%" >
	   	<select name="searchCnd" class="select" title="검색조건선택">
			   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >이름</option>
			   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >회사명</option>
			   <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >부서명</option>
		   </select>
		</td>
	  <td width="35%">
	    <input name="searchWrd" type="text" size="35" value="<c:out value="${searchVO.searchWrd}"/>" maxlength="35" onkeypress="press(event);" title="검색단어입력">
	  </td>
	  <th width="10%">
	   <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
	      
	      <td>

	      <span class="button"><input type="submit" onClick="fn_egov_select_ncrdInfs('1');" value="조회"/></span>
	      </td>
	      
	     <!-- <td>&nbsp;&nbsp;</td>
	      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
	      <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>" class="text_left" nowrap>
	      <a href="#LINK" onClick="fn_egov_addNcrdInf()">등록</a>
	      </td>
	      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td> -->
	    </tr>
	   </table>
	  </th>
	 </tr>
	</table>
	<table width="100%" cellpadding="8" class="table-line"  summary="번호,이름,회사명,부서명,등록일자,사용등록   목록입니다">
	 <thead>
	  <tr>
	    <!-- th class="title" width="3%" nowrap><input type="checkbox" name="all_check" class="check2"></th-->
	    <th scope="col" class="title" width="10%" nowrap>번호</th>
	    <th scope="col" class="title" width="25%" nowrap>이름</th>
	    <th scope="col" class="title" width="20%" nowrap>회사명</th>
	    <th scope="col" class="title" width="15%" nowrap>부서명</th>
	    <th scope="col" class="title" width="15%" nowrap>등록일자</th>
	    <th scope="col" class="title" width="15%" nowrap>사용등록</th>
	  </tr>
	 </thead>
	 <tbody>
		 <c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <!--td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->
		    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>

		 	<!-- 2010.11.1
		    <td class="lt_text3" nowrap>
	    			<a href="#LINK" onClick="fn_egov_popupNcrdInf('<c:out value="${result.ncrdId}"/>')">
	    			<c:out value="${result.ncrdNm}"/></a>
		    </td>
		    -->

		    <td class="lt_text3" nowrap>
	    		<a href="<c:url value='/cop/ncm/selectNcrdInfPopup.do?ncrdId='/><c:out value='${result.ncrdId}'/>" target="_blank">
	    			<c:out value="${result.ncrdNm}"/>
	    		</a>
		    </td>

		    <td class="lt_text3" nowrap><c:out value="${result.cmpnyNm}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.deptNm}"/></td>
			<td class="lt_text3" nowrap><c:out value="${result.frstRegisterPnttm}"/></td	>
			<td class="lt_text3" nowrap>
	    		<a href="<c:url value='/cop/ncm/insertNcrdUseInf.do?ncrdId='/><c:out value='${result.ncrdId}'/>">
	    			사용등록
	    		</a>
		  </tr>
		 </c:forEach>
		 <c:if test="${fn:length(resultList) == 0}">
		  <tr>
		    <td class="lt_text3" nowrap colspan="6" ><spring:message code="common.nodata.msg" /></td>
		  </tr>
		 </c:if>
	 </tbody>
	 <!--tfoot>
	  <tr class="">
	   <td colspan=6 align="center"></td>
	  </tr>
	 </tfoot -->
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_ncrdInfs" />
	</div>
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</div>
</form>
</body>
</html>
