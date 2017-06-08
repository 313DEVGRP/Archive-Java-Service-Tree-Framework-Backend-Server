<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
  /**
  * @Class Name : EgovSmsEhCacheNewRegist.jsp
  * @Description : EH 캐시 신규 설정  등록 화면
  * @Modification Information
  * 
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2010.05.25            최초 생성
  *
  * author 운영환경1  개발팀
  * since 2010.05.25
  *  
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>EhCache Config Regist</title>


</head>	
<body>
<script type="text/javaScript" language="javascript" defer="defer">
//<!--

function fn_egov_goList(){
	$('#contents').load("<c:url value='/ole/sms/selectEhCacheList.sms'/>");	
}

function fn_egov_save(){

	if(checkValue()){
		if(confirm("신규 등록의 경우 기존 설정파일이 삭제되고\n현재 프로퍼티 설정으로 신규 생성됩니다.\n저장하시겠습니까?")){
		    var options = { 
				   	   success     : responseCtl,
				       url         : "<c:url value='/ole/sms/saveNewEhCacheServices.sms'/>",
				       type        : "post", /* get, post */
				       dataType    : "html" /* xml, html, script, json */
				}; 
			jQuery("#ehCacheVO").ajaxSubmit( options );
		}
	}
}


function fn_egov_init(){

	var arrObj = $("#ehCacheVO input");
    for ( var ii = 0 ; ii < arrObj.length ; ++ii ) {
        arrObj[ii].value = "";
    }
    
    arrObj = $("#ehCacheVO select");
    for ( var ii = 0 ; ii < arrObj.length ; ++ii ) {
        arrObj[ii].options[0].selected = true;
    }
	
}


function fn_egov_preview(){

	if(checkValue()){
		frm = document.ehCacheVO;
		
	    window.open("","Preview","resizable=1,width=800,height=500,scrollbars=auto");
	    frm.method="post";
	    frm.action="<c:url value='/ole/sms/selectNewEhCachePreview.sms'/>";
	    frm.target="Preview";
	    frm.submit();
	}
	
}

function responseCtl(html, status){
	 if(status ='success'){
			 alert('저장 되었습니다.');		
	 }	 
	 $('#contents').html(html);

}

function checkValue(){
	
	var ehCacheNm = trim(document.ehCacheVO.ehCacheNm.value);
	var disk_store = trim(document.ehCacheVO.diskStorePath.value);
	var a = trim(document.ehCacheVO.diskExpiryThreadIntervalSeconds.value);
	var b = trim(document.ehCacheVO.diskSpoolBufferSizeMB.value);
	var c = trim(document.ehCacheVO.diskPersistent.value);
	var d = trim(document.ehCacheVO.diskAccessStripes.value);
	var e = trim(document.ehCacheVO.maxElementsInMemory.value);
	var f = trim(document.ehCacheVO.memoryStoreEvictionPolicy.value);
	var g = trim(document.ehCacheVO.overflowToDisk.value);
	var h = trim(document.ehCacheVO.timeToIdleSeconds.value);
	var i = trim(document.ehCacheVO.timeToLiveSeconds.value);
	var j = trim(document.ehCacheVO.maxElementsOnDisk.value);
	var k = trim(document.ehCacheVO.statistics.value);
	var l = trim(document.ehCacheVO.copyOnRead.value);
	var m = trim(document.ehCacheVO.copyOnWrite.value);
	var n = trim(document.ehCacheVO.logging.value);
	
	if(ehCacheNm == ''){
		alert('Ehcache 명은 필수 입력사항 입니다.');
		return false;
	}

	if(disk_store == ''){
		alert('diskStorePath 명은 필수 입력사항 입니다.');
		return false;
	}

	if(a == '' && b == '' && c == '' && d == '' && e == '' && f == '' 
		&& g == '' && h == '' && i == '' && j == '' && k == '' && l == '' && m == '' && n == ''){
		alert('Ehcahe 어트리뷰트는 적어도 하나는 입력이 필요합니다.');
		return false;
	}
	
	return true;
}

//-->
</script>

<div id="wrap" >
<div id="content">
<form:form commandName="ehCacheVO" id="ehCacheVO" name="ehCacheVO">
	<div id="h2_topnav"><h2><strong>EhCache 설정관리 등록</strong></h2></div>
		  	<div id="datail_table">
				<table id="tbl" summary="Ehcache name,attribute" class="">
				<caption>EhCache Config New Regist</caption>
				  <tr>
						<th scope="row">Ehcache name</th>
						<td colspan="2">
							<label for="ehCacheNm">
							<form:input path="ehCacheNm"   size="70" cssClass="inputlarge" /></label>
						</td>			
					</tr>
					<tr>
						<th scope="row">diskStore Path</th>
						<td colspan="2">
							<label for="diskStorePath">
							<form:input path="diskStorePath"   size="70" cssClass="inputlarge" /></label>
						</td>			
					</tr>
					<tr>
					    <th scope="row" width="30%" rowspan="15">attribute</th>
						<th scope="row" width="35%"  align="center">diskExpiryThreadIntervalSeconds</th>
						<td>
							<label for="diskExpiryThreadIntervalSeconds">
							<form:input path="diskExpiryThreadIntervalSeconds"   size="50" cssClass="inputlarge" /></label>
						</td>			
					</tr>
					<tr>
						<th scope="row" width="35%" align="center">diskSpoolBufferSizeMB</th>
						<td>
							<label for="diskSpoolBufferSizeMB">
							<form:input path="diskSpoolBufferSizeMB"   size="50" cssClass="inputlarge" /></label>
						</td>			
					</tr>
					<tr>
						<th scope="row" width="35%" align="center">diskPersistent</th>
						<td>
							<label for="diskPersistent">
							<form:input path="diskPersistent"   size="50" cssClass="inputlarge" /></label>
						</td>			
					</tr>
					<tr>
						<th scope="row" width="35%" align="center">diskAccessStripes</th>
						<td>
							<label for="diskAccessStripes">
							<form:input path="diskAccessStripes"   size="50" cssClass="inputlarge" /></label>
						</td>			
					</tr>
					<tr>
						<th scope="row" width="35%" align="center">eternal</th>
						<td>
							<label for="eternal">
							<form:input path="eternal"   size="50" cssClass="inputlarge" /></label>
						</td>			
					</tr>
					<tr>
						<th scope="row" width="35%" align="center">maxElementsInMemory</th>
						<td>
							<label for="maxElementsInMemory">
							<form:input path="maxElementsInMemory"   size="50" cssClass="inputlarge" /></label>
						</td>			
					</tr>
					<tr>
						<th scope="row" width="35%" align="center">memoryStoreEvictionPolicy</th>
						<td class="tbtd_content" >
							<label for="memoryStoreEvictionPolicy">
							<form:input path="memoryStoreEvictionPolicy"   size="50" cssClass="inputlarge" /></label>
						</td>			
					</tr>
					<tr>
						<th scope="row" width="35%" align="center">overflowToDisk</th>
						<td>
							<label for="overflowToDisk">
							<form:input path="overflowToDisk"   size="50" cssClass="inputlarge" /></label>
						</td>			
					</tr>
					<tr>
						<th scope="row" width="35%" align="center">timeToIdleSeconds</th>
						<td>
							<label for="timeToIdleSeconds">
							<form:input path="timeToIdleSeconds"   size="50" cssClass="inputlarge" /></label>
						</td>			
					</tr>
					<tr>
						<th scope="row" width="35%" align="center">timeToLiveSeconds</th>
						<td>
							<label for="timeToLiveSeconds">
							<form:input path="timeToLiveSeconds"   size="50" cssClass="inputlarge" /></label>
						</td>			
					</tr>
					<tr>
						<th scope="row" width="35%" align="center">maxElementsOnDisk</th>
						<td>
							<label for="maxElementsOnDisk">
							<form:input path="maxElementsOnDisk"   size="50" cssClass="inputlarge" /></label>
						</td>			
					</tr>
					<tr>
						<th scope="row" width="35%" align="center">statistics</th>
						<td>
							<label for="statistics">
							<form:input path="statistics"   size="50" cssClass="inputlarge" /></label>
						</td>			
					</tr>
					<tr>
						<th scope="row" width="35%" align="center">copyOnRead</th>
						<td>
							<label for="copyOnRead">
							<form:input path="copyOnRead"   size="50" cssClass="inputlarge" /></label>
						</td>			
					</tr>
					<tr>
						<th scope="row" width="35%" align="center">copyOnWrite</th>
						<td>
							<label for="copyOnWrite">
							<form:input path="copyOnWrite"   size="50" cssClass="inputlarge" /></label>
						</td>			
					</tr>
					<tr>
						<th scope="row" width="35%" align="center">logging</th>
						<td>
							<label for="logging">
							<form:input path="logging"   size="50" cssClass="inputlarge" /></label>
						</td>			
					</tr>
                </table>                	
			</div>
			<div id="btn_style01">
				<a title="미리 보기(새창)" href="/#" onclick="javascript:fn_egov_preview();return false;"><span>미리 보기</span></a>
				<a title="저장" href="/#" onclick="javascript:fn_egov_save();return false;"><span>저장</span></a>
				<!-- a href="/#" onclick="javascript:fn_egov_init();return false;"><span>초기화</span></a -->
				<a title="목록" href="/#" onclick="javascript:fn_egov_goList();return false;"><span>목록</span></a>
			</div>
<input type="hidden" name="serviceNm" value="ehCache" />
</form:form>
</div>
</div>
</body>
</html>

