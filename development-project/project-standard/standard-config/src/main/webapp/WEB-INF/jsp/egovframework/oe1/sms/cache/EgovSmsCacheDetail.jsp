<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : EgovSmsCacheDetail.jsp
  * @Description : 캐시 빈 설정 상세 화면
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
<title>Cache Config Detail(Spring Integration)</title>


</head>
<body>
<script type="text/javaScript" language="javascript" defer="defer">
//<!--

function fn_egov_goList(){
	$('#contents').load("<c:url value='/ole/sms/selectCacheBeanList.sms'/>");	
}

function fn_egov_save(){

	if(checkValue()){
	    var options = { 
			   	   success     : responseCtl,
			       url         : "<c:url value='/ole/sms/updateCacheService.sms'/>",
			       type        : "post", /* get, post */
			       dataType    : "html" /* xml, html, script, json */
			}; 
		jQuery("#beanVO").ajaxSubmit( options );
	}
}


function fn_egov_delete(){
   	var options = { 
		   	   success     : responseDeleteCtl,
		       url         : "<c:url value='/ole/sms/deleteCacheService.sms'/>",
		       type        : "post", /* get, post */
		       dataType    : "html" /* xml, html, script, json */
		};
   	if(confirm("현재 조회된 빈 설정을 삭제 합니다.\n진행하시겠습니까?")){
   		jQuery("#beanVO").ajaxSubmit( options );
   	}
	
}

function responseCtl(html, status){
	 if(status ='success'){
			 alert('저장 되었습니다.');		
	 }	 
	 $('#contents').html(html);

}

function responseDeleteCtl(html, status){
	 if(status ='success'){
			 alert('삭제 되었습니다.');		
	 }	 
	 $('#contents').html(html);

}


function fn_egov_preview(){
	frm = document.beanVO;
	
    window.open("","Preview","resizable=1,width=800,height=500,scrollbars=yes");
    frm.method="post";
    frm.action="<c:url value='/ole/sms/selectCachePreview.sms'/>";
    frm.target="Preview";
    frm.submit();
	
}

function checkValue(){
	
	var beanNm = trim(document.beanVO.beanNm.value);
	var beanClassNm = trim(document.beanVO.beanClassNm.value);
	var propertyNm = trim(document.beanVO.propertyNm.value);
	var subBeanClassNm = trim(document.beanVO.subBeanClassNm.value);
	var subPropertyNm = trim(document.beanVO.subPropertyNm.value);
	var subPropertyValue = trim(document.beanVO.subPropertyValue.value);

	
	if(subPropertyValue == ''){
		alert('서브 프로퍼티값은 필수 입력사항 입니다.');
		return false;
	}
	if(!checkSpChar(beanNm)){
		return false;
	}
	
	if(!checkKoreanLang(beanNm)){
		return false;
	}

	if(!checkSpChar(subPropertyValue)){
		return false;
	}
	
	if(!checkKoreanLang(subPropertyValue)){
		return false;
	}
	
	return true;
}

//-->
</script>

<div id="wrap">
		<!-- content 시작 -->
		<div id="content">
<form:form commandName="beanVO" id="beanVO" name="beanVO">
<input type="hidden" name="beanNm" id="beanNm" value="<c:out value='${beanVO.beanNm}'/>" />
<input type="hidden" name="beanClassNm" id="beanClassNm" value="<c:out value='${beanVO.beanClassNm}'/>" />
<input type="hidden" name="propertyNm" id="propertyNm" value="<c:out value='${beanVO.propertyNm}'/>" />
<input type="hidden" name="subBeanClassNm" id="subBeanClassNm" value="<c:out value='${beanVO.subBeanClassNm}'/>" />
<input type="hidden" name="subPropertyNm" id="subPropertyNm" value="<c:out value='${beanVO.subPropertyNm}'/>" />

	<div id="h2_topnav"><h2><strong>캐시 설정관리 상세</strong></h2></div>
		  	<div id="datail_table">
		  		<table id="tbl" summary="Bean ID,Class Name,property name,bean class,sub property name,sub property value" class="">
				<caption>Cache Config Detail</caption>
                  <tr>
						<th scope="row">Bean ID</th>
						<td colspan="2">
							<c:out value='${beanVO.beanNm}'/>
						</td>			
					</tr>
					<tr>
						<th scope="row">Class Name</th>
						<td colspan="2">
							<c:out value='${beanVO.beanClassNm}'/>
						</td>			
					</tr>
					<tr>
					    <th scope="row" rowspan="4">property</th>
						<th scope="row">property name</th>
						<td>
							<c:out value='${beanVO.propertyNm}'/>
						</td>			
					</tr>
					<tr>
						<th scope="row">bean class</th>
						<td>
							<c:out value='${beanVO.subBeanClassNm}'/>
						</td>			
					</tr>
					<tr>
						<th scope="row">sub property name</th>
						<td>
							<c:out value='${beanVO.subPropertyNm}'/>
						</td>			
					</tr>
					<tr>
						<th scope="row"><label for="subPropertyValue">sub property value</label></th>
						<td>							
							<form:input path="subPropertyValue"   size="50" cssClass="inputlarge" />
						</td>			
					</tr>
                </table>                	
			</div>
  			<div id="btn_style01">
				<a title="미리 보기(새창)" href="/#" onclick="javascript:fn_egov_preview();return false;"><span>미리 보기</span></a>
				<a title="저장" href="/#" onclick="javascript:fn_egov_save();return false;"><span>저장</span></a>
				<a title="삭제" href="/#" onclick="javascript:fn_egov_delete();return false;"><span>삭제</span></a>
				<a title="목록"href="/#" onclick="javascript:fn_egov_goList();return false;"><span>목록</span></a>
			</div>
	
<input type="hidden" name="serviceNm" value="cache" />
</form:form>
</div>
</div>
</body>
</html>

