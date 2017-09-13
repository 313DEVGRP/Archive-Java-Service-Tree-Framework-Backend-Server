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
                        <h1 class="bm-remove">Rival War CompareInfo Controller</h1>
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
                                                onclick="$('#alog').load('${pageContext.request.contextPath}/rivalWar/api/menu/analyzeMenu.do');">
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
                                                    <th>topImageUrl1<th>
                                                    <th>topImageUrl2<th>
                                                    <th>topImageUrl3<th>
                                                    <th>topVenderUrl<th>
                                                    <th>topVenderText<th>
                                                    <th>topPost1Icon<th>
                                                    <th>topPost1Url<th>
                                                    <th>topPost1Text<th>
                                                    <th>topPost2Icon<th>
                                                    <th>topPost2Url<th>
                                                    <th>topPost2Text<th>
                                                    <th>topPost3Icon<th>
                                                    <th>topPost3Url<th>
                                                    <th>topPost3Text<th>
                                                    <th>topPost4Icon<th>
                                                    <th>topPost4Url<th>
                                                    <th>topPost4Text<th>
                                                    <th>topPost5Icon<th>
                                                    <th>topPost5Url<th>
                                                    <th>topPost5Text<th>

                                                    <th>midImageUrl1<th>
                                                    <th>midImageUrl2<th>
                                                    <th>midImageUrl3<th>
                                                    <th>midVenderUrl<th>
                                                    <th>midVenderText<th>
                                                    <th>midPost1Icon<th>
                                                    <th>midPost1Url<th>
                                                    <th>midPost1Text<th>
                                                    <th>midPost2Icon<th>
                                                    <th>midPost2Url<th>
                                                    <th>midPost2Text<th>
                                                    <th>midPost3Icon<th>
                                                    <th>midPost3Url<th>
                                                    <th>midPost3Text<th>
                                                    <th>midPost4Icon<th>
                                                    <th>midPost4Url<th>
                                                    <th>midPost4Text<th>
                                                    <th>midPost5Icon<th>
                                                    <th>midPost5Url<th>
                                                    <th>midPost5Text<th>

                                                    <th>botImageUrl1<th>
                                                    <th>botImageUrl2<th>
                                                    <th>botImageUrl3<th>
                                                    <th>botVenderUrl<th>
                                                    <th>botVenderText<th>
                                                    <th>botPost1Icon<th>
                                                    <th>botPost1Url<th>
                                                    <th>botPost1Text<th>
                                                    <th>botPost2Icon<th>
                                                    <th>botPost2Url<th>
                                                    <th>botPost2Text<th>
                                                    <th>botPost3Icon<th>
                                                    <th>botPost3Url<th>
                                                    <th>botPost3Text<th>
                                                    <th>botPost4Icon<th>
                                                    <th>botPost4Url<th>
                                                    <th>botPost4Text<th>
                                                    <th>botPost5Icon<th>
                                                    <th>botPost5Url<th>
                                                    <th>botPost5Text<th>
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
                                            "url": "${pageContext.request.contextPath}/api/rivalWar/ROLE_ADMIN/compareInfo/alterNode.do",
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
                                                d.topImageUrl1 = d.data.default.topImageUrl1;
                                                d.topImageUrl2 = d.data.default.topImageUrl2;
                                                d.topImageUrl3 = d.data.default.topImageUrl3;
                                                d.topVenderUrl = d.data.default.topVenderUrl;
                                                d.topVenderText = d.data.default.topVenderText;
                                                d.topPost1Icon = d.data.default.topPost1Icon;
                                                d.topPost1Url = d.data.default.topPost1Url;
                                                d.topPost1Text = d.data.default.topPost1Text;
                                                d.topPost2Icon = d.data.default.topPost2Icon;
                                                d.topPost2Url = d.data.default.topPost2Url;
                                                d.topPost2Text = d.data.default.topPost2Text;
                                                d.topPost3Icon = d.data.default.topPost3Icon;
                                                d.topPost3Url = d.data.default.topPost3Url;
                                                d.topPost3Text = d.data.default.topPost3Text;
                                                d.topPost4Icon = d.data.default.topPost4Icon;
                                                d.topPost4Url = d.data.default.topPost4Url;
                                                d.topPost4Text = d.data.default.topPost4Text;
                                                d.topPost5Icon = d.data.default.topPost5Icon;
                                                d.topPost5Url = d.data.default.topPost5Url;
                                                d.topPost5Text = d.data.default.topPost5Text;
                                                d.midImageUrl1 = d.data.default.midImageUrl1;
                                                d.midImageUrl2 = d.data.default.midImageUrl2;
                                                d.midImageUrl3 = d.data.default.midImageUrl3;
                                                d.midVenderUrl = d.data.default.midVenderUrl;
                                                d.midVenderText = d.data.default.midVenderText;
                                                d.midPost1Icon = d.data.default.midPost1Icon;
                                                d.midPost1Url = d.data.default.midPost1Url;
                                                d.midPost1Text = d.data.default.midPost1Text;
                                                d.midPost2Icon = d.data.default.midPost2Icon;
                                                d.midPost2Url = d.data.default.midPost2Url;
                                                d.midPost2Text = d.data.default.midPost2Text;
                                                d.midPost3Icon = d.data.default.midPost3Icon;
                                                d.midPost3Url = d.data.default.midPost3Url;
                                                d.midPost3Text = d.data.default.midPost3Text;
                                                d.midPost4Icon = d.data.default.midPost4Icon;
                                                d.midPost4Url = d.data.default.midPost4Url;
                                                d.midPost4Text = d.data.default.midPost4Text;
                                                d.midPost5Icon = d.data.default.midPost5Icon;
                                                d.midPost5Url = d.data.default.midPost5Url;
                                                d.midPost5Text = d.data.default.midPost5Text;
                                                d.botImageUrl1 = d.data.default.botImageUrl1;
                                                d.botImageUrl2 = d.data.default.botImageUrl2;
                                                d.botImageUrl3 = d.data.default.botImageUrl3;
                                                d.botVenderUrl = d.data.default.botVenderUrl;
                                                d.botVenderText = d.data.default.botVenderText;
                                                d.botPost1Icon = d.data.default.botPost1Icon;
                                                d.botPost1Url = d.data.default.botPost1Url;
                                                d.botPost1Text = d.data.default.botPost1Text;
                                                d.botPost2Icon = d.data.default.botPost2Icon;
                                                d.botPost2Url = d.data.default.botPost2Url;
                                                d.botPost2Text = d.data.default.botPost2Text;
                                                d.botPost3Icon = d.data.default.botPost3Icon;
                                                d.botPost3Url = d.data.default.botPost3Url;
                                                d.botPost3Text = d.data.default.botPost3Text;
                                                d.botPost4Icon = d.data.default.botPost4Icon;
                                                d.botPost4Url = d.data.default.botPost4Url;
                                                d.botPost4Text = d.data.default.botPost4Text;
                                                d.botPost5Icon = d.data.default.botPost5Icon;
                                                d.botPost5Url = d.data.default.botPost5Url;
                                                d.botPost5Text = d.data.default.botPost5Text;

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
                                            label: "topImageUrl1:", name: "topImageUrl1"
                                        },{
                                            label: "topImageUrl2:", name: "topImageUrl2"
                                        },{
                                            label: "topImageUrl3:", name: "topImageUrl3"
                                        },{
                                            label: "topVenderUrl:", name: "topVenderUrl"
                                        },{
                                            label: "topVenderText:", name: "topVenderText"
                                        },{
                                            label: "topPost1Icon:", name: "topPost1Icon"
                                        },{
                                            label: "topPost1Url:", name: "topPost1Url"
                                        },{
                                            label: "topPost1Text:", name: "topPost1Text"
                                        },{
                                            label: "topPost2Icon:", name: "topPost2Icon"
                                        },{
                                            label: "topPost2Url:", name: "topPost2Url"
                                        },{
                                            label: "topPost2Text:", name: "topPost2Text"
                                        },{
                                            label: "topPost3Icon:", name: "topPost3Icon"
                                        },{
                                            label: "topPost3Url:", name: "topPost3Url"
                                        },{
                                            label: "topPost3Text:", name: "topPost3Text"
                                        },{
                                            label: "topPost4Icon:", name: "topPost4Icon"
                                        },{
                                            label: "topPost4Url:", name: "topPost4Url"
                                        },{
                                            label: "topPost4Text:", name: "topPost4Text"
                                        },{
                                            label: "topPost5Icon:", name: "topPost5Icon"
                                        },{
                                            label: "topPost5Url:", name: "topPost5Url"
                                        },{
                                            label: "topPost5Text:", name: "topPost5Text"
                                        },{
                                            label: "midImageUrl1:", name: "midImageUrl1"
                                        },{
                                            label: "midImageUrl2:", name: "midImageUrl2"
                                        },{
                                            label: "midImageUrl3:", name: "midImageUrl3"
                                        },{
                                            label: "midVenderUrl:", name: "midVenderUrl"
                                        },{
                                            label: "midVenderText:", name: "midVenderText"
                                        },{
                                            label: "midPost1Icon:", name: "midPost1Icon"
                                        },{
                                            label: "midPost1Url:", name: "midPost1Url"
                                        },{
                                            label: "midPost1Text:", name: "midPost1Text"
                                        },{
                                            label: "midPost2Icon:", name: "midPost2Icon"
                                        },{
                                            label: "midPost2Url:", name: "midPost2Url"
                                        },{
                                            label: "midPost2Text:", name: "midPost2Text"
                                        },{
                                            label: "midPost3Icon:", name: "midPost3Icon"
                                        },{
                                            label: "midPost3Url:", name: "midPost3Url"
                                        },{
                                            label: "midPost3Text:", name: "midPost3Text"
                                        },{
                                            label: "midPost4Icon:", name: "midPost4Icon"
                                        },{
                                            label: "midPost4Url:", name: "midPost4Url"
                                        },{
                                            label: "midPost4Text:", name: "midPost4Text"
                                        },{
                                            label: "midPost5Icon:", name: "midPost5Icon"
                                        },{
                                            label: "midPost5Url:", name: "midPost5Url"
                                        },{
                                            label: "midPost5Text:", name: "midPost5Text"
                                        },{
                                            label: "botImageUrl1:", name: "botImageUrl1"
                                        },{
                                            label: "botImageUrl2:", name: "botImageUrl2"
                                        },{
                                            label: "botImageUrl3:", name: "botImageUrl3"
                                        },{
                                            label: "botVenderUrl:", name: "botVenderUrl"
                                        },{
                                            label: "botVenderText:", name: "botVenderText"
                                        },{
                                            label: "botPost1Icon:", name: "botPost1Icon"
                                        },{
                                            label: "botPost1Url:", name: "botPost1Url"
                                        },{
                                            label: "botPost1Text:", name: "botPost1Text"
                                        },{
                                            label: "botPost2Icon:", name: "botPost2Icon"
                                        },{
                                            label: "botPost2Url:", name: "botPost2Url"
                                        },{
                                            label: "botPost2Text:", name: "botPost2Text"
                                        },{
                                            label: "botPost3Icon:", name: "botPost3Icon"
                                        },{
                                            label: "botPost3Url:", name: "botPost3Url"
                                        },{
                                            label: "botPost3Text:", name: "botPost3Text"
                                        },{
                                            label: "botPost4Icon:", name: "botPost4Icon"
                                        },{
                                            label: "botPost4Url:", name: "botPost4Url"
                                        },{
                                            label: "botPost4Text:", name: "botPost4Text"
                                        },{
                                            label: "botPost5Icon:", name: "botPost5Icon"
                                        },{
                                            label: "botPost5Url:", name: "botPost5Url"
                                        },{
                                            label: "botPost5Text:", name: "botPost5Text"
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
                                                "url": "${pageContext.request.contextPath}/api/rivalWar/compareInfo/getNodeForDatatable.do",
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
                                                {"data": "topImageUrl1"},
                                                {"data": "topImageUrl2"},
                                                {"data": "topImageUrl3"},
                                                {"data": "topVenderUrl"},
                                                {"data": "topVenderText"},
                                                {"data": "topPost1Icon"},
                                                {"data": "topPost1Url"},
                                                {"data": "topPost1Text"},
                                                {"data": "topPost2Icon"},
                                                {"data": "topPost2Url"},
                                                {"data": "topPost2Text"},
                                                {"data": "topPost3Icon"},
                                                {"data": "topPost3Url"},
                                                {"data": "topPost3Text"},
                                                {"data": "topPost4Icon"},
                                                {"data": "topPost4Url"},
                                                {"data": "topPost4Text"},
                                                {"data": "topPost5Icon"},
                                                {"data": "topPost5Url"},
                                                {"data": "topPost5Text"},

                                                {"data": "midImageUrl1"},
                                                {"data": "midImageUrl2"},
                                                {"data": "midImageUrl3"},
                                                {"data": "midVenderUrl"},
                                                {"data": "midVenderText"},
                                                {"data": "midPost1Icon"},
                                                {"data": "midPost1Url"},
                                                {"data": "midPost1Text"},
                                                {"data": "midPost2Icon"},
                                                {"data": "midPost2Url"},
                                                {"data": "midPost2Text"},
                                                {"data": "midPost3Icon"},
                                                {"data": "midPost3Url"},
                                                {"data": "midPost3Text"},
                                                {"data": "midPost4Icon"},
                                                {"data": "midPost4Url"},
                                                {"data": "midPost4Text"},
                                                {"data": "midPost5Icon"},
                                                {"data": "midPost5Url"},
                                                {"data": "midPost5Text"},

                                                {"data": "botImageUrl1"},
                                                {"data": "botImageUrl2"},
                                                {"data": "botImageUrl3"},
                                                {"data": "botVenderUrl"},
                                                {"data": "botVenderText"},
                                                {"data": "botPost1Icon"},
                                                {"data": "botPost1Url"},
                                                {"data": "botPost1Text"},
                                                {"data": "botPost2Icon"},
                                                {"data": "botPost2Url"},
                                                {"data": "botPost2Text"},
                                                {"data": "botPost3Icon"},
                                                {"data": "botPost3Url"},
                                                {"data": "botPost3Text"},
                                                {"data": "botPost4Icon"},
                                                {"data": "botPost4Url"},
                                                {"data": "botPost4Text"},
                                                {"data": "botPost5Icon"},
                                                {"data": "botPost5Url"},
                                                {"data": "botPost5Text"}
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
                                                   getChildNode="${pageContext.request.contextPath}/api/rivalWar/compareInfo/getChildNode.do"
                                                   searchNode="${pageContext.request.contextPath}/api/rivalWar/compareInfo/searchNode.do"
                                                   addNode="${pageContext.request.contextPath}/api/rivalWar/ROLE_ADMIN/compareInfo/addNode.do"
                                                   removeNode="${pageContext.request.contextPath}/api/rivalWar/ROLE_ADMIN/compareInfo/removeNode.do"
                                                   alterNode="${pageContext.request.contextPath}/api/rivalWar/ROLE_ADMIN/compareInfo/alterNode.do"
                                                   alterNodeType="${pageContext.request.contextPath}/api/rivalWar/ROLE_ADMIN/compareInfo/alterNodeType.do"
                                                   moveNode="${pageContext.request.contextPath}/api/rivalWar/ROLE_ADMIN/compareInfo/moveNode.do"></customTags:jstree>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>
</section>
</body>
</html>
