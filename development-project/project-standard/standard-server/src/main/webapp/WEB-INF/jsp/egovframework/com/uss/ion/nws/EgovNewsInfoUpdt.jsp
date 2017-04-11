<%
 /**
  * @Class Name : EgovNewsInfoUpdt.jsp
  * @Description : EgovNewsInfoUpdt 화면
  * @Modification Information
  * @
  * @  수정일   	수정자		수정내용
  * @ ----------	------		---------------------------
  * @ 2009.02.01	박정규		최초 생성
  * @ 2011.07.12	옥찬우		Line 83 주석처리 ( // form.newsId.value = newsId; )
  *
  *  @author 공통서비스팀
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>뉴스정보수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" >
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
function fn_egov_updt_newsinfo(form, newsId){

    // 서버사이드 테스트용
    /*
        form.action = "<c:url value='/uss/olh/hpc/HpcmCnUpdt.do'/>";
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


        // form.newsId.value = newsId;
        form.action = "<c:url value='/uss/ion/nws/NewsInfoUpdt.do'/>";
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
 * 입력받은문자열중에서 제거 문자열을 제외 문자열을 리턴한다.
 ******************************************************** */
function fn_egov_remove_string(srcStr, cndStr) {

    var result = null;
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

function fn_egov_check_file(flag) {

    if(flag=="Y") {
        document.getElementById('file_upload_posbl').style.display = "block";
        document.getElementById('file_upload_imposbl').style.display = "none";
    } else {
        document.getElementById('file_upload_posbl').style.display = "none";
        document.getElementById('file_upload_imposbl').style.display = "block";
    }


}


</script>
</head>
<body onLoad="fn_egov_initl_newsinfo();">
<DIV id="content" style="width:700px">

<!-- 상단타이틀(파일첨부를 위한 폼명 및 Enctype 설정 -->
<form:form commandName="newsManageVO" action="" method="post"  enctype="multipart/form-data">

<!-- NewsInfoUpdtView.do Call을 위한 처리  -->
<input name="newsId" id="newsId" type="hidden" value="<c:out value='${result.newsId}'/>">

<!-- 첨부파일을 위한 NAME 설정 -->
<input type="hidden" name="posblAtchFileNumber" id="posblAtchFileNumber" value="3" />

<!-- 첨부파일 삭제 후 리턴 URL -->
<input type="hidden" name="returnUrl" id="returnUrl" value="<c:url value='/uss/ion/nws/NewsInfoUpdtView.do'/>"/>

<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="타이틀이미지">&nbsp;뉴스정보 수정</td>
 </tr>
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="뉴스정보 수정테이블.">
  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label id="idNewsSj" for="newsSj">뉴스제목</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력" ></th>
    <td width="80%" nowrap>
        <form:input path="newsSj" size="70" maxlength="70" />
        <div><form:errors path="newsSj"/></div>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" ><label id="idNewsCn" for="newsCn">뉴스내용</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력" ></th>
    <td>
      <form:textarea path="newsCn" cols="300" rows="30" cssClass="txaClass" />
      <div><form:errors path="newsCn"/></div>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" ><label id="idNewsOrigin" for="newsOrigin">뉴스출처</label>&nbsp;&nbsp;</th>
    <td>
      <input name="newsOrigin" id="newsOrigin" type="text" size="60" value="<c:out value='${result.newsOrigin}'/>"  maxlength="60">
    </td>
  </tr>

  		<!--
		<tr>
			<th width="20%" height="23" class="required_text" nowrap >
				<label id="idNtceDe" for="ntceDe">게시일자</label>
				&nbsp;&nbsp;
			</th>
			<td width="80%" nowrap>
				<input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
				<input name="ntceDe" id="ntceDe" type="text" size="10" value="<c:out value='${fn:substring(result.ntceDe, 0,4)}'/>
					-<c:out value='${fn:substring(result.ntceDe, 4,6)}'/>
					-<c:out value='${fn:substring(result.ntceDe, 6,8)}'/>"  readonly  />
				<a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(newsManageVO,'', newsManageVO.ntceDe);" />
					<img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />"  align="middle" style="border:0px" alt="게시일달력" title="게시일달력">
				</a>
				<div><form:errors path="ntceDe"/></div>
			</td>
		</tr>
		-->

  <tr>
	<th height="23" class="required_text" >
		게시일자
	</th>
	<td>
		<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
		<input name="ntceDe" type="text" size="10" readonly title="게시일자 입력" value="<c:out value='${fn:substring(result.ntceDe, 0,4)}'/>-<c:out value='${fn:substring(result.ntceDe, 4,6)}'/>-<c:out value='${fn:substring(result.ntceDe, 6,8)}'/>"/>
			<a href="#" onClick="javascript:fn_egov_NormalCalendar(newsManageVO,'', newsManageVO.ntceDe);" />
			<img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />"  align="middle" style="border:0px" alt="달력창팝업버튼이미지">
			</a>
		<div><form:errors path="ntceDe"/></div>
	</td>
   </tr>

 <!--첨부목록을 보여주기 위한 -->
<c:if test="${result.atchFileId != ''}">
    <tr>
        <th height="23">첨부파일 목록</th>
        <td >
            <c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" >
                <c:param name="param_atchFileId" value="${result.atchFileId}" />
            </c:import>
        </td>
    </tr>
</c:if>

 <!--첨부화일 업로드를 위한 Start -->
  <tr>
    <th height="23"><label for="egovComFileUploader">파일첨부</label></th>
        <td colspan="3">
          <c:if test="${result.atchFileId == null}">
		    <input type="hidden" name="fileListCnt" id="fileListCnt" value="0" >
		    <input name="atchFileAt" id="atchFileAt" type="hidden" value="N">
		  </c:if>		
		  <c:if test="${result.atchFileId != null}">
		    <input name="atchFileAt" id="atchFileAt" type="hidden" value="Y">
		  </c:if>
            <div id="file_upload_posbl"  style="display:none;" >
                <table width="580px" cellspacing="0" cellpadding="0" border="0" align="center" class="UseTable">
                    <tr>
                        <td><input name="file_1" id="egovComFileUploader" type="file"  ></td>
                    </tr>
                    <tr>
                        <td>
                            <div id="egovComFileList"></div>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="file_upload_imposbl"  style="display:none;" >
                <table width="580px" cellspacing="0" cellpadding="0" border="0" align="center" class="UseTable">
                    <tr>
                        <td><spring:message code="common.imposbl.fileupload" /></td>
                    </tr>
                </table>
            </div>
  </tr>
 <!--첨부화일 업로드를 위한 end.. -->


</table>

<!--첨부파일 업로드 가능화일 설정(Update) Start..-->
<script type="text/javascript">

    var existFileNum = null;
    var maxFileNum = null;

    if (document.getElementById('fileListCnt') != null) {
        existFileNum = document.getElementById('fileListCnt').value;
    }

    if (document.getElementById('posblAtchFileNumber') != null) {
        maxFileNum = document.getElementById('posblAtchFileNumber').value;
    }

    if(existFileNum=="undefined" || existFileNum ==null){
        existFileNum = 0;
    }

    if(maxFileNum=="undefined" || maxFileNum ==null){
        maxFileNum = 0;
    }

    var uploadableFileNum = maxFileNum - existFileNum;

    if(uploadableFileNum<0) {
        uploadableFileNum = 0;
    }

    if(uploadableFileNum != 0){

        fn_egov_check_file('Y');

        var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), uploadableFileNum );
        multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );

    }else{
        fn_egov_check_file('N');
    }

</script>
<!--첨부파일 업로드 가능화일 설정(Update) End.-->

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <td height="3px"></td>
</tr>
</table>

<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
    <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_updt_newsinfo(document.forms[0]); return false;"></span></td>
    <td>&nbsp;&nbsp;</td>
    <td>
        <span class="button">
        <a href="<c:url value='/uss/ion/nws/NewsInfoListInqire.do'/>"
           onclick="javascript:fn_egov_inqire_newsinfolist(); return false;"><spring:message code="button.list" /></a>
        </span>
    </td>


</tr>
</table>


</form:form>
</DIV>

</body>
</html>
