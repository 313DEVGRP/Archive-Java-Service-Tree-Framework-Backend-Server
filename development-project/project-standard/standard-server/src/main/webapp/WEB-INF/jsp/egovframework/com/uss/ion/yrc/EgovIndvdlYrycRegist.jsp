<%
/**
 * @Class Name : EgovIndvdlYrycRegist.java
 * @Description : EgovIndvdlYrycRegist.jsp
 * @Modification Information
 * @
 * @  수정일        수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2014.11.14    표준프레임워크         최초 생성
 *
 *  @author 표준프레임워크
 *  @since 2014.11.14
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2014 by MOPAS  All right reserved.
 */
%>

<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"        uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="form"      uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring"    uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <title>개인연차관리 등록</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
    <style type="text/css">
        h1 {font-size:12px;}
        caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
    </style>
    
    <script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
    <validator:javascript formName="indvdlYrycManage" staticJavascript="false" xhtml="true" cdata="false"/>
    <script type="text/javaScript" language="javascript">
        function fnIndvdYrycMangeList() {
        	var varForm = document.getElementById("indvdlYrycManage");
        	varForm.action = "<c:url value='/uss/ion/yrc/EgovIndvdlYrycManageList.do'/>";
        	varForm.submit();
        }
        
        function fnRegistIndvdYrycMange() {
        	var varForm = document.getElementById("indvdlYrycManage");
            if(!validateIndvdlYrycManage(varForm)){       
                return;
            }else{
            	varForm.action = "<c:url value='/uss/ion/yrc/EgovIndvdlYrycRegist.do'/>";
            	varForm.submit();
            }
        }
        
        function fnDeleteIndvdYrycMange() {
        	var varForm = document.getElementById("indvdlYrycManage");
        	varForm.action = "<c:url value='/uss/ion/yrc/deleteIndvdlYryc.do'/>";
            if(confirm("<spring:message code='common.delete.msg' />")){
            	varForm.submit();
            }
        }
        
    </script>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">

    <form:form commandName="indvdlYrycManage" action="">
        <form:hidden path="occrrncYear" value="${indvdlYrycManage.occrrncYear}"/>
    
        <table width="700" cellpadding="8" class="table-search" border="0">
            <tr>
                <td width="40%" class="title_left">
                    <h1>
                        <img src="/images/egovframework/com/cmm/icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;개인연차관리 목록
                    </h1>
                </td>
                <td align="right">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>
                                <span class="button"><input type="submit" value='<spring:message code="button.list" />' onclick="fnIndvdYrycMangeList(); return false;"/></span>
                            </td>
                            <td width="10"></td>
                            <c:choose>
                               <c:when test="${totCnt <= 0}">
                                    <td>
                                        <span class="button"><input type="submit" value='<spring:message code="button.create" />' onclick="fnRegistIndvdYrycMange(); return false;"/></span>
                                    </td>
                               </c:when>
                               <c:otherwise>
                                    <td>
                                        <span class="button"><input type="submit" value='<spring:message code="button.delete" />' onclick="fnDeleteIndvdYrycMange(); return false;"/></span>
                                    </td>
                                    <td width="10"></td>
                                    <td>
                                        <span class="button"><input type="submit" value='<spring:message code="button.update" />' onclick="fnRegistIndvdYrycMange(); return false;"/></span>
                                    </td>
                               </c:otherwise>
                            </c:choose>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table width="700" cellpadding="0" class="table-list" border="0"  summary="개인연차관리 목록으로 발생연도 발생연차 사용연차 잔여연차 사용자로 구성" >
            <caption>개인연차관리 목록</caption>
            <thead>
                <tr>  
                    <th class="title" width="15%" scope="col">발생연도</th>
                    <th class="title" width="15%" scope="col">발생연차<form:errors path="occrncYrycCo" /></th>
                    <th class="title" width="15%" scope="col">사용연차<form:errors path="useYrycCo" /></th>
                    <th class="title" width="15%" scope="col">잔여연차</th>
                    <th class="title" width="30%" scope="col">사용자</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${resultList}" var="resultInfo" varStatus="status">
                <tr>
                    <td class="lt_text3" nowrap><c:out value="${indvdlYrycManage.occrrncYear}"/></td>
                    <td class="lt_text3" nowrap><input name="occrncYrycCo" type="text" size="10" value='<c:out value="${resultInfo.occrncYrycCo}"/>' maxlength="10" title="연차등록"></td>
                    <td class="lt_text3" nowrap><input name="useYrycCo" type="text" size="10" value='<c:out value="${resultInfo.useYrycCo}"/>' maxlength="10" title="사용연차등록"></td>
                    <td class="lt_text3" nowrap><c:out value="${resultInfo.remndrYrycCo}"/></td>
                    <td class="lt_text3" nowrap><c:out value="${resultInfo.mberNm}"/></td>
                </tr>
                </c:forEach>
                <c:if test="${fn:length(resultList) == 0}">
                    <tr>
                        <td class="lt_text3" nowrap><c:out value="${indvdlYrycManage.occrrncYear}"/></td>
                        <td class="lt_text3" nowrap><input name="occrncYrycCo" type="text" size="10" value="" maxlength="10" title="연차등록"></td>
                        <td class="lt_text3" nowrap><input name="useYrycCo" type="text" size="10" value="" maxlength="10" title="사용연차등록"></td>
                        <td class="lt_text3" nowrap>없음</td>
                        <td class="lt_text3" nowrap><c:out value="${indvdlYrycManage.mberNm}"/></td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </form:form>
</div>
<div>
    <h1>* 개인연차 등록/수정시 발생연도는 해당연도로 변경되어 저장됨</h1>
</div>
</body>
</html>
