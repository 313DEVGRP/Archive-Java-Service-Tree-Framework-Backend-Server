<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovTrsmrcvLogRegist.jsp
  * @Description : 송수신 로그 등록 화면
  * @Modification Information
  * @
  * @  수정일         수정자          수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.03.09      이삼섭          최초 생성
  * @ 2011.07.08      이기하          패키지 분리로 경로 수정(sym.log -> sym.log.tlg)
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.03.09
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
	function fn_egov_regist_TrsmrcvLog(pTrsmrcvSeCode){
		document.frm.trsmrcvSeCode.value = pTrsmrcvSeCode;
		document.frm.action = "<c:url value='/sym/log/tlg/InsertTrsmrcvLog.do'/>";
		document.frm.submit();
	}

	function fn_egov_select_TrsmrcvLog(pageNo){
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/sym/log/tlg/SelectTrsmrcvLogList.do'/>";
		document.frm.submit();
	}
</script>
<title>송수신  테스트</title>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<form name="frm" method="post" action="<c:url value='/sym/log/tlg/InsertTrsmrcvLog.do'/>">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input name="trsmrcvSeCode" type="hidden" />

	<table width="700" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%" class="title_left"><h1 class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;송수신테스트</h1></td>
	 </tr>
	</table>
	<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="연계ID, 제공기관ID, 제공시스템ID, 제공서비스ID, 요청기관ID, 요청시스템ID를 입력하여 송수신 테스트를 하는 테이블이다.">
	<CAPTION style="display: none;">송수신 테스트</CAPTION>
	 <tr>
	    <th width="20%" height="23" class="required_text" scope="row" nowrap ><label for="cntcId">연계ID</label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="80%" nowrap >
	      <input name="cntcId" type="text" size="60" value="INT1" maxlength="4" id="cntcId" >
	    </td>
	  </tr>
	 <tr>
	    <th width="20%" height="23" class="required_text" scope="row" nowrap ><label for="provdInsttId">제공기관ID</label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="80%" nowrap >
	      <input name="provdInsttId" type="text" size="60" value="PI01" maxlength="4" id="provdInsttId" >
	    </td>
	  </tr>
	 <tr>
	    <th width="20%" height="23" class="required_text" scope="row" nowrap ><label for="provdSysId">제공시스템ID</label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="80%" nowrap >
	      <input name="provdSysId" type="text" size="60" value="PS01" maxlength="4" id="provdSysId" >
	    </td>
	  </tr>
	 <tr>
	    <th width="20%" height="23" class="required_text" scope="row" nowrap ><label for="provdSvcId">제공서비스ID</label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="80%" nowrap >
	      <input name="provdSvcId" type="text" size="60" value="PV01" maxlength="4" id="provdSvcId" >
	    </td>
	  </tr>
	 <tr>
	    <th width="20%" height="23" class="required_text" scope="row" nowrap ><label for="requstInsttId">요청기관ID</label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="80%" nowrap >
	      <input name="requstInsttId" type="text" size="60" value="RI01" maxlength="4" id="requstInsttId">
	    </td>
	  </tr>
	 <tr>
	    <th width="20%" height="23" class="required_text" scope="row" nowrap ><label for="requstSysId">요청시스템ID</label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="80%" nowrap >
	      <input name="requstSysId" type="text" size="60" value="RS01" maxlength="4" id="requstSysId" >
	    </td>
	  </tr>
	</table>
	<table width="700" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
	<div id="border" style="width:700px" align="center">
	<table border="0" cellspacing="0" cellpadding="0">
	<tr>
	  <!--
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt=""></td>
      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap>
      <a href="#noscript" onclick="fn_egov_regist_TrsmrcvLog('S01'); return false;">전송요청</a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      -->
      <td><span class="button"><input type="submit" value="전송요청" onclick="fn_egov_regist_TrsmrcvLog('S01'); return false;"></span></td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt=""></td>
      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap>
      <a href="#noscript" onclick="fn_egov_regist_TrsmrcvLog('S02'); return false;">전송완료</a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      <td width="10"></td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt=""></td>
      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap>
      <a href="#noscript" onclick="fn_egov_regist_TrsmrcvLog('S03'); return false;">전송실패</a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      <td width="10"></td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt=""></td>
      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap>
      <a href="#noscript" onclick="fn_egov_regist_TrsmrcvLog('S04'); return false;">수신요청</a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      <td width="10"></td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt=""></td>
      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap>
      <a href="#noscript" onclick="fn_egov_regist_TrsmrcvLog('S05'); return false;">수신완료</a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      <td width="10"></td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt=""></td>
      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap>
      <a href="#noscript" onclick="fn_egov_regist_TrsmrcvLog('S06'); return false;">수신실패</a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      <td width="10"></td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt=""></td>
      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap>
      <a href="#noscript" onclick="fn_egov_select_TrsmrcvLog('1'); return false;">목록</a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
	</tr>
	</table>
	</div>
</form>
</body>
</html>
