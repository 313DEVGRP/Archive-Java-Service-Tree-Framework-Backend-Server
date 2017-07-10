<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" autoFlush="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<meta name="keywords" content="jsTree Service Engine" />
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
<customTags:assetsCssExtendNas theRestOfFileName="/DataTables-1.10.4/media/css/jquery.dataTables.css"></customTags:assetsCssExtendNas>
<customTags:assetsCssExtendNas theRestOfFileName="/DataTables-1.10.4/extensions/Responsive/css/dataTables.responsive.css"></customTags:assetsCssExtendNas>

<customTags:assetsJsExtendNas theRestOfFileName="/DataTables-1.10.4/media/js/jquery.dataTables.js"></customTags:assetsJsExtendNas>
<customTags:assetsJsExtendNas theRestOfFileName="/DataTables-1.10.4/extensions/Responsive/js/dataTables.responsive.js"></customTags:assetsJsExtendNas>

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
							<h1 class="bm-remove">jsTree Service Engine Spring Hibernate Version Demo</h1>
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
											<button type="button" id="analyze" title="analyze" onclick="$('#alog').load('/com/ext/jstree/springHibernate/core/analyzeNode.do');">
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
                    $(function() {
                      $.ajax({
                        async: false,
                        type: 'GET',
                        url: "/com/ext/jstree/springHibernate/core/csrf.do",
                        success: function(r) {
                          var token = r._csrf_token;
                          var header = r._csrf_headerName;
                          $(document).ajaxSend(function(e, xhr, options) {
                            xhr.setRequestHeader(header, token);
                          });
                        }
                      });

                      $("#demo").bind(
                              "before.jstree",
                              function(e, data) {
                                $("#alog").append(data.func + "<br />");
                                $("li:not([rel='drive']).jstree-open > a > .jstree-icon").css('background-image',
                                        'url(/js/egovframework/com/ext/jstree/jstree-v.pre1.0/themes/toolbar_open.png)');
                                $("li:not([rel='drive']).jstree-closed > a > .jstree-icon").css('background-image',
                                        'url(/js/egovframework/com/ext/jstree/jstree-v.pre1.0/themes/ic_explorer.png)');
                              }).jstree({
                        // List of active plugins
                        "plugins": ["themes", "json_data", "ui", "crrm", "cookies", "dnd", "search", "types", "hotkeys", "contextmenu", "checkbox"],

                        //contextmenu
                        "contextmenu": {
                          items: { // Could be a function that should return an object like this one             
                            "create": {
                              "separator_before": true,
                              "separator_after": true,
                              "label": "Create",
                              "action": false,
                              "submenu": {
                                "create_file": {
                                  "seperator_before": false,
                                  "seperator_after": false,
                                  "label": "File",
                                  action: function(obj) {
                                    this.create(obj, "last", {
                                      "attr": {
                                        "rel": "default"
                                      }
                                    });
                                  }
                                },
                                "create_folder": {
                                  "seperator_before": false,
                                  "seperator_after": false,
                                  "label": "Folder",
                                  action: function(obj) {
                                    this.create(obj, "last", {
                                      "attr": {
                                        "rel": "folder"
                                      }
                                    });
                                  }
                                }

                              }
                            },
                            "ccp": {
                              "separator_before": false,
                              "separator_after": true,
                              "label": "Edit",
                              "action": false,
                              "submenu": {
                                "cut": {
                                  "seperator_before": false,
                                  "seperator_after": false,
                                  "label": "Cut",
                                  action: function(obj) {
                                    this.cut(obj, "last", {
                                      "attr": {
                                        "rel": "default"
                                      }
                                    });
                                  }
                                },
                                "paste": {
                                  "seperator_before": false,
                                  "seperator_after": false,
                                  "label": "Paste",
                                  action: function(obj) {
                                    this.paste(obj, "last", {
                                      "attr": {
                                        "rel": "folder"
                                      }
                                    });
                                  }
                                },

                                "changeType": {
                                  "seperator_before": false,
                                  "seperator_after": false,
                                  "label": "Change Type",
                                  "submenu": {
                                    "toFile": {
                                      "seperator_before": false,
                                      "seperator_after": false,
                                      "label": "toFile",
                                      action: function(obj) {
                                        this.set_type("default");
                                      }
                                    },
                                    "toFolder": {
                                      "seperator_before": false,
                                      "seperator_after": false,
                                      "label": "toFolder",
                                      action: function(obj) {
                                        this.set_type("folder");
                                      }
                                    }
                                  }
                                }

                              }
                            }

                          }
                        },

                        // I usually configure the plugin that handles the data first
                        // This example uses JSON as it is most common
                        "json_data": {
                          // This tree is ajax enabled - as this is most common, and maybe a bit more complex
                          // All the options are almost the same as jQuery's AJAX (read the docs)
                          "ajax": {
                            // the URL to fetch the data
                            "url": "/com/ext/jstree/springHibernate/core/getChildNode.do",
                            // the `data` function is executed in the instance's scope
                            // the parameter is the node being loaded 
                            // (may be -1, 0, or undefined when loading the root nodes)
                            "data": function(n) {
                              // the result is fed to the AJAX request `data` option
                              return {
                                "c_id": n.attr ? n.attr("id").replace("node_", "").replace("copy_", "") : 1
                              };
                            },
                            "success": function(n) {
                              jSuccess('access good');
                            }
                          }
                        },
                        // Configuring the search plugin
                        "search": {
                          // As this has been a common question - async search
                          // Same as above - the `ajax` config option is actually jQuery's AJAX object
                          "ajax": {
                            "url": "/com/ext/jstree/springHibernate/core/searchNode.do",
                            // You get the search string as a parameter
                            "data": function(str) {
                              return {
                                "searchString": str
                              };
                            },
                            "success": function(n) {
                              jSuccess('search data complete');
                            }
                          }
                        },
                        // Using types - most of the time this is an overkill
                        // read the docs carefully to decide whether you need types
                        "types": {
                          // I set both options to -2, as I do not need depth and children count checking
                          // Those two checks may slow jstree a lot, so use only when needed
                          "max_depth": -2,
                          "max_children": -2,
                          // I want only `drive` nodes to be root nodes 
                          // This will prevent moving or creating any other type as a root node
                          "valid_children": ["drive"],
                          "types": {
                            // The default type
                            "default": {
                              // I want this type to have no children (so only leaf nodes)
                              // In my case - those are files
                              "valid_children": "none",
                              // If we specify an icon for the default type it WILL OVERRIDE the theme icons
                              "icon": {
                                "image": "/js/egovframework/com/ext/jstree/jstree-v.pre1.0/themes/attibutes.png"
                              }
                            },
                            // The `folder` type
                            "folder": {
                              // can have files and other folders inside of it, but NOT `drive` nodes
                              "valid_children": ["default", "folder"],
                              "icon": {
                                "image": "/js/egovframework/com/ext/jstree/jstree-v.pre1.0/themes/ic_explorer.png"
                              }
                            },
                            // The `drive` nodes 
                            "drive": {
                              // can have files and folders inside, but NOT other `drive` nodes
                              "valid_children": ["default", "folder"],
                              "icon": {
                                "image": "/js/egovframework/com/ext/jstree/jstree-v.pre1.0/themes/home.png"
                              },
                              // those prevent the functions with the same name to be used on `drive` nodes
                              // internally the `before` event is used
                              "start_drag": false,
                              "move_node": false,
                              "delete_node": false,
                              "remove": false
                            }
                          }
                        },
                        // UI & core - the nodes to initially select and open will be overwritten by the cookie plugin

                        // the UI plugin - it handles selecting/deselecting/hovering nodes
                        "ui": {
                          // this makes the node with ID node_4 selected onload
                          "initially_select": ["node_4"]
                        },
                        // the core plugin - not many options here
                        "core": {
                          // just open those two nodes up
                          // as this is an AJAX enabled tree, both will be downloaded from the server
                          "initially_open": ["node_2", "node_3"]
                        }
                      }).bind("create.jstree", function(e, data) {
                        $.post("/com/ext/jstree/springHibernate/core/addNode.do", {
                          "ref": data.rslt.parent.attr("id").replace("node_", "").replace("copy_", ""),
                          "c_position": data.rslt.position,
                          "c_title": data.rslt.name,
                          "c_type": data.rslt.obj.attr("rel")
                        }, function(r) {
                          if (r.status) {
                            $(data.rslt.obj).attr("id", "node_" + r.id);
                            jNotify('Notification : <strong>Add Node</strong>, Complete !');
                          } else {
                            $.jstree.rollback(data.rlbk);
                          }
                          $("#analyze").click();
                          $("span.ui-icon-refresh").click();
                        });
                      }).bind("remove.jstree", function(e, data) {
                        data.rslt.obj.each(function() {
                          $.ajax({
                            async: false,
                            type: 'POST',
                            url: "/com/ext/jstree/springHibernate/core/removeNode.do",
                            data: {
                              "c_id": this.id.replace("node_", "").replace("copy_", "")
                            },
                            success: function(r) {
                              $("#analyze").click();
                              $("span.ui-icon-refresh").click();
                              jNotify('Notification : <strong>Remove Node</strong>, Complete !');
                            }
                          });
                        });
                      }).bind("rename.jstree", function(e, data) {
                        $.post("/com/ext/jstree/springHibernate/core/alterNode.do", {
                          "c_id": data.rslt.obj.attr("id").replace("node_", "").replace("copy_", ""),
                          "c_title": data.rslt.new_name,
                          "c_type": data.rslt.obj.attr("rel")
                        }, function(r) {
                          if (!r.status) {
                            $.jstree.rollback(data.rlbk);
                          }
                          jSuccess('Rename Node Complete');
                          $("#analyze").click();
                          $("span.ui-icon-refresh").click();

                        });
                      }).bind("set_type.jstree", function(e, data) {
                        $.post("/com/ext/jstree/springHibernate/core/alterNodeType.do", {
                          "c_id": data.rslt.obj.attr("id").replace("node_", "").replace("copy_", ""),
                          "c_title": data.rslt.new_name,
                          "c_type": data.rslt.obj.attr("rel")
                        }, function(r) {
                          $("#analyze").click();
                          $("span.ui-icon-refresh").click();
                          jSuccess('Node Type Change');
                        });
                      }).bind("move_node.jstree", function(e, data) {
                        data.rslt.o.each(function(i) {
                          $.ajax({
                            async: false,
                            type: 'POST',
                            url: "/com/ext/jstree/springHibernate/core/moveNode.do",
                            data: {
                              "c_id": $(this).attr("id").replace("node_", "").replace("copy_", ""),
                              "ref": data.rslt.cr === -1 ? 1 : data.rslt.np.attr("id").replace("node_", "").replace("copy_", ""),
                              "c_position": data.rslt.cp + i,
                              "c_title": data.rslt.name,
                              "copy": data.rslt.cy ? 1 : 0,
                              "multiCounter": i
                            },
                            success: function(r) {
                              if (r.status) {
                                $.jstree.rollback(data.rlbk);
                              } else {
                                $(data.rslt.oc).attr("id", "node_" + r.id);
                                if (data.rslt.cy && $(data.rslt.oc).children("UL").length) {
                                  data.inst.refresh(data.inst._get_parent(data.rslt.oc));
                                }
                                jNotify('Notification : <strong>Move Node</strong> Complete !');
                              }
                              $("#analyze").click();
                              $("span.ui-icon-refresh").click();

                            }
                          });
                        });
                      });

                    });
                    // Code for the menu buttons
                    $(function() {
                      $("#mmenu input, #mmenu button").click(function() {
                        switch (this.id) {
                        case "add_default":
                        case "add_folder":
                          $("#demo").jstree("create", null, "last", {
                            "attr": {
                              "rel": this.id.toString().replace("add_", "")
                            }
                          });
                          break;
                        case "search":
                          $("#demo").jstree("search", document.getElementById("text").value);
                          //$("#jstreeTable_filter").find('input[type="search"]').val();
                          $('#jstreeTable').DataTable().column(6).search(document.getElementById("text").value).draw();
                          ;
                          break;
                        case "text":
                          break;
                        default:
                          $("#demo").jstree(this.id);
                          break;
                        }
                      });
                    });
                  </script>
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>
	</section>
</body>
</html>
