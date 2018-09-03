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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- ANALYTICS START -->
    <!-- https://www.google.com/analytics/settings/home?scid=18527803 web log Analyzer  -->
    <script type="text/javascript">
        /**
         * Editor Generator client-side code.Create a form that can be submitted to the
         * server to build an Editor package.
         *
         * If you are reading this, "Hi"! This code is useful only for Generator and not
         * in any other situation. It is designed to be run here and only here - as such
         * it is not modular nor is it well documented. If you do have any questions
         * about Generator, please post them in the DataTables forums.
         */

        /*globals downloader*/
        (function($){


            if ( ! $.fn.DataTable.ext.editorFields ) {
                $.fn.DataTable.ext.editorFields = {};
            }

            $.fn.DataTable.ext.editorFields.title = {
                create: function ( field )      { return $('<div/>')[0]; },
                get:    function ( field )      { return ''; },
                set:    function ( field, val ) {}
            };


            var Fields = function () {
                var that = this;

                $('#field-add').on( 'click', function () {
                    that.add();
                } );

                $('#fields').on( 'click', 'div.field-remove', function () {
                    $(this).closest( 'div.field' ).remove();
                    that.order();
                } );

                $('#fields').on( 'click', 'div.field-details', function () {
                    that.editDetails( $(this).closest('div.field') );
                } );

                $('#fields').on( 'keyup copy cut paste clear', 'div.field-title input', function () {
                    var field = $(this).closest('div.field');
                    var json = that.jsonSet( field, 'label', this.value );

                    if ( json._auto_sql ) {
                        that.jsonSet( field, 'sql', that.titleToSql( this.value ) );
                    }

                    that.summary( field );
                } );

                $('#fields').on( 'change', 'div.field-type select', function () {
                    var val = $(this).val();
                    var field = $(this).closest('div.field');
                    var json = that.json( field );
                    var extra = field.find('div.field-type-options');

                    that.jsonSet( field, 'type', val );

                    if ( val === 'select' || val === 'checkbox' || val === 'radio' ) {
                        extra.html( '<input type="text" placeholder="Values" class="values-multi">' );
                    }
                    else if ( val === 'date' ) {
                        extra.html( that.select( 'html', Fields.options.date ) );
                        extra.find('select').change();
                    }
                    else if ( val === 'time' ) {
                        extra.html( that.select( 'html', Fields.options.time ) );
                        extra.find('select').change();
                    }
                    else if ( val === 'datetime' ) {
                        extra.html( that.select( 'html', Fields.options.datetime ) );
                        extra.find('select').change();
                    }
                    else {
                        extra.html( '&nbsp;' );
                    }
                } );

                $('#fields').on( 'change', 'div.field-type-options select', function () {
                    var field = $(this).closest('div.field');
                    that.jsonSet( field, 'format', $(this).val() );
                } );

                $('#fields').on( 'keyup copy cut paste clear', 'div.field-type-options input', function () {
                    var field = $(this).closest('div.field');
                    that.jsonSet( field, 'values', this.value );
                } );

                $('#fields')
                        .on( 'focus', 'input.values-multi', function () {
                            $('<div class="values-multi-info">Values for the list of options. Use a comma (,) to separate multiple options.</div>' )
                                    .css( {
                                        top: $(this).offset().top + $(this).outerHeight() + 10,
                                        left: $(this).offset().left
                                    } )
                                    .appendTo( 'body' );
                        } )
                        .on( 'blur', 'input.values-multi', function () {
                            $('div.values-multi-info').remove();
                        } );

                // Reorder
                $( "#fields" ).sortable( {
                    placeholder: "field placeholder",
                    handle: "label span.field-move",
                    stop: function ( e, ui ) {
                        that.order();
                    }
                } );

                // Submit actions
                $('#generator_form').submit( function (e) {
                    var validate = that.validate();
                    if ( validate !== true ) {
                        e.preventDefault();
                        alert( validate );
                        return false;
                    }
                } );

                var prepSubmit = function ( action, target ) {
                    return function () {
                        if ( ! $(this).hasClass( 'register-action' ) ) {
                            $('#generator_form')[0].target = target;
                            $('#action').val( action );
                            $('#generator_form').submit();
                        }
                    }
                };

                $('#button_complete').click( prepSubmit('complete', '_self') );
                $('#button_run').click( prepSubmit('run', '_blank') );
                $('#button_sql').click( prepSubmit('sql', '_blank') );
                $('#button_html').click( prepSubmit('html', '_blank') );
                $('#button_js').click( prepSubmit('js', '_blank') );
                $('#button_sss').click( prepSubmit('sss', '_blank') );
                $('#button_model').click( prepSubmit('model', '_blank') );

                this._editor = this.editInit();
            };

            $.extend( Fields.prototype, {
                add: function () {
                    var field = $(
                            '<div class="field border">'+
                            '<input type="hidden" value="">'+
                            '<label class="field-order"/>'+
                            '<div>'+
                            '<div class="field-title"><input type="text"/></div>'+
                            '<div class="field-type">'+this.select( 'html', Fields.options.types )+'</div>'+
                            '<div class="field-type-options">&nbsp;</div>'+
                            '<div class="field-remove">Remove</div>'+
                            '<div class="field-details">&nbsp;</div>'+
                            '</div>'+
                            '</div>'
                    );

                    this.json( field, {
                        label: '',
                        sql: '',
                        _auto_sql: true,
                        type: 'text',
                        format: '',
                        values: '',
                        'default': '',
                        notEmpty: 0,
                        validation: null,
                        min: '',
                        max: '',
                        table: true,
                        editor: true
                    } );

                    this.summary( field );

                    $('#fields').append( field );

                    this.order();
                },

                editInit: function () {
                    var that = this;
                    var editor = new $.fn.dataTable.Editor( {
                        ajax: function (m, url, data, success, error) {
                            var field = editor.modifier();

                            // Loop only happens once as there is only a single entry
                            $.each( data.data, function (key, val) {
                                that.json( field, val );

                                // Update the always shown fields with the values selected in the Editor form
                                field.find('div.field-title input').val( val.label );
                                field.find('div.field-type select').val( val.type ).change();

                                if ( val.type === 'select' || val.type === 'checkbox' || val.type === 'radio' ) {
                                    field.find('div.field-type-options input').val( val.values );
                                }
                                else if ( val.type === 'date' || val.type === 'time' || val.type === 'datetime' ) {
                                    field.find('div.field-type-options select').val( val.format );
                                }
                            } );

                            that.summary( field );

                            success( { data: [] } );
                        },
                        fields: [
                            {
                                name: '_auto_sql',
                                type: 'hidden'
                            },
                            {
                                label: 'Field name and type',
                                name: 'title1',
                                type: 'title'
                            },
                            {
                                label: 'Title:',
                                name: 'label'
                            },
                            {
                                label: 'SQL column name:',
                                name: 'sql',
                                fieldInfo: 'This can be automatically derived from the title, but if you have an existing table, type the column name in here'
                            },
                            {
                                label: 'Type:',
                                name: 'type',
                                type: 'select',
                                options: this.select( 'js', Fields.options.types ),
                                fieldInfo: 'More input types, such as WYSIWYG input fields, are available using plug-ins'
                            },
                            {
                                label: 'Format:',
                                name: 'format',
                                type: 'select'
                            },
                            {
                                label: 'Values:',
                                name: 'values',
                                fieldInfo: 'Values that can be selected in this field. Use a comma to separate multiple values. The downloaded package can select from joined database tables.'
                            },
                            {
                                label: 'Default value:',
                                name: 'default'
                            },
                            {
                                label: 'Validation',
                                name: 'title2',
                                type: 'title'
                            },
                            {
                                label: 'Required:',
                                name: 'notEmpty',
                                type: 'radio',
                                options: this.select( 'js', Fields.options.yesNo )
                            },
                            {
                                label: 'Validation:',
                                name: 'validation',
                                type: 'select'
                            },
                            {
                                label: 'Min:',
                                name: 'min'
                            },
                            {
                                label: 'Max:',
                                name: 'max'
                            },
                            {
                                label: 'Show in:',
                                name: 'title3',
                                type: 'title'
                            },
                            {
                                label: 'Table:',
                                name: 'table',
                                type: 'radio',
                                options: this.select( 'js', Fields.options.yesNo )
                            },
                            {
                                label: 'Editor:',
                                name: 'editor',
                                type: 'radio',
                                options: this.select( 'js', Fields.options.yesNo )
                            }
                        ]
                    } );

                    editor.hide( ['format', 'values', 'min', 'max'] );

                    editor.dependent( 'type', function (val) {
                        // Form options
                        if ( val === 'select' || val === 'checkbox' || val === 'radio' ) {
                            editor.field( 'values' ).show();
                            editor.field( 'format' ).hide();
                        }
                        else if ( val === 'date' ) {
                            editor.field( 'values' ).hide();
                            editor.field( 'format' )
                                    .update( that.select('js', Fields.options.date) )
                                    .show();
                        }
                        else if ( val === 'time' ) {
                            editor.field( 'values' ).hide();
                            editor.field( 'format' )
                                    .update( that.select('js', Fields.options.time) )
                                    .show();
                        }
                        else if ( val === 'datetime' ) {
                            editor.field( 'values' ).hide();
                            editor.field( 'format' )
                                    .update( that.select('js', Fields.options.datetime) )
                                    .show();
                        }
                        else {
                            editor.field( 'values' ).hide();
                            editor.field( 'format' ).hide();
                        }

                        // Validation
                        if ( val === 'text' ) {
                            editor.field('validation')
                                    .show()
                                    .update( that.select('js', Fields.options.validationString ) );
                        }
                        else if ( val === 'number' ) {
                            editor.field('validation')
                                    .show()
                                    .update( that.select('js', Fields.options.validationNumeric ) );
                        }
                        else {
                            editor.field('validation').hide();
                            editor.field('min').hide();
                            editor.field('max').hide();
                        }
                    } );

                    editor.dependent( 'validation', function (val) {
                        if ( val === 'min-len' || val === 'numeric-min' ) {
                            editor.field('min').show();
                            editor.field('max').hide();
                        }
                        else if ( val === 'max-len' || val === 'numeric-max' ) {
                            editor.field('min').hide();
                            editor.field('max').show();
                        }
                        else if ( val === 'min-max-len' || val === 'numeric-min-max' ) {
                            editor.field('min').show();
                            editor.field('max').show();
                        }
                        else {
                            editor.field('min').hide();
                            editor.field('max').hide();
                        }
                    } );

                    $( editor.field( 'label' ).input() ).on( 'keyup copy cut paste clear', function () {
                        var json = that.json( editor.modifier() );

                        if ( json._auto_sql ) {
                            editor.set( 'sql', that.titleToSql( this.value ) );
                        }
                    } );

                    $( editor.field( 'sql' ).input() ).on( 'keyup copy cut paste clear', function () {
                        var json = that.json( editor.modifier() );

                        json._auto_sql = false;

                        that.json( editor.modifier(), json );
                    } );

                    return editor;
                },


                editDetails: function ( field ) {
                    var json = this.json( field );

                    this._editor
                            .edit( field, {
                                title: 'Field configuration',
                                buttons: 'Save',
                                focus: 'label'
                            } )
                            .set( json );
                },


                order: function () {
                    $('#fields div.field').each( function (i) {
                        $('label.field-order', this).html( '<span class="field-move">&#x2195;</span>Field '+(i+1)+':' );
                        $('input[type=hidden]', this).prop( 'name', 'field_'+i );
                    } );

                    $('#column_count').val( $('#fields div.field').length );
                },


                json: function ( field, val ) {
                    field = $(field);

                    if ( ! val ) {
                        return JSON.parse( field.find( 'input[type=hidden]' ).val() );
                    }

                    field.find('input[type=hidden]').val( JSON.stringify( val ) );
                },


                jsonSet: function ( field, prop, val ) {
                    var json = this.json( field );

                    json[ prop ] = val;

                    this.json( field, json );

                    return json;
                },


                summary: function ( field ) {
                    field = $(field);
                    var val = JSON.parse( field.find( 'input[type=hidden]' ).val() );
                    var out = [];

                    out.push( 'SQL column name: <i>'+(val.sql || 'Not set')+'</i>' );

                    if ( val.default ) {
                        out.push( 'Default: '+val['default'].replace(/</g, '&lt;').replace(/>/g, '&gt;') );
                    }
                    else {
                        out.push( 'Default: <i>Empty string</i>' );
                    }

                    if ( val.validation ) {
                        out.push( 'Validation: <i>Yes</i>' );
                    }
                    else {
                        out.push( 'Validation: <i>None</i>' );
                    }

                    out.push( '<b>Edit</b>' );

                    field.find('div.field-details').html( out.join( ' &nbsp; ' ) );
                },

                titleToSql: function ( title ) {
                    return title
                            .toLowerCase()
                            .replace(/ /g, '_')
                            .replace(/[^a-zA-Z0-9\-_]/g, '');
                },

                select: function ( type, options ) {
                    if ( type === 'js' ) {
                        return options;
                    }

                    var out = '';

                    $.each( options, function ( key, value ) {
                        out += '<option value="'+value+'">'+key+'</option>';
                    } );

                    return '<select>'+out+'</select>';
                },

                validate: function () {
                    // server and database
                    if ( $('input[name=db_table_name]').val() === "" ) {
                        $('input[name=db_table_name]').focus();
                        return 'A database table name is required.';
                    }
                    else if ( $('input[name=db_table_name]').val().match(/[^a-zA-Z0-9_]/) ) {
                        $('input[name=db_table_name]').focus();
                        return 'The database table name can only contain letters, numbers and underscores.';
                    }

                    if ( $('input[name="db_table_pkey"]').val() === '' ) {
                        $('input[name=db_table_pkey]').focus();
                        return 'A primary key is required';
                    }
                    else if ( $('input[name=db_table_pkey]').val().match(/[^a-zA-Z0-9_\-]/) ) {
                        $('input[name=db_table_name]').focus();
                        return 'The primary key should contain only letters, numbers, underscores and dashes.';
                    }

                    // fields
                    var fields = $('#fields div.field').toArray();

                    for ( var i=0, ien=fields.length ; i<ien ; i++ ) {
                        var field = $(fields[i]);
                        var json = this.json( field );

                        if ( json.label === "" ) {
                            field.find('div.field-title input').focus();
                            return 'All fields must have a title so they can be identified in the table and form.';
                        }
                        else if ( json.sql === "" ) {
                            return 'All fields must have an SQL column name. This is used to generate the DB table and populate the DataTables and Editor fields.';
                        }
                        else if ( json.sql.length > 64 ) {
                            return 'SQL column names must be less that 65 characters in length';
                        }
                        else if ( json.sql.match(/[^a-zA-Z0-9_\-]/) ) {
                            return 'Database column names must only contain letters, numbers, underscores or dashes.';
                        }
                        else if ( json.sql.match(/^[0-9]/) ) {
                            return 'Database column names cannot not start with a number.';
                        }
                        else if ( json.sql === $('input[name="db_table_pkey"]').val() ) {
                            return 'The primary key is automatically included by Editor and is not required in its own field.';
                        }
                        else if ( json.min === '' && (json.validation === 'min-len' || json.validation === 'min-max-len' || json.validation === 'numeric-min' || json.validation === 'numeric-min-max') ) {
                            return 'If a minimum value validation type is used a minimum value must be given.';
                        }
                        else if ( json.max === '' && (json.validation === 'max-len' || json.validation === 'min-max-len' || json.validation === 'numeric-max' || json.validation === 'numeric-min-max') ) {
                            return 'If a maximum value validation type is used a maximum value must be given.';
                        }
                    }

                    return true;
                }
            } );


            Fields.options = {
                date: {
                    "Fri, 9 Mar 12": "D, j M y",
                    "Fri, 9 Mar 2012": "D, j M Y",
                    "Friday, 09-Mar-12": "l, d-M-y",
                    "2012-03-09 (yyyy-mm-dd)": "Y-m-d",
                    "03-09-2012 (mm-dd-yy)": "m-d-y",
                    "03/09/2012 (mm/dd/yy)": "m/d/y",
                    "09-03-2012 (dd-mm-yy)": "d-m-y",
                    "09/03/2012 (dd/mm/yy)": "d/m/y",
                    "09.03.2012 (dd.mm.yy)": "d.m.y"
                },

                time: {
                    "24 hour clock (14:39)": "H:i",
                    "12 hour clock (2:39 pm)": "g:i a",
                },

                datetime: {
                    "ISO8601 (2016-01-14 14:39:10)": "Y-m-d H:i:s",
                    "RFC 2822 (Thu, 14 Jan 2016 14:39:10": "D, j M Y H:i:s",
                    "Month/Day/Year - 12h (01/14/2016 2:39 pm)": "m/d/y g:i a",
                    "Day/Month/Year - 24h (14/01/2016 14:39)": "d/m/y H:i"
                },

                types: {
                    "Text": "text",
                    "Number": "number",
                    "Password": "password",
                    "Textarea": "textarea",
                    "Select": "select",
                    "Checkbox": "checkbox",
                    "Radio": "radio",
                    "Date": "date",
                    "Time": "time",
                    "DateTime": "datetime",
                    "Read only": "readonly",
                    "Hidden": "hidden"
                },

                validationString: {
                    "None": "",
                    "Min length": "min-len",
                    "Max length": "max-len",
                    "Min + max length": "min-max-len",
                    "E-mail": "email",
                    "IP address": "ip",
                    "URL": "url",
                    "Unique": "unique"
                },

                validationNumeric: {
                    "None": "",
                    "Numeric": "numeric",
                    "Numeric - min": "numeric-min",
                    "Numeric - max": "numeric-max",
                    "Numeric - min - max": "numeric-min-max",
                },

                yesNo: {
                    "Yes": 1,
                    "No": 0
                }
            };


            $(document).ready( function () {
                var fields = new Fields();
                fields.add();
                fields.add();
                fields.add();

                // Download builder
                $('input[data-shortname="e"]').prop('checked', true);
                $('input[data-shortname="b"]').prop('checked', true);
                $('input[data-shortname="sl"]').prop('checked', true);
                $('input[data-shortname="jqc"]').prop('checked', true);
                $('input[data-shortname="moment"]').prop('checked', true);
                $('input[name="style-r"][value="yes"]').prop('checked', true);
                var downloadConfig = $('#download-config, #download-config-background');

                $('button.download-builder').on( 'click', function (e) {
                    e.preventDefault();
                    downloadConfig.fadeIn();
                } );

                $('div.download-close, #download-config-background, #download-done').on( 'click', function (e) {
                    var buildStr = downloader.buildString();
                    // No need to include Editor in the build string since it is included
                    // as a local file. Also it is not available on the CDN
                    buildStr = buildStr
                            .replace( /\/e\-\d\.\d\.\d\/?/, '\/' )
                            .replace( /\/$/, '' );

                    $('#build').val( buildStr );
                    $('#builder-style').html( downloader.style() );
                    $('#builder-software').html( downloader.software() );

                    downloadConfig.fadeOut();
                } );

                // Remove packaging options as they are not relevant for Generator
                $('div.download-set.package').remove();
                $('#download-config h3').last().remove();

                // Sneaky use of the hover label from the field inputs to display info about
                // the download options
                $('button[data-label]')
                        .on( 'mouseenter', function () {
                            $('<div class="values-multi-info"/>' )
                                    .append( $(this).attr('data-label') )
                                    .css( {
                                        top: $(this).offset().top + $(this).outerHeight() + 10,
                                        left: $(this).offset().left
                                    } )
                                    .appendTo( 'body' );
                        } )
                        .on( 'mouseleave', function () {
                            $('div.values-multi-info').remove();
                        } );

                // Option buttons
                $('select[name=server_type]').on( 'change', function () {
                    if ( $(this).val() === '.net' ) {
                        $('#button_sss').html( 'Controller' );
                        $('#button_model').css( 'display', 'inline-block' );
                    }
                    else if ( $(this).val() === 'nodejs' ) {
                        $('#button_sss').html( 'NodeJS' );
                        $('#button_model').css( 'display', 'none' );
                    }
                    else {
                        $('#button_sss').html( 'PHP' );
                        $('#button_model').css( 'display', 'none' );
                    }
                } );

                $('select[name=server_type]').parent().children('button').on( 'click', function (e) {
                    e.preventDefault();

                    $(this).siblings().removeClass('active');
                    $(this).addClass('active');
                    $('select[name=server_type]').val( $(this).data('val') ).change();
                } );

                $('select[name=db_type]').parent().children('button').on( 'click', function (e) {
                    e.preventDefault();

                    $(this).siblings().removeClass('active');
                    $(this).addClass('active');
                    $('select[name=db_type]').val( $(this).data('val') ).change();
                } );
            } );


        }(jQuery));
    </script>
</head>

<body id="demo_body">
<section class="clearfix">
    <div class="box">
        <form id="generator_form" action="generator.php" method="POST" class="layout">
            <input id="column_count" type="hidden" name="columns">
            <input id="action" type="hidden" name="action" value="">
            <input id="build" type="hidden" name="build" value="dt/jqc-1.12.4/moment-2.18.1/dt-1.10.18/b-1.5.2/sl-1.2.6">

            <h3>Software and styling</h3>
            <div class="field border text">
                <label>Styling:</label>
                <div id="builder-style">
                    DataTables
                </div>
                <div class="clear"></div>
            </div>

            <div class="field border text">
                <label>Software:</label>
                <div>
                    <div id="builder-software">DataTables, Buttons, Editor, Select, jQuery 1, Moment</div>
                    <button class="site-btn btn-small download-builder" style="margin-top:1em;">Customise</button>
                </div>
                <div class="clear"></div>
            </div>


            <h3>Server and database</h3>
            <div class="field border">
                <label>Server type:</label>
                <div>
                    <select name="server_type" style="display: none">
                        <option value="php" selected>PHP</option>
                        <option value=".net">.NET</option>
                        <option value="nodejs">.NodeJS</option>
                    </select>
                    <button class="site-btn btn-small btn-inline active" data-val="php">PHP</button>
                    <button class="site-btn btn-small btn-inline" data-val=".net">.NET</button>
                    <button class="site-btn btn-small btn-inline" data-val="nodejs">NodeJS</button>
                </div>
                <div class="clear"></div>
            </div>

            <div class="field border">
                <label>Database type:</label>
                <div>
                    <select name="db_type" style="display: none">
                        <option value="mysql" selected>MySQL</option>
                        <option value="postgres">PostgreSQL</option>
                        <option value="sqlserver">SQL Server</option>
                    </select>
                    <button class="site-btn btn-small btn-inline active" data-val="mysql">MySQL / MariaDB</button>
                    <button class="site-btn btn-small btn-inline" data-val="postgres">PostgreSQL</button>
                    <button class="site-btn btn-small btn-inline" data-val="sqlserver">SQL Server</button>
                </div>
                <div class="clear"></div>
            </div>

            <div class="field border">
                <label>Table name:</label>
                <div>
                    <input type="text" name="db_table_name">
                </div>
                <div class="clear"></div>
            </div>

            <div class="field border">
                <label>Primary key:</label>
                <div>
                    <input type="text" name="db_table_pkey" value="id">
                </div>
                <div class="clear"></div>
            </div>

            <h3>Form / Table</h3>

            <div class="fields">
                <div class="field field-header">
                    <label> </label>
                    <div>
                        <div class="field-title">Title</div>
                        <div class="field-type">Type</div>
                    </div>
                </div>
                <div id="fields"></div>
            </div>
            <div id="field-add">
                +
            </div>
        </form>
    </div>
</section>
</body>
</html>
