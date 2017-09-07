<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" autoFlush="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="customTags"%>

<!DOCTYPE html>
<!--[if lt IE 7 ]> <html xmlns="http://www.w3.org/1999/xhtml" lang="ko-KR" class="ie6 older"> <![endif]-->
<!--[if IE 7 ]>    <html xmlns="http://www.w3.org/1999/xhtml" lang="ko-KR" class="ie7 older"> <![endif]-->
<!--[if IE 8 ]>    <html xmlns="http://www.w3.org/1999/xhtml" lang="ko-KR" class="ie8"> <![endif]-->
<!--[if IE 9 ]>    <html xmlns="http://www.w3.org/1999/xhtml" lang="ko-KR" class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="ko-KR">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="Expire" content="-1" />
<meta http-equiv="Keywords" content="jsTree Service Engine" />
<meta http-equiv="Reply-to" content="313@313.co.kr" />
<meta http-equiv="Content-Language" content="Korean" />
<meta http-equiv="Last-Modified" content="Wed 15 Sep 2010 23:59:59" />
<meta http-equiv="Organization" content="www.313.co.kr" />
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="imagetoolbar" content="no" />
<meta http-equiv="content-Script-type" content="text/javascript" />
<meta http-equiv="content-Style-type" content="text/css" />
<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
Remove this if you use the .htaccess -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta name="robots" content="ALL, INDEX, FOLLOW" />
<meta name="Subject" content="jsTree Service Engine" />
<meta name="Filename" content="index.jsp" />
<meta name="Author-Date" content="15 Sep 10" />
<meta name="Date" content="15 Sep 10" />
<meta name="Author" content="313 DEV GRP" />
<meta name="Other Agent" content="이동민, LeeDongMin" />
<meta name="Email" content="313@313.co.kr" />
<meta name="Reply-To" content="313@313.co.kr" />
<meta name="Project" content="jsTree Service Engine" />
<meta name="Status" content="Draft" />
<meta name="Location" content="South Korea" />
<meta name="Distribution" content="jsTree Service Engine" />
<meta name="Description" content="jsTree Service Engine" />
<meta name="verify-v1" content="Eal6+fiCjgKAZb5A6pRvSLmsh9NLF2AsqxqJrLuFoAs=" />
<meta name="Revision" content="1.9" />
<meta name="Generator" content="eclipse 3.6.1" />
<meta name="Classification" content="Development,Deployment" />
<meta name="Copyright" content="CopyRight @ 313 Developer Group. All Rights Reserved" />
<meta name="title" content="jsTree Service Engine" />
<meta name="revisit-after" content="7 days" />
<meta name="siteinfo" content="http://www.313.co.kr/robots.txt" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes"> -->
<!-- <meta name="description" content="dongmin.lee" /> -->
<!-- <meta name="keywords" content="" /> -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="HandheldFriendly" content="True" />
<meta name="MobileOptimized" content="320" />
<meta property="og:type" content="website">
<meta property="og:title" content="jsTree Service Engine">
<meta property="og:url" content="http://www.313.co.kr/">
<meta property="og:site_name" content="jsTree Service Engine">
<customTags:assetsJsExtendNas theRestOfFileName="/jquery-1.12.4/dist/jquery.min.js"></customTags:assetsJsExtendNas>
<customTags:assetsJsExtendNas theRestOfFileName="/jquery-migrate-1.4.1.min.js"></customTags:assetsJsExtendNas>
<customTags:assetsJsExtendNas theRestOfFileName="/jquery-ui-1.12.1/jquery-ui.min.js"></customTags:assetsJsExtendNas>

<customTags:assetsCssExtendNas theRestOfFileName="/normalize.css-4.2.0/normalize.css"></customTags:assetsCssExtendNas>
<customTags:assetsCssExtendNas theRestOfFileName="/font/NanumGothic.css"></customTags:assetsCssExtendNas>
<!-- JSTREE -->
<customTags:assetsJsExtendNas theRestOfFileName="/jstree-v.pre1.0/_lib/jquery.cookie.js"></customTags:assetsJsExtendNas>
<customTags:assetsJsExtendNas theRestOfFileName="/jstree-v.pre1.0/_lib/jquery.hotkeys.js"></customTags:assetsJsExtendNas>
<customTags:assetsJsExtendNas theRestOfFileName="/jstree-v.pre1.0/jquery.jstree.js"></customTags:assetsJsExtendNas>

<customTags:assetsJsExtendNas theRestOfFileName="/jnotify_v2.1/jquery/jNotify.jquery.min.js"></customTags:assetsJsExtendNas>
<customTags:assetsCssExtendNas theRestOfFileName="/jnotify_v2.1/jquery/jNotify.jquery.css"></customTags:assetsCssExtendNas>

<!-- dataTable -->
<customTags:assetsCssExtendNas theRestOfFileName="/DataTables-1.10.16/media/css/jquery.dataTables.css"></customTags:assetsCssExtendNas>
<customTags:assetsCssExtendNas theRestOfFileName="/DataTables-1.10.16/extensions/Responsive/css/responsive.dataTables.css"></customTags:assetsCssExtendNas>

<customTags:assetsJsExtendNas theRestOfFileName="/DataTables-1.10.16/media/js/jquery.dataTables.js"></customTags:assetsJsExtendNas>
<customTags:assetsJsExtendNas theRestOfFileName="/DataTables-1.10.16/extensions/Responsive/js/dataTables.responsive.js"></customTags:assetsJsExtendNas>

<!-- Style Setting -->
<style type="text/css">
#demo {
	overflow: auto;
	max-height: 469px;
	float: left;
	background: #fff;
}

.menu_right {
	width: 100%;
	margin: 30px 0 5px 0;
	text-align: right;
}

.btn_wrap01 {
	overflow: hidden;
	width: 100%;
	float: left;
}

.btn_wrap01 button {display;block;
	float: left;
	margin: 0;
	padding: 0;
	width: 14%;
	min-width: 0;
	border-left: 1px solid #fff;
}

.btn_wrap01 button:first-child {
	border-left: 0;
}

.btn_wrap02 {
	width: 26%;
	float: right;
}

.btn_wrap02 .textInputVerticalCenter {
	width: 69%;
	float: left;
}

.demo_side {
	width: 30%;
	border-top: 1px solid #000;
}

.demo_con {
	width: 68%;
	float: right;
	border-top: 1px solid #000;
}

.demo_con table tbody tr td {
	text-align: center;
}

.demo_con table tbody tr.child td {
	text-align: left;
}

.dataTables_filter,.dataTables_length {
	display: none
}

table.dataTable.dtr-inline.collapsed tbody td:first-child:before,table.dataTable.dtr-inline.collapsed tbody th:first-child:before
	{
	top: 50%;
	margin-top: -10px;
}

@media only screen and (max-width: 768px) {
	.btn_wrap01 {
		width: 100%
	}
	.btn_wrap01 button {
		border-bottom: 1px solid #fff;
	}
	.btn_wrap01 button:first-child {
		width: 100%;
	}
	.btn_wrap02 {
		width: 100%;
		margin-top: 10px
	}
	.demo_side {
		width: 100%;
	}
	.demo_con {
		width: 100%;
	}
}

@media only screen and (min-width:481px) and (max-width: 768px) {
	.btn_wrap01 button {
		width: 33.33%;
	}
	.btn_wrap01 button:nth-child(3n-1) {
		border-left: 0;
	}
}

@media only screen and (max-width: 480px) {
	.btn_wrap01 button {
		width: 50%;
	}
	.btn_wrap01 button:nth-child(2n) {
		border-left: 0;
	}
}
</style>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

<!-- ANALYTICS START -->
<!-- https://www.google.com/analytics/settings/home?scid=18527803 web log Analyzer  -->
<script type="text/javascript">
  //<![CDATA[
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-18527803-1']);
  _gaq.push(['_trackPageview']);
  _gaq.push(['_trackPageLoadTime']);
  (function() {
    var ga = document.createElement('script');
    ga.type = 'text/javascript';
    ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(ga, s);
  })();
  //]]>
</script>
<!-- ANALYTICS END -->
<!-- NAVER ANALYTICS START -->
<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
  if (!wcs_add) var wcs_add = {};
  wcs_add["wa"] = "1244b972beb34c";
  wcs_do();
</script>
<!-- NAVER ANALYTICS END -->
</head>

<body id="demo_body">
	<section class="clearfix">
		<div id="jsTreeContainer">

			<nav>
				<div class="container bm-medium">
					<div class="one-whole">
						<div class="text-center">
							<h1 class="bm-remove">jsTree Service Engine Struts iBatis Version Demo</h1>
						</div>
					</div>
				</div>
			</nav>

			<article>
				<div class="clearfix">
					<div class="container bm-remove">
						<div id="article" class="one-whole boxed p-twenty animate-in clearfix" data-anim-type="fade-in" data-anim-delay="0">
							<div class="article-body rte" itemprop="articleBody">
								<div id="description">
									<div id="mmenu" style="clear: both;" class="clearfix">
										<div class="desktop-tablet alpha boxed bm-remove btn_wrap01">
											<button type="button" id="add_folder">
												<i class="fa fa-plus"></i>
												add folder
											</button>
											<button type="button" id="add_default">
												<i class="fa fa-plus"></i>
												add file
											</button>
											<button type="button" id="rename">
												<i class="fa fa-eraser"></i>
												rename
											</button>
											<button type="button" id="remove">
												<i class="fa fa-minus"></i>
												remove
											</button>
											<button type="button" id="cut">
												<i class="fa fa-cut"></i>
												cut
											</button>
											<button type="button" id="copy">
												<i class="fa fa-copy"></i>
												copy
											</button>
											<button type="button" id="paste">
												<i class="fa fa-paste"></i>
												paste
											</button>
											<button type="button" id="analyze" title="analyze" onclick="$('#alog').load('${pageContext.request.contextPath}/com/ext/jstree/strutsiBatis/core/analyzeNode.action');">
												<i class="fa fa-search"></i>
												analyze
											</button>
											<button type="button" id="refresh" title="refresh" onclick="$('#demo').jstree('refresh',-1);">
												<i class="fa fa-search"></i>
												refresh
											</button>
										</div>
										<div class="menu_right">
											<input type="text" id="text" placeholder="찾을 노드 이름 입력" data-tooltip="Press Enter To Node To Search" />
											<button type="button" id="search" title="Search">
												<i class="fa fa-search"></i>
												Search
											</button>
										</div>
									</div>

									<div class="clearfix">
										<div id="demo" class="demo demo_side"></div>

										<div class="demo_con">
											<table id="jstreeTable" class="display responsive no-wrap" cellspacing="0" width="100%">
												<thead>
													<tr>
														<th>c_id</th>
														<th>c_parentid</th>
														<th>c_position</th>
														<th>c_left</th>
														<th>c_right</th>
														<th>c_level</th>
														<th>c_title</th>
														<th>c_type</th>
													</tr>
												</thead>
											</table>
										</div>
									</div>

									<div id='alog' style="float: left; border: 1px solid gray; padding: 5px; height: 150px; margin-top: 15px; overflow: auto; width: 98%;">분석 결과</div>

									<!-- JavaScript neccessary for the tree -->
									<script type="text/javascript">
                    function jstreeDataTableReload() {
                      var jstreeDataTable = $('#jstreeTable').dataTable({
                        "ajax": {
                          "url": "${pageContext.request.contextPath}/com/ext/jstree/strutsiBatis/core/monitor/list.action",
                          "dataSrc": "rows"
                        },
                        "processing": true,
                        "responsive": true,
                        "columns": [{
                          "data": "cell.0"
                        }, {
                          "data": "cell.1"
                        }, {
                          "data": "cell.2"
                        }, {
                          "data": "cell.3"
                        }, {
                          "data": "cell.4"
                        }, {
                          "data": "cell.5"
                        }, {
                          "data": "cell.6"
                        }, {
                          "data": "cell.7"
                        }]
                      });
                      jstreeDataTable.api().ajax.reload();
                    }

                    $(function() {

                      var jstreeDataTable = $('#jstreeTable').dataTable({
                        "ajax": {
                          "url": "${pageContext.request.contextPath}/com/ext/jstree/strutsiBatis/core/monitor/list.action",
                          "dataSrc": "rows"
                        },
                        "processing": true,
                        "responsive": true,
                        "columns": [{
                          "data": "cell.0"
                        }, {
                          "data": "cell.1"
                        }, {
                          "data": "cell.2"
                        }, {
                          "data": "cell.3"
                        }, {
                          "data": "cell.4"
                        }, {
                          "data": "cell.5"
                        }, {
                          "data": "cell.6"
                        }, {
                          "data": "cell.7"
                        }]
                      });
                    });
                  </script>
									<customTags:jstree target="#demo" getChildNode="${pageContext.request.contextPath}/com/ext/jstree/strutsiBatis/core/getChildNode.action"
										searchNode="${pageContext.request.contextPath}/com/ext/jstree/strutsiBatis/core/searchNode.action"
										addNode="${pageContext.request.contextPath}/com/ext/jstree/strutsiBatis/core/addNode.action"
										removeNode="${pageContext.request.contextPath}/com/ext/jstree/strutsiBatis/core/removeNode.action"
										alterNode="${pageContext.request.contextPath}/com/ext/jstree/strutsiBatis/core/alterNode.action"
										alterNodeType="${pageContext.request.contextPath}/com/ext/jstree/strutsiBatis/core/alterNodeType.action"
										moveNode="${pageContext.request.contextPath}/com/ext/jstree/strutsiBatis/core/moveNode.action"></customTags:jstree>
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>
	</section>
</body>
</html>
