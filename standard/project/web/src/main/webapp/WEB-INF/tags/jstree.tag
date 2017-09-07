<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false" body-content="scriptless" description="NAS 연동 CSS 출력 태그" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>

<%@ attribute name="target"%>
<%@ attribute name="getChildNode"%>
<%@ attribute name="searchNode"%>
<%@ attribute name="addNode"%>
<%@ attribute name="removeNode"%>
<%@ attribute name="alterNode"%>
<%@ attribute name="alterNodeType"%>
<%@ attribute name="moveNode"%>

<script type="text/javascript">
  $(function() {
    $.ajax({
      async: false,
      type: 'GET',
      url: "${pageContext.request.contextPath}/api/jsTreeServiceFramework/security/csrf.do",
      success: function(r) {
        var token = r._csrf_token;
        var header = r._csrf_headerName;
        $(document).ajaxSend(function(e, xhr, options) {
        	xhr.setRequestHeader(header, token);
        });
      }
    });

    $("${target}").bind(
            "before.jstree",
            function(e, data) {
              $("#alog").append(data.func + "<br />");
              $("li:not([rel='drive']).jstree-open > a > .jstree-icon").css('background-image',
                      'url(${pageContext.request.contextPath}/js/egovframework/com/ext/jstree/jstree-v.pre1.0/themes/toolbar_open.png)');
              $("li:not([rel='drive']).jstree-closed > a > .jstree-icon").css('background-image',
                      'url(${pageContext.request.contextPath}/js/egovframework/com/ext/jstree/jstree-v.pre1.0/themes/ic_explorer.png)');
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
          "url": "${getChildNode}",
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
          "url": "${searchNode}",
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
              "image": "${pageContext.request.contextPath}/js/egovframework/com/ext/jstree/jstree-v.pre1.0/themes/attibutes.png"
            }
          },
          // The `folder` type
          "folder": {
            // can have files and other folders inside of it, but NOT `drive` nodes
            "valid_children": ["default", "folder"],
            "icon": {
              "image": "${pageContext.request.contextPath}/js/egovframework/com/ext/jstree/jstree-v.pre1.0/themes/ic_explorer.png"
            }
          },
          // The `drive` nodes 
          "drive": {
            // can have files and folders inside, but NOT other `drive` nodes
            "valid_children": ["default", "folder"],
            "icon": {
              "image": "${pageContext.request.contextPath}/js/egovframework/com/ext/jstree/jstree-v.pre1.0/themes/home.png"
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
      $.post("${addNode}", {
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
        jstreeDataTableReload();
      });
    }).bind("remove.jstree", function(e, data) {
      data.rslt.obj.each(function() {
        $.ajax({
          async: false,
          type: 'POST',
          url: "${removeNode}",
          data: {
            "c_id": this.id.replace("node_", "").replace("copy_", "")
          },
          success: function(r) {
            $("#analyze").click();
            $("span.ui-icon-refresh").click();
            jNotify('Notification : <strong>Remove Node</strong>, Complete !');
            jstreeDataTableReload();
          }
        });
      });
    }).bind("rename.jstree", function(e, data) {
      $.post("${alterNode}", {
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
        jstreeDataTableReload();
      });
    }).bind("set_type.jstree", function(e, data) {
      $.post("${alterNodeType}", {
        "c_id": data.rslt.obj.attr("id").replace("node_", "").replace("copy_", ""),
        "c_title": data.rslt.new_name,
        "c_type": data.rslt.obj.attr("rel")
      }, function(r) {
        $("#analyze").click();
        $("span.ui-icon-refresh").click();
        jSuccess('Node Type Change');
        jstreeDataTableReload();
      });
    }).bind("move_node.jstree", function(e, data) {
      data.rslt.o.each(function(i) {
        $.ajax({
          async: false,
          type: 'POST',
          url: "${moveNode}",
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
            jstreeDataTableReload();
          }
        });
      });
    }).bind("select_node.jstree", function (event, data) {
      // `data.rslt.obj` is the jquery extended node that was clicked
      if ($.isFunction(jsTreeClick)) {
        console.log(data.rslt.obj);
        jsTreeClick(data.rslt.obj.attr("id"));
      }
    });

  });
  // Code for the menu buttons
  $(function() {
    $("#mmenu input, #mmenu button").click(function() {
      switch (this.id) {
      case "add_default":
      case "add_folder":
        $("${target}").jstree("create", null, "last", {
          "attr": {
            "rel": this.id.toString().replace("add_", "")
          }
        });
        break;
      case "search":
        $("${target}").jstree("search", document.getElementById("text").value);
        //$("#jstreeTable_filter").find('input[type="search"]').val();
        $('#jstreeTable').DataTable().column(6).search(document.getElementById("text").value).draw();
        ;
        break;
      case "text":
        break;
      default:
        $("${target}").jstree(this.id);
        break;
      }
    });
  });
</script>