<%
 /**
  * @Class Name : EgovQnaAnswerDetailInqure.jsp
  * @Description : EgovQnaAnswerDetailInqure 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.02.01   박정규              최초 생성
  *   2011.10.27   서준식              완료 처리 이외의 상태에서도 저장된 답변 내용이 있으면 표시 될 수 있도록 변경
  *  @author 공통서비스팀 
  *  @since 2009.02.01
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>Q&amp;A답변상세조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_qnaanswerlist() {

	document.QnaManageForm.action = "<c:url value='/uss/olh/qnm/QnaAnswerListInqire.do'/>";
	document.QnaManageForm.submit();
		
}

/* ********************************************************
 * 수정처리화면
 ******************************************************** */
function fn_egov_updt_qnacnanswer(qaId){

	// Update하기 위한 키값을 셋팅
	document.QnaManageForm.qaId.value = qaId;	


		document.QnaManageForm.action = "<c:url value='/uss/olh/qnm/QnaCnAnswerUpdtView.do'/>";
		document.QnaManageForm.submit();

		
}


</script>
</head>
 
<body>
<DIV id="content" style="width:700px">
<!-- 상단타이틀 -->
<form name="QnaManageForm" action="<c:url value='/uss/olh/qnm/QnaCnAnswerUpdtView.do'/>" method="post">

<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="제목아이콘이미지">&nbsp;Q&amp;A답변상세조회</h1></td>
 </tr>
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="Q&amp;A에 대한 답변을 조회합니다.">
  <caption>Q&amp;A답변상세조회</caption>
  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >작성자명&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.wrterNm}"/>
    	<c:out value="${result.passwordConfirmAt}"/>  
    </td>
  </tr>

  <tr> 
    <th scope="row" height="23" class="required_text" >전화&nbsp;&nbsp;</th>
    <td width="80%" nowrap>    
      <c:out value="${result.areaNo}"/>-<c:out value="${result.middleTelno}"/>-<c:out value="${result.endTelno}"/>                      
    </td>
  </tr> 

  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >이메일&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.emailAdres}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<input name="emailAnswerAt" type="checkbox" <c:if test="${result.emailAnswerAt == 'Y'}">checked</c:if> title="이메일답변여부"> 이메일답변여부  
    </td>
  </tr>

  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >작성일자&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
  		<c:if test="${result.writngDe != null}">
    		<c:out value='${fn:substring(result.writngDe, 0,4)}'/>-<c:out value='${fn:substring(result.writngDe, 4,6)}'/>-<c:out value='${fn:substring(result.writngDe, 6,8)}'/>       			   	          				 			   
 		</c:if>
    
  
    </td>
  </tr>

  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >조회횟수&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.inqireCo}"/>  
    </td>
  </tr>

  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >진행처리상태&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.qnaProcessSttusCodeNm}"/>  
    </td>
  </tr>

  <tr> 
    <th scope="row" height="23" class="required_text" >질문제목&nbsp;&nbsp;</th>
    <td width="80%" nowrap>    
      <c:out value="${result.qestnSj}"/>                 
    </td>
  </tr> 

  <tr> 
    <th scope="row" height="23" class="required_text" ><label for="qestnCn">질문내용</label>&nbsp;&nbsp;</th>
    <td width="80%" nowrap>    
      <textarea name="qestnCn" class="textarea"  cols="300" rows="15"  style="width:450px;" readonly title="질문내용"><c:out value="${result.qestnCn}"/></textarea>                       
    </td>
  </tr> 

<!--답변내용이 있을경우 Display...-->
<c:if test="${result.qnaProcessSttusCode == '3' || result.answerCn != null}">
  <tr> 
    <th scope="row" height="23" class="required_text" ><label for="answerCn">답변내용</label>&nbsp;&nbsp;</th>
    <td width="80%" nowrap>    
      <textarea name="answerCn" class="textarea"  cols="300" rows="15"  style="width:450px;" readonly title="답변내용"><c:out value="${result.answerCn}"/></textarea>                                        
    </td>
  </tr> 

  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >담당부서&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.orgnztNm}"/>
    </td>
  </tr>

  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >답변일자&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
  		<c:if test="${result.answerDe != null}">
    		<c:out value='${fn:substring(result.answerDe, 0,4)}'/>-<c:out value='${fn:substring(result.answerDe, 4,6)}'/>-<c:out value='${fn:substring(result.answerDe, 6,8)}'/>       			   	          				 			   
 		</c:if>
    </td>
  </tr>

  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >답변자&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.emplyrNm}"/>
    </td>
  </tr>

  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >전화번호&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.offmTelno}"/>
    </td>
  </tr>

  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >이메일&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.aemailAdres}"/>
    </td>
  </tr>

  
</c:if>
   
   
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="10px"></td>
</tr>
</table>

<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr> 
  <td><span class="button"><input type="submit" value="답변" onclick="fn_egov_updt_qnacnanswer('<c:out value="${result.qaId}"/>'); return false;"></span></td>
  <td>&nbsp;&nbsp;</td>
  <td><span class="button"><a href="<c:url value='/uss/olh/qnm/QnaAnswerListInqire.do'/>" onclick="fn_egov_inqire_qnaanswerlist(); return false;"><spring:message code="button.list" /></a></span></td>
  <td>&nbsp;&nbsp;</td> 
</tr>
</table>

<input name="qaId" type="hidden" value="">
<input name="writngPassword" 	type="hidden" value="">
<input name="passwordConfirmAt" type="hidden" value="">

</form>
</DIV>

</body>
</html>
