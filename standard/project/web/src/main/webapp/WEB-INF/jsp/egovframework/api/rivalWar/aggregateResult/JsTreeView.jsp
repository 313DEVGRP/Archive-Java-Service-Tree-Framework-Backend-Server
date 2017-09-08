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
                            <h1 class="bm-remove">Rival War AggregateResult Controller</h1>
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

                                                        <th>topName</th>
                                                        <th>topNumberOfAdvantages</th>
                                                        <th>topVersusScore</th>
                                                        <th>topLikeCount</th>
                                                        <th>topTotalRegisteredPosts</th>
                                                        <th>topRegisteredHashTag</th>
                                                        <th>topGraphPercent</th>

                                                        <th>midName</th>
                                                        <th>midNumberOfAdvantages</th>
                                                        <th>midLikeCount</th>
                                                        <th>midTotalRegisteredPosts</th>
                                                        <th>midRegisteredHashTag</th>
                                                        <th>midGraphPercent</th>
                                                        <th>midVersusScore</th>

                                                        <th>botName</th>
                                                        <th>botNumberOfAdvantages</th>
                                                        <th>botLikeCount</th>
                                                        <th>botTotalRegisteredPosts</th>
                                                        <th>botRegisteredHashTag</th>
                                                        <th>botGraphPercent</th>
                                                        <th>botVersusScore</th>

                                                        <th>totalTraffic</th>
                                                        <th>uniqueVisit</th>
                                                        <th>revisitCount</th>
                                                        <th>pageView</th>
                                                        <th>totalArticle</th>
                                                        <th>totalLikeCount</th>
                                                        <th>totalSpecCount</th>
                                                        <th>totalHashCount</th>
                                                        <th>standardError</th>
                                                        <th>equilibriumAssumption</th>
                                                        <th>probability</th>

                                                        <th>lowerLimit</th>
                                                        <th>higherLimit</th>
                                                        <th>distributionTResult</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
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

                                                        <th>topName</th>
                                                        <th>topNumberOfAdvantages</th>
                                                        <th>topVersusScore</th>
                                                        <th>topLikeCount</th>
                                                        <th>topTotalRegisteredPosts</th>
                                                        <th>topRegisteredHashTag</th>
                                                        <th>topGraphPercent</th>

                                                        <th>midName</th>
                                                        <th>midNumberOfAdvantages</th>
                                                        <th>midLikeCount</th>
                                                        <th>midTotalRegisteredPosts</th>
                                                        <th>midRegisteredHashTag</th>
                                                        <th>midGraphPercent</th>
                                                        <th>midVersusScore</th>

                                                        <th>botName</th>
                                                        <th>botNumberOfAdvantages</th>
                                                        <th>botLikeCount</th>
                                                        <th>botTotalRegisteredPosts</th>
                                                        <th>botRegisteredHashTag</th>
                                                        <th>botGraphPercent</th>
                                                        <th>botVersusScore</th>

                                                        <th>totalTraffic</th>
                                                        <th>uniqueVisit</th>
                                                        <th>revisitCount</th>
                                                        <th>pageView</th>
                                                        <th>totalArticle</th>
                                                        <th>totalLikeCount</th>
                                                        <th>totalSpecCount</th>
                                                        <th>totalHashCount</th>
                                                        <th>standardError</th>
                                                        <th>equilibriumAssumption</th>
                                                        <th>probability</th>

                                                        <th>lowerLimit</th>
                                                        <th>higherLimit</th>
                                                        <th>distributionTResult</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>

                                    <div id='alog' style="float: left; border: 1px solid gray; padding: 5px; height: 150px; margin-top: 15px; overflow: auto; width: 98%;">분석 결과</div>

                                    <!-- JavaScript neccessary for the tree -->
                                    <script type="text/javascript">
                                        var editor = new $.fn.dataTable.Editor({
                                            "ajax": {
                                                "url": "${pageContext.request.contextPath}/api/rivalWar/ROLE_ADMIN/aggregateResult/alterNode.do",
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
                                                    d.topName = d.data.default.topName;
                                                    d.topNumberOfAdvantages = d.data.default.topNumberOfAdvantages;
                                                    d.topVersusScore = d.data.default.topVersusScore;
                                                    d.topLikeCount = d.data.default.topLikeCount;
                                                    d.topTotalRegisteredPosts = d.data.default.topTotalRegisteredPosts;
                                                    d.topRegisteredHashTag = d.data.default.topRegisteredHashTag;
                                                    d.topGraphPercent = d.data.default.topGraphPercent;

                                                    d.midName = d.data.default.midName;
                                                    d.midNumberOfAdvantages = d.data.default.midNumberOfAdvantages;
                                                    d.midLikeCount = d.data.default.midLikeCount;
                                                    d.midTotalRegisteredPosts = d.data.default.midTotalRegisteredPosts;
                                                    d.midRegisteredHashTag = d.data.default.midRegisteredHashTag;
                                                    d.midGraphPercent = d.data.default.midGraphPercent;
                                                    d.midVersusScore = d.data.default.midVersusScore;

                                                    d.botName = d.data.default.botName;
                                                    d.botNumberOfAdvantages = d.data.default.botNumberOfAdvantages;
                                                    d.botLikeCount = d.data.default.botLikeCount;
                                                    d.botTotalRegisteredPosts = d.data.default.botTotalRegisteredPosts;
                                                    d.botRegisteredHashTag = d.data.default.botRegisteredHashTag;
                                                    d.botGraphPercent = d.data.default.botGraphPercent;
                                                    d.botVersusScore = d.data.default.botVersusScore;

                                                    d.totalTraffic = d.data.default.totalTraffic;
                                                    d.uniqueVisit = d.data.default.uniqueVisit;
                                                    d.revisitCount = d.data.default.revisitCount;
                                                    d.pageView = d.data.default.pageView;
                                                    d.totalArticle = d.data.default.totalArticle;
                                                    d.totalLikeCount = d.data.default.totalLikeCount;
                                                    d.totalSpecCount = d.data.default.totalSpecCount;

                                                    d.totalHashCount = d.data.default.totalHashCount;
                                                    d.standardError = d.data.default.standardError;
                                                    d.equilibriumAssumption = d.data.default.equilibriumAssumption;
                                                    d.probability = d.data.default.probability;
                                                    d.lowerLimit = d.data.default.lowerLimit;
                                                    d.higherLimit = d.data.default.higherLimit;
                                                    d.distributionTResult = d.data.default.distributionTResult;
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
                                                label: "topName:", name: "topName"
                                            }, {
                                                label: "topNumberOfAdvantages:", name: "topNumberOfAdvantages"
                                            }, {
                                                label: "topVersusScore:", name: "topVersusScore"
                                            }, {
                                                label: "topLikeCount:", name: "topLikeCount"
                                            }, {
                                                label: "topTotalRegisteredPosts:", name: "topTotalRegisteredPosts"
                                            }, {
                                                label: "topRegisteredHashTag:", name: "topRegisteredHashTag"
                                            }, {
                                                label: "topGraphPercent:", name: "topGraphPercent"
                                            }, {
                                                label: "midName:", name: "midName"
                                            }, {
                                                label: "midNumberOfAdvantages:", name: "midNumberOfAdvantages"
                                            }, {
                                                label: "midLikeCount:", name: "midLikeCount"
                                            }, {
                                                label: "midTotalRegisteredPosts:", name: "midTotalRegisteredPosts"
                                            }, {
                                                label: "midRegisteredHashTag:", name: "midRegisteredHashTag"
                                            }, {
                                                label: "midGraphPercent:", name: "midGraphPercent"
                                            }, {
                                                label: "midVersusScore:", name: "midVersusScore"
                                            }, {
                                                label: "botName:", name: "botName"
                                            }, {
                                                label: "botNumberOfAdvantages:", name: "botNumberOfAdvantages"
                                            }, {
                                                label: "botLikeCount:", name: "botLikeCount"
                                            }, {
                                                label: "botTotalRegisteredPosts:", name: "botTotalRegisteredPosts"
                                            }, {
                                                label: "botRegisteredHashTag:", name: "botRegisteredHashTag"
                                            }, {
                                                label: "botGraphPercent:", name: "botGraphPercent"
                                            }, {
                                                label: "botVersusScore:", name: "botVersusScore"
                                            }, {
                                                label: "totalTraffic:", name: "totalTraffic"
                                            }, {
                                                label: "uniqueVisit:", name: "uniqueVisit"
                                            }, {
                                                label: "revisitCount:", name: "revisitCount"
                                            }, {
                                                label: "pageView:", name: "pageView"
                                            }, {
                                                label: "totalArticle:", name: "totalArticle"
                                            }, {
                                                label: "totalLikeCount:", name: "totalLikeCount"
                                            }, {
                                                label: "totalSpecCount:", name: "totalSpecCount"
                                            }, {
                                                label: "totalHashCount:", name: "totalHashCount"
                                            }, {
                                                label: "standardError:", name: "standardError"
                                            }, {
                                                label: "equilibriumAssumption:", name: "equilibriumAssumption"
                                            }, {
                                                label: "probability:", name: "probability"
                                            }, {
                                                label: "lowerLimit:", name: "lowerLimit"
                                            }, {
                                                label: "higherLimit:", name: "higherLimit"
                                            }, {
                                                label: "distributionTResult:", name: "distributionTResult"
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
                                                    "url": "${pageContext.request.contextPath}/api/rivalWar/aggregateResult/getNodeForDatatable.do",
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

                                                    {"data": "topName"},
                                                    {"data": "topNumberOfAdvantages"},
                                                    {"data": "topVersusScore"},
                                                    {"data": "topLikeCount"},
                                                    {"data": "topTotalRegisteredPosts"},
                                                    {"data": "topRegisteredHashTag"},
                                                    {"data": "topGraphPercent"},

                                                    {"data": "midName"},
                                                    {"data": "midNumberOfAdvantages"},
                                                    {"data": "midLikeCount"},
                                                    {"data": "midTotalRegisteredPosts"},
                                                    {"data": "midRegisteredHashTag"},
                                                    {"data": "midGraphPercent"},
                                                    {"data": "midVersusScore"},

                                                    {"data": "botName"},
                                                    {"data": "botNumberOfAdvantages"},
                                                    {"data": "botLikeCount"},
                                                    {"data": "botTotalRegisteredPosts"},
                                                    {"data": "botRegisteredHashTag"},
                                                    {"data": "botGraphPercent"},
                                                    {"data": "botVersusScore"},

                                                    {"data": "totalTraffic"},
                                                    {"data": "uniqueVisit"},
                                                    {"data": "revisitCount"},
                                                    {"data": "pageView"},
                                                    {"data": "totalArticle"},
                                                    {"data": "totalLikeCount"},
                                                    {"data": "totalSpecCount"},

                                                    {"data": "totalHashCount"},
                                                    {"data": "standardError"},
                                                    {"data": "equilibriumAssumption"},
                                                    {"data": "probability"},
                                                    {"data": "lowerLimit"},
                                                    {"data": "higherLimit"},
                                                    {"data": "distributionTResult"}
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
                                                       getChildNode="${pageContext.request.contextPath}/api/rivalWar/aggregateResult/getChildNode.do"
                                                       searchNode="${pageContext.request.contextPath}/api/rivalWar/aggregateResult/searchNode.do"
                                                       addNode="${pageContext.request.contextPath}/api/rivalWar/ROLE_ADMIN/aggregateResult/addNode.do"
                                                       removeNode="${pageContext.request.contextPath}/api/rivalWar/ROLE_ADMIN/aggregateResult/removeNode.do"
                                                       alterNode="${pageContext.request.contextPath}/api/rivalWar/ROLE_ADMIN/aggregateResult/alterNode.do"
                                                       alterNodeType="${pageContext.request.contextPath}/api/rivalWar/ROLE_ADMIN/aggregateResult/alterNodeType.do"
                                                       moveNode="${pageContext.request.contextPath}/api/rivalWar/ROLE_ADMIN/aggregateResult/moveNode.do"></customTags:jstree>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </article>
    </section>
</body>
</html>
