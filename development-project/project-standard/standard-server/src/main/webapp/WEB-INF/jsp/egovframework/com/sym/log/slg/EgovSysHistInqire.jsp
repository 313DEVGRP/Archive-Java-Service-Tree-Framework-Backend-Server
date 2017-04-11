<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovSysHistInqire.jsp
  * @Description : 시스템 이력 정보 상세조회 화면
  * @Modification Information
  * @
  * @  수정일         수정자          수정내용
  * @ -------        --------       ---------------------------
  * @ 2009.03.11      이삼섭          최초 생성
  * @ 2011.07.08      이기하          패키지 분리로 경로 수정(sym.log -> sym.log.slg)
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.03.11
  *  @version 1.0
  *  @see
  *
  */
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript">
function fn_egov_update_sysHist(){
	document.frm.action = "<c:url value='/sym/log/slg/ModifySysHistory.do'/>";
	document.frm.submit();
}

function fn_egov_delete_sysHist(){
	document.frm.action = "<c:url value='/sym/log/slg/DeleteSysHistory.do'/>";
	document.frm.submit();
}

function fn_egov_select_sysHist(){
	document.frm.action = "<c:url value='/sym/log/slg/SelectSysHistoryList.do'/>";
	document.frm.submit();
}
</script>

<title>시스템 이력 상세보기</title>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<form name="frm" action ="<c:url value='/sym/log/slg/SelectSysHistoryList.do'/>" method="post">
<input name="pageIndex" type="hidden" value="1" />
<input type="hidden" name="histId" value="<c:out value='${result.histId}'/>" />
	<table width="700" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left"><h1 class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;시스템 이력정보</h1></td>
	 </tr>
	</table>
	<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="이력구분, 시스템명, 이력내용, 등록일자를 나타내는 시스템 이력 상세보기 테이블이다." >
	<CAPTION style="display: none;">시스템 이력정보</CAPTION>
	  <tr>
	    <th height="23" class="" scope="row">이력 구분</th>
	    <td>&nbsp;&nbsp;
	    <c:out value="${result.histSeCodeNm}"/>
	    </td>
	  </tr>
	 <tr>
	    <th width="20%" height="23" align="center" scope="row">시스템명</th>
	    <td width="80%" nowrap >&nbsp;&nbsp;
	    <c:out value="${result.sysNm}"/>
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" align="center" scope="row"><label for="histCn">이력내용</label></th>
	    <td width="80%" nowrap>
	      <textarea name="histCn" class="textarea"  cols="40" rows="8"  style="width:450px;" id="histCn"><c:out value="${result.histCn}"/></textarea>
	    </td>
	  </tr>
	 <tr>
	    <th width="20%" height="23" align="center" scope="row">등록일자</th>
	    <td width="80%" nowrap >&nbsp;&nbsp;
	      <c:out value="${result.frstRegisterPnttm}"/>
	    </td>
	  </tr>
	  <c:if test="${result.atchFileId != ''}">
		  <tr>
		    <th height="23"><spring:message code="sym.log.atchFileList" scope="row" /></th>
		    <td colspan="6">
				<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
					<c:param name="param_atchFileId" value="${result.atchFileId}" />
				</c:import>
		    </td>
		  </tr>
	  </c:if>
	</table>
	<table width="700" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
	<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
      <td><span class="button"><input type="submit" value="수정" onclick="fn_egov_update_sysHist(); return false;"></span></td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt=""></td>
      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap>
      <a href="#noscript" onclick="fn_egov_delete_sysHist(); return false;">삭제</a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      <td width="10"></td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt=""></td>
      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap>
      <a href="#noscript" onclick="fn_egov_select_sysHist(); return false;">목록</a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
	</tr>
	</table>
</form>
</body>
</html>
