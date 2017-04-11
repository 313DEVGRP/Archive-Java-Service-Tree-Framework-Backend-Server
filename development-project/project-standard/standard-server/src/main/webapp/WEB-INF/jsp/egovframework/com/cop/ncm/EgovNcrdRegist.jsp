<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<% 
 /**
  * @Class Name : EgovNcrdRegist.jsp
  * @Description : 명함등록		
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.03.30   이삼섭          최초 생성
  * @ 2011.06.21   안민정          이름 입력부분 Search 버튼 주석처리 (커뮤니티와 연동 시 주석 해제하여 사용)
  
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
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/ccm/zip/EgovZipPopup.js' />" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="nameCard" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
	function fn_egov_regist_ncrdInf(){
		if (!validateNameCard(document.nameCard)){
			return;
		}
		
		if (confirm('<spring:message code="common.regist.msg" />')) {
			document.nameCard.action = "<c:url value='/cop/ncm/insertNcrdInf.do'/>";
			document.nameCard.submit();
		}
	}

	function fn_egov_select_ncrdInfs(){
		document.nameCard.action = "<c:url value='/cop/ncm/selectNcrdInfs.do'/>";
		document.nameCard.submit();		
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
	
	function showModalDialogCallback(retVal) {
		if (retVal) {
			var tmp = retVal.split("|");
			document.nameCard.ncrdTrgterId.value = tmp[0];
			document.nameCard.ncrdNm.value = tmp[1];
		}
	}
</script>
<title>명함 등록</title>

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
<input type="hidden" name="zip_url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />

<div id="border" style="width:730px">
	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	  	<h1>		
	  		<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="" />&nbsp;명함등록
	  	</h1>
	  </td>
	 </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="이름, 회사명, 직위, 부서명, 직급, 이메일주소, 전화번호, 휴대폰번호, 주소, 외부사용자여부, 공개여부, 비고 입니다">
	  <tr> 
	    <th scope="col" width="20%" height="23" class="required_text" nowrap >
	    	<label for="ncrdNm">
	    		<spring:message code="cop.ncrdNm" />
	    		<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
	    	</label>
	    </th>
	    <td width="80%" nowrap colspan="3">
	      <input name="ncrdNm" type="text" size="30" id="ncrdNm" value='<c:out value="${ncrdVO.ncrdNm}" />' maxlength="60" >
	      <input name="ncrdTrgterId" type="hidden" value='<c:out value="${ncrdVO.ncrdTrgterId}" />'>
	      &nbsp;	      
	      
	      	<!--   커뮤니티와 연동  시 주석 해제    -->
	      	
	    	<!-- a href="#LINK" onClick="fn_egov_inqire_user()" style="selector-dummy: expression(this.hideFocus=false);">
	      		<img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />"
	     			width="15" height="15" align="middle" alt="search"/>
	    	</a-->
	    	
	    <br><form:errors path="ncrdNm" />			
	    </td>
	  </tr>
	  <tr> 
	    <th scope="col" width="20%" height="23" class="required_text" nowrap >
	    	<label for="cmpnyNm">
	    		<spring:message code="cop.cmpnyNm" />
	    		<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="not required">
	    	</label>
	    </th>
	    <td width="30%" nowrap>
	      	<input name="cmpnyNm" type="text" id="cmpnyNm" size="30" value=""  maxlength="60" >
	    </td>
	    <th scope="col" width="20%" height="23" class="required_text" nowrap >
	    	<label for="deptNm">
	    		<spring:message code="cop.deptNm" />
	    		<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="not required">
	    	</label>	    	
	    </th>
	    <td width="30%" nowrap>
	      	<input name="deptNm" type="text" id="deptNm" size="30" value=""  maxlength="60" >
	    </td>    
	  </tr>
	  <tr> 
	    <th scope="col" width="20%" height="23" class="required_text" nowrap >
	    	<label for="ofcpsNm">
	    		<spring:message code="cop.ofcpsNm" />
	    		<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="not required">
	    	</label>
	    </th>
	    <td width="30%" nowrap>
	      <input name="ofcpsNm" type="text" id="ofcpsNm" size="30" value=""  maxlength="60" >
	    </td>
	    <th scope="col" width="20%" height="23" class="required_text" nowrap >
	    	<label for="clsfNm">
	    		<spring:message code="cop.clsfNm" />
	    		<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="not required">	    		
	    	</label>
	    </th>
	    <td width="30%" nowrap>
	      <input name="clsfNm" type="text" id="clsfNm" size="30" value=""  maxlength="60" >
	    </td>    
	  </tr>    
	  <tr> 
	    <th scope="col" width="20%" height="23" class="required_text" nowrap >
	    	<label for="emailAdres">
	    		<spring:message code="cop.emailAdres" />	    	
	    		<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
	    	</label>
	    </th>
	    <td width="80%" nowrap colspan="3">
	      <input name="emailAdres" type="text" id="emailAdres" size="30" value=""  maxlength="60" >
	      <br><form:errors path="emailAdres" />	
	    </td>
	  </tr>
	  <tr> 
	    <th scope="col" width="20%" height="23" class="required_text" nowrap >
	    	<spring:message code="cop.telNo" />
	    	<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="not required">
	    </th>
	    <td width="80%" nowrap colspan="3">
	      <label for="nationNo"><input name="nationNo" type="text" id="nationNo" size="7" value=""  maxlength="7" >-</label>
	      <label for="areaNo"><input name="areaNo" type="text" id="areaNo" size="5" value=""  maxlength="4" >-</label>
	      <label for="middleTelNo"><input name="middleTelNo" type="text" id="middleTelNo" size="5" value=""  maxlength="4" >-</label>
	      <label for="endTelNo"><input name="endTelNo" type="text" id="endTelNo" size="5" value=""  maxlength="4" ></label>
	    </td>
	  </tr>  
	  <tr> 
	    <th scope="col" width="20%" height="23" class="required_text" nowrap >
	    	<label for="mbtlNum">
	    		<spring:message code="cop.mbtlNum" />
	    		<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="not required">
	    	</label>
	    </th>
	    <td width="80%" nowrap colspan="3">
	     	<select name="idntfcNo" class="select" id="mbtlNum">
	  		   <option selected value=''>--식별번호--</option>
			   <option value="010">010</option>
			   <option value="011">011</option>
			   <option value="016">016</option>
			   <option value="017">017</option>
			   <option value="018">018</option>
			   <option value="019">019</option>
	  	   </select>  	   	    
	      <label for="middleMbtlNum"><input name="middleMbtlNum" type="text" id="middleMbtlNum" size="5" value=""  maxlength="5" ></label>-
	      <label for="endMbtlNum"><input name="endMbtlNum" type="text" id="endMbtlNum" size="5" value=""  maxlength="5" ></label>
	    </td>
	  </tr> 
	  <tr> 
	    <th scope="col" width="20%" height="23" class="required_text" nowrap >
	    	<spring:message code="cop.adres" />
	    	<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="not required">
	    </th>
	    <td width="80%" nowrap colspan="3">
	      <input type="hidden" name="zipCode" value="" size="6" readonly onClick="javascript:fn_egov_ZipSearch(document.frm, document.frm.v_zipCode, document.frm.zipCode, document.frm.adres);" />
          <input type="hidden" name="v_zipCode" value="" size="7" readonly onClick="javascript:fn_egov_ZipSearch(document.frm, document.frm.v_zipCode, document.frm.zipCode, document.frm.adres);" />
	      <label for="adres"><input name="adres" type="text" id="adres" readonly /></label> 
	      &nbsp;<a href="#LINK" onClick="fn_egov_ZipSearch(document.nameCard, document.nameCard.v_zipCode, document.nameCard.zipCode, document.nameCard.adres);" style="selector-dummy: expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />"
	     			width="15" height="15" align="middle" alt="search"></a>
	      <br><label for="detailAdres"><input name="detailAdres" type="text" size="80" value=""  maxlength="80" ></label> 
      
	    </td>
	  </tr>
	  <tr> 
	    <th scope="col" width="20%" height="23" class="required_text" nowrap >
	    	<spring:message code="cop.extrlUserAt" />
	    	<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="not required">
	    </th>
	    <td width="30%" class="">
	     	<spring:message code="cop.extrlUser" /> : <input type="radio" name="extrlUserAt" class="radio2" value="Y">&nbsp;
	     	<spring:message code="cop.intrlUser" /> : <input type="radio" name="extrlUserAt" class="radio2" value="N">
	    </td> 
	    <th scope="col" width="20%" height="23" class="required_text" nowrap ><spring:message code="cop.publicAt" />
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="30%" class="" colspan="3">
	     	<spring:message code="cop.public" /> : <input type="radio" name="othbcAt" class="radio2" value="Y">&nbsp;
	     	<spring:message code="cop.private" /> : <input type="radio" name="othbcAt" class="radio2" value="N">
	     	<br/><form:errors path="othbcAt" />
 	    </td>    
	  </tr> 
	  <tr> 
	    <th scope="col" width="20%" height="23" class="required_text" nowrap >
	    	<spring:message code="cop.remark" />
	    	<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="not required">
	    </th>
	    <td width="80%" nowrap colspan="3">
	      <label for="remark"><input name="remark" type="text" id="remark" size="90" value=""  maxlength="90" ></label>   
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
      	<span class="button"><input type="button" onClick="fn_egov_regist_ncrdInf();" value="<spring:message code='button.create' />"/></span> 
      </td>
      <td width="10"></td>
      <td>
      	<span class="button"><input type="button" onClick="fn_egov_select_ncrdInfs();" value="<spring:message code='button.list' />"/></span> 
      </td>          
	</tr>
	</table>
	</div>
</div>
</form:form>
</body>
</html>
