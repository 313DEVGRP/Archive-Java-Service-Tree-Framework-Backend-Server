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
	
</head>

<body>
<br/>
<h1>JFILE-SHOWCASE</h1>
<p>jfile 컴포넌트의 사용예제 입니다.</p>
<div id="tabs">
	<ul>
		<li><a href="#jfileIntro">JFile 이란?</a></li>
		<li><a href="#gettingStarted">Getting Started</a></li>
		<li><a href="#api">API</a></li>
		<li><a href="#options">Options</a></li>
		<li><a href="#configuration">Configuration</a></li>
		<li><a href="#simple">Example</a></li>
<!-- 		<li><a href="#talk">Egov 에 바라는 점</a></li> -->
    </ul>
    <div id="jfileIntro">
		<h2>OverView</h2>
		<p>
			- jfile 업/다운로드 컴포넌트는 AJAX 기반의 업그레이드 된  기술로 개발자들이 쉽게 파일 업로드 컴포넌트를 다룰 수 있도록 해 줍니다. 
			SI 프로젝트에서 빈번히 요구하는 보안 지침 사항, 또는 사용자 편의성에 의거하여 다양한 요구사항이 나올 때 여러분들이 클래스 수정없이 단순한 설정 값 변경만으로 반영 할 수 있도록
			도와줍니다. 아래 내용은 실제 모 SI 프로젝트 고객에서 요구한 요구사항입니다. jfile 컴포넌트는 아래의 요구사항을 쉽게 적용 할 수 있도록 도와 줍니다. 예를 들어 보안 지침사항 1)번과 사용자편의성 7)번 만 적용 하고자 할 경우  클래스 수정 없이 설정값 변경으로 쉽게 반영 할 수 있습니다.
			
		</p>
		<p>
			- 본 공통컴포넌트는 표준프레임워크 오픈커뮤니티 슈퍼개발자K(2012년 개최) 우승 프로젝트인 "대용량 파일 업다운로드/암호화 프로젝트"(정호열 커미터)를 표준프레임워크 공통컴포넌트로 적용하여 제공합니다.
			<br/>
			- 참조 : http://open.egovframe.go.kr/cop/bbs/selectProjectArticle.do?projId=8&projTyCode=PROJ02
		</p>
		<br/>
		<h5>&lt;보안지침사항&gt;</h5>
		
		<ul>
			<li><a>1) 회원이 업로드한 파일 위치가 DMZ 영역에 있을 경우에는 파일자체를 암호화 해야함. </a></li>
			<li><a>2) 파일 암호화 알고리즘은 고객사가 신뢰 할 수 있는 알고리즘으로 쉽게 변경 가능해야 함. </a></li>
			<li><a>3) 파일이 관리되는 각각의 고객사 폴더별로 암호화 알고리즘을 변경 해야 할 시에도 조치 가능해야 함. </a></li>
			<li><a>4) 파일명을 암호화 해야 함. </a></li>
		</ul>
		<br/>
		<h5>&lt;사용자편의성&gt;</h5>
		<ul>
			<li><a>1) 크로스 부라우징을 지원해야 함.</a></li>
			<li><a>2) ajax 기반으로 동작해야 함. </a></li>
			<li><a>3) 파일 선택시 다중 선택이 가능해야 함. </a></li>
			<li><a>4) 파일이 업로드 될 때 progressbar 의 움직임으로 업로드 진행상황을 확인 할 수 있어야 함. </a></li>
			<li><a>5) 이미지파일인 경우 파일을 다운받기 전에 미리보기(preview) 가능해야 함. </a></li>
			<li><a>6) 다운받을 파일이 복수개 일 경우 한번에 압축하여 다운로드 받을 수 있어야 함. </a></li>
			<li><a>7) 해당업무별로 파일저장 경로를 다르게 관리 할 수 있어야 함. </a></li>
		</ul>
		
		<br/>
		<h5>&lt;고객 접근 통계&gt;</h5>
		<ul>
			<li><a>1) 다운로드 시 다운로드 건수 이력을 남겨야 함.</a></li>
		</ul>
		
		<br/>
		<h5>&lt;이슈 사항&gt;</h5>
		<ul>
			<li><a>1) 회원수 증가로 인해 월별로 생성해 놓은  디렉터리가  파일 30만건 이상 일 경우 더 이상 파일을 업로드 할수 없음.</a></li>
			<li><a>2) 서버에 파일이 저장되는 root 폴더의 위치를 업무마다 다르게 저장하고 해야함. 예) 신한은행 : /app/s001, 대민시스템 : /app/k001, 내부시스템 : /app/w001.</a></li>
			<li><a>3) 시스템구성환경이 복수개의 WebServer(아파치, Webtobe...) 와 복수개의 WAS(웹로직,웹스피어...) 로
          			구성 되어 있을경우 파일업로드 완료 시점에 ftp 또는 sftp 를 통해 웹서버로 전송되야 함.
          			(이미지는 웹서버에서 &lt;img src="이미지 URL"/&gt; 형태로 사용하기 때문. 이미지를  웹서버로 전송하지 않고 WAS 에서 byte[] 형태로 서비스 할 수 있게 해주는 방법으로 구현했다가 
          			 로드러너로  부하테스트 시 CPU, Memory 과다 부하로   WAS 가 죽어 버림. 즉 파일 완료시점에 사용자가 핸들링 할 수 있는 User 이벤트를 제공해야 함.) </a></li>
		</ul>
	</div>
    <div id="gettingStarted">
		<h2>Getting Started</h2>
		<br/>
		<h5>&lt;관련 설정&gt;</h5>
		
		<ul>
			<li><a>1) 테이블 생성을 합니다. 테이블 생성 스크립트 위치 : ([프로젝트루트폴더]/docs/J_ATTACHFILE.sql) </a>
				<fieldset>
					<legend><b>Table Script (altibase, oracle, tibero 등)</b></legend>
					<pre>
CREATE TABLE J_ATTACHFILE 
(
	FILE_ID VARCHAR2(13) NOT NULL,
	FILE_SEQ INTEGER NOT NULL,
	FILE_NAME VARCHAR2(100) NOT NULL,
	FILE_SIZE INTEGER,
	FILE_MASK VARCHAR2(100),
	DOWNLOAD_COUNT INTEGER,
	DOWNLOAD_EXPIRE_DATE VARCHAR2(8),
	DOWNLOAD_LIMIT_COUNT INTEGER,
	REG_DATE DATE,
	DELETE_YN VARCHAR2(1),
CONSTRAINT  J_ATTACHFILE_PK PRIMARY KEY (FILE_ID, FILE_SEQ)
);					
</pre>
				</fieldset>
				
				<fieldset>
					<legend><b>Table Script (cubrid 등)</b></legend>
					<pre>
CREATE TABLE J_ATTACHFILE 
(
	FILE_ID VARCHAR(13) NOT NULL,
	FILE_SEQ INTEGER NOT NULL,
	FILE_NAME VARCHAR(100) NOT NULL,
	FILE_SIZE INTEGER,
	FILE_MASK VARCHAR(100),
	DOWNLOAD_COUNT INTEGER,
	DOWNLOAD_EXPIRE_DATE VARCHAR(8),
	DOWNLOAD_LIMIT_COUNT INTEGER,
	REG_DATE DATETIME,
	DELETE_YN VARCHAR(1),
CONSTRAINT  J_ATTACHFILE_PK PRIMARY KEY (FILE_ID, FILE_SEQ)
);				
</pre>	     
				</fieldset>				

				<fieldset>
					<legend><b>Table Script (mysql 등)</b></legend>
					<pre>
CREATE TABLE J_ATTACHFILE 
(
	FILE_ID VARCHAR(13) NOT NULL,
	FILE_SEQ INT NOT NULL,
	FILE_NAME VARCHAR(100) NOT NULL,
	FILE_SIZE INT,
	FILE_MASK VARCHAR(100),
	DOWNLOAD_COUNT INT,
	DOWNLOAD_EXPIRE_DATE VARCHAR(8),
	DOWNLOAD_LIMIT_COUNT INT,
	REG_DATE DATETIME,
	DELETE_YN VARCHAR(1),
PRIMARY KEY (FILE_ID, FILE_SEQ)
);

CREATE UNIQUE INDEX J_ATTACHFILE_PK ON J_ATTACHFILE
(
	FILE_ID, FILE_SEQ
);		
</pre>	     
				</fieldset>						
			</li>
			<li><a>2) AJAX 처리를 위하여 BeanNameViewResolver 등록이 필요합니다. (WEB-INF/config/egovframework/springmvc/egov-com-serlvet.xml 참조)</a>
			<fieldset>
					<legend><b>BeanNameViewResolver</b></legend>

			&lt;bean class="org.springframework.web.servlet.view.BeanNameViewResolver" p:order="0"/&gt;

			</li>

		</ul>
		
	</div>
	<div id="api">
		<h2>JFile API</h2>
		<p>
			- JFile API 는 개발자가 직접 JFileController 에 메서드를 추가해야 하거나 변경해야 할 경우 JFileService API 를 사용해야 합니다.
			    아래의 내용은 JFile V1.0 버전에서 제공하는 JFileService API 목록입니다.
		</p>
		<br/>
		
		<ul>
			<li><a>
			 /* <br/>
	          * 파일을 업로드 한다.<br/>
			  * @param fileId 파일 아이디.<br/>
			  * @param multipartFile 멀티파트 파일.<br/>
			  * @param uploadPath 업로드 경로.<br/>
			  * @param fileSeqs 파일 시퀀스 목록.<br/>
			  */<br/>
			  public void upload(String fileId, MultipartFile multipartFile, String uploadPath, Object[] fileSeqs) ;</a></li>
			  
			<br/>
			<li><a>			 
			 /*<br/>
			  * 파일을 업로드 한다.<br/>
			  * @param fileId 파일 아이디.<br/> 
			  * @param multipartFile 멀티파트 파일.<br/>
			  * @param uploadPath 업로드 경로.<br/>
			  */<br/>
			  public void upload(String fileId, MultipartFile multipartFile, String uploadPath) ;<br/>
			</a></li>
			
			<br/>			  
			<li><a>			 
			 /*<br/>
			  * 파일을 업로드 한다.<br/>
			  * @param fileId 파일아이디.<br/>
			  * @param multipartFile 멀티파트 파일.<br/>
			  * @param fileSeqs 파일 시퀀스 목록.<br/>
			  */<br/>
			  public void upload(String fileId, MultipartFile multipartFile, Object[] fileSeqs) ;<br/>
			</a></li>
			
			<br/>
			<li><a>			 
			 /*<br/>
			  * 파일을 업로드 한다.<br/>
			  * @param fileId 파일아이디.<br/>
			  * @param multipartFile 멀티파트 파일.<br/>
			  */<br/>
			  public void upload(String fileId, MultipartFile multipartFile) ;<br/>
			</a></li>
			
			<br/>
			<li><a>			 
			 /*<br/>
			  * 파일을 업로드 한다.<br/>
			  * @param fileId 파일 아이디.<br/>
			  * @param multipartFiles 멀티파트 파일.<br/>
			  * @param uploadPath 업로드 경로.<br/>
			  * @param fileSeqs 파일 시퀀스 목록.<br/>
			  */<br/>
			public void upload(String fileId, Collection&lt;MultipartFile&gt; multipartFiles, String uploadPath, Object[] fileSeqs) ;<br/>
			</a></li>
			
			<br/>
			<li><a>			 
			 /*<br/>
			  * 파일을 업로드 한다.<br/>
			  * @param fileId 파일 아이디.<br/>
			  * @param multipartFiles 멀티파트 파일.<br/>
			  * @param uploadPath 업로드 경로.<br/>
			  */<br/>
			public void upload(String fileId, Collection&lt;MultipartFile&gt; multipartFiles, String uploadPath) ;<br/>
			</a></li>
			
			<br/>
			<li><a>			 
			 /*<br/>
			  * 파일을 업로드 한다.<br/>
			  * @param fileId 파일 아이디.<br/>
			  * @param multipartFiles 멀티파트 파일.<br/>
			  * @param fileSeqs 파일 시퀀스 목록.<br/>
			  */<br/>
			public void upload(String fileId, Collection&lt;MultipartFile&gt; multipartFiles, Object[] fileSeqs) ;<br/>
			</a></li>
			
			<br/>
			<li><a>			 
			 /*<br/>
			  * 파일을 업로드 한다.<br/>
			  * @param fileId 파일 아이디.<br/>
			  * @param multipartFiles 멀티파트 파일.<br/>
			  */<br/>
			public void upload(String fileId, Collection&lt;MultipartFile&gt;) ;<br/>
			</a></li>
			
			<br/>
			<li><a>			 
			 /*<br/>
			  * 파일을 업로드 한다.<br/>
			  * @param multipartFile 멀티파트 파일.<br/>
			  * @param uploadPath 업로드 경로.<br/>
			  */<br/>
			public void upload(MultipartFile multipartFile, String uploadPath) ;<br/>
			</a></li>
			
			<br/>
			<li><a>			 
			 /*<br/>
			  * 파일을 업로드 한다.<br/>
			  * @param multipartFile 멀티파트 파일.<br/>
			  */<br/>
			public void upload(MultipartFile multipartFile) ;<br/>
			</a></li>
			
			<br/>
			<li><a>			 
			 /*<br/>
			  * 파일을 업로드 한다.<br/>
			  * @param multipartFiles 멀티파트 파일.<br/>
			  * @param uploadPath 업로드 경로.<br/>
			  */<br/>
			public void upload(Collection&lt;MultipartFile&gt; multipartFiles, String uploadPath) ;<br/>
			</a></li>
			
			<br/>
			<li><a>			 
			 /*<br/>
			  * 파일을 업로드 한다.<br/>
			  * @param multipartFiles 멀티파트 파일.<br/>
			  */<br/>
			public void upload(Collection&lt;MultipartFile&gt; multipartFiles) ;<br/>
			</a></li>
			
			<br/>
			<li><a>			 
			 /*<br/>
			  * 파일 아이디를 조회한다.<br/>
			  * @param fileId 파일아이디.<br/>
			  * @param fileSeqs 파일 시퀀스 목록.<br/>
			  * @return String 파일 아이디.<br/>
			  */<br/>
			public String getFileId(String fileId, Object[] fileSeqs);<br/>
			</a></li>
			
			<br/>
			<li><a>			 
			 /*<br/>
			  * 파일 아이디를 조회한다.<br/>
			  * @param fileId 파일아이디.<br/>
			  * @return String 파일 아이디.<br/>
			  */<br/>
			public String getFileId(String fileId);<br/>
			</a></li>
			
			<br/>
			<li><a>			 
			 /*<br/>
			  * 파일 아이디를 조회한다.<br/>
			  * @return String 파일 아이디.<br/>
			  */<br/>
			public String getFileId();<br/>
			</a></li>
			
			<br/>
			<li><a>			 
			 /*<br/>
			  * 파일업로드가 완료된 후 처리 작업을 수행한다.<br/>
			  * @param fileId 파일아이디.<br/>
			  * @param uploadPath 업로드 경로.<br/>
			  */<br/>
			public void executeAfterUploadCompleted(String fileId, String uploadPath);<br/>
			</a></li>
			
			<br/>
			<li><a>			 
			 /*<br/>
			  * 파일업로드가 완료된 후 처리 작업을 수행한다.<br/>
			  * @param fileId 파일아이디.<br/>
			  */<br/>
			public void executeAfterUploadCompleted(String fileId);<br/>
			</a></li>
			
			<br/>
			<li><a>			 
			 /*<br/>
			  * 첨부파일 객체.<br/>
			  * @param filePullPath 디렉터리를 포함한 전체 경로.<br/>
			  * @return File 파일 객체.<br/>
			  */<br/>
			public File getFile(String filePullPath);<br/>
			</a></li>
			
			<br/>
			<li><a>			 
			 /*<br/>
			  * 첨부파일 객체.<br/>
			  * @param fileId 파일 아이디.<br/>
			  * @return File 파일 객체.<br/>
			  */<br/>
			public File getFileBySequence(String fileId);<br/>
			</a></li>
			
			<br/>
			<li><a>			 
			 /*<br/>
			  * 첨부파일 객체.<br/>
			  * @param fileId 파일 아이디.<br/>
			  * @param fileSeq 파일 시퀀스 목록.<br/>
			  * @return File 파일 객체.<br/>
			  */<br/>
			public File getFileBySequence(String fileId);<br/>
			</a></li>
			
			<br/>
			<li><a>			 
			 /*<br/>
			  * 첨부파일 객체.<br/>
			  * @param fileId 파일 아이디.<br/>
			  * @param fileSeq 파일 시퀀스 목록.<br/>
			  * @param filePath 파일 경로.<br/>
			  * @return File 파일 객체.<br/>
			  */<br/>
			public File getFileBySequence(String fileId, String fileSeq, String filePath);<br/>
			</a></li>
			
			<br/>
			<li><a>			 
			 /*<br/>
			  * JFile 객체.<br/>
			  * @param fileId 파일 아이디.<br/>
			  * @return JFile[] 암호화 정보 및 마스킹 파일명을 포함하고 있는 파일 객체.<br/>
			  */<br/>
			public JFile[] getFiles(String fileId);<br/>
			</a></li>
			
			<br/>
			<li><a>			 
			 /*<br/>
			  * JFile 객체.<br/>
			  * @param fileId 파일 아이디.<br/>
			  * @param uploadPath 파일 경로<br/>
			  * @return JFile[] 암호화 정보 및 마스킹 파일명을 포함하고 있는 파일 객체.<br/>
			  */<br/>
			public JFile[] getFiles(String fileId, String uploadPath);<br/>
			</a></li>
		</ul>
	</div>
	<div id="options">
		<h2>Option 설명</h2>
		<p>
			- jfile 업/다운로드 컴포넌트는 태그 라이브러리를 활용하여 개발자 들이 쉽고 빠르게 개발 할 수 있도록 유도합니다. 
			
		</p>
		<br/>
				
		<ul>
			<li><a>Jsp 페이지 상단에 &lt;%@ taglib uri="http://www.egovframe.go.kr/tags/ext/jfile/jsp" prefix="jwork"%&gt; 태그를 추가합니다.
			<fieldset>
			<legend><b>Jsp 태그 라이브러리 부분</b></legend>
			① &lt;jwork:fileuploader<br/> 
		           ②   objectId="fileUploadObj1"<br/>  
		           ③   uploadCompletedEvent="uploadCompleted1"<br/> 
		           ④   beanId="jfileService"<br/>
		           ⑤   fileType="image"<br/>
		           ⑥   maxFileSize="100"<br/>
		           ⑦   maxFileCount="30"<br/>
		           ⑧   usePreview="true"<br/>
		           ⑨   useSecurity="false"<br/>
		           ⑩   uploadMode="db"<br/>
		       /&gt;
		    </fieldset>
		    
		    <fieldset>
			<legend><b>script 부분</b></legend>
			&lt;script&gt;<br/>
			// 전송 버튼 클릭 시<br/>
			function send1(){	<br/>	
				fileUploadObj1.startUpload();<br/>
			}<br/>
			<br/>
			// 태그라이브러리 에서 등록한 업로드 완료 이벤트 함수 명<br/>
			function uploadCompleted1(){<br/>
				fileUploadObj1.refresh();<br/>
			}<br/>
			&lt;/script&gt;
		    </fieldset>
			</a></li>
			
			<li><a>① jwork:fileuploader jfile 태그라이브러리의 접두어 입니다. </a></li>
			<li><a>② objectId="fileUploadObj1" jfile 컴포넌트를 식별 할 수 있는 유일키 오브젝트 아이디 입니다.</a></li>
			<li><a>③ uploadCompletedEvent="uploadCompleted1" jfile 컴포넌트가 파일 업로드를 완료 했을 때 발생하는 이벤트 함수명을 등록합니다.</a></li>
			<li><a>④ beanId="jfileService" 는 [프로젝트루트폴더]/src/main/resources/egovframework/spring/com/context-jfile.xml 등록 되어 있는 beanId 입니다.</a></li>
			<li><a>⑤ fileType="image" 업로드 할 파일 유형 입니다.</a></li>
			<li><a>⑥ maxFileSize="100" 최대로 업로드 할 수 있는 파일사이즈 입니다.</a></li>
			<li><a>⑦ maxFileCount="30" 최대로 업로드 할 수 있는 파일 갯 수 입니다.</a></li>
			<li><a>⑧ usePreview="true" 미리 보기 기능을 show/hide 할 수 있습니다.</a></li>
			<li><a>⑨ useSecurity="false" 파일을 암호화 할지 여부를 지정 할 수 있습니다.</a></li>
			<li><a>⑩ uploadMode="db" 'db', 'file' 모두 두 가지가 있으면 'db' 모드 일 경우에만 파일업로드 완료후 fileId 값을 생성 해 줍니다.</a></li>
		</ul>
		<br/>		
	</div>
	
	<div id="configuration">
		<h2>Configuration 설명</h2>
		<p>
			- Spring 컨테이너가 jfile 에서 서비스 하는 bean 들을 읽어 들일 수 있도록 xml 파일을 설정하는 부분입니다. <br/>
			아래의 경우와 같이 고객사에서 요구하는 상황이 발생 했을시 개발자는 클래스 수정 없이 <font color="red">xml 설정 파일[context-jfile.xml]정보</font>와 <font color="red">Jsp파일의 태그라이브러리</font>에서 beanId 값의 
			변경 만으로 아래의 상황을 처리 할 수 있습니다.
		</p>
		<br/>
		<ul>
			<li><a>1) 기본적인 파일 업로드를 제공하는 서비스 설정 형태
			<fieldset>
			<legend><b>[프로젝트루트폴더]/src/main/resources/egovframework/spring/com/context-jfile.xml</b></legend>
				
				① &lt;aop:aspectj-autoproxy proxy-target-class="false" /	 &gt;<br/>
				② &lt;bean class="egovframework.com.ext.jfile.aspect.MultipartResolverDisablingAspect" /&gt;<br/>
				③ &lt;bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver"/&gt;<br/>				
				④ &lt;bean id="download" class="egovframework.com.ext.jfile.view.DownloadView" /&gt;<br/>
				⑤ &lt;bean id="jsonView" class="egovframework.com.ext.jfile.view.JSonView" /&gt;<br/>
				⑥ &lt;bean id="cipherService" class="egovframework.com.ext.jfile.security.service.CipherServiceImpl" &gt;<br/>
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;property name="jcrypto" &gt;<br/>
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;bean class="egovframework.com.ext.jfile.security.GenericJCrypto"/ &gt;<br/>
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/property &gt;<br/>
				 &nbsp;&nbsp;&nbsp;&nbsp;&lt;/bean&gt;<br/>
			</fieldset>
			<br/>
			①, ② 번은 멀티플 파일 업로드시 동일한 이름의 여러개 파일을 올리는 것을 지원하도록 해주는 방법입니다. <br/>
			③ 번은 Spring 에서 지원하는 멀티파트 리졸버 입니다.
			④ 번은 파일 다운로드를 처리하는 View 입니다.
			⑤ 번은 JSONObject 형태의 데이타를 주고 받을 때 사용되는 view 입니다.
			⑥ 번은 파일 암호화를 지원하기 위한 서비스입니다. JFile 태그라이브러리에서 useSecurity='true' 일 때만 동작합니다.  
			
			</a></li>
			<br/>
			
		</ul>
		<br/>
	</div>
	
    <div id="simple">
		
		<h2>업로드 Example</h2>
		<p>
			파일 업로드를 처리하는 예제입니다.
		</p>
		<fieldset>
		<legend><b>파일 업로드1</b></legend>
			<jwork:fileuploader 
			       objectId="fileUploadObj1"  
			       uploadCompletedEvent="uploadCompleted1"
			       fileType="all" 
			       maxFileSize="100" 
			       maxFileCount="30" 
			       usePreview="true"
			       useSecurity="false"
			       uploadMode="db"
			       />
			<input type="button" onclick="send1()" value="전송" style="width: 110px; height: 24px; font-size: 11px"/>       
		</fieldset>
		
		<script type="text/javascript">	
			function send1(){		
				fileUploadObj1.startUpload();
			}
		
			function uploadCompleted1(){
				fileUploadObj1.refresh();
			}
		</script>	
		
		<fieldset>
		<legend><b>사용자 정의 Jsp 파일</b></legend>
			<fieldset>
			<legend><b>① JFile css, script 파일 선언 부분</b></legend>
			&lt;link href="&lt;c:url value="/resource/jfile/swfupload/css/custom.css" /&gt;" rel="stylesheet" type="text/css" /&gt;<br/>
			&lt;script type="text/javascript" src="&lt;c:url value="/resource/jfile/jquery/1.3.2/jquery-1.3.2.min.js" /&gt;"&gt;&lt;/script&gt;<br/>
			&lt;script type="text/javascript" src="&lt;c:url value="/resource/jfile/json.js" /&gt;"&gt;&lt;/script&gt;<br/>
			&lt;script type="text/javascript" src="&lt;c:url value="/resource/jfile/jwork/jwork.fileUpload.js" /&gt;"&gt;&lt;/script&gt;<br/>
			&lt;script type="text/javascript" src="&lt;c:url value="/resource/jfile/jwork/jwork.fileDownload.js" /&gt;"&gt;&lt;/script&gt;<br/>
			&lt;script type="text/javascript" src="&lt;c:url value="/resource/jfile/swfupload/swfupload/swfupload.js" /&gt;"&gt;&lt;/script&gt;<br/>
			&lt;script type="text/javascript" src="&lt;c:url value="/resource/jfile/swfupload/js/swfupload.queue.js" /&gt;"&gt;&lt;/script&gt;<br/><br/>
			</fieldset>
			<fieldset>
			<legend><b>② script 이벤트 처리 부분</b></legend>
			&lt;script&gt;<br/>			
			function <font color="green">send1</font>(){<br/>
      			&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">fileUploadObj1</font>.startUpload();<br/>
      		}<br/>
      		<br/>
      		function <font color="blue">uploadCompleted1</font>(){<br/>
      			&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">fileUploadObj1</font>.refresh();<br/>
      		}<br/>
			&lt;/script&gt;<br/><br/>
			</fieldset>
			<fieldset>
			<legend><b>③ JFile 태그 라이브러리 선언 부분</b></legend>
			&lt;jwork:fileuploader<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;objectId="<font color="red">fileUploadObj1</font>"<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;uploadCompletedEvent="<font color="blue">uploadCompleted1</font>"<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;fileType="image"<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;maxFileSize="100"<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;maxFileCount="30"<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;usePreview="true"<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;useSecurity="false"<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;uploadMode="db"<br/>
			/&gt;
			</fieldset>
			<fieldset>
			<legend><b>④ 사용자가 정의한 버튼 이벤트</b></legend>
			&lt;input type="button" onclick="<font color="green">send1</font>()" value="전송" style="width: 110px; height: 24px; font-size: 11px"/&gt;
			</fieldset>
		</fieldset>	
		
		&lt;&lt; <b> 소스 설명 </b> &gt;&gt;<br/>
	    1) 개발하고자 하는 JSP 파일안에 JFile 을 사용하기 위한 css, script 파일 선언부분을 작성하고 JFile 태그라이브러리 를 위와 같이 작성합니다. <br>
	    2) 사용자가 정의한 버튼 이벤트 <font color="green">send1</font>() 에 클릭 이벤트가 발생하면 <font color="red">fileUploadObj1</font>.startUpload(); 업로드 함수가 실행되면서 컴포넌트가 파일을 업로드 하기 시작합니다.
	               이 때 파일이 업로드 되는 상황이 프로그래스 바에 표시가 됩니다.<br/>
	    3) 업로드가 완료되면 <font color="blue">uploadCompleted1</font> 이벤트가 발생하며 이곳에서 <font color="red">fileUploadObj1</font>.refresh(); 함수를 호출해서 리플래시를 해주면 됩니다.
      	<br/></br>
      	&lt;&lt; <b> 부가 설명 </b> &gt;&gt;<br/>	
		1) 하나의 JSP 에서 다 수 개의 JFileUpload 를 사용하고자 하실 때에는 <b>②Script 이벤트 처리부분, ③JFile 태그라이브러리를 부분, ④ 사용자가 정의한 버튼이벤트 부분</b>을  <font color="red">Copy & Paste</font> 를 하여 추가 해 주시고 <font color="red">적색</font>, <font color="blue">파란색</font>, <font color="green">녹색</font> 부분만 변경 해 주시고 사용하시면 됩니다.<br/>
		2) 파일을 암호화 하고자 할 경우에는 <b>③JFile 태그라이브러리를 부분</b> 에서 <b>useSecurity="<font color="red">true</font>"</b> 으로 변경 해 주시면 됩니다. 
		
	</div>
	
</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#tabs").tabs();
});
</script>
</body>
</html>