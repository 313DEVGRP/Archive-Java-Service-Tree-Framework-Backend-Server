<%--
  Class Name : EgovBackupOpertUpdt.jsp
  Description : 백업작업수정 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2010.09.03    김진만          최초 생성

    author   : 공통서비스 개발팀 김진만

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>백업작업수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js' />"></script>
<validator:javascript formName="backupOpert" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init(){
    var varForm = document.getElementById("backupOpert");
    var executSchdulMonth = varForm.executSchdulDe.value.substring(4,6);
    var executSchdulDay = varForm.executSchdulDe.value.substring(6,8);

    for (var i = 0; i < varForm.executSchdulMonth.length; i++) {
        if (varForm.executSchdulMonth[i].value == executSchdulMonth) {
            varForm.executSchdulMonth[i].selected = true;
            break;
        }
    }

    for (var i = 0; i < varForm.executSchdulDay.length; i++) {
        if (varForm.executSchdulDay[i].value == executSchdulDay) {
            varForm.executSchdulDay[i].selected = true;
            break;
        }
    }


    if ( varForm.executCycle.value == "05" )  {
      // 실행주기가 한번만일때 실행스케줄일자값 설정.
      varForm.executSchdulDeNm.value = varForm.executSchdulDe.value.substring(0,4) + '-' + varForm.executSchdulDe.value.substring(4,6) + '-' + varForm.executSchdulDe.value.substring(6,8);
    }

    fn_egov_executCycleOnChange();
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

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_get_list(){
    var varForm = document.getElementById("backupOpert");
    varForm.action = "<c:url value='/sym/sym/bak/getBackupOpertList.do' />";
    varForm.submit()
}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save(){
    var varForm = document.getElementById("backupOpert");
    varForm.action = "<c:url value='/sym/sym/bak/updateBackupOpert.do' />";


    if(!confirm("<spring:message code='common.save.msg' />") ){
      return ;
    }


    // 실행스케줄일자 validation체크
    if (varForm.executCycle.value == "02") {
      var i = 0;
      for (i = 0 ; i < varForm.executSchdulDfkSes.length; i++) {
        if (varForm.executSchdulDfkSes[i].checked == true) {
          break;
        }
      }
      if (i == varForm.executSchdulDfkSes.length) {
        alert("실행주기를 매주로 선택했을 때 요일은 필수 입력값입니다.");
        return ;
      }
    }

    if (varForm.executCycle.value == "03") {
        if (varForm.executSchdulDay.value == "") {
            alert("실행주기가 매월일때 실행스케줄일은(는) 필수 입력값입니다.");
             return ;
        }
    }
    if (varForm.executCycle.value == "04") {
        if (varForm.executSchdulMonth.value == "")   {
            alert("실행주기가 매년일때 실행스케줄월은(는) 필수 입력값입니다.");
             return ;
        }
        if (varForm.executSchdulDay.value == "") {
            alert("실행주기가 매년일때 실행스케줄일은(는) 필수 입력값입니다.");
             return ;
        }

        // 2월 29일도 입력가능하도록 윤년인 해를 년도값으로 사용
        if (!checkDate('0400', varForm.executSchdulMonth.value, varForm.executSchdulDay.value, "실행스케줄월, 일이 유효하지 않습니다."))   {
             return ;
        }

    }
    if ( varForm.executCycle.value == "05" )  {
        // 스케줄주기가 한번만일때 스케줄일자값이 존재해야 한다.
        if (varForm.executSchdulDeNm.value == "")   {
            alert("실행주기가 한번만일때 실행스케줄일자은(는) 필수 입력값입니다.");
             return ;
        }
        if (!isDate(varForm.executSchdulDeNm.value, "실행스케줄일자가 유효하지 않습니다."))   {
             return ;
        }
    }

    /* 폼전송 데이타 조립. */
    var executSchdulDe = "";
    if (varForm.executCycle.value == "03") {
      executSchdulDe = '0000' + '00' + varForm.executSchdulDay.value;
    } else if (varForm.executCycle.value == "04") {
      executSchdulDe = '0000' + varForm.executSchdulMonth.value + varForm.executSchdulDay.value;
    } else if ( varForm.executCycle.value == "05" ) {
      executSchdulDe = varForm.executSchdulDeNm.value;
      executSchdulDe = fn_egov_remove_string(executSchdulDe,"-");
    }
    varForm.executSchdulDe.value = executSchdulDe;

    if(!validateBackupOpert(varForm)){
        return;
    }else{
        varForm.submit();
    }

}

/* ********************************************************
 * executCycle onChange 이벤트 핸들러
 ******************************************************** */
function fn_egov_executCycleOnChange() {

    var varForm = document.getElementById("backupOpert");
    var i = 0;
    if (varForm.executCycle.value == "01") {
        // 실행주기가 매일인 경우
        fn_egov_displayExecutSchdulSpan(false, false, false, false, true);
        fn_egov_clearExecutSchdulValue(true, true, true, true, false);

    } else if (varForm.executCycle.value == "02") {
        // 실행주기가 매주인 경우
        fn_egov_displayExecutSchdulSpan(false, false, false, true, true);
        fn_egov_clearExecutSchdulValue(true, true, true, false, false);

    } else if (varForm.executCycle.value == "03") {
        // 실행주기가 매월인 경우
        fn_egov_displayExecutSchdulSpan(false, false, true, false, true);
        fn_egov_clearExecutSchdulValue(true, true, false, true, false);

    } else if (varForm.executCycle.value == "04") {
        // 실행주기가 매년인 경우
        fn_egov_displayExecutSchdulSpan(false, true, true, false, true);
        fn_egov_clearExecutSchdulValue(true, false, false, true, false);

    } else if (varForm.executCycle.value == "05") {
        // 실행주기가 한번만인 경우
        fn_egov_displayExecutSchdulSpan(true, false, false, false, true);
        fn_egov_clearExecutSchdulValue(false, true, true, true, false);
    }

}

/* ********************************************************
 * 실행스케줄관련 SPAN Visibility 조절 함수
 ******************************************************** */
function fn_egov_displayExecutSchdulSpan(bYyyyMMdd, bMonth, bDay, bDfk, bHHmmss) {
  if (bYyyyMMdd) {
    spnYyyyMMdd.style.visibility ="visible";
    spnYyyyMMdd.style.display ="inline";
  } else {
    spnYyyyMMdd.style.visibility ="hidden";
    spnYyyyMMdd.style.display ="none";
  }

  if (bMonth) {
    spnMonth.style.visibility ="visible";
    spnMonth.style.display ="inline";
  } else {
    spnMonth.style.visibility ="hidden";
    spnMonth.style.display ="none";
  }

  if (bDay) {
    spnDay.style.visibility ="visible";
    spnDay.style.display ="inline";
  } else {
    spnDay.style.visibility ="hidden";
    spnDay.style.display ="none";
  }

  if (bDfk) {
    spnDfk.style.visibility ="visible";
    spnDfk.style.display ="inline";
  } else {
    spnDfk.style.visibility ="hidden";
    spnDfk.style.display ="none";
  }

  if (bHHmmss) {
    spnHHmmss.style.visibility ="visible";
    spnHHmmss.style.display ="inline";
  } else {
    spnHHmmss.style.visibility ="hidden";
    spnHHmmss.style.display ="none";
  }

}

/* ********************************************************
 * 실행스케줄관련 컴포넌트 값 clear 함수
 ******************************************************** */
function fn_egov_clearExecutSchdulValue(bYyyyMMdd, bMonth, bDay, bDfk, bHHmmss) {
   var varForm = document.getElementById("backupOpert");
  if (bYyyyMMdd) {
    executSchdulDeNm = "";
  }

  if (bMonth) {
    varForm.executSchdulMonth[0].selected = true;
  }

  if (bDay) {
    varForm.executSchdulDay[0].selected = true;
  }

  if (bDfk) {
    // 실행스케줄 요일 값 클리어
    for (var i = 0 ; i < varForm.executSchdulDfkSes.length; i++) {
        varForm.executSchdulDfkSes[i].checked = false;
    }
  }

  if (bHHmmss) {
    // 시분초는 클리어 할 필요가 없다.

  }

}

</script>
</head>
<body onLoad="fn_egov_init();">
<DIV id="content" style="width:712px">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 상단타이틀 -->
<form:form commandName="backupOpert"  action="<c:url value='/sym/sym/bak/updateBackupOpert.do' />" method="post">

<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}' default="1"/>"/>
<!-- 히든 속성 -->
<input type="hidden" name="executSchdulDe" value="<c:out value='${backupOpert.executSchdulDe}'/>"/>

<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0" summary="상단 타이틀을 제공한다.">
 <tr>
  <td width="100%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;백업작업 수정</h1></td>
 </tr>
</table>
<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
<tr>
    <td height="3px"></td>
</tr>
</table>
<!--  등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="백업작업수정을 위한 테이블.">
  <caption>백업작업 수정</caption>
  <tr>
    <th width="15%" height="23" class="required_text" scope="row" nowrap ><label for="backupOpertId">백업작업ID</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td width="85%" nowrap>
        <form:input path="backupOpertId" size="20" maxlength="20" readonly="true"  cssClass="readOnlyClass"/>
        <form:errors path="backupOpertId" cssClass="error" />
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" scope="row" nowrap ><label for="backupOpertNm">백업작업명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td>
        <form:input path="backupOpertNm" size="60" maxlength="60" />
        <form:errors path="backupOpertNm" cssClass="error" />
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" scope="row" nowrap ><label for="backupOrginlDrctry">백업원본디렉토리</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td>
        <form:input path="backupOrginlDrctry" size="100" maxlength="255" />
        <form:errors path="backupOrginlDrctry" cssClass="error" />
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" scope="row" nowrap ><label for="backupStreDrctry">백업저장디렉토리</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td>
        <form:input path="backupStreDrctry" size="100" maxlength="255" />
        <form:errors path="backupStreDrctry" cssClass="error" />
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" scope="row" nowrap ><label for="executCycle">실행주기</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td>
         <form:select path="executCycle" onchange="javascript:fn_egov_executCycleOnChange(); return false;" cssStyle="padding:0px">
             <form:options items="${executCycleList}" itemValue="code" itemLabel="codeNm"/>
         </form:select>
         <form:errors path="executCycle" cssClass="error"/>
        <span id="spnYyyyMMdd">
        <input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
        <input name="executSchdulDeNm" id="executSchdulDeNm" type="text" size="10" maxlength="10" title="실행스케줄일자" readonly="readonly">
        <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar( backupOpert,'',  backupOpert.executSchdulDeNm ); return false;">
        <img src="/images/egovframework/com/sym/cal/bu_icon_carlendar.gif"  style="vertical-align: middle; border:0px" alt="달력창팝업버튼이미지">
        </a>
        </span>
        <span id="spnMonth">
            <select name="executSchdulMonth" id="executSchdulMonth" title="실행스케줄월">
                <option value="" selected="selected" >선택</option>
                <c:forEach var="i" begin="1" end="12" step="1">
                  <c:if test="${i < 10}"><option value="0${i}">0${i}</option></c:if>
                  <c:if test="${i >= 10}"><option value="${i}">${i}</option></c:if>
                </c:forEach>
            </select>
            월
          </span>
          <span id="spnDay">
            <select name="executSchdulDay" id="executSchdulDay" title="실행스케줄일">
                <option value="" selected="selected">선택</option>
                <c:forEach var="i" begin="1" end="31" step="1">
                  <c:if test="${i < 10}"><option value="0${i}">0${i}</option></c:if>
                  <c:if test="${i >= 10}"><option value="${i}">${i}</option></c:if>
                </c:forEach>
            </select>
        일
        </span>
        <span id="spnDfk">
        <form:checkboxes path="executSchdulDfkSes" items="${executSchdulDfkSeList}" itemValue="code" itemLabel="codeNm" cssClass="check2"  cssStyle="padding:0px; vertical-align : middle;"/>
        <form:errors path="executSchdulDfkSes" cssClass="error"/>
        </span>
        <span id="spnHHmmss">
        <form:select path="executSchdulHour" title="실행스케줄시" cssStyle="padding:0px">
            <form:options items="${executSchdulHourList}" />
        </form:select>
        <form:errors path="executSchdulHour" cssClass="error"/>
                    시
        <form:select path="executSchdulMnt" title="실행스케줄분" cssStyle="padding:0px">
            <form:options items="${executSchdulMntList}" />
        </form:select>
        <form:errors path="executSchdulMnt" cssClass="error"/>
                    분
        <form:select path="executSchdulSecnd"  title="실행스케줄초" cssStyle="padding:0px">
            <form:options items="${executSchdulSecndList}" />
        </form:select>
        <form:errors path="executSchdulSecnd" cssClass="error"/>
                     초
        </span>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" nowrap ><label for="cmprsSe">압축구분</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td>
         <form:select path="cmprsSe" >
             <form:options items="${cmprsSeList}" itemValue="code" itemLabel="codeNm"/>
         </form:select>
         <form:errors path="cmprsSe" cssClass="error"/>
    </td>
  </tr>

</table>
<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
<tr>
    <td height="10"></td>
</tr>
</table>
<center>
<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center" summary="목록/저장 버튼을 제공한다.">
<tr>
    <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_save(); return false;"></span></td>
    <td>&nbsp;&nbsp;</td>
    <td>
        <span class="button">
        <a href="<c:url value='/sym/sym/bak/getBackupOpertList.do'>
                 </c:url>"
           onclick="fn_egov_get_list(); return false;"><spring:message code="button.list" /></a>
        </span>
    </td>
</tr>
</table>
</center>
</form:form>
</DIV>

</body>
</html>