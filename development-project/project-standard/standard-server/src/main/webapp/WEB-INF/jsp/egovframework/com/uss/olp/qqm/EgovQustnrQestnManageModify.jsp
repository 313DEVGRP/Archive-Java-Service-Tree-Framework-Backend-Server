<%--
  Class Name : EgovQustnrQestnManageModify.jsp
  Description : 설문문항 수정 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.19

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>설문문항 수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="qustnrQestnManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">


/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_QustnrQestnManage(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrQestnManage(){

	var varFrom = document.getElementById("qustnrQestnManageVO");
	varFrom.action = "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageList.do' />";
	varFrom.submit();
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_QustnrQestnManage(){
	var varFrom = document.getElementById("qustnrQestnManageVO");

	if(confirm("<spring:message code="common.save.msg" />")){
		varFrom.action =  "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageModify.do' />";

		if(!validateQustnrQestnManageVO(varFrom)){
			return;
		}else{
			varFrom.submit();
		}
	}
}
</script>
</head>
<body onLoad="fn_egov_init_QustnrQestnManage();">
<DIV id="content" style="width:712px">
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 상단타이틀 -->
<form:form commandName="qustnrQestnManageVO"  action="${pageContext.request.contextPath}/uss/olp/qqm/EgovQustnrQestnManageModify.do" method="post">

<!-- 상단 타이틀  영역 -->
<div class="title_left" style="width:100%;margin:0 0 0 0;">
	<h1><img src="<c:out value="${ImgUrl}" />icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt="제목아이콘이미지">&nbsp;설문문항 수정</h1>
</div>

<!-- 줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<!-- 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="등록 을 제공한다.">
<caption>등록 을 제공한다</caption>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap><label for="qestnrTmplatId">설문지정보(제목)</label><img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>
      ${resultList[0].qestnrSj}
      <input name="qestnrTmplatId" id="qestnrTmplatId" type="hidden" value="${resultList[0].qestnrTmplatId}">
      <input name="qestnrId" id="qestnrId" type="hidden" value="${resultList[0].qestnrId}">
      <input name="searchMode" id="searchMode" type="hidden" value="${qustnrQestnManageVO.searchMode}">
    </td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap><label for="qestnSn">질문순번</label><img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>
      <input name="qestnSn" type="text" size="50" value="1" maxlength="70" style="width:60px;" title="질문순번 입력">
      <div><form:errors path="qestnSn" cssClass="error" /></div>
    </td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="qestnTyCode">질문유형</label><img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>

<select name="qestnTyCode" title="질문유형 선택">
	<option value="">선택</option>
	<c:forEach items="${cmmCode018}" var="comCodeList" varStatus="status">
		<option value="${comCodeList.code}" <c:if test="${comCodeList.code eq resultList[0].qestnTyCode}">selected</c:if>>${comCodeList.codeNm}</option>
	</c:forEach>
</select>

     </td>
  </tr>
  <tr>
    <th scope="row" height="23" class="required_text" ><label for="qestnCn">질문 내용</label><img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td>
      <textarea name="qestnCn" id="qestnCn" class="textarea"  cols="75" rows="10" title="질문내용 입력" style="width:99%;">${resultList[0].qestnCn}</textarea>
     <div><form:errors path="qestnCn" cssClass="error"  /></div>
    </td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="required">최대선택건수</label><img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>
       <select name="mxmmChoiseCo" title="최대선택건수 선택">
       	<option value="1" <c:if test="${resultList[0].mxmmChoiseCo == '1'}">selected</c:if>>1</option>
       	<option value="2" <c:if test="${resultList[0].mxmmChoiseCo == '2'}">selected</c:if>>2</option>
       	<option value="3" <c:if test="${resultList[0].mxmmChoiseCo == '3'}">selected</c:if>>3</option>
       	<option value="4" <c:if test="${resultList[0].mxmmChoiseCo == '4'}">selected</c:if>>4</option>
       	<option value="5" <c:if test="${resultList[0].mxmmChoiseCo == '5'}">selected</c:if>>5</option>
       	<option value="6" <c:if test="${resultList[0].mxmmChoiseCo == '6'}">selected</c:if>>6</option>
       	<option value="7" <c:if test="${resultList[0].mxmmChoiseCo == '7'}">selected</c:if>>7</option>
       	<option value="8" <c:if test="${resultList[0].mxmmChoiseCo == '8'}">selected</c:if>>8</option>
       	<option value="9" <c:if test="${resultList[0].mxmmChoiseCo == '9'}">selected</c:if>>9</option>
       	<option value="10" <c:if test="${resultList[0].mxmmChoiseCo == '10'}">selected</c:if>>10</option>
      	</select>
    </td>
  </tr>
</table>


<!-- 줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<center>
<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center" summary="목록/저장 버튼을 제공한다.">
<caption>목록/저장 버튼을 제공한다</caption>
<tr>
	<td><img src="<c:out value="${ImgUrl}" />btn/bu2_left.gif" width="8" height="20" alt="버튼이미지"></td>
	<td class="btnBackground" nowrap><a href="<c:url value='/uss/olp/qqm/EgovQustnrQestnManageList.do' />">목록</a></td>
	<td><img src="<c:out value="${ImgUrl}" />btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
	<th scope="col">&nbsp;</th>
	<td>
		<span class="button"><input type="submit" value="저장" onclick="fn_egov_save_QustnrQestnManage(this.form); return false;"></span>
	</td>
</tr>
</table>
</center>
<input name="qestnrQesitmId" type="hidden" value="${resultList[0].qestnrQesitmId}">
<input name="cmd" type="hidden" value="<c:out value='save'/>">
</form:form>
</DIV>

</body>
</html>
