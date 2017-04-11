<%
/**
 * @Class Name : EgovMtgPlaceUpdt.java
 * @Description : EgovMtgPlaceUpdt.jsp
 * @Modification Information 
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.06.29    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.06.29
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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>회의실 수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />" ></script>
<validator:javascript formName="mtgPlaceManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">

<!--
function fncSelectMtgPlaceManageList() {
    var varFrom = document.getElementById("mtgPlaceManage");
    varFrom.action = "<c:url value='/uss/ion/mtg/selectMtgPlaceManageList.do'/>";
    varFrom.submit();       
}

function fncUpdtMtgPlace() {
     var varFrom = document.getElementById("mtgPlaceManage");
     var fxtrsForm = document.getElementById("fxtrsForm");
     var checkField = fxtrsForm.mtgPlaceCheck;
     var mtgPlaceId = fxtrsForm.mtgPlaceId;
     var fxtrsCd    = fxtrsForm.fxtrsCd;
     var quantity   = fxtrsForm.quantity;
     var checkMtgPlaces = "";
     var checkedCount = 0;

     if(checkField) {
     	if(checkField.length > 1) {
             for(var i=0; i < checkField.length; i++) {
                 if(checkField[i].checked) {
                 	checkMtgPlaces += ((checkedCount==0? "" : "$")+fxtrsCd[i].value+","+quantity[i].value);
                     checkedCount++;
                 }
             }
         } else {
             if(checkField.checked) {
             	checkMtgPlaces = fxtrsCd.value+","+quantity.value;
             }
         }
     }   
     varFrom.checkedMtgPlacesForInsert.value=checkMtgPlaces;
     //alert("checkMtgPlaces:"+checkMtgPlaces);
     varFrom.action = "<c:url value='/uss/ion/mtg/updtMtgPlace.do'/>";

     if(confirm("저장 하시겠습니까?")){
	     if(!validateMtgPlaceManage(varFrom)){           
	         return;
	     }else{
	         varFrom.submit();
	     } 
     }
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
<form:form commandName="mtgPlaceManage" name="mtgPlaceManage" method="post" action="${pageContext.request.contextPath}/uss/ion/mtg/updtMtgPlace.do"  enctype="multipart/form-data"> 
<input type="hidden" name="returnUrl"           value="/uss/ion/mtg/selectMtgPlaceManage.do" />
<input type="hidden" name="posblAtchFileNumber" id="posblAtchFileNumber" value="3" />  
<input type="hidden" name="checkedMtgPlacesForInsert">
<input type="hidden" name="cmd" value="update">
<input type="hidden" name="mtgPlaceId" value ="<c:out value='${mtgPlaceManage.mtgPlaceId}'/>">
<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${mtgPlaceManageVO.searchCondition}'/>" >
<input type="hidden" name="searchKeyword" value="<c:out value='${mtgPlaceManageVO.searchKeyword}'/>" >
<input type="hidden" name="pageIndex" value="<c:out value='${mtgPlaceManageVO.pageIndex}'/>" >

<!--  첨부파일 테이블 레이아웃 End. /cmm/fms/selectImageFileInfs.do -->
	<c:if test="${mtgPlaceManage.atchFileId eq null || mtgPlaceManage.atchFileId eq ''}">
	 	<input type="hidden" name="fileListCnt" value="0" />
	 	<input type="hidden" name="atchFileAt" value="N">
	</c:if> 
	
	<c:if test="${mtgPlaceManage.atchFileId ne null && mtgPlaceManage.atchFileId ne ''}">
	 	<input type="hidden" name="atchFileAt" value="Y"> 
	</c:if>
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;회의실 수정</h1></td>
  <td width="50%">&nbsp;</td>
  <th width="10%" align="right">

       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
	      <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncUpdtMtgPlace(); return false;"></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/mtg/selectMtgPlaceManageList.do'/>?searchCondition=1" onclick="fncSelectMtgPlaceManageList(); return false;"><spring:message code="button.list" /></a></span></td>     
        </tr>
       </table>
  </th>  
 </tr>
</table>


<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="회의실  수정" >
<caption>회의실 수정</caption>
  <tr> 
    <th height="23" class="required_text" scope="row"><label for="mtgPlaceNm">회의실 명<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td colspan ="3">
       <form:input  path="mtgPlaceNm" title="회의실명" size="80"  />
    </td>
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text" scope="row"><label for="aceptncPosblNmpr">수용가능인원</label><img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td width="20%" nowrap>
        <select name="aceptncPosblNmpr" title="수용가능인원">
	       	<option value="5"   <c:if test="${mtgPlaceManage.aceptncPosblNmpr == '5'}" > selected </c:if>>5명</option>
	       	<option value="10"  <c:if test="${mtgPlaceManage.aceptncPosblNmpr == '10'}"> selected </c:if>>10명</option>
	       	<option value="15"  <c:if test="${mtgPlaceManage.aceptncPosblNmpr == '15'}"> selected </c:if>>15명</option>
	       	<option value="20"  <c:if test="${mtgPlaceManage.aceptncPosblNmpr == '20'}"> selected </c:if>>20명</option>
	       	<option value="25"  <c:if test="${mtgPlaceManage.aceptncPosblNmpr == '25'}"> selected </c:if>>25명</option>
	       	<option value="30"  <c:if test="${mtgPlaceManage.aceptncPosblNmpr == '30'}"> selected </c:if>>30명</option>
	       	<option value="50"  <c:if test="${mtgPlaceManage.aceptncPosblNmpr == '50'}"> selected </c:if>>50명</option>
	       	<option value="70"  <c:if test="${mtgPlaceManage.aceptncPosblNmpr == '70'}"> selected </c:if>>70명</option>
	       	<option value="100" <c:if test="${mtgPlaceManage.aceptncPosblNmpr == '100'}"> selected </c:if>>100명</option>
      	</select>  
    </td>
    <th width="20%" height="23" class="required_text" scope="row"><label for="opnBeginTm">개방시간</label><img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td >
        <select name="opnBeginTm" title="개방시작시간">
	       	<option value="08:00" <c:if test="${mtgPlaceManage.opnBeginTm == '08:00'}"> selected </c:if>>08:00</option>
	       	<option value="09:00" <c:if test="${mtgPlaceManage.opnBeginTm == '09:00'}"> selected </c:if>>09:00</option>
	       	<option value="10:00" <c:if test="${mtgPlaceManage.opnBeginTm == '10:00'}"> selected </c:if>>10:00</option>
	       	<option value="11:00" <c:if test="${mtgPlaceManage.opnBeginTm == '11:00'}"> selected </c:if>>11:00</option>
	       	<option value="12:00" <c:if test="${mtgPlaceManage.opnBeginTm == '12:00'}"> selected </c:if>>12:00</option>
	       	<option value="13:00" <c:if test="${mtgPlaceManage.opnBeginTm == '13:00'}"> selected </c:if>>13:00</option>
	       	<option value="14:00" <c:if test="${mtgPlaceManage.opnBeginTm == '14:00'}"> selected </c:if>>14:00</option>
	       	<option value="15:00" <c:if test="${mtgPlaceManage.opnBeginTm == '15:00'}"> selected </c:if>>15:00</option>
	       	<option value="16:00" <c:if test="${mtgPlaceManage.opnBeginTm == '16:00'}"> selected </c:if>>16:00</option>
	       	<option value="17:00" <c:if test="${mtgPlaceManage.opnBeginTm == '17:00'}"> selected </c:if>>17:00</option>
	       	<option value="18:00" <c:if test="${mtgPlaceManage.opnBeginTm == '18:00'}"> selected </c:if>>18:00</option>
	       	<option value="19:00" <c:if test="${mtgPlaceManage.opnBeginTm == '19:00'}"> selected </c:if>>19:00</option>
	       	<option value="20:00" <c:if test="${mtgPlaceManage.opnBeginTm == '20:00'}"> selected </c:if>>20:00</option>
	       	<option value="21:00" <c:if test="${mtgPlaceManage.opnBeginTm == '21:00'}"> selected </c:if>>21:00</option>
      	</select>  
~        <select name="opnEndTm" title="개방종료시간">
	       	<option value="08:00" <c:if test="${mtgPlaceManage.opnEndTm == '08:00'}"> selected </c:if>>08:00</option>
	       	<option value="09:00" <c:if test="${mtgPlaceManage.opnEndTm == '09:00'}"> selected </c:if>>09:00</option>
	       	<option value="10:00" <c:if test="${mtgPlaceManage.opnEndTm == '10:00'}"> selected </c:if>>10:00</option>
	       	<option value="11:00" <c:if test="${mtgPlaceManage.opnEndTm == '11:00'}"> selected </c:if>>11:00</option>
	       	<option value="12:00" <c:if test="${mtgPlaceManage.opnEndTm == '12:00'}"> selected </c:if>>12:00</option>
	       	<option value="13:00" <c:if test="${mtgPlaceManage.opnEndTm == '13:00'}"> selected </c:if>>13:00</option>
	       	<option value="14:00" <c:if test="${mtgPlaceManage.opnEndTm == '14:00'}"> selected </c:if>>14:00</option>
	       	<option value="15:00" <c:if test="${mtgPlaceManage.opnEndTm == '15:00'}"> selected </c:if>>15:00</option>
	       	<option value="16:00" <c:if test="${mtgPlaceManage.opnEndTm == '16:00'}"> selected </c:if>>16:00</option>
	       	<option value="17:00" <c:if test="${mtgPlaceManage.opnEndTm == '17:00'}"> selected </c:if>>17:00</option>
	       	<option value="18:00" <c:if test="${mtgPlaceManage.opnEndTm == '18:00'}"> selected </c:if>>18:00</option>
	       	<option value="19:00" <c:if test="${mtgPlaceManage.opnEndTm == '19:00'}"> selected </c:if>>19:00</option>
	       	<option value="20:00" <c:if test="${mtgPlaceManage.opnEndTm == '20:00'}"> selected </c:if>>20:00</option>
	       	<option value="21:00" <c:if test="${mtgPlaceManage.opnEndTm == '21:00'}"> selected </c:if>>21:00</option>
      	</select> 
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" scope="row"><label for="lcSe">위치</label><img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td colspan ="3" >
	        <form:select path="lcSe" title="위치">
		      <form:options items="${lcSeCode}" itemValue="code" itemLabel="codeNm"/>
	        </form:select>
	        <form:input  path="lcDetail" title="위치상세"  size="70" />
     </td>
  </tr>
<!--  첨부파일 테이블 레이아웃 설정 Start.. -->
	<c:if test="${mtgPlaceManage.atchFileId ne null && mtgPlaceManage.atchFileId ne ''}">
	<tr> 
		<th height="23" class="required_text" scope="row"><label for="atchFileId">이미지 파일목록</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
		    <td colspan="3">
				<!-- c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" -->
				<c:import url="/cmm/fms/selectFileInfsForUpdate.do" charEncoding="utf-8">
					<c:param name="param_atchFileId" value="${mtgPlaceManage.atchFileId}" />
				</c:import>								
		    </td>
	</tr>
    </c:if>	

  <tr>
	<th width="20%" height="23" class="required_text"  scope="row"><label for="file_1">이미지 파일첨부</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
	<td colspan="3">

    	<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center" class="UseTable">
			<tr>
				<td><input name="file_1" id="egovComFileUploader" type="file" title="첨부파일" /></td>
			</tr>
			<tr>
				<td>
			    	<div id="egovComFileList"></div>
			    </td>
			</tr>
   	    </table>		      
	 </td>
  </tr>
<!--  첨부파일 테이블 레이아웃 End. -->
</table>
</form:form>
<table border="0" cellspacing="0" cellpadding="0">
	<tr> 
		<td>
		※ 비품체크박스와  수량을 기입하셔야 비품 해당 정보가 저장됩니다.
		</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="회의실  비품정보 수정" >
<caption>회의실  비품정보 수정</caption>
  <tr> 
    <th width="20%" height="150" class="required_text" scope="row"><label for="fxtrsForm">비품정보</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
    <td width="80%"  align="center">
    <form:form commandName="fxtrsForm" name="fxtrsForm" method="post" action="#LINK">  
    <div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div> 
		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
              <c:forEach var="mtgPlaceFxtrs" items="${mtgPlaceFxtrsList}" varStatus="status">
                 <c:if test="${(status.count-1)%2 == 0}"> <tr> </c:if>
			     <td>
				   <input type="checkbox" name="mtgPlaceCheck" style="border:0px;" <c:if test="${(mtgPlaceFxtrs.quantity) > 0}"> checked </c:if> title="체크박스">
				   <input type="hidden"   name="mtgPlaceId" value="<c:out value='${mtgPlaceFxtrs.mtgPlaceId}'/>">
				   <input type="hidden"   name="fxtrsCd"    value="<c:out value='${mtgPlaceFxtrs.fxtrsCd}'/>">
				   <input name="fxtrsNm"  type="text" size="15" value="<c:out value="${mtgPlaceFxtrs.fxtrsNm}"/>" maxlength="100" style="width:100;" title="비품명">
	               <input name="quantity" type="text" size="4" value="<c:out value="${mtgPlaceFxtrs.quantity}"/>" maxlength="5" style="width:40;" title="비품갯수">개
			     </td> 
                 <c:if test="${(status.count-1)%2 == 1}"> </tr> </c:if>
			  </c:forEach>
		</table>
    </form:form>
    </td>
  </tr>
</table>

<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>            
</DIV>
<!--  첨부파일 업로드 가능화일 설정 Start.. -->  
<script type="text/javascript">
   var maxFileNum = document.getElementById('posblAtchFileNumber').value;
   if(maxFileNum==null || maxFileNum==""){
     maxFileNum = 3;
   }
   var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
   multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
</script> 
<!--  첨부파일 업로드 가능화일 설정 End. -->
</body>
</html>