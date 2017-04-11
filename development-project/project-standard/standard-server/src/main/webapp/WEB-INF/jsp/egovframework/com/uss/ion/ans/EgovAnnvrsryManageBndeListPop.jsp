<%
/**
 * @Class Name : EgovAnnvrsryManageBndeListPop.java
 * @Description : EgovAnnvrsryManageBndeListPop jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.10.25    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.10.25
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
<title>기념일일괄등록 </title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<c:set var="ImgUrl" value="/images/egovframework/com/uss/ion/ans/"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialogCallee.js'/>" ></script>
<script type="text/javaScript" language="javascript">

	/* ********************************************************
	 * 등록 처리 함수 
	 ******************************************************** */
	function fncAnnvrsryManageBndeRegist(){
		var varFrom = document.getElementById("listForm");

		var usid           = varFrom.usid;
		var annvrsryDe     = varFrom.annvrsryDe;
		var cldrSe         = varFrom.cldrSe;
		var annvrsrySe     = varFrom.annvrsrySe;
		var annvrsryNm     = varFrom.annvrsryNm;
		var reptitSe       = varFrom.reptitSe;
   
		var checkAnnvrsryManage = "";
		var checkedCount     = 0;

		if(usid.length > 1){
			for(var i=0; i < usid.length; i++){
				checkAnnvrsryManage += ((checkedCount==0? "" : "$")+usid[i].value+","+annvrsryDe[i].value+","+cldrSe[i].value+","+annvrsrySe[i].value+","+annvrsryNm[i].value+","+reptitSe[i].value);
				checkedCount++;
			}
		} else {
			checkAnnvrsryManage = usid.value+","+annvrsryDe.value+","+cldrSe.value+","+annvrsrySe.value+","+annvrsryNm.value+","+reptitSe.value;
		}

		varFrom.checkedAnnvrsryManageForInsert.value=checkAnnvrsryManage;
		varFrom.action = "/uss/ion/ans/insertAnnvrsryManageBnde.do";

		if(confirm("저장 하시겠습니까?")){
			varFrom.submit();
		}
	}

	/* ********************************************************
	 * 엑셀체크 처리 함수 
	 ******************************************************** */
	function fncAnnvrsryManageBndeCheck(){
	   var varFrom = document.getElementById("listForm");
	   if(checkFile()){
		   varFrom.action ="/uss/ion/ans/EgovAnnvrsryManageListPop.do";
		   varFrom.cmd.value = "bnde";
		   varFrom.submit();
	   }
	}
	
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
	   var opener = parent.window.dialogArguments;
	   alert("기념일 엑셀 등록처리 완료하였습니다"); 
	   opener[0].fncSelectAnnvrsryManageList("1");
	   window.close(); </c:if>
	   <c:if test="${message ne 'true'}"> alert("${message}");  </c:if>
	</c:if>
		
</script>
<base target="_self"/>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:700px">
<table border="0">
  <tr>
    <td width="670">
<!-- ********** 여기서 부터 본문 내용 *************** -->
	
	<form name="listForm" id="listForm" action="<c:url value='/uss/ion/ans/EgovAnnvrsryManageListPop.do'/>" method="post" enctype="multipart/form-data">
	<input type="hidden" name="searchCondition">
	<input type="hidden" name="checkedAnnvrsryManageForInsert">
	<input type="hidden" name="searchKeyword">
	<input type="hidden" name="cmd">
	<table width="670" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="40%"class="title_left">
	      <h1><img src="/images/egovframework/com/cmm/icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;기념일일괄등록</h1></td>
	  <th>
	  </th>
	  <td width="10%"></td>
	  <td width="35%"></td>
	  <th width="10%">
	       <table border="0" cellspacing="0" cellpadding="0">
	        <tr> 
	          <td><span class="button"><a href="#LINK" onclick="fncAnnvrsryManageBndeRegist(); return false;"><spring:message code="button.create" /></a></span></td>     
	        </tr>
	       </table>
	  </th>  
	 </tr>
	</table>
	<table width="670" border="0" cellpadding="0" cellspacing="1" class="table-register">
	  <tr>
	    <th width="20%" height="23" class="required_text"  > 기념일 엑셀파일<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
	    <td width="80%" >&nbsp;<input type = "file" name="file" size="40" title="일괄파일"/>
	    <span class="button"><input type="submit" value="업로드" onclick="fncAnnvrsryManageBndeCheck(); return false;"></span>
	    </td>
	  </tr> 
	</table>

	<table width="670" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="3px"></td>
	</tr>
	</table>
	
	<table width="670" cellpadding="0" class="table-line" border="0"  summary="기념일 엑셀파일" >
       <caption>기념일 엑셀파일</caption>
	<thead>
	<tr>  
		<th class="title" width="25%" scope="col">기념일명</th>
		<th class="title" width="20%" scope="col">기념일구분</th>
		<th class="title" width="" scope="col">기념일자(양/음)</th>
		<th class="title" width="20%" scope="col">반복여부</th>
	</tr>
	</thead>     
	<tbody>
	
	<c:forEach items="${annvrsryManageList}" var="resultInfo" varStatus="status">
	<input type="hidden" name="usid"       id="usid"       value="${resultInfo.usid}">
	<input type="hidden" name="annvrsryDe" id="annvrsryDe" value="${resultInfo.annvrsryDe}">
	<input type="hidden" name="cldrSe"     id="cldrSe"     value="${resultInfo.cldrSe}">
	<input type="hidden" name="annvrsrySe" id="annvrsrySe" value="${resultInfo.annvrsrySe}">
	<input type="hidden" name="annvrsryNm" id="annvrsryNm" value="${resultInfo.annvrsryNm}">
	<input type="hidden" name="reptitSe"   id="reptitSe"   value="${resultInfo.reptitSe}">
	<tr>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.annvrsryTemp1}"/></td>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.annvrsryTemp3}"/></td>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.annvrsryDe}"/>
       		<c:if test="${!empty resultInfo.cldrSe }">(<c:if test='${resultInfo.cldrSe == "1"}'>양</c:if><c:if test='${resultInfo.cldrSe == "2"}'>음</c:if>)</c:if></td>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.reptitSe}"/></td>

	</tr>   
	</c:forEach>
	
	<c:if test="${fn:length(annvrsryManageList) == 0}">
		<tr> 
			<td class="lt_text3" colspan="5">
				<spring:message code="common.nodata.msg" />
			</td>
		</tr>   	          				 			   
	</c:if>
	    	
	    	
	</tbody>  
	</table>
	
	<table width="700" cellspacing="0" cellpadding="0" border="0">
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
