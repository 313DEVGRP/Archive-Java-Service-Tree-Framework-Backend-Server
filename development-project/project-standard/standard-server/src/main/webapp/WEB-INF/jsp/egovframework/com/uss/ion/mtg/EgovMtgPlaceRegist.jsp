<%
/**
 * @Class Name : EgovMtgPlaceRegist.java
 * @Description : EgovMtgPlaceRegist.jsp
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
<title>회의실 등록</title>
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

	function fncMtgPlaceClear() {
		var varFrom = document.getElementById("mtgPlaceManage");
		var fxtrsForm = document.getElementById("fxtrsForm");
		var checkField = fxtrsForm.mtgPlaceCheck;
		var mtgPlaceId = fxtrsForm.mtgPlaceId;
		var fxtrsCd    = fxtrsForm.fxtrsCd;
		var quantity   = fxtrsForm.quantity;
		
		varFrom.mtgPlaceNm.value       = "";
		varFrom.aceptncPosblNmpr.value = 5;
		varFrom.opnBeginTm.value       = "08:00";
		varFrom.opnEndTm.value         = "21:00";
		varFrom.lcDetail.value         = "";
		varFrom.lcSe[0].selected       = true;
	
		if(checkField){
			  if(checkField.length > 1){
		        for(var i=0; i < checkField.length; i++){
		            	checkField[i].checked = false;
		            	quantity[i].value = 0;
		        }
		    }else{
		        	checkField.checked = false;
		        	quantity.value = 0;
		    }
		} 
	}

	function fncSelectMtgPlaceManageList() {
	    var varFrom = document.getElementById("mtgPlaceManage");
	    varFrom.action = "<c:url value='/uss/ion/mtg/selectMtgPlaceManageList.do'/>";
	    varFrom.submit();       
	}


  /* ********************************************************
   * 멀티입력 처리 함수
   ******************************************************** */
  	function fncInsertMtgPlace(){
	  var varFrom = document.getElementById("mtgPlaceManage");
	  var fxtrsForm = document.getElementById("fxtrsForm");
      var checkField = fxtrsForm.mtgPlaceCheck;
      var mtgPlaceId = fxtrsForm.mtgPlaceId;
      var fxtrsCd    = fxtrsForm.fxtrsCd;
      var quantity   = fxtrsForm.quantity;
      var checkMtgPlaces = "";
      var checkedCount = 0;

	  if(varFrom.opnBeginTm.value == ""){
		  alert("개방 오픈 시간을 선택하세요");
		  return;
	  }
	  if(varFrom.opnEndTm.value == ""){
		  alert("개방 종료 시간을 선택하세요");
		  return;
	  }
      if(varFrom.opnBeginTm.value.substring(0,2) >= varFrom.opnEndTm.value.substring(0,2)){
           alert("개방오픈시간이 개방종료시간보다 늦거나 같습니다. 개방시간을 확인하세요.");
           return;
	  }

      if(varFrom.opnBeginTm.value.substring(0,2) >= varFrom.opnEndTm.value.substring(0,2)){
          alert("개방오픈시간이 개방종료시간보다 늦거나 같습니다. 개방시간을 확인하세요.");
          return;
	  }
      
      if(checkField){
      	if(checkField.length > 1){
              for(var i=0; i < checkField.length; i++){
                  if(checkField[i].checked) {
                  	checkMtgPlaces += ((checkedCount==0? "" : "$")+fxtrsCd[i].value+","+quantity[i].value);
                      checkedCount++;
                  }
              }
          }else{
              if(checkField.checked){
              	checkMtgPlaces = fxtrsCd.value+","+quantity.value;
              }
          }
      }   
      varFrom.checkedMtgPlacesForInsert.value=checkMtgPlaces;
      varFrom.action = "<c:url value='/uss/ion/mtg/insertMtgPlace.do'/>";

       if(confirm("저장 하시겠습니까?")){
	      if(!validateMtgPlaceManage(varFrom)){           
	         return;
	      }else{
	         varFrom.submit();
	      } 
	   }
	}	
  	
</script>
</head> 
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">

<!-- ********** 여기서 부터 본문 내용 *************** -->
<form:form commandName="mtgPlaceManage" name="mtgPlaceManage" method="post" action="${pageContext.request.contextPath}/uss/ion/mtg/insertMtgPlace.do" enctype="multipart/form-data"> 
<input type="hidden" name="posblAtchFileNumber" id="posblAtchFileNumber" value="3" />
<input type="hidden" name="checkedMtgPlacesForInsert">
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;회의실 등록</h1></td>
  <td width="60%">&nbsp;</td>
  <th width="10%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td align="right"><span class="button"><a href="#LINK" onclick="fncMtgPlaceClear(); return false;">초기화</a></span></td>
          <td>&nbsp;&nbsp;&nbsp;</td>
          <td align="right"><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncInsertMtgPlace(); return false;"></span></td>     
          <td>&nbsp;&nbsp;&nbsp;</td>
          <td align="right"><span class="button"><a href="<c:url value='/uss/ion/mtg/selectMtgPlaceManageList.do'/>?searchCondition=1" onclick="fncSelectMtgPlaceManageList(); return false;"><spring:message code="button.list" /></a></span></td>     
        </tr>
       </table>
  </th>  
 </tr>
</table>


<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="회의실  등록" >
<caption>회의실 등록</caption>
  <tr> 
    <th height="23" height="23" class="required_text" scope="row"><label for="mtgPlaceNm">회의실 명</label><img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td colspan ="3">
       <form:input  path="mtgPlaceNm" title="회의실명" size="80" />
    </td>
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text"  scope="row"><label for="aceptncPosblNmpr">수용가능인원</label><img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td width="20%" >
        <select name="aceptncPosblNmpr" title="수용가능인원">
            <option value="0">선택하세요</option>
	       	<option value="5" selected>5명</option>
	       	<option value="10">10명</option>
	       	<option value="15">15명</option>
	       	<option value="20">20명</option>
	       	<option value="25">25명</option>
	       	<option value="30">30명</option>
	       	<option value="50">50명</option>
	       	<option value="70">70명</option>
	       	<option value="100">100명</option>
      	</select>  
    </td>
    <th width="20%" height="23" class="required_text"  scope="row"><label for="opnBeginTm">개방시간</label><img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td > 
        <select name="opnBeginTm" title="개방시작시간">
            <option value="">선택하세요</option>
	       	<option value="08:00" selected>08:00</option>
	       	<option value="09:00">09:00</option>
	       	<option value="10:00">10:00</option>
	       	<option value="11:00">11:00</option>
	       	<option value="12:00">12:00</option>
	       	<option value="13:00">13:00</option>
	       	<option value="14:00">14:00</option>
	       	<option value="15:00">15:00</option>
	       	<option value="16:00">16:00</option>
	       	<option value="17:00">17:00</option>
	       	<option value="18:00">18:00</option>
	       	<option value="19:00">19:00</option>
	       	<option value="20:00">20:00</option>
	       	<option value="21:00">21:00</option>
      	</select>  
~        <select name="opnEndTm" title="개방종료시간">
            <option value="">선택하세요</option>
	       	<option value="08:00">08:00</option>
	       	<option value="09:00">09:00</option>
	       	<option value="10:00">10:00</option>
	       	<option value="11:00">11:00</option>
	       	<option value="12:00">12:00</option>
	       	<option value="13:00">13:00</option>
	       	<option value="14:00">14:00</option>
	       	<option value="15:00">15:00</option>
	       	<option value="16:00">16:00</option>
	       	<option value="17:00">17:00</option>
	       	<option value="18:00">18:00</option>
	       	<option value="19:00">19:00</option>
	       	<option value="20:00">20:00</option>
	       	<option value="21:00" selected>21:00</option>
      	</select> 
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text"  scope="row"><label for="lcSe">위치</label><img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td colspan ="3" >
	        <form:select path="lcSe" title="위치선택">
		      <form:options items="${lcSeCode}" itemValue="code" itemLabel="codeNm"/>
	      </form:select>
          <form:input  path="lcDetail" title="위치상세" size="70"/>
     </td>
  </tr>
  <tr>
	<th width="20%" height="23" class="required_text"  scope="row"><label for="txtComFileUploader">이미지 파일첨부</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
	<td colspan="3" >
    	<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center" class="UseTable">
			<tr>
				<td><input name="txtComFileUploader" id="egovComFileUploader" type="file"  title="첨부파일"/></td>
			</tr>
			<tr>
				<td>
			    	<div id="egovComFileList"></div>
			    </td>
			</tr>
   	    </table>		      
	 </td>
  </tr>
</table>
</form:form>

<table border="0" cellspacing="0" cellpadding="0">
	<tr> 
		<td>
		※ 비품체크박스와  수량을 기입하셔야 비품 해당 정보가 저장됩니다.
		</td>
	</tr>
</table>


<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="회의실  비품정보 등록" >
<caption>회의실  비품정보 등록</caption>
  <tr> 
    <th width="20%" height="150" class="required_text"  scope="row"><label for="fxtrsForm">비품정보</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
    <td width="80%" align="center">
    <form:form commandName="fxtrsForm" name="fxtrsForm" method="post" action="#LINK">  
	<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
              <c:forEach var="mtgPlaceFxtrs" items="${mtgPlaceFxtrsList}" varStatus="status">
                 <c:if test="${(status.count-1)%2 == 0}"> <tr> </c:if>
			     <td>
				   <input type="checkbox" name="mtgPlaceCheck" style="border:0px;" <c:if test="${(mtgPlaceFxtrs.quantity) > 0}"> checked </c:if>  title="체크박스">
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
<script type="text/javascript">
   var maxFileNum = document.getElementById('posblAtchFileNumber').value;
   if(maxFileNum==null || maxFileNum==""){
     maxFileNum = 3;
   }
   var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
   multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
</script> 
</body>
</html>
