<%--
  Class Name : EgovComDamRequestOfferUpdt.jsp
  Description : 지식 정보제공/정보요청 수정
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2010.08.30    장동한          최초 생성
 
    author   : 공통서비스 개발팀 장동한
    since    : 2010.08.30
    
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="JsUrl" value="/js/egovframework/com/dam/spe/req/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>지식 정보제공/정보요청-등록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
<validator:javascript formName="requestOfferVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
/* ********************************************************
* 초기화
******************************************************** */
function fn_egov_init_RequestOffer(){

	var maxFileNum = document.getElementById('posblAtchFileNumber').value;
	   
	   if(maxFileNum==null || maxFileNum==""){
		   
	     maxFileNum = 3;
	     
	    }
	        
	   var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
	   
	   multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
	   			

}
/* ********************************************************
* 저장
******************************************************** */
function fn_egov_save_RequestOffer(){
	var vFrom = document.requestOfferVO;
	
	if(confirm("<spring:message code="common.save.msg" />")){

		vFrom.action = "<c:url value='/dam/spe/req/updtRequestOfferActor.do'/>";
		
		if(!validateRequestOfferVO(vFrom)){ 			
			return;
		}else{
			vFrom.submit();
		} 
	}
}
/* ********************************************************
 * 지식유형 가져오기
 ******************************************************** */
function fn_egov_get_CodeId(form){
 	form.cmd.value = "change";
 	form.submit();
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
<style type="text/css">
.txaIpt80 {
width : 80px;
}

#divVerify {
font-size : 12px;
color : red;
}
.txaIpt90 {
width : 92%;
}
.txaIpt99 {
width : 97%;
margin:0px 0px 0px 2px;
}

</style>
</head>
<body onLoad="fn_egov_init_RequestOffer()">
<DIV id="content" style="width:712px">
<!-- noscript 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!-- 등록폼 시작  -->
<form:form commandName="requestOfferVO" name="requestOfferVO" action="<c:url value='/dam/spe/req/updtRequestOffer.do'/>" method="post" enctype="multipart/form-data" >
	<%-- 상산 타이틀 --%>
<table width="100%" cellpadding="1" class="table-search" border="0">
<tr>
	<td class="title_left">
		<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt="">&nbsp;지식 정보제공/정보요청 수정</h1>
	</td>
	<td width="150px"></td>  
</tr>
</table>

<!--  등록  폼 영역-대상서비스/서비스TABLE/헤더 Tag 정보  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" 
summary="이 표는 지식 정보제공/정보요청  정보를 제공하며, 조직명, 지식유형명, 지식명, 지식내용, 첨부파일  정보로 구성되어 있습니다 .">
<caption>지식 정보제공/정보요청 수정</caption>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">조직명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력" title="필수입력" width="15" height="15"></th>
	<td width="80%">
		<select name="orgnztId" class="select" onChange="javascript:fn_egov_get_CodeId(document.requestOfferVO)">
			<option value="">선택</option>
			<c:forEach var="knoPersonal" items="${mapTeamList}" varStatus="status">							
				<option value='<c:out value="${knoPersonal.orgnztId}"/>' <c:if test="${knoPersonal.orgnztId == requestOfferVO.orgnztId}">selected="selected"</c:if> ><c:out value="${knoPersonal.orgnztNm}"/></option>
			</c:forEach>			  		   
		</select>	
	</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">지식유형명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력" title="필수입력" width="15" height="15"></th>
	<td width="80%">
		<select name="knoTypeCd" class="select">
			<option value="">선택</option>
			<c:forEach var="knoPersonal" items="${mapMaterialList}" varStatus="status">
				<option value='<c:out value="${knoPersonal.knoTypeCd}"/>' <c:if test="${knoPersonal.knoTypeCd == requestOfferVO.knoTypeCd}">selected="selected"</c:if> ><c:out value="${knoPersonal.knoTypeNm}"/></option>
			</c:forEach>			  		   
		</select>
	</td>
</tr>

<tr> 
	<th scope="row" width="20%" height="23" class="required_text">지식명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력" title="필수입력" width="15" height="15"></th>
	<td width="80%">
		<form:input path="knoNm" size="73" title="지식명" cssClass="txaIpt" maxlength="255"/>
		<div><form:errors path="knoNm" cssClass="error"/></div>
	</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">지식내용<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력" title="필수입력" width="15" height="15"></th>
	<td width="80%">
		<form:textarea path="knoCn" title="지식내용" rows="5" cols="20" cssClass="txaClass"/>
		<div><form:errors path="knoCn" cssClass="error"/></div>
	</td>
</tr>

<!-- 첨부파일 테이블 레이아웃 설정 Start -->
  <c:if test="${requestOfferVO.atchFileId ne ''}">
	<tr> 
		<th scope="row" height="23" class="required_text" >첨부파일목록</th>
		    <td>
				<!-- c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" -->
				<c:import url="/cmm/fms/selectFileInfsForUpdate.do" charEncoding="utf-8">
					<c:param name="param_atchFileId" value="${requestOfferVO.atchFileId}" />
				</c:import>								
		    </td>
	</tr>
  </c:if>	
<!-- 첨부파일 테이블 레이아웃 End -->

 
 
 <!-- 첨부화일 업로드를 위한 Start -->
   <tr>
	<th scope="row" width="20%" height="23" class="required_text"  >파일첨부</th>
	<td>

    	<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center" class="UseTable">
			<tr>
				<td><input name="file_1" id="egovComFileUploader" type="file" title="첨부파일명 입력"/></td>
			</tr>
			<tr>
				<td>
			    	<div id="egovComFileList"></div>
			    </td>
			</tr>
   	    </table>		      
	 </td>
  </tr>
 <!-- 첨부화일 업로드를 위한 end.. -->


</table>

  <c:if test="${requestOfferVO.atchFileId eq ''}">
  	<input type="hidden" name="fileListCnt" value="0" />
  	<input name="atchFileAt" type="hidden" value="N">
  </c:if> 

  <c:if test="${requestOfferVO.atchFileId ne ''}">
  	<input name="atchFileAt" type="hidden" value="Y">
  </c:if> 
<input type="hidden" name="posblAtchFileNumber" id="posblAtchFileNumber" value="3">
<input type="hidden" name="returnUrl" value="<c:url value='/dam/spe/req/updtRequestOffer.do'/>" >
<!-- 첨부파일 업로드 가능화일 설정 Start -->  
 

<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
<tr>
	<td height="3px"></td>
</tr>
</table>

<center>
<!--  목록/저장버튼  -->

<table border="0" cellspacing="0" cellpadding="0" align="center" summary="목록/저장버튼을 제공한다.">
<tr> 
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>"  width="8" height="20" alt="버튼이미지"></td>
  <td class="btnBackground" nowrap><input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_save_RequestOffer(); return false;" class="btnNew" style="height:20px;width:26px;" > 
  </td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>"  width="8" height="20" alt="버튼이미지"></td>      
  <td>&nbsp;</td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>"  width="8" height="20" alt="버튼이미지"></td>
  <td class="btnBackground" nowrap><a href="<c:url value='/dam/spe/req/listRequestOffer.do'/>"><spring:message code="button.list" /></a> 
  </td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>"  width="8" height="20" alt="버튼이미지"></td>      
</tr>
</table>
</center>
<form:hidden path="ansParents" />
<form:hidden path="ansDepth" />
<form:hidden path="ansSeq" />
<form:hidden path="ansNumber" />

<input name="knoId" type="hidden" value="${requestOfferVO.knoId}">
<input name="cmd" type="hidden" value="<c:out value='save'/>"/>
</form:form>

</DIV>

</body>
</html>