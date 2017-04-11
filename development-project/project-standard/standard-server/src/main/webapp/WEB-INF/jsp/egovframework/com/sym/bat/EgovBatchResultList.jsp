<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
/**
 * @Class Name : EgovBatchResultList.jsp
 * @Description : 배치결과관리 목록조회
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2010.08.31   김진만          최초 생성
 *
 *  @author 김진만
 *  @version 1.0
 *  @see
 *
 */
//  배치결과의 executBeginTime, executEndTime의 화면 표시용 임시 변수 ....
%>
<c:set var="tempDate" value=""/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>배치결과관리 목록조회</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js' />"></script>
<script type="text/javascript">

function fn_egov_init(){

    var vForm = document.frm;

    if (vForm.searchKeywordFrom.value == "") {
        // 조회일자에 현재날짜 세팅
        //vForm.searchStartDate.value = fn_egov_getToday();
        //vForm.searchEndDate.value = fn_egov_getToday();
        //vForm.searchEndHour.options[23].selected = true;
    } else {
        // 조회조건 지정된 것 설정하기.
        // 조회시작일자
        vForm.searchStartDate.value = vForm.searchKeywordFrom.value.substring(0,4) + '-' + vForm.searchKeywordFrom.value.substring(4,6) + '-' + vForm.searchKeywordFrom.value.substring(6,8);
        // 조회종료일자
        vForm.searchEndDate.value = vForm.searchKeywordTo.value.substring(0,4) + '-' + vForm.searchKeywordTo.value.substring(4,6) + '-' + vForm.searchKeywordTo.value.substring(6,8);
    }
}

/* ********************************************************
 * 현재날짜 가져오기
 ******************************************************** */
function fn_egov_getToday(){

    var today = new Date();
    var currentYear  = today.getYear();
    var currentMonth = (today.getMonth()+1).toString();
    var currentDay = today.getDate().toString();

    var currentToday = currentYear + "-" + fn_egov_getLpad(2,currentMonth) + "-" + fn_egov_getLpad(2,currentDay);

    return  currentToday;
}

/* ********************************************************
 * LPAD 처리
 ******************************************************** */
function fn_egov_getLpad(rtnSize, sourceStr)
{
    rtnStr = sourceStr;

    for( i= sourceStr.length; i<parseInt(rtnSize); i++)
        rtnStr =  "0" + rtnStr;

    return rtnStr;
}

/* ********************************************************
 * 입력받은문자열중에서 제거 문자열을 제외 문자열을 리턴한다.
 ******************************************************** */
function fn_egov_remove_string(srcStr, cndStr) {

    var result = null;
    var rtnStr = null;

    for (var i = 0; i < srcStr.length; i++) {

        if (srcStr.charAt(i) == cndStr) {
            result = srcStr.substring(0, i);

            // 첫번째 제거 문자열을 제외한 전체 문자열
            srcStr = result + srcStr.substring(i+1, srcStr.length);

            // 최종변환 문자열
            rtnStr = srcStr;
        }
    }

    return rtnStr;
}


function press(event) {
    if (event.keyCode==13) {
        fn_egov_get_list('1');
    }
}

function fn_egov_get_list(pageNo) {

    if (document.frm.searchKeyword.value != "") {
        if (document.frm.searchCondition.value == "") {
            alert("검색조건을 선택하세요.");
            document.frm.searchCondition.focus();
            return;
        }
    }

    /* 폼전송 데이타 조립. */
    var startDate = "";
    var endDate = "";
    if (document.frm.searchStartDate.value != "")   {
        startDate = document.frm.searchStartDate.value;
        // startDate = fn_egov_remove_string(startDate,"-");
    }
    if (document.frm.searchEndDate.value != "")   {
        endDate = document.frm.searchEndDate.value;
        // endDate = fn_egov_remove_string(endDate,"-");
    }

    /**  lee.m.j 2010-10-27 추가   **/
    var tmpFromDate = startDate.split("-");
    var tmpEndDate = endDate.split("-");

    var strTmpFromDate = "";
    var strTmpEndDate = "";

    for(var i=0;i<tmpFromDate.length;i++) {
        strTmpFromDate = strTmpFromDate + tmpFromDate[i];
    }

    for(var j=0;j<tmpEndDate.length;j++) {
        strTmpEndDate = strTmpEndDate + tmpEndDate[j];
    }
    /**  lee.m.j 2010-10-27 추가   **/


    document.frm.searchKeywordFrom.value = strTmpFromDate ;
    document.frm.searchKeywordTo.value = strTmpEndDate ;

    /*
        검색조건 체크
    */

    if (document.frm.searchStartDate.value != "" || document.frm.searchEndDate.value != "")   {
        if (document.frm.searchStartDate.value == "") {
            alert("검색시작일자를 입력하세요");
            return ;
        }
        if (document.frm.searchEndDate.value == "") {
            alert("검색종료일자를 입력하세요");
            return ;
        }
        if(isDate(document.frm.searchStartDate.value, "조회시작일자") == false) {
            return;
        }

        if(isDate(document.frm.searchEndDate.value, "조회종료일자") == false) {
            return;
        }

        /*
        if(document.frm.searchKeywordFrom.value > document.frm.searchKeywordTo.value) {
            alert("검색종료시각가 검색시작시각보다 빠를수 없습니다.");
            return ;
        }*/

        /**  lee.m.j 2010-10-27 추가   **/
        if(strTmpFromDate.length != 8 || strTmpEndDate.length != 8 || !checknum(strTmpFromDate) || !checknum(strTmpEndDate)) {
            alert("날짜 형식이 잘못되었습니다");
            return;
        } else {
            if(strTmpFromDate > strTmpEndDate) {
                alert("시작일자는 종료일자보다 클 수 없습니다");
                return;
            }
        }
        /**  lee.m.j 2010-10-27 추가   **/
    }

    document.frm.pageIndex.value = pageNo;
    document.frm.action = "<c:url value='/sym/bat/getBatchResultList.do'/>";
    document.frm.submit();
}

function checknum(number) {

    var rtnMsg = true;
    var pattern = /^[0-9]+$/;

    if(!pattern.test(number)) {
        rtnMsg = false;
    }

    return rtnMsg;
}

function fn_egov_get_detail_view(batchResultId) {
    document.frm.batchResultId.value = batchResultId;
    document.frm.action = "<c:url value='/sym/bat/getBatchResult.do'/>";
    document.frm.submit();
}
</script>
</head>
<body onLoad="fn_egov_init();">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:712px">

    <form name="frm" id="frm" action="<c:url value='/sym/bat/getBatchResultList.do'/>" method="post">
    <table width="100%" cellpadding="8" class="table-search" border="0" summary="제목테이블.">
     <tr>
      <td width="35%"class="title_left">
       <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;배치결과 목록</h1>
      </td>
     </tr>
    </table>
    <table width="100%" cellpadding="8" class="table-search" border="0" summary="리스트 조회기능을 제공한다.">
      <tr>
        <td>
            <select name="searchCondition" class="select" title="검색조건구분">
                <option value=''>--선택하세요--</option>
                <option value="0" <c:if test="${searchVO.searchCondition == '0'}">selected="selected"</c:if> >배치작업명</option>
                <option value="1" <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if> >배치스케줄ID</option>
           </select>
           <input name="searchKeyword" type="text" size="15" value='<c:out value="${searchVO.searchKeyword}"/>' maxlength="35" title="검색키워드"  onKeyDown="press(event);" >
        </td>
        <td>
                                실행시작일자:
            <input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
            <input type="text" name="searchStartDate" size="10" title="검색시작일자" >
            <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar( frm,'',  frm.searchStartDate );return false;">
            <img src="<c:url value='/images/egovframework/com/sym/cal/bu_icon_carlendar.gif' />"  style="vertical-align: middle; border:0px" alt="달력창팝업버튼이미지">
            </a>
        ~
            <input type="text" name="searchEndDate" size="10" title="검색종료일자">
            <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar( frm, '', frm.searchEndDate );">
            <img src="<c:url value='/images/egovframework/com/sym/cal/bu_icon_carlendar.gif' />"  style="vertical-align: middle; border:0px" alt="달력창팝업버튼이미지">
            </a>
        </td>
        <td>
            <select name=sttus class="select" title="검색조건구분">
                <option value='00'>전체</option>
                <option value="01" <c:if test="${searchVO.sttus == '01'}">selected="selected"</c:if> >정상</option>
                <option value="02" <c:if test="${searchVO.sttus == '02'}">selected="selected"</c:if> >비정상</option>
                <option value="03" <c:if test="${searchVO.sttus == '03'}">selected="selected"</c:if> >수행중</option>
           </select>
        </td>
        <td width="3%" align="right">
           <table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_get_list('1'); return false;"></span></td>
            </tr>
           </table>
        </td>
      </tr>
    </table>

    <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}' default="1"/>">
    <input name="searchKeywordFrom" type="hidden" value="<c:out value='${searchVO.searchKeywordFrom}'/>">
    <input name="searchKeywordTo" type="hidden" value="<c:out value='${searchVO.searchKeywordTo}'/>">
    <input name="batchResultId" type="hidden" value="">
    </form>


    <table width="100%" cellpadding="8" class="table-list" summary="배치결과에 대한 목록을 제공합니다.">
     <caption>배치결과 목록</caption>
     <thead>
      <tr>
        <th class="title" width="25%" scope="col" nowrap="nowrap">배치결과ID</th>
        <th class="title" width="20%" scope="col" nowrap="nowrap">배치스케줄ID</th>
        <th class="title" width="20%" scope="col" nowrap="nowrap">배치작업명</th>
        <th class="title" width="7%" scope="col" nowrap="nowrap">상태</th>
        <th class="title" width="14%" scope="col" nowrap="nowrap">실행시작시각</th>
        <th class="title" width="14%" scope="col" nowrap="nowrap">실행종료시각</th>
      </tr>
     </thead>
     <tbody>
        <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
        <c:if test="${fn:length(resultList) == 0}">
        <tr>
            <td class="lt_text3" colspan="9">
            <spring:message code="common.nodata.msg" />
            </td>
        </tr>
        </c:if>
         <%-- 데이터를 화면에 출력해준다 --%>
        <c:forEach items="${resultList}" var="resultInfo" varStatus="status">
          <tr>
                <td class="lt_text3">
                    <form name="item" method="post" action="<c:url value='/sym/bat/getBatchResult.do'/>">
                        <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
                        <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>">
                        <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>">
                        <input type="hidden" name="batchResultId" value="<c:out value='${resultInfo.batchResultId}'/>">
                        <span class="link"><input type="submit" value="<c:out value='${resultInfo.batchResultId}'/>" onclick="fn_egov_get_detail_view('<c:out value="${resultInfo.batchResultId}"/>'); return false;"></span>
                    </form>
                </td>
                <td class="lt_text3">${resultInfo.batchSchdulId}</td>
                <td class="lt_text6">${resultInfo.batchOpertNm}</td>
                <td class="lt_text3">${resultInfo.sttusNm}</td>
                <td class="lt_text">
                    <fmt:parseDate value="${resultInfo.executBeginTime}" pattern="yyyyMMddHHmmss" var="tempDate"/>
                    <fmt:formatDate value="${tempDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
                <td class="lt_text">
                    <fmt:parseDate value="${resultInfo.executEndTime}" pattern="yyyyMMddHHmmss" var="tempDate"/>
                    <fmt:formatDate value="${tempDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
          </tr>
        </c:forEach>

     </tbody>
    </table>
    <table width="100%" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
      <tr>
        <td height="10"></td>
      </tr>
    </table>
    <div align="center">
        <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_get_list" />
    </div>
</div>

</body>
</html>