<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%
 /**
  * @Class Name : EgovAdressBookUpdt.jsp
  * @Description : 주소록수정및 상세조회
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.09.25   윤성록          최초 생성
  *	 2011.09.05   정진오		Form 내부에 Form이 있어 테이블이 깨지는 현상 해소
  *
  *  @author 공통컴포넌트  윤성록
  *  @since 2009.09.25
  *  @version 1.0
  *  @see
  *
  */
%>

<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="adbk" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">
	function fn_egov_update_adbkInf(){

		if (!validateAdbk(document.adbk)){
			return;
		}
		if(confirm("수정 하시겠습니까?")){
			document.adbk.action = "<c:url value='/cop/adb/UpdateAdressBook.do'/>";
			document.adbk.submit();
		}
	}

	function fn_egov_deleteUser(userId){
		document.adbk.checkWord.value = userId;
		document.adbk.checkCnd.value = "update";
		document.adbk.action = "<c:url value='/cop/adb/deleteUser.do'/>";
		document.adbk.submit();
	}

	function fn_egov_select_adbkInfs(){
		document.adbk.action = "<c:url value='/cop/adb/selectAdbkList.do'/>";
		document.adbk.submit();
	}
	function fn_egov_inqire_user(){
		var retVal;
		var url = "<c:url value='/cop/adb/openPopup.do?requestUrl=/cop/adb/selectManList.do&width=850&height=360'/>";
		var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";

		retVal = window.showModalDialog(url,"p_userInqire", openParam);

		if(retVal != null){
			var temp = retVal.split(",");
			var checkId = document.adbk.userId.value.split(",");

			for(var i = 0; i < checkId.length; i++){
				if(temp[0] == checkId[i]){
					alert("이미 등록된 사람입니다.");
					return;
				}
			}

			document.adbk.userId.value += temp[0] + ",";
			document.adbk.userNm.value += temp[1] + ",";
			document.adbk.userEmail.value += temp[2] + ",";
			document.adbk.checkCnd.value = "update";

			document.adbk.action = "<c:url value='/cop/adb/addUser.do'/>";
			document.adbk.submit();

		}
	}
	
	function showModalDialogCallback(retVal) {
		if (retVal != null) {
			var temp = retVal.split(",");
			var checkId = document.adbk.userId.value.split(",");

			for(var i = 0; i < checkId.length; i++) {
				if(temp[0] == checkId[i]){
					alert("이미 등록된 사람입니다.");
					return;
				}
			}

			document.adbk.userId.value += temp[0] + ",";
			document.adbk.userNm.value += temp[1] + ",";
			document.adbk.userEmail.value += temp[2] + ",";
			document.adbk.checkCnd.value = "update";

			document.adbk.action = "<c:url value='/cop/adb/addUser.do'/>";
			document.adbk.submit();

		}
	}


</script>
<title>주소록 수정</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<form name="adbk" method="post" action ="<c:url value='/cop/adb/UpdateAdressBook.do'/>">
<input type = "hidden" name = "userId" value = '<c:out value="${adbkUserVO.userId}" />'>
<input type = "hidden" name = "userNm" value = '<c:out value="${adbkUserVO.userNm}" />'>
<input type = "hidden" name = "userEmail" value = '<c:out value="${adbkUserVO.userEmail}" />'>
<input type = "hidden" name = "adbkId" value = '<c:out value="${searchVO.adbkId}" />'>
<input type = "hidden" name = "checkWord" value = "" >
<input type = "hidden" name = "checkCnd" value = "">

<div id="border" style="width:730px">
	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="제목아이콘이미지" >&nbsp;주소록수정</td>
	 </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="주소록의 수정에 대한 데이터 항목을 제공한다.">
	  <tr>
	    <th width="20%" height="23" class="required_text" nowrap ><spring:message code="cop.adbkNm" />
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="80%" nowrap colspan="3">
	     <c:if test="${writer == true}">
	     <input name="adbkNm" type="text" size="30"  value='<c:out value="${searchVO.adbkNm}" />' maxlength="50" style="width: 338px" title="주소록명입력">
	     </c:if>
	     <c:if test="${writer != true}"> <c:out value="${searchVO.adbkNm}" /> </c:if>
	   </td>
	  </tr>

	  <tr>
	    <th width="20%" height="23" class="required_text" nowrap ><spring:message code="cop.othbcScope" />
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="30%" class="" colspan="3">
	     	<spring:message code="cop.man" /> : <input type="radio" name="othbcScope" class="radio2" value="개인"<c:if test="${searchVO.othbcScope == '개인'}"> checked="checked"</c:if> <c:if test="${writer != true}"> disabled   </c:if> >&nbsp;&nbsp;&nbsp;
	     	<spring:message code="cop.part" /> : <input type="radio" name="othbcScope" class="radio2" value="부서"<c:if test="${searchVO.othbcScope == '부서'}"> checked="checked"</c:if> <c:if test="${writer != true}"> disabled   </c:if>>&nbsp;&nbsp;&nbsp;
	     	<spring:message code="cop.company" /> : <input type="radio" name="othbcScope" class="radio2" value="회사"<c:if test="${searchVO.othbcScope == '회사'}"> checked="checked"</c:if> <c:if test="${writer != true}"> disabled   </c:if>>
	     	<br>
 	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" nowrap >
	    	<spring:message code="cop.adbkUser" />
	    	<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택입력표시">
	    </th>
	     <td width="80%" nowrap colspan="3">
	    <c:if test="${writer == true}">
	      <input name="remark" type="text" size="90" value=""  maxlength="90" style="width: 181px" readonly class="readOnlyClass" title="주소록구성원입력">
	      <a href="javascript:fn_egov_inqire_user()" style="selector-dummy: expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />"
	     			width="15" height="15" style="vertical-align: middle" alt="주소록구성원찾기조회팝업 제공"></a>
	    </c:if>
	    </td>
	  </tr>

	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="주소록에  대한 주소록구성원 목록을 제공한다.">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
	<table width="100%" cellpadding="8" class="table-list">
	 <thead>
	  <tr>
	    <th class="title" width="10%" nowrap>아이디</th>
	    <th class="title" width="10%" nowrap>이름 </th>
	    <th class="title" width="20%" nowrap>메일</th>
	    <th class="title" width="12%" nowrap>집전화번호</th>
	    <th class="title" width="12%" nowrap>휴대폰번호</th>
	    <th class="title" width="12%" nowrap>회사번호</th>
	    <th class="title" width="12%" nowrap>팩스번호</th>
	    <c:if test="${writer == true}">
	   		<th class="title" width="10%" nowrap>삭제</th>
	    </c:if>
	  </tr>
	 </thead>
	 <tbody>
		 <c:forEach var="result" items="${searchVO.adbkMan}" varStatus="status">
		  <tr>
		    <!-- td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->

		    <c:if test="${result.ncrdId == ''|| result.ncrdId == NULL}">
		    	<td class="lt_text3" nowrap><c:out value="${result.emplyrId}" /></td>
		    </c:if>
		    <c:if test="${result.emplyrId == ''|| result.emplyrId == NULL}">
		    	<td class="lt_text3" nowrap><c:out value="${result.ncrdId}" /></td>
		    </c:if>
		    	<td class="lt_text3" nowrap><c:out value="${result.nm}"/></td>
		    	<td class="lt_text3" nowrap><c:out value="${result.emailAdres}"/></td>
		    	<td class="lt_text3" nowrap><c:out value="${result.homeTelno}"/></td>
		    	<td class="lt_text3" nowrap><c:out value="${result.moblphonNo}"/></td>
		    	<td class="lt_text3" nowrap><c:out value="${result.offmTelno}"/></td>
		    	<td class="lt_text3" nowrap><c:out value="${result.fxnum}"/></td>
		    <c:if test="${writer == true}">
				<c:if test="${result.ncrdId == '' || result.ncrdId == NULL}">
					<td>
					<!-- 2011.09.05 수정사항 -->
					<!-- <form name="deleteItem" method="post" action="<c:url value='/cop/adb/deleteUser.do'/>"> -->
					<!-- <input type="hidden" name="emplyrId" value="<c:out value="${result.emplyrId}"/>"/> -->
						&nbsp;
						<span class="button">
							<input type="submit" value="삭제" onClick="javascript:fn_egov_deleteUser('<c:out value="${result.emplyrId}" />'); return false;">
						</span>
					<!-- </form> -->
					</td>
				</c:if>
				<c:if test="${result.emplyrId == '' || result.emplyrId == NULL}">
					<td class="lt_text3" nowrap>
					<!-- 2011.09.05 수정사항 -->
					<!-- <form name="deleteItem" method="post" action="<c:url value='/cop/adb/deleteUser.do'/>"> -->
					<!--	<input type="hidden" name="ncrdId" value="<c:out value="${result.ncrdId}"/>"/> -->
 						<span class="button">
 							<input type="submit" value="삭제" onClick="javascript:fn_egov_deleteUser('<c:out value="${result.ncrdId}" />'); return false;">
				 		</span>
					<!-- </form> -->
					</td>
				</c:if>
			</c:if>
		  </tr>
		 </c:forEach>
		 <c:if test="${fn:length(searchVO.adbkMan) == 0}">
		  <tr>
		    <c:if test="${writer == true}">
				<td class="lt_text3" colspan="8" ></td>
		   	</c:if>
			<c:if test="${writer == false}">
	 			<td class="lt_text3" colspan="7"></td>
	      	</c:if>
		  </tr>
		 </c:if>
	 </tbody>

	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>

	<div align="center">
	<table border="0" cellspacing="0" cellpadding="0" align="center">
	    <tr>
	    <c:if test="${writer == true}">
		  <td><span class="button"><input type="submit" value="저장" onclick="fn_egov_update_adbkInf(); return false;"></span></td>
	    	       <td>&nbsp;&nbsp;</td>
	    </c:if>
  		<td><span class="button"><a href="<c:url value='/cop/adb/selectAdbkList.do'/>?pageIndex=<c:out value='${searchVO.pageIndex}'/>" onclick="fn_egov_select_adbkInfs(); return false;">목록</a></span></td>
	    </tr>
	</table>
	</div>
</div>
</form>
</body>
</html>
