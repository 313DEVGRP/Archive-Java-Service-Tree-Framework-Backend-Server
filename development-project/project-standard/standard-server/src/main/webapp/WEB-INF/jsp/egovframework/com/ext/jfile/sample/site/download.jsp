<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ page session="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.egovframe.go.kr/tags/ext/jfile/jsp" prefix="jwork"%>

<html>
<head>
	<title>JFile</title>
	<style>
		body {margin: 0;padding: 0;width: 100%;	font: 14px/1.4em Verdana, Arial, sans-serif;}
		fieldset {margin: 20px 10px;padding: 10px 10px 10px 10px; }
	</style>
	
	<link href="<c:url value="/resource/jfile/swfupload/css/custom.css" />" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<c:url value="/resource/jfile/jquery/1.3.2/jquery-1.3.2.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resource/jfile/json.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resource/jfile/jwork/jwork.fileUpload.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resource/jfile/jwork/jwork.fileDownload.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resource/jfile/swfupload/swfupload/swfupload.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resource/jfile/swfupload/js/swfupload.queue.js" />"></script>

	<link href="<c:url value="/resource/jfile/jqueryui/1.8/themes/base/jquery.ui.all.css" />" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="<c:url value="/resource/jfile/jqueryform/2.4/jquery.form.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resource/jfile/jqueryui/1.8/jquery.ui.core.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resource/jfile/jqueryui/1.8/jquery.ui.widget.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resource/jfile/jqueryui/1.8/jquery.ui.tabs.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resource/jfile/json2.js" />"></script>
	
	<script type="text/javascript" src="<c:url value="/resource/jfile/sample/site/site.js" />"></script>
	
	<script type="text/javascript">
	var maxTime = 0;
	window.onload=function() {
		maxTime = <%=request.getSession().getMaxInactiveInterval()%>
		updateTime();
	};
	
	function loadDownload() {
		var fileId= document.downloadForm.fileId.value;
		fileDownloadObj1.setFileId(fileId);
		fileDownloadObj1.refresh();
	}
	
	</script>
</head>
<body>
<form id="downloadForm" name="downloadForm">
<br/>
<h1>&nbsp;<span style="width:400px;">&nbsp;</span> 세션 만료 시간 : <span id="time"></span> 초 &nbsp;&nbsp; <input type="button" value="세션타임아웃시간 10초로 줄이기" onclick="cutdownSessionLimitTime('<%=request.getContextPath()%>');"></h1>

다운로드 할 File ID : <input type="text" id="fileId" name="fileId" value="139ae6c750348"/> <input type="button" value="조회" onclick="loadDownload()"/>
<div id="simple">
	<fieldset>
	<legend><b>파일 다운로드1</b>
	
	</legend>
		<jwork:filedownloader				
		       objectId="fileDownloadObj1"
		       fileId="fileId"
		       usePreview="true"
		       useSecurity="false"
		       uploadMode="db"
		       />
		<input type="button" onclick="send2()" value="전송" style="width: 110px; height: 24px; font-size: 11px"/>		
	</fieldset>
</div>
</form>
</body>
</html>