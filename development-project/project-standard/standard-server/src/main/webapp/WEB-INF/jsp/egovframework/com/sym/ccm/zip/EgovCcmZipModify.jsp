<%
 /**
  * @Class Name  : EgovCcmZipModify.jsp
  * @Description : EgovCcmZipModify 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.04.01   이중호              최초 생성
  *
  *  @author 공통서비스팀 
  *  @since 2009.04.01
  *  @version 1.0
  *  @see
  *  
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
<title>우편번호 수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/sym/ccm/zip/zip.css' />">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="zip" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_Zip(){
	location.href = "<c:url value='/sym/ccm/zip/EgovCcmZipList.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_Zip(form){
	if(confirm("<spring:message code='common.save.msg'/>")){
		if(!validateZip(form)){ 			
			return;
		}else{
			form.submit();
		}
	}
}
-->
</script>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<DIV id="content" style="width:712px">
<!-- 상단타이틀 -->
<form:form commandName="zip" name="zip" method="post">

<input name="cmd" type="hidden" value="Modify">
<form:hidden path="zip"/>
<form:hidden path="sn"/>
<form:hidden path="ctprvnNm"/>
<form:hidden path="signguNm"/>
<c:if test="${searchList == '1'}">
	<form:hidden path="emdNm"/>
</c:if>
<c:if test="${searchList == '2'}">
	<form:hidden path="rdmnCode"/>
	<form:hidden path="rdmn"/>
</c:if>
<!-- 상단 타이틀  영역 -->
<table width="700" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left"><h1 class="title_left">
<c:if test="${searchList == '1'}">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;우편번호 일반주소 수정</h1></td>
</c:if>
<c:if test="${searchList == '2'}">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;우편번호 도로명주소 수정</h1></td>
</c:if>
 </tr>
</table>
<!-- 줄간격조정  -->
<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="리건물명과 번지동호를 수정하는 우편번호 수정 테이블이다.">
<CAPTION style="display: none;">우편번호 수정</CAPTION>
  <c:if test="${searchList == '1'}">
	  <tr>
	    <th width="20%" height="23" class="required_text" scope="row" nowrap >우편번호<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>          
	    <td width="80%" nowrap colspan="3">
	    	<c:out value='${fn:substring(zip.zip, 0,3)}'/>-<c:out value='${fn:substring(zip.zip, 3,6)}'/>
	    </td>
	  </tr> 
	  <tr> 
	    <th width="20%" height="23" class="required_text" scope="row" nowrap >시도명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
	    <td width="80%" nowrap>
	    	<c:out value='${zip.ctprvnNm}'/>
	    </td>    
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" scope="row" nowrap >시군구명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>          
	    <td width="80%" nowrap>
	    	<c:out value='${zip.signguNm}'/>
	    </td>    
	  </tr> 
	  <tr>
	    <th width="20%" height="23" class="required_text" scope="row" nowrap >읍면동명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>          
	    <td width="80%" nowrap>
			<c:out value='${zip.emdNm}'/>    
	    </td>    
	  </tr> 
	  <tr>
	    <th width="20%" height="23" nowrap scope="row" ><label for="liBuldNm">리건물명</label></th>          
	    <td width="80%" nowrap>
	    	<input name="liBuldNm" type="text" size="60" value="<c:out value='${zip.liBuldNm}'/>"  maxlength="60" id="liBuldNm" >
	    </td>    
	  </tr> 
	  <tr>
	    <th width="20%" height="23" scope="row" nowrap ><label for="lnbrDongHo">번지동호</label></th>          
	    <td width="80%" nowrap>
	    	<input name="lnbrDongHo" type="text" size="20" value="<c:out value='${zip.lnbrDongHo}'/>"  maxlength="20" id="lnbrDongHo">
	    </td>    
	  </tr>
  	  <input type=hidden name="rdmnCode" id="rdmnCode" value="0"/>
	  <input type=hidden name="rdmn" id="rdmn" value="0"/> 
  </c:if>
  <c:if test="${searchList == '2'}">
	  <tr>
	    <th width="11%" height="23" class="required_text" scope="row" nowrap >우편번호<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
	    <td><c:out value='${fn:substring(zip.zip, 0,3)}'/>-<c:out value='${fn:substring(zip.zip, 3,6)}'/></td>
	  </tr>
	  <tr>
	    <th width="11%" height="23" class="required_text" scope="row" nowrap >도로명코드<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
	    <td><c:out value='${zip.rdmnCode}'/></td>
	  </tr>
	  <tr>
	    <th width="11%" height="23" class="required_text" scope="row" nowrap >시도명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
	    <td><c:out value='${zip.ctprvnNm}'/>}</td>
	  </tr>
	  <tr>
	    <th width="11%" height="23" class="required_text" scope="row" nowrap >시군구명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
	    <td><c:out value='${zip.signguNm}'/></td>
	  </tr>
	  <tr>
	    <th width="11%" height="23" class="required_text" scope="row" nowrap >도로명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
	    <td><c:out value='${zip.rdmn}'/></td>
	  </tr>
	  <tr>
	    <th width="11%" height="23" scope="row" nowrap >건물번호본번</th>
	    <td width="80%" nowrap>
	    <input name="bdnbrMnnm" type="text" size="5" value="<c:out value='${zip.bdnbrMnnm}'/>"  maxlength="5" id="bdnbrMnnm">
	    </td>
	  </tr>
	  <tr>
	    <th width="11%" height="23" scope="row" nowrap >건물번호부번</th>
	    <td width="80%" nowrap>
	    <input name="bdnbrSlno" type="text" size="5" value="<c:out value='${zip.bdnbrSlno}'/>"  maxlength="5" id="bdnbrSlno">
	    </td>
	  </tr>
	  <tr>
	    <th width="11%" height="23" scope="row" nowrap >건물명</th>
	    <td width="80%" nowrap>
	    <input name="buldNm" type="text" size="60" value="<c:out value='${zip.buldNm}'/>"  maxlength="60" id="buldNm">
	    </td>
	  </tr>
	  <tr>
	    <th width="11%" height="23" scope="row" nowrap >상세건물명</th>
	    <td width="80%" nowrap>
	    <input name="detailBuldNm" type="text" size="60" value="<c:out value='${zip.detailBuldNm}'/>"  maxlength="60" id="detailBuldNm">
	    </td>
	  </tr>
  	  <input type=hidden name="emdNm" id="emdNm" value="0"/>
  </c:if>
</table>
<table width="700" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
</table>

<!-- 줄간격조정  -->
<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
<!--
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" alt="목록" width="8" height="20"></td>
  <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap><a href="#noscript" onclick="fn_egov_list_Zip(); return false;">목록</a></td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" alt="목록" width="8" height="20"></td>      
  <td width="10"></td>
-->
  <td><span class="button"><input type="submit" value="목록" onclick="fn_egov_list_Zip(); return false;"></span></td>
  <td><span class="button"><input type="submit" value="저장" onclick="fn_egov_modify_Zip(document.zip); return false;"></span></td>     
</tr>
</table>
	<input name="searchList" type="hidden" value="${searchList}">
</form:form>
</DIV>
</body>
</html>
