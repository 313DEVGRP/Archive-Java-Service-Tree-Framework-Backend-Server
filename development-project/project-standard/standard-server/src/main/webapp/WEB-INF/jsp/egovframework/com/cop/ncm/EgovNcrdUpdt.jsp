<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%
 /**
  * @Class Name : EgovNcrdUpdt.jsp
  * @Description : 명함수정
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

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/ccm/zip/EgovZipPopup.js' />" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="nameCard" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
	function fn_egov_select_ncrdInfs(){
		document.nameCard.action = "<c:url value='/cop/ncm/selectMyNcrdUseInf.do'/>";
		document.nameCard.submit();
	}

	function fn_egov_updt_ncrdInf(){
		if (!validateNameCard(document.nameCard)){
			return;
		}

		if (confirm('<spring:message code="common.update.msg" />')) {
			document.nameCard.action = "<c:url value='/cop/ncm/updateNcrdInf.do'/>";
			document.nameCard.submit();
		}
	}

	function fn_egov_inqire_user(){
		var retVal;
		var url = "<c:url value='/cop/com/openPopup.do?requestUrl=/cop/com/selectUserList.do&width=850&height=360'/>";
		var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";

		retVal = window.showModalDialog(url,"p_userInqire", openParam);

		if(retVal != null){
			var tmp = retVal.split("|");
			document.nameCard.ncrdTrgterId.value = tmp[0];
			document.nameCard.ncrdNm.value = tmp[1];
		}
	}
	
	//showModalDialog 대체 수정
	function showModalDialogCallback(retVal) {
		if (retVal) {
			var tmp = retVal.split("|");
			document.nameCard.ncrdTrgterId.value = tmp[0];
			document.nameCard.ncrdNm.value = tmp[1];
		}
	}
</script>
<title>명함수정</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
</head>
<body>

<form:form commandName="nameCard" name="nameCard" method="post" >
<div style="visibility:hidden;display:none;">
<input name="iptSubmit" type="submit" value="전송" title="전송">
</div>
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
<input type="hidden" name="ncrdId" value="<c:out value='${ncrdVO.ncrdId}'/>" />
<input type="hidden" name="zip_url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />

<div id="border" style="width:730px">
	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목버튼이미지">
	   &nbsp;명함수정</td>
	 </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
	  <tr>
	    <th width="20%" height="23" class="required_text" nowrap ><spring:message code="cop.ncrdNm" />
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="80%" nowrap colspan="3">
	      <label for="ncrdNm"><input name="ncrdNm" type="text" id="ncrdNm" size="30"  value='<c:out value="${ncrdVO.ncrdNm}" />' maxlength="60" ></label>
	      <input name="ncrdTrgterId" type="hidden" value='<c:out value="${ncrdVO.ncrdTrgterId}" />'><!--
	      &nbsp;

	      <a href="#LINK" onClick="fn_egov_inqire_user()" style="selector-dummy: expression(this.hideFocus=false);">
	      	<img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />" width="15" height="15" align="middle" alt="search"></a>

	     --><br/><form:errors path="ncrdNm" />
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" nowrap ><label for="ncrdNm"><spring:message code="cop.cmpnyNm" /></label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="required">
	    </th>
	    <td width="30%" nowrap>
	      <input name="cmpnyNm" type="text" id="cmpnyNm" size="30" value='<c:out value="${ncrdVO.cmpnyNm}" />'  maxlength="60" title="회사명수정">
	    </td>
	    <th width="20%" height="23" class="required_text" nowrap ><label for="deptNm"><spring:message code="cop.deptNm" /></label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="required">
	    </th>
	    <td width="30%" nowrap>
	      <input name="deptNm" type="text" id="deptNm" size="30" value='<c:out value="${ncrdVO.deptNm}" />' maxlength="60" title="이름수정">
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" nowrap ><label for="ofcpsNm"><spring:message code="cop.ofcpsNm" /></label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="required">
	    </th>
	    <td width="30%" nowrap>
	      <input name="ofcpsNm" type="text" id="ofcpsNm" size="30" value='<c:out value="${ncrdVO.ofcpsNm}" />' maxlength="60" title="직위명수정">
	    </td>
	    <th width="20%" height="23" class="required_text" nowrap ><label for="clsfNm"><spring:message code="cop.clsfNm" /></label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="required">
	    </th>
	    <td width="30%" nowrap>
	      <input name="clsfNm" type="text" id="clsfNm" size="30" value='<c:out value="${ncrdVO.clsfNm}" />'  maxlength="60" title="직급명수정">
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" nowrap ><spring:message code="cop.emailAdres" />
		<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="80%" nowrap colspan="3">
	      <label for="emailAdres"><input name="emailAdres" type="text" id="emailAdres" size="30" value='<c:out value="${ncrdVO.emailAdres}" />'  maxlength="60" title=""></label>
	      <br/><form:errors path="emailAdres" />
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" nowrap ><spring:message code="cop.telNo" />
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="required">
	    </th>
	    <td width="80%" nowrap colspan="3">
	      <label for="nationNo"><input name="nationNo" type="text" id="nationNo" size="5" value='<c:out value="${ncrdVO.nationNo}" />'  maxlength="5" ></label>-
	      <label for="areaNo"><input name="areaNo" type="text" id="areaNo" size="5" value='<c:out value="${ncrdVO.areaNo}" />'  maxlength="5" ></label>-
	      <label for="middleTelNo"><input name="middleTelNo" type="text" id="middleTelNo" size="5" value='<c:out value="${ncrdVO.middleTelNo}" />'  maxlength="5" ></label>-
	      <label for="endTelNo"><input name="endTelNo" type="text" id="endTelNo" size="5" value='<c:out value="${ncrdVO.endTelNo}" />' maxlength="5" ></label>
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" nowrap ><label for="idntfcNo"><spring:message code="cop.mbtlNum" /></label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="required">
	    </th>
	    <td width="80%" nowrap colspan="3">
	     	<select name="idntfcNo" class="select" id="idntfcNo">
	  		   <option selected value=''>--식별번호--</option>
			   <option value="010" <c:if test="${ncrdVO.idntfcNo == '010'}"> selected="selected" </c:if> >010</option>
			   <option value="011" <c:if test="${ncrdVO.idntfcNo == '011'}"> selected="selected" </c:if> >011</option>
			   <option value="016" <c:if test="${ncrdVO.idntfcNo == '016'}"> selected="selected" </c:if> >016</option>
			   <option value="017" <c:if test="${ncrdVO.idntfcNo == '017'}"> selected="selected" </c:if> >017</option>
			   <option value="018" <c:if test="${ncrdVO.idntfcNo == '018'}"> selected="selected" </c:if> >018</option>
			   <option value="019" <c:if test="${ncrdVO.idntfcNo == '019'}"> selected="selected" </c:if> >019</option>
	  	   </select>
	  	   -
	      <label for="middleMbtlNum"><input name="middleMbtlNum" type="text" id="middleMbtlNum" size="5" value='<c:out value="${ncrdVO.middleMbtlNum}" />' maxlength="5" ></label>-
	      <label for="endMbtlNum"><input name="endMbtlNum" type="text" id="endMbtlNum" size="5" value='<c:out value="${ncrdVO.endMbtlNum}" />'  maxlength="5" ></label>
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" nowrap ><spring:message code="cop.adres" />
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="required">
	    </th>
	    <td width="80%" nowrap colspan="3">
	      <input type="hidden" name="zipCode" value=""  />
          <input type="hidden" name="v_zipCode" value=""  />
	      <label for="adres"><input name="adres" type="text" value='<c:out value="${ncrdVO.adres}" />' readonly id="adres" onClick="javascript:fn_egov_ZipSearch(document.frm, document.frm.v_zipCode, document.frm.zipCode, document.frm.adres);" / ></label>
	      &nbsp;<a href="#LINK" onClick="fn_egov_ZipSearch(document.nameCard, document.nameCard.v_zipCode, document.nameCard.zipCode, document.nameCard.adres)" style="selector-dummy: expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />"
	     			width="15" height="15" align="middle" alt="search"></a>
	      <br>
	      <label for="detailAdres"><input name="detailAdres" type="text" id="detailAdres" size="80" value='<c:out value="${ncrdVO.detailAdres}" />' maxlength="80" ></label>
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" nowrap ><spring:message code="cop.extrlUserAt" />
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="required">
	    </th>
	    <td width="30%" nowrap class="">
	     	<spring:message code="cop.extrlUser" /> : <input type="radio" name="extrlUserAt" class="radio2" value="Y" <c:if test="${ncrdVO.extrlUserAt == 'Y'}"> checked="checked"</c:if> />&nbsp;
	     	<spring:message code="cop.intrlUser" /> : <input type="radio" name="extrlUserAt" class="radio2" value="N"  <c:if test="${ncrdVO.extrlUserAt == 'N'}"> checked="checked"</c:if> />
	    </td>
	    <th width="20%" height="23" class="required_text" nowrap ><spring:message code="cop.publicAt" />
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="30%" nowrap class="" colspan="3">
	     	<spring:message code="cop.public" /> : <input type="radio" name="othbcAt" class="radio2" value="Y" <c:if test="${ncrdVO.othbcAt == 'Y'}"> checked="checked"</c:if> />&nbsp;
	     	<spring:message code="cop.private" /> : <input type="radio" name="othbcAt" class="radio2" value="N"  <c:if test="${ncrdVO.othbcAt == 'N'}"> checked="checked"</c:if> />
	     	<br/><form:errors path="othbcAt" />
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" nowrap ><spring:message code="cop.remark" />
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="required">
	    </th>
	    <td width="80%" nowrap colspan="3">
	      <label for="remark"><input name="remark" type="text" id="remark" size="90" value='<c:out value="${ncrdVO.remark}" />' maxlength="90" ></label>
	    </td>
	  </tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
	<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
      
      <td>
      	<span class="button"><input type="button" onClick="fn_egov_updt_ncrdInf()" value="<spring:message code='button.update' />"/></span>
      </td>
     
      <td width="10"></td>
      
      <td>
      	<span class="button"><input type="button" onClick="fn_egov_select_ncrdInfs('1')" value="<spring:message code='button.list' />"/></span>
      	
      </td>
      
	</tr>
	</table>
	</div>
</div>
</form:form>
</body>
</html>
