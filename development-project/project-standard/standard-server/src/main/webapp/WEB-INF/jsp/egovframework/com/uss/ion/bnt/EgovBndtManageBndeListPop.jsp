<%
/**
 * @Class Name : EgovBndtManageBndeListPop.java
 * @Description : EgovBndtManageBndeListPop jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.07.20    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.07.20
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>당직일괄등록 </title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<c:set var="ImgUrl" value="/images/egovframework/com/uss/ion/bnt/"/>
<script type="text/javaScript" language="javascript">
	
	/* ********************************************************
	 * 등록 처리 함수 
	 ******************************************************** */
	function fncBndtManageBndeRegist(){
		var varFrom = document.getElementById("listForm");
		//var checkField = varFrom.bndtCheck;
		var bndtId = varFrom.bndtId;
		var bndtDe = varFrom.bndtDe;
		var searchKeyword  = varFrom.searchKeyword;
		var checkBndtManage = "";
		var checkedCount     = 0;
		
		if(bndtId.length > 1){
			searchKeyword.value = bndtDe[0].value.substring(0,6);
			for(var i=0; i < bndtId.length; i++){
				checkBndtManage += ((checkedCount==0? "" : "$")+bndtDe[i].value+","+bndtId[i].value);
				checkedCount++;
			}
		} else {
			checkMtgPlaces = bndtDe.value+","+bndtDe.value;
		}
	
		varFrom.checkedBndtManageForInsert.value=checkBndtManage;
		varFrom.action = "/uss/ion/bnt/insertBndtManageBnde.do";
	
		if(confirm("저장 하시겠습니까?")){
			varFrom.submit();
		}
	}

	/* ********************************************************
	 * 엑셀체크 처리 함수 
	 ******************************************************** */
	function fncBndtManageBndeCheck(){
	   if(checkFile()){
		   document.listForm.action ="/uss/ion/bnt/EgovBndtManageListPop.do";
		   document.listForm.cmd.value = "bnde";
	       document.listForm.submit();
	   }
	}

	/* ********************************************************
	* 아이디  팝업창열기
	* fn_egov_schdulCharger_LeaderSchdule
	* param 타이틀, ID 폼명, 사원번호 폼명, 사원명 폼명, 부서명 폼명
	* ******************************************************** */
	/* 	function fn_egov_schdulCharger_LeaderSchdule_Bndt(number){
		var arrParam = new Array(6);
		arrParam[0] = window;
		arrParam[1] = '당직 대상자';
		arrParam[2] = 'bndtId'+number;
		arrParam[3] = '';
		arrParam[4] = 'bndtTemp1'+number;
		arrParam[5] = 'bndtTemp2'+number;
	 	window.showModalDialog("/uss/ion/ism/selectSanctnerListPopup.do", arrParam,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
	}
	
	function showModalDialogCallback(retVal) {
	} */
	
	/* ********************************************************
	* 당직엑셀일괄등록시 등록파일 체크 함수
	******************************************************** */
	function checkFile(){ 
		if(document.listForm.file.value==""){
		   alert("업로드 할 파일을 지정해 주세요");
		   return false;
		}
	
		var  str_dotlocation,str_ext,str_low;
		str_value  = document.listForm.file.value;
		str_low   = str_value.toLowerCase(str_value);
		str_dotlocation = str_low.lastIndexOf(".");
		str_ext   = str_low.substring(str_dotlocation+1);
		
		switch (str_ext) {
		  case "xls" :
		  case "xlsx" :
			 return true; 
		     break;
		  default:
		     alert("파일 형식이 맞지 않습니다.\n xls,XLS,xlsx,XLSX 만\n 업로드가 가능합니다!");
		     return false;
		}
	}


	<c:if test="${!empty message}">
	   <c:if test="${message eq 'true'}"> 
//	   var opener = parent.window.dialogArguments;
	   alert("당직엑셀 등록처리 완료하였습니다"); 
//	   opener[0].fncSelectAnnvrsryManageList();
	   opener.fncSelectBndtManageList();
	   window.close();</c:if>
	   <c:if test="${message ne 'true'}"> alert("${message}");  </c:if>
	</c:if>
</script>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:700px">
<table border="0">
  <tr>
    <td width="670">
<!-- ********** 여기서 부터 본문 내용 *************** -->
	
	<form name="listForm" id="listForm" action="<c:url value='/uss/ion/bnt/EgovBndtManageListPop.do'/>" method="post" enctype="multipart/form-data">
	<input type="hidden" name="searchCondition">
	<input type="hidden" name="checkedBndtManageForInsert">
	<input type="hidden" name="searchKeyword">
	<input type="hidden" name="cmd">
	<table width="670" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="40%"class="title_left">
	      <h1><img src="/images/egovframework/com/cmm/icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;당직일괄등록</h1></td>
	  <th>
	  </th>
	  <td width="10%"></td>
	  <td width="35%"></td>
	  <th width="10%">
	       <table border="0" cellspacing="0" cellpadding="0">
	        <tr> 
	          <td><span class="button"><a href="#LINK" onclick="fncBndtManageBndeRegist(); return false;"><spring:message code="button.create" /></a></span></td>     
	        </tr>
	       </table>
	  </th>  
	 </tr>
	</table>
	<table width="670" border="0" cellpadding="0" cellspacing="1" class="table-register">
	  <tr>
	    <th width="20%" height="23" class="required_text"  > 당직자 엑셀파일</th>          
	    <td width="80%" >&nbsp;<input type = "file" name="file" size="40" title="일괄파일"/>
	    <span class="button"><input type="submit" value="업로드" onclick="fncBndtManageBndeCheck(); return false;"></span>
	    </td>
	  </tr> 
	</table>

	<table width="670" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="3px"></td>
	</tr>
	</table>
	
	<table width="670" cellpadding="0" class="table-line" border="0"  summary="당직자 엑셀파일" >
       <caption>당직자 엑셀파일</caption>
	<thead>
	<tr>  
		<th class="title" width="30%" scope="col">당직일자</th>
		<th class="title" width="30%" scope="col">당직자명</th>
		<th class="title" width="" scope="col">소속명</th>
	</tr>
	</thead>     
	<tbody>
	<c:forEach items="${bndtManageList}" var="resultInfo" varStatus="status">
	<input type="hidden" name="bndtDe" id="bndtDe" value="${resultInfo.bndtDe}">
	<input type="hidden" name="bndtId" id="bndtId" value="${resultInfo.bndtId}">
	<tr>
		<td class="lt_text3" nowrap>
			<font <c:if test="${(resultInfo.dateWeek ) == 1}"> color="red" </c:if> <c:if test="${(resultInfo.dateWeek ) == 7}"> color="blue"</c:if> size='2'>
				<c:out value="${resultInfo.tempBndtWeek}"/>
			</font>
		</td>
		<td class="lt_text3" nowrap>${resultInfo.tempBndtNm}</td>
		<td class="lt_text3" nowrap>${resultInfo.tempOrgnztNm}</td>
	</tr>   
	</c:forEach>
	
	<c:if test="${fn:length(bndtManageList) == 0}">
		<tr> 
			<td class="lt_text3" colspan="5">
				<spring:message code="common.nodata.msg" />
			</td>
		</tr>   	          				 			   
	</c:if>
	    	
	    	
	</tbody>  
	</table>
	
	<table width="670" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="3px"></td>
	</tr>
	</table>
	</form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>
</div>
</body>
</html>
