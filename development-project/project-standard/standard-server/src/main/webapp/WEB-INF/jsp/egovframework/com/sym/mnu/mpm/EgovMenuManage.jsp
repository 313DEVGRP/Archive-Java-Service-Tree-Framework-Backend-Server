<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovMenuManage.jsp
  * @Description : 메뉴관리 조회 화면
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.10    이용          최초 생성
  	  2011.07.27     서준식          메뉴 삭제 자바스크립트 오류 수정
  *
  *  @author 공통서비스 개발팀 이용
  *  @since 2009.03.10
  *  @version 1.0
  *  @see
  *
  */
  /* Image Path 설정 */
  String imagePath_icon   = "/images/egovframework/com/sym/mnu/mpm/icon";
  String imagePath_button = "/images/egovframework/com/sym/mnu/mpm/button";
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" type="text/css">
<title>메뉴관리리스트</title>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script language="javascript1.2" type="text/javaScript">
<!--
/* ********************************************************
 * 모두선택 처리 함수
 ******************************************************** */
function fCheckAll() {
    var checkField = document.menuManageForm.checkField;
    if(document.menuManageForm.checkAll.checked) {
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
 * 멀티삭제 처리 함수
 ******************************************************** */
function fDeleteMenuList() {
    var checkField = document.menuManageForm.checkField;
    var menuNo = document.menuManageForm.checkMenuNo;
    var checkMenuNos = "";
    var checkedCount = 0;
    if(checkField) {

    	if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkMenuNos += ((checkedCount==0? "" : ",") + menuNo[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkMenuNos = menuNo.value;
            }
        }
    }
    if(checkedCount ==0){
		alert("선택된 메뉴가 없습니다.");
		return false;
    }

    document.menuManageForm.checkedMenuNoForDel.value=checkMenuNos;
    document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageListDelete.do'/>";
    document.menuManageForm.submit();
}

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
//	document.menuManageForm.searchKeyword.value =
	document.menuManageForm.pageIndex.value = pageNo;
	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>";
   	document.menuManageForm.submit();
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectMenuManageList() {
	document.menuManageForm.pageIndex.value = 1;
	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>";
	document.menuManageForm.submit();
}

/* ********************************************************
 * 입력 화면 호출 함수
 ******************************************************** */
function insertMenuManage() {
   	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuRegistInsert.do'/>";
   	document.menuManageForm.submit();
}

/* ********************************************************
 * 일괄처리 화면호출 함수
 ******************************************************** */
/* function bndeInsertMenuManage() {
	   	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuRegistInsert.do'/>";
	   	document.menuManageForm.submit();
	}
 */
function bndeInsertMenuManage() {
   	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuBndeRegist.do'/>";
   	document.menuManageForm.submit();
}
/* ********************************************************
 * 상세조회처리 함수
 ******************************************************** */
function selectUpdtMenuManageDetail(menuNo) {
	document.menuManageForm.req_menuNo.value = menuNo;
   	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageListDetailSelect.do'/>";
   	document.menuManageForm.submit();
}
/* ********************************************************
 * 최초조회 함수
 ******************************************************** */
function fMenuManageSelect(){
    document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>";
    document.menuManageForm.submit();
}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>

</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
<!-- ********** 여기서 부터 본문 내용 *************** -->
<form name="menuManageForm" action ="<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>" method="post">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input name="checkedMenuNoForDel" type="hidden" />
<input name="req_menuNo" type="hidden"  />

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%" class="title_left">
     <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="" />&nbsp;메뉴관리리스트</h1></td>
  <td width="10%" ></td>
  <td width="35%"></td>
  <td width="10%"></td>
 </tr>
</table>
<table width="717" border="0" cellpadding="0" cellspacing="1" summary="메뉴관리 검색조건">
 <tr>
  <td width="100%">
    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="메뉴관리 검색조건">
	<caption>메뉴관리 검색조건</caption>
      <tr>
        <th width="20%" height="40" class="" scope="row" ><label for="searchKeyword">메뉴명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
        <td width="80%">
          <table border="0" cellspacing="0" cellpadding="0" align="left">
            <tr>
              <td >&nbsp;<input name="searchKeyword" type="text" size="80" value="${searchVO.searchKeyword }"  maxlength="60" title="검색조건"/></td>
              <td width="5%"></td>
              <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="selectMenuManageList(); return false;"/></span></td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
   </td>
 </tr>
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td width="75%">&nbsp;</td>
    <td width="25%" height="10">&nbsp;
       <table border="0" cellspacing="0" cellpadding="0" summary="메뉴관리 처리버튼">
       	<caption>메뉴관리 처리버튼</caption>
        <tr>
             <td><span class="button"><a href="<c:url value='/sym/mnu/mpm/EgovMenuRegistInsert.do'/>" onclick="bndeInsertMenuManage(); return false;">일괄등록</a></span></td>
             <td width="5%"></td>
             <td><span class="button"><a href="<c:url value='/sym/mnu/mpm/EgovMenuRegistInsert.do'/>" onclick="insertMenuManage(); return false;"><spring:message code="button.create" /></a></span></td>
             <td width="5%"></td>
             <td><span class="button"><a href="#LINK" onclick="fDeleteMenuList(); return false;"><spring:message code="button.delete" /></a></span></td>
         </tr>
       </table>
     </td>
  </tr>
</table>
<br/><br/>
<table width="717" cellpadding="8" class="table-line" style="table-layout:fixed" summary="메뉴관리 목록 조회화면으로 메뉴ID,메뉴한글명,프로그램파일명,메뉴설명,상위메뉴ID로 구성.">
 <caption>메뉴관리 목록 조회</caption>
 <thead>
  <tr>
    <th class="title" width="30">
       <input type="checkbox" name="checkAll" class="check2" onclick="javascript:fCheckAll();" title="전체선택"/>
    </th>
    <th class="title" width="100" scope="col">메뉴ID</th>
    <th class="title" width="120" scope="col">메뉴한글명</th>
    <th class="title" width="200" scope="col">프로그램파일명</th>
    <th class="title" width="167" scope="col">메뉴설명</th>
    <th class="title" width="100" scope="col">상위메뉴ID</th>
  </tr>
 </thead>
 <tbody>

 <c:forEach var="result" items="${list_menumanage}" varStatus="status">
  <tr>
    <td class="lt_text">
       <input type="checkbox" name="checkField" class="check2" title="선택"/>
       <input name="checkMenuNo" type="hidden" value="<c:out value='${result.menuNo}'/>"/>
    </td>
    <td class="lt_text"><c:out value="${result.menuNo}"/></td>
    <td class="lt_text" style="cursor:hand;">
       <span class="link"><a href="<c:url value='/sym/mnu/mpm/EgovMenuManageListDetailSelect.do?req_menuNo='/>${result.menuNo}" onclick="selectUpdtMenuManageDetail('<c:out value="${result.menuNo}"/>'); return false;"><c:out value="${result.menuNm}"/></a></span>
    </td>
    <td class="lt_text"><c:out value="${result.progrmFileNm}"/></td>
    <td class="lt_text"><c:out value="${result.menuDc}"/></td>
    <td class="lt_text"><c:out value="${result.upperMenuId}"/></td>
  </tr>
 </c:forEach>
 </tbody>
 <!--tfoot>
  <tr class="">
   <td colspan=6 align="center"></td>
  </tr>
 </tfoot -->
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0" summary="목록페이징 처리">
  <tr>
    <td height="10"></td>
  </tr>
  <tr>
    <td>
<!-- 페이징 시작 -->
<div align="center">
  <div>
	<ui:pagination paginationInfo = "${paginationInfo}"	type="image" jsFunction="linkPage"/>
  </div>
</div>
<!-- 페이징 끝 -->
    </td>
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

