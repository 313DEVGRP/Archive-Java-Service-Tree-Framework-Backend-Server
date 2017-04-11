<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
 /**
  * @Class Name : EgovNewsInfoRegist.jsp
  * @Description : EgovNewsInfoRegist 화면
  * @Modification Information
  * @
  * @  수정일   	수정자		수정내용
  * @ ----------	------		---------------------------
  * @ 2009.02.01	박정규		최초 생성
  * @ 2011.07.20	옥찬우		첨부파일 갯수 설정 부분 id="posblAtchFileNumber" 추가( Line : 167 )
  *
  *  @author 공통서비스팀
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<%@ page import="java.util.Date"  %>

<html lang="ko">
<head>
<title>뉴스정보 등록</title>

<meta http-equiv="content-type" content="text/html; charset=utf-8" >

<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" >
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/uss/ion/nws/EgovNewsInfo.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>

<validator:javascript formName="newsManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

	/* ********************************************************
	 * 초기화
	 ******************************************************** */
	function fn_egov_initl_newsinfo(){

		// 첫 입력란에 포커스..
		newsManageVO.newsSj.focus();

	}

	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function fn_egov_regist_newsinfo(form){


		// 서버사이드 테스트용
		/*
			form.action = "<c:url value='/uss/ion/nws/NewsInfoRegist.do'/>";
			form.submit();
			return;
		*/

		var ls_ntceDe = form.ntceDe.value;

		if (ls_ntceDe != "") {

			ls_ntceDe = fn_egov_remove_string(ls_ntceDe,"-");
			form.ntceDe.value = ls_ntceDe;

		}

		if (!validateNewsManageVO(form)) {

			return;

		} else {

			form.action = "<c:url value='/uss/ion/nws/NewsInfoRegist.do'/>";
			form.submit();

		}

	}

	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_inqire_newsinfolist() {

		newsManageVO.action = "<c:url value='/uss/ion/nws/NewsInfoListInqire.do'/>";
		newsManageVO.submit();

	}

	/* ********************************************************
	 * 현재날짜 가져오기
	 ******************************************************** */
	function fn_egov_getToday(){

		var today = new	Date();
		var currentYear  = today.getYear();
		var currentMonth = (today.getMonth()+1).toString();
		var currentDay = today.getDate();

		var	currentToday = currentYear + "-" + fn_egov_getLpad(2,currentMonth) + "-" + currentDay;

		return	currentToday;
	}

	/* ********************************************************
	 * LPAD 처리
	 ******************************************************** */
	function fn_egov_getLpad(rtnSize, sourceStr)
	{
	    rtnStr = sourceStr;

	    for( i= sourceStr.length; i<parseInt(rtnSize); i++)
	        rtnStr =  "0" + rtnStr;

	    return rtnStr;
	}

	/* ********************************************************
	 * 입력받은문자열중에서 제거 문자열을 제외 문자열을 리턴한다.
	 ******************************************************** */
	function fn_egov_remove_string(srcStr, cndStr) {

	    var	result = null;
		var rtnStr = null;

	    for (var i = 0; i < srcStr.length; i++) {

	        if (srcStr.charAt(i) == cndStr) {
	            result = srcStr.substring(0, i);

	            // 첫번째 제거 문자열을 제외한 전체 문자열
	            srcStr = result + srcStr.substring(i+1, srcStr.length);

	            // 최종변환 문자열
	            rtnStr = srcStr;
	        }
	    }

	    return rtnStr;
	}

</script>
</head>

<body onLoad="fn_egov_initl_newsinfo();">

	<DIV id="content" style="width:700px">

	<!--  상단타이틀(파일첨부를 위한 폼명 및 Enctype 설정 -->
	<form:form commandName="newsManageVO" name="newsManageVO" action="" method="post" enctype="multipart/form-data">

	<!--  첨부파일 갯수를 위한 hidden-->
	<input type="hidden" name="posblAtchFileNumber" id="posblAtchFileNumber" value="3" />

	<!--  상단 타이틀  영역 -->
	<table width="100%" cellpadding="8" class="table-search" border="0">
		<tr>
			<td width="100%"class="title_left">
				<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="뉴스정보등록 개요모양">&nbsp;뉴스정보등록
			</td>
		</tr>
	</table>

	<!--  줄간격조정  -->
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td height="3px"></td>
		</tr>
	</table>

	<!--  등록  폼 영역  -->
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
		<tr>
			<th width="20%" height="23" class="required_text" nowrap >
				뉴스제목
				<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력사항표시">
			</th>
			<td width="80%" nowrap>
				<form:input path="newsSj" size="70" maxlength="70" />
				<div><form:errors path="newsSj"/></div>
			</td>
		</tr>

		<tr>
			<th height="23" class="required_text" >
				뉴스내용
				<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력사항표시">
			</th>
		    <td>
				<form:textarea path="newsCn" cols="300" rows="30" cssClass="txaClass" />
				<div><form:errors path="newsCn"/></div>
		    </td>
		</tr>

		<tr>
	    	<th height="23" class="required_text" >
	    		뉴스출처&nbsp;&nbsp;
	    	</th>
			<td>
				<input name="newsOrigin" type="text" size="60" value=""  maxlength="60" title="뉴스 출처 입력" />
			</td>
		</tr>

		<tr>
			<th height="23" class="required_text" >
				게시일자
			</th>
			<td>
				<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
				<input name="ntceDe" type="text" size="10" readonly title="게시일자 입력" />
					<a href="#" onClick="javascript:fn_egov_NormalCalendar(newsManageVO,'', newsManageVO.ntceDe);" >
						<img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />"  align="middle" style="border:0px" alt="달력창팝업버튼이미지">
					</a>
				<div><form:errors path="ntceDe"/></div>
			</td>
		</tr>

		<!-- 첨부파일 테이블 레이아웃 설정 Start..-->
		<tr>
			<th height="23">파일첨부</th>
			<td colspan="3">

			<table width="580px" cellspacing="0" cellpadding="0" border="0" align="center" class="UseTable">
				<tr>
					<td>
						<input name="file_1" id="egovComFileUploader" type="file" title="첨부파일 입력" />
					</td>
				</tr>

				<tr>
					<td>
				    	<div id="egovComFileList"></div>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	  <!--첨부파일 테이블 레이아웃 End.-->
	</table>

	<!-- 첨부파일 업로드 가능화일 설정 Start..-->
	<script type="text/javascript">

		var maxFileNum = document.getElementById('posblAtchFileNumber').value;

		   if(maxFileNum==null || maxFileNum==""){

		     maxFileNum = 3;

		    }

		   var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );

		   multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );

	</script>
	<!--  첨부파일 업로드 가능화일 설정 End.-->

	<!--  줄간격조정  -->
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td height="5px"></td>
		</tr>
	</table>

	<!--  목록/저장버튼  -->
	<table border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
		<!-- 
			<td>
				<img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="저장버튼이미지">
			</td>
			<td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif' />" class="text_left" nowrap>
				<a href="JavaScript:fn_egov_regist_newsinfo(document.forms[0]);">저장</a>
			</td>
			<td>
				<img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" width="8" height="20" alt="저장버튼이미지">
			</td>
			<td>&nbsp;</td>
			<td>
				<img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="목록버튼이미지">
			</td>
			<td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif' />" class="text_left" nowrap>
				<a href="javascript:fn_egov_inqire_newsinfolist();">목록</a>
			</td>
			<td>
				<img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" width="8" height="20" alt="목록버튼이미지">
			</td>
		-->
			<td><span class="button"><input type="submit" value="저장" title="저장" onclick="javascript:fn_egov_regist_newsinfo(document.forms[0]);return false;"></span></td>
			<td>&nbsp;</td>
			<td><span class="button"><input type="submit" value="목록" title="목록" onclick="javascript:fn_egov_inqire_newsinfolist();return false;"></span></td>
		
		</tr>
	</table>

	</form:form>
	</DIV>

</body>
</html>
