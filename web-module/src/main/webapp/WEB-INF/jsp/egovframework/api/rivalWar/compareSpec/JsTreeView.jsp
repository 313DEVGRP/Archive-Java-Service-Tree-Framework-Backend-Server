<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         trimDirectiveWhitespaces="true" autoFlush="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<%@ taglib tagdir="/WEB-INF/tags" prefix="customTags" %>

<!DOCTYPE html>
<!--[if lt IE 7 ]> <html xmlns="http://www.w3.org/1999/xhtml" lang="ko-KR" class="ie6 older"> <![endif]-->
<!--[if IE 7 ]> <html xmlns="http://www.w3.org/1999/xhtml" lang="ko-KR" class="ie7 older"> <![endif]-->
<!--[if IE 8 ]> <html xmlns="http://www.w3.org/1999/xhtml" lang="ko-KR" class="ie8"> <![endif]-->
<!--[if IE 9 ]> <html xmlns="http://www.w3.org/1999/xhtml" lang="ko-KR" class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="ko-KR">
<!--<![endif]-->
<head>
    <meta charset="utf-8">

    <meta http-equiv="Expire" content="-1"/>
    <meta http-equiv="Keywords" content="jsTree Service Engine"/>
    <meta http-equiv="Reply-to" content="313@313.co.kr"/>
    <meta http-equiv="Content-Language" content="Korean"/>
    <meta http-equiv="Last-Modified" content="Wed 15 Sep 2010 23:59:59"/>
    <meta http-equiv="Organization" content="www.313.co.kr"/>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta http-equiv="content-Script-type" content="text/javascript"/>
    <meta http-equiv="content-Style-type" content="text/css"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <meta name="robots" content="ALL, INDEX, FOLLOW"/>
    <meta name="Subject" content="jsTree Service Engine"/>
    <meta name="Filename" content="index.jsp"/>
    <meta name="Author-Date" content="15 Sep 10"/>
    <meta name="Date" content="15 Sep 10"/>
    <meta name="Author" content="313 DEV GRP"/>
    <meta name="Other Agent" content="이동민, LeeDongMin"/>
    <meta name="Email" content="313@313.co.kr"/>
    <meta name="Reply-To" content="313@313.co.kr"/>
    <meta name="Project" content="jsTree Service Engine"/>
    <meta name="Status" content="Draft"/>
    <meta name="Location" content="South Korea"/>
    <meta name="Distribution" content="jsTree Service Engine"/>
    <meta name="Description" content="jsTree Service Engine"/>
    <meta name="verify-v1" content="Eal6+fiCjgKAZb5A6pRvSLmsh9NLF2AsqxqJrLuFoAs="/>
    <meta name="Revision" content="1.9"/>
    <meta name="Generator" content="eclipse 3.6.1"/>
    <meta name="Classification" content="Development,Deployment"/>
    <meta name="Copyright" content="CopyRight @ 313 Developer Group. All Rights Reserved"/>
    <meta name="title" content="jsTree Service Engine"/>
    <meta name="revisit-after" content="7 days"/>
    <meta name="siteinfo" content="http://www.313.co.kr/robots.txt"/>
    <meta name="keywords" content="jsTree Service Engine"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="HandheldFriendly" content="True"/>
    <meta name="MobileOptimized" content="320"/>

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
    <customTags:assetsCssExtendNas theRestOfFileName="/DataTables-1.10.16/extensions/Buttons/css/buttons.dataTables.min.css"></customTags:assetsCssExtendNas>
    <customTags:assetsCssExtendNas theRestOfFileName="/DataTables-1.10.16/extensions/Select/css/select.dataTables.min.css"></customTags:assetsCssExtendNas>
    <customTags:assetsCssExtendNas theRestOfFileName="/DataTables-1.10.16/extensions/Editor-1.6.5/css/editor.dataTables.min.css"></customTags:assetsCssExtendNas>

    <customTags:assetsJsExtendNas theRestOfFileName="/DataTables-1.10.16/media/js/jquery.dataTables.min.js"></customTags:assetsJsExtendNas>
    <customTags:assetsJsExtendNas theRestOfFileName="/DataTables-1.10.16/extensions/Responsive/js/dataTables.responsive.min.js"></customTags:assetsJsExtendNas>
    <customTags:assetsJsExtendNas theRestOfFileName="/DataTables-1.10.16/extensions/Buttons/js/dataTables.buttons.min.js"></customTags:assetsJsExtendNas>
    <customTags:assetsJsExtendNas theRestOfFileName="/DataTables-1.10.16/extensions/Select/js/dataTables.select.min.js"></customTags:assetsJsExtendNas>
    <customTags:assetsJsExtendNas theRestOfFileName="/DataTables-1.10.16/extensions/Editor-1.6.5/js/dataTables.editor.min.js"></customTags:assetsJsExtendNas>

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

        .btn_wrap01 button {
            display;
            block;
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

        .dataTables_filter, .dataTables_length {
            display: none
        }

        table.dataTable.dtr-inline.collapsed tbody td:first-child:before, table.dataTable.dtr-inline.collapsed tbody th:first-child:before {
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

        @media only screen and (min-width: 481px) and (max-width: 768px) {
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
        (function () {
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
                        <h1 class="bm-remove">Rival War compareSpec Controller</h1>
                    </div>
                </div>
            </div>
        </nav>

        <article>
            <div class="clearfix">
                <div class="container bm-remove">
                    <div id="article" class="one-whole boxed p-twenty animate-in clearfix" data-anim-type="fade-in"
                         data-anim-delay="0">
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
                                        <button type="button" id="analyze" title="analyze"
                                                onclick="$('#alog').load('${pageContext.request.contextPath}/rivalWar/api/compareSpec/analyzeNode.do');">
                                            <i class="fa fa-search"></i>
                                            analyze
                                        </button>
                                        <button type="button" id="refresh" title="refresh"
                                                onclick="$('#demo').jstree('refresh',-1);">
                                            <i class="fa fa-search"></i>
                                            refresh
                                        </button>
                                    </div>
                                    <div class="menu_right">
                                        <input type="text" id="text" placeholder="찾을 노드 이름 입력"
                                               data-tooltip="Press Enter To Node To Search"/>
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

                                                <th>calTime</th>

                                                <th>topSpecName</th>

                                                <th>topSpec1Title</th>
                                                <th>topSpec1Amount</th>
                                                <th>topSpec1Percent</th>
                                                <th>topSpec1Trend</th>
                                                <th>topSpec1Graph</th>

                                                <th>topSpec2Title</th>
                                                <th>topSpec2Amount</th>
                                                <th>topSpec2Percent</th>
                                                <th>topSpec2Trend</th>
                                                <th>topSpec2Graph</th>

                                                <th>topSpec3Title</th>
                                                <th>topSpec3Amount</th>
                                                <th>topSpec3Percent</th>
                                                <th>topSpec3Trend</th>
                                                <th>topSpec3Graph</th>

                                                <th>topSpec4Title</th>
                                                <th>topSpec4Amount</th>
                                                <th>topSpec4Percent</th>
                                                <th>topSpec4Trend</th>
                                                <th>topSpec4Graph</th>

                                                <th>topSpec5Title</th>
                                                <th>topSpec5Amount</th>
                                                <th>topSpec5Percent</th>
                                                <th>topSpec5Trend</th>
                                                <th>topSpec5Graph</th>

                                                <th>midSpecName</th>

                                                <th>midSpec1Title</th>
                                                <th>midSpec1Amount</th>
                                                <th>midSpec1Percent</th>
                                                <th>midSpec1Trend</th>
                                                <th>midSpec1Graph</th>

                                                <th>midSpec2Title</th>
                                                <th>midSpec2Amount</th>
                                                <th>midSpec2Percent</th>
                                                <th>midSpec2Trend</th>
                                                <th>midSpec2Graph</th>

                                                <th>midSpec3Title</th>
                                                <th>midSpec3Amount</th>
                                                <th>midSpec3Percent</th>
                                                <th>midSpec3Trend</th>
                                                <th>midSpec3Graph</th>

                                                <th>midSpec4Title</th>
                                                <th>midSpec4Amount</th>
                                                <th>midSpec4Percent</th>
                                                <th>midSpec4Trend</th>
                                                <th>midSpec4Graph</th>

                                                <th>midSpec5Title</th>
                                                <th>midSpec5Amount</th>
                                                <th>midSpec5Percent</th>
                                                <th>midSpec5Trend</th>
                                                <th>midSpec5Graph</th>

                                                
                                                <th>botSpecName</th>

                                                <th>botSpec1Title</th>
                                                <th>botSpec1Amount</th>
                                                <th>botSpec1Percent</th>
                                                <th>botSpec1Trend</th>
                                                <th>botSpec1Graph</th>

                                                <th>botSpec2Title</th>
                                                <th>botSpec2Amount</th>
                                                <th>botSpec2Percent</th>
                                                <th>botSpec2Trend</th>
                                                <th>botSpec2Graph</th>

                                                <th>botSpec3Title</th>
                                                <th>botSpec3Amount</th>
                                                <th>botSpec3Percent</th>
                                                <th>botSpec3Trend</th>
                                                <th>botSpec3Graph</th>

                                                <th>botSpec4Title</th>
                                                <th>botSpec4Amount</th>
                                                <th>botSpec4Percent</th>
                                                <th>botSpec4Trend</th>
                                                <th>botSpec4Graph</th>

                                                <th>botSpec5Title</th>
                                                <th>botSpec5Amount</th>
                                                <th>botSpec5Percent</th>
                                                <th>botSpec5Trend</th>
                                                <th>botSpec5Graph</th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </div>
                                </div>

                                <div id='alog' style="float: left; border: 1px solid gray; padding: 5px; height: 150px; margin-top: 15px; overflow: auto; width: 98%;">분석 결과</div>

                                <!-- JavaScript neccessary for the tree -->
                                <script type="text/javascript">
                                    var editor = new $.fn.dataTable.Editor({
                                        "ajax": {
                                            "url": "${pageContext.request.contextPath}/api/rivalWar/ROLE_ADMIN/compareSpec/alterNode.do",
                                            "data": function ( d ) {
                                                delete(d.action);
                                                d.c_id = d.data.default.c_id;
                                                d.c_parentid = d.data.default.c_parentid;
                                                d.c_position = d.data.default.c_position;
                                                d.c_left = d.data.default.c_left;
                                                d.c_right = d.data.default.c_right;
                                                d.c_level = d.data.default.c_level;
                                                d.c_title = d.data.default.c_title;
                                                d.c_type = d.data.default.c_type;

                                                d.calTime = d.data.default.calTime;


                                                d.topSpecName = d.data.default.topSpecName;

                                                d.topSpec1Title = d.data.default.topSpec1Title;
                                                d.topSpec1Amount = d.data.default.topSpec1Amount;
                                                d.topSpec1Percent = d.data.default.topSpec1Percent;
                                                d.topSpec1Trend = d.data.default.topSpec1Trend;
                                                d.topSpec1Graph = d.data.default.topSpec1Graph;

                                                d.topSpec2Title = d.data.default.topSpec2Title;
                                                d.topSpec2Amount = d.data.default.topSpec2Amount;
                                                d.topSpec2Percent = d.data.default.topSpec2Percent;
                                                d.topSpec2Trend = d.data.default.topSpec2Trend;
                                                d.topSpec2Graph = d.data.default.topSpec2Graph;

                                                d.topSpec3Title = d.data.default.topSpec3Title;
                                                d.topSpec3Amount = d.data.default.topSpec3Amount;
                                                d.topSpec3Percent = d.data.default.topSpec3Percent;
                                                d.topSpec3Trend = d.data.default.topSpec3Trend;
                                                d.topSpec3Graph = d.data.default.topSpec3Graph;

                                                d.topSpec4Title = d.data.default.topSpec4Title;
                                                d.topSpec4Amount = d.data.default.topSpec4Amount;
                                                d.topSpec4Percent = d.data.default.topSpec4Percent;
                                                d.topSpec4Trend = d.data.default.topSpec4Trend;
                                                d.topSpec4Graph = d.data.default.topSpec4Graph;

                                                d.topSpec5Title = d.data.default.topSpec5Title;
                                                d.topSpec5Amount = d.data.default.topSpec5Amount;
                                                d.topSpec5Percent = d.data.default.topSpec5Percent;
                                                d.topSpec5Trend = d.data.default.topSpec5Trend;
                                                d.topSpec5Graph = d.data.default.topSpec5Graph;

                                                d.midSpecName = d.data.default.midSpecName;

                                                d.midSpec1Title = d.data.default.midSpec1Title;
                                                d.midSpec1Amount = d.data.default.midSpec1Amount;
                                                d.midSpec1Percent = d.data.default.midSpec1Percent;
                                                d.midSpec1Trend = d.data.default.midSpec1Trend;
                                                d.midSpec1Graph = d.data.default.midSpec1Graph;

                                                d.midSpec2Title = d.data.default.midSpec2Title;
                                                d.midSpec2Amount = d.data.default.midSpec2Amount;
                                                d.midSpec2Percent = d.data.default.midSpec2Percent;
                                                d.midSpec2Trend = d.data.default.midSpec2Trend;
                                                d.midSpec2Graph = d.data.default.midSpec2Graph;

                                                d.midSpec3Title = d.data.default.midSpec3Title;
                                                d.midSpec3Amount = d.data.default.midSpec3Amount;
                                                d.midSpec3Percent = d.data.default.midSpec3Percent;
                                                d.midSpec3Trend = d.data.default.midSpec3Trend;
                                                d.midSpec3Graph = d.data.default.midSpec3Graph;

                                                d.midSpec4Title = d.data.default.midSpec4Title;
                                                d.midSpec4Amount = d.data.default.midSpec4Amount;
                                                d.midSpec4Percent = d.data.default.midSpec4Percent;
                                                d.midSpec4Trend = d.data.default.midSpec4Trend;
                                                d.midSpec4Graph = d.data.default.midSpec4Graph;

                                                d.midSpec5Title = d.data.default.midSpec5Title;
                                                d.midSpec5Amount = d.data.default.midSpec5Amount;
                                                d.midSpec5Percent = d.data.default.midSpec5Percent;
                                                d.midSpec5Trend = d.data.default.midSpec5Trend;
                                                d.midSpec5Graph = d.data.default.midSpec5Graph;


                                                d.botSpecName = d.data.default.botSpecName;

                                                d.botSpec1Title = d.data.default.botSpec1Title;
                                                d.botSpec1Amount = d.data.default.botSpec1Amount;
                                                d.botSpec1Percent = d.data.default.botSpec1Percent;
                                                d.botSpec1Trend = d.data.default.botSpec1Trend;
                                                d.botSpec1Graph = d.data.default.botSpec1Graph;

                                                d.botSpec2Title = d.data.default.botSpec2Title;
                                                d.botSpec2Amount = d.data.default.botSpec2Amount;
                                                d.botSpec2Percent = d.data.default.botSpec2Percent;
                                                d.botSpec2Trend = d.data.default.botSpec2Trend;
                                                d.botSpec2Graph = d.data.default.botSpec2Graph;

                                                d.botSpec3Title = d.data.default.botSpec3Title;
                                                d.botSpec3Amount = d.data.default.botSpec3Amount;
                                                d.botSpec3Percent = d.data.default.botSpec3Percent;
                                                d.botSpec3Trend = d.data.default.botSpec3Trend;
                                                d.botSpec3Graph = d.data.default.botSpec3Graph;

                                                d.botSpec4Title = d.data.default.botSpec4Title;
                                                d.botSpec4Amount = d.data.default.botSpec4Amount;
                                                d.botSpec4Percent = d.data.default.botSpec4Percent;
                                                d.botSpec4Trend = d.data.default.botSpec4Trend;
                                                d.botSpec4Graph = d.data.default.botSpec4Graph;

                                                d.botSpec5Title = d.data.default.botSpec5Title;
                                                d.botSpec5Amount = d.data.default.botSpec5Amount;
                                                d.botSpec5Percent = d.data.default.botSpec5Percent;
                                                d.botSpec5Trend = d.data.default.botSpec5Trend;
                                                d.botSpec5Graph = d.data.default.botSpec5Graph;

                                                delete(d.data);
                                            }
                                        },
                                        table: "#jstreeTable",
                                        idSrc:  'c_type',
                                        fields: [ {
                                            label: "c_id:", name: "c_id"
                                        },{
                                            label: "c_parentid:", name: "c_parentid"
                                        },{
                                            label: "c_position:", name: "c_position"
                                        },{
                                            label: "c_left:", name: "c_left"
                                        },{
                                            label: "c_right:", name: "c_right"
                                        },{
                                            label: "c_level:", name: "c_level"
                                        },{
                                            label: "c_title:", name: "c_title"
                                        },{
                                            label: "c_type:", name: "c_type"
                                        },{
                                            label: "calTime:", name: "calTime"
                                        },{
                                            label: "topSpecName:", name: "topSpecName"
                                        },{
                                            label: "topSpec1Title:", name: "topSpec1Title"
                                        },{
                                            label: "topSpec1Amount:", name: "topSpec1Amount"
                                        },{
                                            label: "topSpec1Percent:", name: "topSpec1Percent"
                                        },{
                                            label: "topSpec1Trend:", name: "topSpec1Trend"
                                        },{
                                            label: "topSpec1Graph:", name: "topSpec1Graph"
                                        },{
                                            label: "topSpec2Title:", name: "topSpec2Title"
                                        },{
                                            label: "topSpec2Amount:", name: "topSpec2Amount"
                                        },{
                                            label: "topSpec2Percent:", name: "topSpec2Percent"
                                        },{
                                            label: "topSpec2Trend:", name: "topSpec2Trend"
                                        },{
                                            label: "topSpec2Graph:", name: "topSpec2Graph"
                                        },{
                                            label: "topSpec3Title:", name: "topSpec3Title"
                                        },{
                                            label: "topSpec3Amount:", name: "topSpec3Amount"
                                        },{
                                            label: "topSpec3Percent:", name: "topSpec3Percent"
                                        },{
                                            label: "topSpec3Trend:", name: "topSpec3Trend"
                                        },{
                                            label: "topSpec3Graph:", name: "topSpec3Graph"
                                        },{
                                            label: "topSpec4Title:", name: "topSpec4Title"
                                        },{
                                            label: "topSpec4Amount:", name: "topSpec4Amount"
                                        },{
                                            label: "topSpec4Percent:", name: "topSpec4Percent"
                                        },{
                                            label: "topSpec4Trend:", name: "topSpec4Trend"
                                        },{
                                            label: "topSpec4Graph:", name: "topSpec4Graph"
                                        },{
                                            label: "topSpec5Title:", name: "topSpec5Title"
                                        },{
                                            label: "topSpec5Amount:", name: "topSpec5Amount"
                                        },{
                                            label: "topSpec5Percent:", name: "topSpec5Percent"
                                        },{
                                            label: "topSpec5Trend:", name: "topSpec5Trend"
                                        },{
                                            label: "topSpec5Graph:", name: "topSpec5Graph"
                                        },{
                                            label: "midSpecName:", name: "midSpecName"
                                        },{
                                            label: "midSpec1Title:", name: "midSpec1Title"
                                        },{
                                            label: "midSpec1Amount:", name: "midSpec1Amount"
                                        },{
                                            label: "midSpec1Percent:", name: "midSpec1Percent"
                                        },{
                                            label: "midSpec1Trend:", name: "midSpec1Trend"
                                        },{
                                            label: "midSpec1Graph:", name: "midSpec1Graph"
                                        },{
                                            label: "midSpec2Title:", name: "midSpec2Title"
                                        },{
                                            label: "midSpec2Amount:", name: "midSpec2Amount"
                                        },{
                                            label: "midSpec2Percent:", name: "midSpec2Percent"
                                        },{
                                            label: "midSpec2Trend:", name: "midSpec2Trend"
                                        },{
                                            label: "midSpec2Graph:", name: "midSpec2Graph"
                                        },{
                                            label: "midSpec3Title:", name: "midSpec3Title"
                                        },{
                                            label: "midSpec3Amount:", name: "midSpec3Amount"
                                        },{
                                            label: "midSpec3Percent:", name: "midSpec3Percent"
                                        },{
                                            label: "midSpec3Trend:", name: "midSpec3Trend"
                                        },{
                                            label: "midSpec3Graph:", name: "midSpec3Graph"
                                        },{
                                            label: "midSpec4Title:", name: "midSpec4Title"
                                        },{
                                            label: "midSpec4Amount:", name: "midSpec4Amount"
                                        },{
                                            label: "midSpec4Percent:", name: "midSpec4Percent"
                                        },{
                                            label: "midSpec4Trend:", name: "midSpec4Trend"
                                        },{
                                            label: "midSpec4Graph:", name: "midSpec4Graph"
                                        },{
                                            label: "midSpec5Title:", name: "midSpec5Title"
                                        },{
                                            label: "midSpec5Amount:", name: "midSpec5Amount"
                                        },{
                                            label: "midSpec5Percent:", name: "midSpec5Percent"
                                        },{
                                            label: "midSpec5Trend:", name: "midSpec5Trend"
                                        },{
                                            label: "midSpec5Graph:", name: "midSpec5Graph"
                                        },{
                                            label: "botSpecName:", name: "botSpecName"
                                        },{
                                            label: "botSpec1Title:", name: "botSpec1Title"
                                        },{
                                            label: "botSpec1Amount:", name: "botSpec1Amount"
                                        },{
                                            label: "botSpec1Percent:", name: "botSpec1Percent"
                                        },{
                                            label: "botSpec1Trend:", name: "botSpec1Trend"
                                        },{
                                            label: "botSpec1Graph:", name: "botSpec1Graph"
                                        },{
                                            label: "botSpec2Title:", name: "botSpec2Title"
                                        },{
                                            label: "botSpec2Amount:", name: "botSpec2Amount"
                                        },{
                                            label: "botSpec2Percent:", name: "botSpec2Percent"
                                        },{
                                            label: "botSpec2Trend:", name: "botSpec2Trend"
                                        },{
                                            label: "botSpec2Graph:", name: "botSpec2Graph"
                                        },{
                                            label: "botSpec3Title:", name: "botSpec3Title"
                                        },{
                                            label: "botSpec3Amount:", name: "botSpec3Amount"
                                        },{
                                            label: "botSpec3Percent:", name: "botSpec3Percent"
                                        },{
                                            label: "botSpec3Trend:", name: "botSpec3Trend"
                                        },{
                                            label: "botSpec3Graph:", name: "botSpec3Graph"
                                        },{
                                            label: "botSpec4Title:", name: "botSpec4Title"
                                        },{
                                            label: "botSpec4Amount:", name: "botSpec4Amount"
                                        },{
                                            label: "botSpec4Percent:", name: "botSpec4Percent"
                                        },{
                                            label: "botSpec4Trend:", name: "botSpec4Trend"
                                        },{
                                            label: "botSpec4Graph:", name: "botSpec4Graph"
                                        },{
                                            label: "botSpec5Title:", name: "botSpec5Title"
                                        },{
                                            label: "botSpec5Amount:", name: "botSpec5Amount"
                                        },{
                                            label: "botSpec5Percent:", name: "botSpec5Percent"
                                        },{
                                            label: "botSpec5Trend:", name: "botSpec5Trend"
                                        },{
                                            label: "botSpec5Graph:", name: "botSpec5Graph"
                                        } ]
                                    });

                                    function jsTreeClick(selectedNodeID) {
                                        console.log(selectedNodeID);
                                        var tempAjaxID = selectedNodeID.replace("node_", "").replace("copy_", "");
                                        $('#jstreeTable').dataTable({
                                            "processing": true,
                                            "serverSide": true,
                                            "bDestroy": true,
                                            "bJQueryUI": true,
                                            "bRegex": true,
                                            "ajax": {
                                                "url": "${pageContext.request.contextPath}/api/rivalWar/compareSpec/getNodeForDatatable.do",
                                                "data": function ( d ) {
                                                    delete(d.order);
                                                    delete(d.columns);
                                                    d.c_id = tempAjaxID;
                                                },
                                                "dataSrc": ""
                                            },
                                            "columns": [
                                                {"data": "c_id"},
                                                {"data": "c_parentid"},
                                                {"data": "c_position"},
                                                {"data": "c_left"},
                                                {"data": "c_right"},
                                                {"data": "c_level"},
                                                {"data": "c_title"},
                                                {"data": "c_type"},

                                                {"data": "calTime"},

                                                {"data": "topSpecName"},

                                                {"data": "topSpec1Title"},
                                                {"data": "topSpec1Amount"},
                                                {"data": "topSpec1Percent"},
                                                {"data": "topSpec1Trend"},
                                                {"data": "topSpec1Graph"},

                                                {"data": "topSpec2Title"},
                                                {"data": "topSpec2Amount"},
                                                {"data": "topSpec2Percent"},
                                                {"data": "topSpec2Trend"},
                                                {"data": "topSpec2Graph"},

                                                {"data": "topSpec3Title"},
                                                {"data": "topSpec3Amount"},
                                                {"data": "topSpec3Percent"},
                                                {"data": "topSpec3Trend"},
                                                {"data": "topSpec3Graph"},

                                                {"data": "topSpec4Title"},
                                                {"data": "topSpec4Amount"},
                                                {"data": "topSpec4Percent"},
                                                {"data": "topSpec4Trend"},
                                                {"data": "topSpec4Graph"},

                                                {"data": "topSpec5Title"},
                                                {"data": "topSpec5Amount"},
                                                {"data": "topSpec5Percent"},
                                                {"data": "topSpec5Trend"},
                                                {"data": "topSpec5Graph"},

                                                {"data": "midSpecName"},

                                                {"data": "midSpec1Title"},
                                                {"data": "midSpec1Amount"},
                                                {"data": "midSpec1Percent"},
                                                {"data": "midSpec1Trend"},
                                                {"data": "midSpec1Graph"},

                                                {"data": "midSpec2Title"},
                                                {"data": "midSpec2Amount"},
                                                {"data": "midSpec2Percent"},
                                                {"data": "midSpec2Trend"},
                                                {"data": "midSpec2Graph"},

                                                {"data": "midSpec3Title"},
                                                {"data": "midSpec3Amount"},
                                                {"data": "midSpec3Percent"},
                                                {"data": "midSpec3Trend"},
                                                {"data": "midSpec3Graph"},

                                                {"data": "midSpec4Title"},
                                                {"data": "midSpec4Amount"},
                                                {"data": "midSpec4Percent"},
                                                {"data": "midSpec4Trend"},
                                                {"data": "midSpec4Graph"},

                                                {"data": "midSpec5Title"},
                                                {"data": "midSpec5Amount"},
                                                {"data": "midSpec5Percent"},
                                                {"data": "midSpec5Trend"},
                                                {"data": "midSpec5Graph"},


                                                {"data": "botSpecName"},

                                                {"data": "botSpec1Title"},
                                                {"data": "botSpec1Amount"},
                                                {"data": "botSpec1Percent"},
                                                {"data": "botSpec1Trend"},
                                                {"data": "botSpec1Graph"},

                                                {"data": "botSpec2Title"},
                                                {"data": "botSpec2Amount"},
                                                {"data": "botSpec2Percent"},
                                                {"data": "botSpec2Trend"},
                                                {"data": "botSpec2Graph"},

                                                {"data": "botSpec3Title"},
                                                {"data": "botSpec3Amount"},
                                                {"data": "botSpec3Percent"},
                                                {"data": "botSpec3Trend"},
                                                {"data": "botSpec3Graph"},

                                                {"data": "botSpec4Title"},
                                                {"data": "botSpec4Amount"},
                                                {"data": "botSpec4Percent"},
                                                {"data": "botSpec4Trend"},
                                                {"data": "botSpec4Graph"},

                                                {"data": "botSpec5Title"},
                                                {"data": "botSpec5Amount"},
                                                {"data": "botSpec5Percent"},
                                                {"data": "botSpec5Trend"},
                                                {"data": "botSpec5Graph"}
                                            ],
                                            select: true,
                                            dom: "Bfrtip",
                                            buttons: [
                                                { extend: "edit",   editor: editor }
                                            ]
                                        });
                                    }
                                </script>
                                <customTags:jstree target="#demo"
                                                   getChildNode="${pageContext.request.contextPath}/api/rivalWar/compareSpec/getChildNode.do"
                                                   searchNode="${pageContext.request.contextPath}/api/rivalWar/compareSpec/searchNode.do"
                                                   addNode="${pageContext.request.contextPath}/api/rivalWar/ROLE_ADMIN/compareSpec/addNode.do"
                                                   removeNode="${pageContext.request.contextPath}/api/rivalWar/ROLE_ADMIN/compareSpec/removeNode.do"
                                                   alterNode="${pageContext.request.contextPath}/api/rivalWar/ROLE_ADMIN/compareSpec/alterNode.do"
                                                   alterNodeType="${pageContext.request.contextPath}/api/rivalWar/ROLE_ADMIN/compareSpec/alterNodeType.do"
                                                   moveNode="${pageContext.request.contextPath}/api/rivalWar/ROLE_ADMIN/compareSpec/moveNode.do"></customTags:jstree>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>
</section>
</body>
</html>
