<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /** 
  * 
  * @Description : EgovIndvdlPgeCntnts List 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2009.09.08    이창원                 최초 생성
  *
  *  @author Lee changwon
  *  @since 2009.09.08
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/egovframework/com/com.css' />" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<title>마이페이지 컨텐츠 목록</title>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>" ></script>
<script type="text/javaScript" language="javascript" defer="defer">
/* ********************************************************
 * 목록에서 체크박스 전체 선택, 선택 해제 기능
 ******************************************************** */
 function fncCheckAll() {
    var varForm = document.IndvdlPgeManage; //document.getElementById("IndvdlPgeManage");
    var checkField = varForm.delYn;
    if(varForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}

 /* ********************************************************
  * 컨텐츠 삭제 시 목록에서 체크박스 체크 확인
  ******************************************************** */
function fncManageChecked() {
    var varForm = document.IndvdlPgeManage; //document.getElementById("IndvdlPgeManage");
    var checkField = varForm.delYn;
    var checkId = varForm.checkedID;
    var returnValue = "";
    var returnBoolean = false;
    var checkCount = 0;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                    checkCount++;
                    checkField[i].value = checkId[i].value;

                    if(returnValue == "")
                        returnValue = checkField[i].value;
                    else 
                        returnValue = returnValue + ";" + checkField[i].value;
                }
            }
            if(checkCount > 0) 
                returnBoolean = true;
            else {
                alert("선택된  컨텐츠가  없습니다.");
                returnBoolean = false;
            }
        } else {
             if(varForm.delYn.checked == false) {
                alert("선택된 컨텐츠가  없습니다.");
                returnBoolean = false;
            }
            else {
                returnValue = checkId.value;
                returnBoolean = true;
            }
        }
    } else {
        alert("조회된 결과가 없습니다.");
    }

    document.IndvdlPgeManageDel.cntntsId.value = returnValue;
    return returnBoolean;
}

/* ********************************************************
* 컨텐츠 미리보기 시 목록에서 체크박스 체크 확인
******************************************************** */
function fncCntntsPreview(){
    var varForm = document.IndvdlPgeManage; //document.getElementById("IndvdlPgeManage");
    var checkField = varForm.delYn;
    var checkCount = 0;
    var checkedItem=0;
    var cntcUrl = "";
    var cntntsNm = "";
    
    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                    checkCount++;
                    checkedItem = i;                   
                }
            }
        }else{
            if(checkField.checked){
            checkCount = 1;
            checkedItem = 0;
            }
        }
    }    
    if(checkCount == 0) {
        alert("미리보기 할 하나의 컨텐츠를 선택해 주세요.");
    }else if(checkCount > 1){
        alert("미리보기 할 컨텐츠를 하나만 선택해 주세요.");
    }else{
        if(checkField.length > 1){
            cntcUrl = varForm.cntcUrl[checkedItem].value;
            cntntsNm = varForm.cntntsNm[checkedItem].value;         
        }else{
            cntcUrl = varForm.cntcUrl.value;
            cntntsNm = varForm.cntntsNm.value;
        }
        var openParam = "dialogLeft:10;dialogTop:10;dialogWidth:500px;dialogHeight:400px;scroll:yes;status:no;center:yes;resizable:yes;";
        window.showModalDialog("<c:url value='/uss/mpe/indvdlCntntsPreview.do'/>?cntcUrl="+cntcUrl, self, openParam);    
    }
}

/* ********************************************************
* 상세보기 화면 이동
******************************************************** */
function fncShowDetail(id) {
    var varForm = document.IndvdlPgeManageDetail; //document.getElementById("IndvdlPgeManage");
    varForm.cntntsId.value = id;
    if("<c:out value='${indvdlPgeVO.pageIndex}'/>"=="") varForm.pageIndex.value = 1;
    else varForm.pageIndex.value = "<c:out value='${indvdlPgeVO.pageIndex}'/>";
    //varForm.action = "<c:url value='/uss/mpe/EgovIndvdlpgeCntntsDetail.do' />";
    varForm.submit();     
}

/* ********************************************************
* 목록에서 체크된 컨텐츠 삭제(사용 유무 N으로 변경)
******************************************************** */
function fncDeleteCntnts() {
    var varForm = document.IndvdlPgeManageDel; //document.getElementById("IndvdlPgeManage");
    if(fncManageChecked()) {
        if(confirm("삭제하시겠습니까?")) {
            varForm.action = "<c:url value='/uss/mpe/EgovIndvdlpgeCntntsDel.do' />";
            varForm.submit();
        }
    }
}

/* ********************************************************
* 페이징 처리
******************************************************** */
function linkPage(pageNo){
    var varForm = document.IndvdlPgeManage; //document.getElementById("IndvdlPgeManage");
    varForm.searchCondition.value = "1";
    if(pageNo=="") varForm.pageIndex.value = 1;
    else varForm.pageIndex.value=pageNo;
    //varForm.action = "<c:url value='/uss/mpe/EgovIndvdlpgeCntntsList.do' />";
    varForm.submit();
}

/* ********************************************************
* 특정 키워드 검색
******************************************************** */
function fncSearch(){
    var varForm = document.IndvdlPgeManage; //document.getElementById("IndvdlPgeManage");
    varForm.pageIndex.value = 1;
    varForm.submit();
}

/* ********************************************************
* 서버 처리 후 메세지 화면에 보여주기
******************************************************** */
function fncShowMessg(){
	if("<c:out value='${message}'/>" != ''){
	alert("<c:out value='${message}'/>");
	}
}
</script>
</head>
<body onLoad="javascript:fncShowMessg();"><c:set var="tabindex" value="7" />
<noscript  class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<form name="IndvdlPgeManage" id="IndvdlPgeManage" action="<c:url value='/uss/mpe/EgovIndvdlpgeCntntsList.do' />" method="post">
<table border="0">
  <tr>
    <td width="700">
<table width="100%" cellpadding="8" class="table-search" border="0" summary="리스트 조회기능을 제공한다.">
 <tr>
  <td width="30%" class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목이미지">&nbsp;마이페이지 컨텐츠 목록 </td>
  <td width="42%" >
    <select name="searchCondition" class="select" tabindex="1" title="검색조건구분">
                    <option value="">--선택하세요--</option>
                    <option <c:if test="${searchcondition eq 1 }"> selected </c:if> value="1">컨텐츠명 </option>
                    <option <c:if test="${searchcondition eq 2 }"> selected </c:if> value="2">사용상태</option>
    </select> 
    <input name="searchKeyword" type="text" value="<c:out value="${indvdlPgeVO.searchKeyword}"/>"  size="20" tabindex="2" title="검색단어입력" >
    <!-- a href="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />" alt="검색" width="15" height="15" style="vertical-align: middle;"></a-->
  </td>
  <td width="28%">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSearch(); return false;" tabindex="4"></span></td>
      <td>&nbsp;&nbsp;</td>
      <td>
           <span class="button">
           <a href="javascript:fncCntntsPreview();"
              onclick="fncCntntsPreview(); return false;" tabindex="4"><spring:message code="button.preview" /></a>
           </span>
      </td>     
      <td>
           <span class="button">
           <a href="javascript:fncDeleteCntnts();"
              onclick="fncDeleteCntnts(); return false;" tabindex="6"><spring:message code="button.delete" /></a>
           </span>
      </td>     
      <td>
           <span class="button">
           <a href="<c:url value='/uss/mpe/EgovIndvdlpgeCntntsRegistView.do'/>" tabindex="5"><spring:message code="button.create" /></a>
           </span>
      </td>     

      
    </tr>
   </table>
  </td>  
 </tr>
</table>
<table width="100%" cellpadding="8" class="table-list" summary="마이페이지에 추가하기 위한 컨텐츠  목록을 제공한다.">
  <thead>
  <tr>
    <th class="title" width="10%" ><input type="checkbox" name="checkAll" class="check2" onClick="javascript:fncCheckAll()" title="전체선택"></th>  
    <th class="title" width="20%" >컨텐츠 명</th>
    <th class="title" width="50%" >연계 URL</th>
    <th class="title" width="20%" >사용 상태 </th>
  </tr>
  </thead>
  <tbody>  
 <c:forEach var="cntntslist" items="${indvdlCntntsList}" varStatus="status">
  <tr>
    <td class="lt_text3"><input name="delYn" type="checkbox" class="check2" value="<c:out value="${cntntslist.cntntsId}"/>" tabindex="<c:out value="${tabindex+10}"/>" title="<c:out value="${cntntslist.cntntsNm}"/>"><input type="hidden" name="checkedID" value="<c:out value='${cntntslist.cntntsId}'/>" ><input type="hidden" name="cntntsNm" value="<c:out value="${cntntslist.cntntsNm}"/>"><input type="hidden" name="cntcUrl" value="<c:out value="${cntntslist.cntcUrl}"/>"></td>
    <td class="lt_text3">
        <span class="link"><input type="submit" style="width:200px;text-align:left;" tabindex="<c:out value="${tabindex}"/>" value="<c:out value="${cntntslist.cntntsNm}"/>" onclick="fncShowDetail('<c:out value='${cntntslist.cntntsId}'/>'); return false;"></span>
    </td>
    <td class="lt_text3"><c:out value="${cntntslist.cntcUrl}"/></td>
    <td class="lt_text3"><c:out value="${cntntslist.cntntsUseAt}"/><c:set var="tabindex" value='${tabindex+1}' /></td>
  </tr>
 </c:forEach>
 <c:if test="${fn:length(indvdlCntntsList) == 0}">
   <tr>
     <td width="100%" height="50"class="lt_text3" valign="middle" align="center" colspan="4">조회된 컨텐츠가 없습니다.</td>  
   </tr>         
 </c:if>
 </tbody>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
</table>
<!-- 페이징 시작 -->
<c:if test="${!empty indvdlPgeVO.pageIndex }">
    <div align="center">
        <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
    </div>
</c:if>
<input type="hidden" name="pageIndex" value="<c:out value='${indvdlPgeVO.pageIndex}'/>">
<!-- 페이징 끝 -->
</td>
</tr>
</table>
</form>
<form name="IndvdlPgeManageDel" id="IndvdlPgeManageDel" action="<c:url value='/uss/mpe/EgovIndvdlpgeCntntsDel.do' />" method="post">
<input type="hidden" name="cntntsId" value="">
<input type="hidden" name="pageIndex" value="<c:out value='${indvdlPgeVO.pageIndex}'/>">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
</form>
<form name="IndvdlPgeManageDetail" id="IndvdlPgeManageDetail" action="<c:url value='/uss/mpe/EgovIndvdlpgeCntntsDetail.do' />" method="post">
<input type="hidden" name="cntntsId" value="">
<input type="hidden" name="pageIndex" value="<c:out value='${indvdlPgeVO.pageIndex}'/>">
    <div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
</form>
</body>
</html>
