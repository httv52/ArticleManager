<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--导入顶部信息--%>
<%@include file="/WEB-INF/jsps/format/admin/head.jsp" %>

<!-- 中间内容 -->
<section id="content">
    <section class="vbox">
        <section class="scrollable padder" id="topAnchor">

            <!--路径-->
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li>
                    <a href="<c:url value="/admin/index"/> "><i class="fa fa-home"></i> 主页</a>
                </li>
                <li class="active">
                    <i class="fa fa-pencil"> 发布文章</i>
                </li>
            </ul>
            <!-- //路径-->

            <div class="row">
                <div class="col-sm-12">
                    <h4 class="page-title">
                        发布文章
                    </h4>
                </div>
                <div class="col-md-12">

                    <input type="hidden" id="attach_url" value="http://127.0.0.1:9001">

                    <form id="articleForm" role="form" novalidate="novalidate">
                        <input type="hidden" name="categories" id="categories">
                        <input type="hidden" name="cid" value="" id="cid">
                        <input type="hidden" name="status" value="publish" id="status">
                        <input type="hidden" name="allow_comment" value="true" id="allow_comment">
                        <input type="hidden" name="allow_ping" value="true" id="allow_ping">
                        <input type="hidden" name="allow_feed" value="true" id="allow_feed">
                        <input type="hidden" name="content" id="content-editor">
                        <input type="hidden" name="fmt_type" id="fmt_type" value="markdown">

                        <div class="form-group col-md-6" style="padding: 0 10px 0 0;">
                            <input type="text" class="form-control" placeholder="请输入文章标题（必须）" name="title" required=""
                                   aria-required="true" value="">
                        </div>

                        <div class="form-group col-md-6" style="padding: 0 0 0 10px;">
                            <input type="text" class="form-control" placeholder="自定义访问路径，如：my-first-article  默认为文章id"
                                   name="slug" value="">
                        </div>

                        <div class="form-group col-md-6" style="padding: 0 10px 0 0;">
                            <input name="tags" id="tags" type="text" class="form-control" placeholder="请填写文章标签"
                                   value="aaa" style="display: none;">
                            <div id="tags_tagsinput" class="tagsinput" style="width: 100%; height: 35px;"><span
                                    class="tag"><span>aaa&nbsp;&nbsp;</span><a href="#"
                                                                               title="Removing tag">x</a></span>
                                <div id="tags_addTag"><input id="tags_tag" value="" data-default="请输入文章标签"
                                                             style="color: rgb(153, 153, 153); width: 157px;"></div>
                                <div class="tags_clear"></div>
                            </div>
                        </div>

                        <div class="form-group col-md-6">
                            <div class="select2-container select2-container-multi select2 form-control"
                                 id="s2id_multiple-sel" style="width: 100%;">
                                <ul class="select2-choices">
                                    <li class="select2-search-field"><label for="s2id_autogen1"
                                                                            class="select2-offscreen"></label> <input
                                            type="text" autocomplete="off" autocorrect="off" autocapitalize="off"
                                            spellcheck="false" class="select2-input select2-default" id="s2id_autogen1"
                                            style="width: 521px;" placeholder=""></li>
                                </ul>
                                <div class="select2-drop select2-drop-multi select2-display-none">
                                    <ul class="select2-results">
                                        <li class="select2-no-results">No matches found</li>
                                    </ul>
                                </div>
                            </div>
                            <select id="multiple-sel" class="select2 form-control select2-offscreen" multiple="multiple"
                                    data-placeholder="请选择分类..." tabindex="-1">

                                <option value="默认分类">
                                    默认分类
                                </option>

                            </select>
                        </div>
                        <div class="clearfix"></div>

                        <div class="form-group col-xs-12">
                            <div class="pull-right">
                                <a id="switch-btn" href="javascript:void(0)"
                                   class="btn btn-purple btn-sm waves-effect waves-light switch-editor" type="markdown">切换为富文本编辑器</a>
                                &nbsp;<span>切换编辑器会丢失当前输入内容</span>
                            </div>
                        </div>

                        <div id="md-container" class="form-group col-md-12">
                            <div class="mditor split  " style="width:auto;height:400px">
                                <div class="head">
                                    <ul class="toolbar">
                                        <i class="item fa fa-bold  " title="粗体 shift+alt+b"></i><i
                                            class="item fa fa-italic  " title="斜体 shift+alt+i"></i><i
                                            class="item fa fa-underline  " title="下划线 shift+alt+e"></i><i
                                            class="item fa fa-strikethrough  " title="删除线 shift+alt+d"></i><i
                                            class="item fa fa-header  " title="标题 shift+alt+h"></i><i
                                            class="item fa fa-quote-left  " title="引用 shift+alt+q"></i><i
                                            class="item fa fa-code  " title="代码 shift+alt+c"></i><i
                                            class="item fa fa-list-ol  " title="有序列表 shift+alt+o"></i><i
                                            class="item fa fa-list-ul  " title="无序列表 shift+alt+u"></i><i
                                            class="item fa fa-link  " title="链接 shift+alt+l"></i><i
                                            class="item fa fa-table  " title="表格 shift+alt+t"></i><i
                                            class="item fa fa-minus  " title="分隔线 shift+alt+n"></i><i
                                            class="item fa fa-image  " title="图片 shift+alt+p"></i><i
                                            class="item fa fa-question  " title="帮助 shift+alt+/"></i><i
                                            class="item fa fa-arrows-alt  control" title="全屏 shift+alt+f"></i><i
                                            class="item fa fa-desktop  control" title="preview shift+alt+w"></i><i
                                            class="item fa fa-columns active control" title="预览 shift+alt+s"></i>
                                    </ul>
                                </div>
                                <div class="body">
                                    <textarea class="editor"></textarea>
                                    <div class="viewer">
                                        <div class="markdown-body"></div>
                                    </div>
                                </div>
                            </div>
                            <textarea id="md-editor" class="" style="display: none;"></textarea>
                        </div>
                        <div id="html-container" class="form-group col-md-12" style="display: none;">
                            <div class="summernote" style="display: none;">
                            </div>
                            <div class="note-editor note-frame panel panel-default">
                                <div class="note-dropzone">
                                    <div class="note-dropzone-message"></div>
                                </div>
                                <div class="note-toolbar panel-heading">
                                    <div class="note-btn-group btn-group note-style">
                                        <div class="note-btn-group btn-group">
                                            <button type="button"
                                                    class="note-btn btn btn-default btn-sm dropdown-toggle"
                                                    tabindex="-1" data-toggle="dropdown" title=""
                                                    data-original-title="样式">
                                                <i class="note-icon-magic"></i>
                                                <span class="note-icon-caret"></span>
                                            </button>
                                            <div class="dropdown-menu dropdown-style">
                                                <li><a href="#" data-value="p"><p>普通</p></a></li>
                                                <li><a href="#" data-value="blockquote">
                                                    <blockquote>引用</blockquote>
                                                </a></li>
                                                <li><a href="#" data-value="pre">
                                                    <pre>代码</pre>
                                                </a></li>
                                                <li><a href="#" data-value="h1"><h1>标题 1</h1></a></li>
                                                <li><a href="#" data-value="h2"><h2>标题 2</h2></a></li>
                                                <li><a href="#" data-value="h3"><h3>标题 3</h3></a></li>
                                                <li><a href="#" data-value="h4"><h4>标题 4</h4></a></li>
                                                <li><a href="#" data-value="h5"><h5>标题 5</h5></a></li>
                                                <li><a href="#" data-value="h6"><h6>标题 6</h6></a></li>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="note-btn-group btn-group note-font">
                                        <button type="button" class="note-btn btn btn-default btn-sm note-btn-bold"
                                                tabindex="-1" title="" data-original-title="粗体 (CTRL+B)">
                                            <i class="note-icon-bold"></i>
                                        </button>
                                        <button type="button" class="note-btn btn btn-default btn-sm note-btn-underline"
                                                tabindex="-1" title="" data-original-title="下划线 (CTRL+U)">
                                            <i class="note-icon-underline"></i></button>
                                        <button type="button" class="note-btn btn btn-default btn-sm" tabindex="-1"
                                                title="" data-original-title="清除格式 (CTRL+\)">
                                            <i class="note-icon-eraser"></i>
                                        </button>
                                    </div
                                    >
                                    <div class="note-btn-group btn-group note-fontname">
                                        <div class="note-btn-group btn-group">
                                            <button type="button"
                                                    class="note-btn btn btn-default btn-sm dropdown-toggle"
                                                    tabindex="-1" data-toggle="dropdown" title=""
                                                    data-original-title="字体"><span class="note-current-fontname">sans-serif</span>
                                                <span class="note-icon-caret"></span></button>
                                            <div class="dropdown-menu note-check dropdown-fontname">
                                                <li><a href="#" data-value="Arial" class=""><i
                                                        class="note-icon-check"></i> <span style="font-family:Arial">Arial</span></a>
                                                </li>
                                                <li><a href="#" data-value="Arial Black" class=""><i
                                                        class="note-icon-check"></i> <span
                                                        style="font-family:Arial Black">Arial Black</span></a></li>
                                                <li><a href="#" data-value="Comic Sans MS" class=""><i
                                                        class="note-icon-check"></i> <span
                                                        style="font-family:Comic Sans MS">Comic Sans MS</span></a></li>
                                                <li><a href="#" data-value="Courier New" class=""><i
                                                        class="note-icon-check"></i> <span
                                                        style="font-family:Courier New">Courier New</span></a></li>
                                                <li><a href="#" data-value="Helvetica" class=""><i
                                                        class="note-icon-check"></i> <span
                                                        style="font-family:Helvetica">Helvetica</span></a></li>
                                                <li><a href="#" data-value="Impact" class=""><i
                                                        class="note-icon-check"></i> <span style="font-family:Impact">Impact</span></a>
                                                </li>
                                                <li><a href="#" data-value="Tahoma" class=""><i
                                                        class="note-icon-check"></i> <span style="font-family:Tahoma">Tahoma</span></a>
                                                </li>
                                                <li><a href="#" data-value="Times New Roman" class=""><i
                                                        class="note-icon-check"></i> <span
                                                        style="font-family:Times New Roman">Times New Roman</span></a>
                                                </li>
                                                <li><a href="#" data-value="Verdana" class=""><i
                                                        class="note-icon-check"></i> <span style="font-family:Verdana">Verdana</span></a>
                                                </li>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="note-btn-group btn-group note-color">
                                        <div class="note-btn-group btn-group note-color">
                                            <button type="button"
                                                    class="note-btn btn btn-default btn-sm note-current-color-button"
                                                    tabindex="-1" title="" data-original-title="最近使用"
                                                    data-backcolor="#FFFF00"><i class="note-icon-font note-recent-color"
                                                                                style="background-color: rgb(255, 255, 0);"></i>
                                            </button>
                                            <button type="button"
                                                    class="note-btn btn btn-default btn-sm dropdown-toggle"
                                                    tabindex="-1" data-toggle="dropdown" title=""
                                                    data-original-title="更多"><span class="note-icon-caret"></span>
                                            </button>
                                            <div class="dropdown-menu">
                                                <li>
                                                    <div class="btn-group">
                                                        <div class="note-palette-title">背景</div>
                                                        <div>
                                                            <button type="button"
                                                                    class="note-color-reset btn btn-default"
                                                                    data-event="backColor" data-value="inherit">透明
                                                            </button>
                                                        </div>
                                                        <div class="note-holder" data-event="backColor">
                                                            <div class="note-color-palette">
                                                                <div class="note-color-row">
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#000000"
                                                                            data-event="backColor" data-value="#000000"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#000000"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#424242"
                                                                            data-event="backColor" data-value="#424242"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#424242"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#636363"
                                                                            data-event="backColor" data-value="#636363"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#636363"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#9C9C94"
                                                                            data-event="backColor" data-value="#9C9C94"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#9C9C94"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#CEC6CE"
                                                                            data-event="backColor" data-value="#CEC6CE"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#CEC6CE"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#EFEFEF"
                                                                            data-event="backColor" data-value="#EFEFEF"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#EFEFEF"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#F7F7F7"
                                                                            data-event="backColor" data-value="#F7F7F7"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#F7F7F7"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#FFFFFF"
                                                                            data-event="backColor" data-value="#FFFFFF"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#FFFFFF"></button>
                                                                </div>
                                                                <div class="note-color-row">
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#FF0000"
                                                                            data-event="backColor" data-value="#FF0000"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#FF0000"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#FF9C00"
                                                                            data-event="backColor" data-value="#FF9C00"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#FF9C00"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#FFFF00"
                                                                            data-event="backColor" data-value="#FFFF00"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#FFFF00"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#00FF00"
                                                                            data-event="backColor" data-value="#00FF00"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#00FF00"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#00FFFF"
                                                                            data-event="backColor" data-value="#00FFFF"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#00FFFF"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#0000FF"
                                                                            data-event="backColor" data-value="#0000FF"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#0000FF"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#9C00FF"
                                                                            data-event="backColor" data-value="#9C00FF"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#9C00FF"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#FF00FF"
                                                                            data-event="backColor" data-value="#FF00FF"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#FF00FF"></button>
                                                                </div>
                                                                <div class="note-color-row">
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#F7C6CE"
                                                                            data-event="backColor" data-value="#F7C6CE"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#F7C6CE"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#FFE7CE"
                                                                            data-event="backColor" data-value="#FFE7CE"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#FFE7CE"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#FFEFC6"
                                                                            data-event="backColor" data-value="#FFEFC6"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#FFEFC6"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#D6EFD6"
                                                                            data-event="backColor" data-value="#D6EFD6"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#D6EFD6"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#CEDEE7"
                                                                            data-event="backColor" data-value="#CEDEE7"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#CEDEE7"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#CEE7F7"
                                                                            data-event="backColor" data-value="#CEE7F7"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#CEE7F7"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#D6D6E7"
                                                                            data-event="backColor" data-value="#D6D6E7"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#D6D6E7"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#E7D6DE"
                                                                            data-event="backColor" data-value="#E7D6DE"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#E7D6DE"></button>
                                                                </div>
                                                                <div class="note-color-row">
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#E79C9C"
                                                                            data-event="backColor" data-value="#E79C9C"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#E79C9C"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#FFC69C"
                                                                            data-event="backColor" data-value="#FFC69C"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#FFC69C"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#FFE79C"
                                                                            data-event="backColor" data-value="#FFE79C"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#FFE79C"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#B5D6A5"
                                                                            data-event="backColor" data-value="#B5D6A5"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#B5D6A5"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#A5C6CE"
                                                                            data-event="backColor" data-value="#A5C6CE"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#A5C6CE"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#9CC6EF"
                                                                            data-event="backColor" data-value="#9CC6EF"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#9CC6EF"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#B5A5D6"
                                                                            data-event="backColor" data-value="#B5A5D6"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#B5A5D6"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#D6A5BD"
                                                                            data-event="backColor" data-value="#D6A5BD"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#D6A5BD"></button>
                                                                </div>
                                                                <div class="note-color-row">
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#E76363"
                                                                            data-event="backColor" data-value="#E76363"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#E76363"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#F7AD6B"
                                                                            data-event="backColor" data-value="#F7AD6B"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#F7AD6B"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#FFD663"
                                                                            data-event="backColor" data-value="#FFD663"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#FFD663"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#94BD7B"
                                                                            data-event="backColor" data-value="#94BD7B"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#94BD7B"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#73A5AD"
                                                                            data-event="backColor" data-value="#73A5AD"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#73A5AD"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#6BADDE"
                                                                            data-event="backColor" data-value="#6BADDE"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#6BADDE"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#8C7BC6"
                                                                            data-event="backColor" data-value="#8C7BC6"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#8C7BC6"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#C67BA5"
                                                                            data-event="backColor" data-value="#C67BA5"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#C67BA5"></button>
                                                                </div>
                                                                <div class="note-color-row">
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#CE0000"
                                                                            data-event="backColor" data-value="#CE0000"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#CE0000"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#E79439"
                                                                            data-event="backColor" data-value="#E79439"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#E79439"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#EFC631"
                                                                            data-event="backColor" data-value="#EFC631"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#EFC631"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#6BA54A"
                                                                            data-event="backColor" data-value="#6BA54A"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#6BA54A"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#4A7B8C"
                                                                            data-event="backColor" data-value="#4A7B8C"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#4A7B8C"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#3984C6"
                                                                            data-event="backColor" data-value="#3984C6"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#3984C6"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#634AA5"
                                                                            data-event="backColor" data-value="#634AA5"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#634AA5"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#A54A7B"
                                                                            data-event="backColor" data-value="#A54A7B"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#A54A7B"></button>
                                                                </div>
                                                                <div class="note-color-row">
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#9C0000"
                                                                            data-event="backColor" data-value="#9C0000"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#9C0000"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#B56308"
                                                                            data-event="backColor" data-value="#B56308"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#B56308"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#BD9400"
                                                                            data-event="backColor" data-value="#BD9400"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#BD9400"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#397B21"
                                                                            data-event="backColor" data-value="#397B21"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#397B21"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#104A5A"
                                                                            data-event="backColor" data-value="#104A5A"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#104A5A"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#085294"
                                                                            data-event="backColor" data-value="#085294"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#085294"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#311873"
                                                                            data-event="backColor" data-value="#311873"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#311873"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#731842"
                                                                            data-event="backColor" data-value="#731842"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#731842"></button>
                                                                </div>
                                                                <div class="note-color-row">
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#630000"
                                                                            data-event="backColor" data-value="#630000"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#630000"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#7B3900"
                                                                            data-event="backColor" data-value="#7B3900"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#7B3900"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#846300"
                                                                            data-event="backColor" data-value="#846300"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#846300"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#295218"
                                                                            data-event="backColor" data-value="#295218"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#295218"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#083139"
                                                                            data-event="backColor" data-value="#083139"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#083139"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#003163"
                                                                            data-event="backColor" data-value="#003163"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#003163"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#21104A"
                                                                            data-event="backColor" data-value="#21104A"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#21104A"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#4A1031"
                                                                            data-event="backColor" data-value="#4A1031"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#4A1031"></button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="btn-group">
                                                        <div class="note-palette-title">前景</div>
                                                        <div>
                                                            <button type="button"
                                                                    class="note-color-reset btn btn-default"
                                                                    data-event="removeFormat" data-value="foreColor">默认
                                                            </button>
                                                        </div>
                                                        <div class="note-holder" data-event="foreColor">
                                                            <div class="note-color-palette">
                                                                <div class="note-color-row">
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#000000"
                                                                            data-event="foreColor" data-value="#000000"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#000000"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#424242"
                                                                            data-event="foreColor" data-value="#424242"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#424242"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#636363"
                                                                            data-event="foreColor" data-value="#636363"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#636363"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#9C9C94"
                                                                            data-event="foreColor" data-value="#9C9C94"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#9C9C94"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#CEC6CE"
                                                                            data-event="foreColor" data-value="#CEC6CE"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#CEC6CE"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#EFEFEF"
                                                                            data-event="foreColor" data-value="#EFEFEF"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#EFEFEF"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#F7F7F7"
                                                                            data-event="foreColor" data-value="#F7F7F7"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#F7F7F7"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#FFFFFF"
                                                                            data-event="foreColor" data-value="#FFFFFF"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#FFFFFF"></button>
                                                                </div>
                                                                <div class="note-color-row">
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#FF0000"
                                                                            data-event="foreColor" data-value="#FF0000"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#FF0000"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#FF9C00"
                                                                            data-event="foreColor" data-value="#FF9C00"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#FF9C00"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#FFFF00"
                                                                            data-event="foreColor" data-value="#FFFF00"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#FFFF00"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#00FF00"
                                                                            data-event="foreColor" data-value="#00FF00"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#00FF00"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#00FFFF"
                                                                            data-event="foreColor" data-value="#00FFFF"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#00FFFF"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#0000FF"
                                                                            data-event="foreColor" data-value="#0000FF"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#0000FF"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#9C00FF"
                                                                            data-event="foreColor" data-value="#9C00FF"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#9C00FF"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#FF00FF"
                                                                            data-event="foreColor" data-value="#FF00FF"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#FF00FF"></button>
                                                                </div>
                                                                <div class="note-color-row">
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#F7C6CE"
                                                                            data-event="foreColor" data-value="#F7C6CE"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#F7C6CE"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#FFE7CE"
                                                                            data-event="foreColor" data-value="#FFE7CE"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#FFE7CE"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#FFEFC6"
                                                                            data-event="foreColor" data-value="#FFEFC6"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#FFEFC6"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#D6EFD6"
                                                                            data-event="foreColor" data-value="#D6EFD6"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#D6EFD6"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#CEDEE7"
                                                                            data-event="foreColor" data-value="#CEDEE7"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#CEDEE7"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#CEE7F7"
                                                                            data-event="foreColor" data-value="#CEE7F7"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#CEE7F7"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#D6D6E7"
                                                                            data-event="foreColor" data-value="#D6D6E7"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#D6D6E7"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#E7D6DE"
                                                                            data-event="foreColor" data-value="#E7D6DE"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#E7D6DE"></button>
                                                                </div>
                                                                <div class="note-color-row">
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#E79C9C"
                                                                            data-event="foreColor" data-value="#E79C9C"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#E79C9C"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#FFC69C"
                                                                            data-event="foreColor" data-value="#FFC69C"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#FFC69C"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#FFE79C"
                                                                            data-event="foreColor" data-value="#FFE79C"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#FFE79C"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#B5D6A5"
                                                                            data-event="foreColor" data-value="#B5D6A5"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#B5D6A5"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#A5C6CE"
                                                                            data-event="foreColor" data-value="#A5C6CE"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#A5C6CE"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#9CC6EF"
                                                                            data-event="foreColor" data-value="#9CC6EF"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#9CC6EF"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#B5A5D6"
                                                                            data-event="foreColor" data-value="#B5A5D6"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#B5A5D6"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#D6A5BD"
                                                                            data-event="foreColor" data-value="#D6A5BD"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#D6A5BD"></button>
                                                                </div>
                                                                <div class="note-color-row">
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#E76363"
                                                                            data-event="foreColor" data-value="#E76363"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#E76363"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#F7AD6B"
                                                                            data-event="foreColor" data-value="#F7AD6B"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#F7AD6B"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#FFD663"
                                                                            data-event="foreColor" data-value="#FFD663"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#FFD663"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#94BD7B"
                                                                            data-event="foreColor" data-value="#94BD7B"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#94BD7B"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#73A5AD"
                                                                            data-event="foreColor" data-value="#73A5AD"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#73A5AD"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#6BADDE"
                                                                            data-event="foreColor" data-value="#6BADDE"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#6BADDE"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#8C7BC6"
                                                                            data-event="foreColor" data-value="#8C7BC6"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#8C7BC6"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#C67BA5"
                                                                            data-event="foreColor" data-value="#C67BA5"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#C67BA5"></button>
                                                                </div>
                                                                <div class="note-color-row">
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#CE0000"
                                                                            data-event="foreColor" data-value="#CE0000"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#CE0000"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#E79439"
                                                                            data-event="foreColor" data-value="#E79439"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#E79439"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#EFC631"
                                                                            data-event="foreColor" data-value="#EFC631"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#EFC631"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#6BA54A"
                                                                            data-event="foreColor" data-value="#6BA54A"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#6BA54A"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#4A7B8C"
                                                                            data-event="foreColor" data-value="#4A7B8C"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#4A7B8C"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#3984C6"
                                                                            data-event="foreColor" data-value="#3984C6"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#3984C6"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#634AA5"
                                                                            data-event="foreColor" data-value="#634AA5"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#634AA5"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#A54A7B"
                                                                            data-event="foreColor" data-value="#A54A7B"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#A54A7B"></button>
                                                                </div>
                                                                <div class="note-color-row">
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#9C0000"
                                                                            data-event="foreColor" data-value="#9C0000"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#9C0000"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#B56308"
                                                                            data-event="foreColor" data-value="#B56308"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#B56308"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#BD9400"
                                                                            data-event="foreColor" data-value="#BD9400"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#BD9400"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#397B21"
                                                                            data-event="foreColor" data-value="#397B21"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#397B21"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#104A5A"
                                                                            data-event="foreColor" data-value="#104A5A"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#104A5A"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#085294"
                                                                            data-event="foreColor" data-value="#085294"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#085294"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#311873"
                                                                            data-event="foreColor" data-value="#311873"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#311873"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#731842"
                                                                            data-event="foreColor" data-value="#731842"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#731842"></button>
                                                                </div>
                                                                <div class="note-color-row">
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#630000"
                                                                            data-event="foreColor" data-value="#630000"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#630000"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#7B3900"
                                                                            data-event="foreColor" data-value="#7B3900"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#7B3900"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#846300"
                                                                            data-event="foreColor" data-value="#846300"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#846300"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#295218"
                                                                            data-event="foreColor" data-value="#295218"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#295218"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#083139"
                                                                            data-event="foreColor" data-value="#083139"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#083139"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#003163"
                                                                            data-event="foreColor" data-value="#003163"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#003163"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#21104A"
                                                                            data-event="foreColor" data-value="#21104A"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#21104A"></button>
                                                                    <button type="button" class="note-color-btn"
                                                                            style="background-color:#4A1031"
                                                                            data-event="foreColor" data-value="#4A1031"
                                                                            title="" data-toggle="button" tabindex="-1"
                                                                            data-original-title="#4A1031"></button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="note-btn-group btn-group note-para">
                                        <button type="button" class="note-btn btn btn-default btn-sm" tabindex="-1"
                                                title="" data-original-title="无序列表 (CTRL+SHIFT+NUM7)"><i
                                                class="note-icon-unorderedlist"></i></button>
                                        <button type="button" class="note-btn btn btn-default btn-sm" tabindex="-1"
                                                title="" data-original-title="有序列表 (CTRL+SHIFT+NUM8)"><i
                                                class="note-icon-orderedlist"></i></button>
                                        <div class="note-btn-group btn-group">
                                            <button type="button"
                                                    class="note-btn btn btn-default btn-sm dropdown-toggle"
                                                    tabindex="-1" data-toggle="dropdown" title=""
                                                    data-original-title="段落"><i class="note-icon-align-left"></i> <span
                                                    class="note-icon-caret"></span></button>
                                            <div class="dropdown-menu">
                                                <div class="note-btn-group btn-group note-align">
                                                    <button type="button" class="note-btn btn btn-default btn-sm"
                                                            tabindex="-1" title=""
                                                            data-original-title="左对齐 (CTRL+SHIFT+L)"><i
                                                            class="note-icon-align-left"></i></button>
                                                    <button type="button" class="note-btn btn btn-default btn-sm"
                                                            tabindex="-1" title=""
                                                            data-original-title="居中对齐 (CTRL+SHIFT+E)"><i
                                                            class="note-icon-align-center"></i></button>
                                                    <button type="button" class="note-btn btn btn-default btn-sm"
                                                            tabindex="-1" title=""
                                                            data-original-title="右对齐 (CTRL+SHIFT+R)"><i
                                                            class="note-icon-align-right"></i></button>
                                                    <button type="button" class="note-btn btn btn-default btn-sm"
                                                            tabindex="-1" title=""
                                                            data-original-title="两端对齐 (CTRL+SHIFT+J)"><i
                                                            class="note-icon-align-justify"></i></button>
                                                </div>
                                                <div class="note-btn-group btn-group note-list">
                                                    <button type="button" class="note-btn btn btn-default btn-sm"
                                                            tabindex="-1" title="" data-original-title="减少缩进 (CTRL+[)">
                                                        <i class="note-icon-align-outdent"></i></button>
                                                    <button type="button" class="note-btn btn btn-default btn-sm"
                                                            tabindex="-1" title="" data-original-title="增加缩进 (CTRL+])">
                                                        <i class="note-icon-align-indent"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="note-btn-group btn-group note-table">
                                        <div class="note-btn-group btn-group">
                                            <button type="button"
                                                    class="note-btn btn btn-default btn-sm dropdown-toggle"
                                                    tabindex="-1" data-toggle="dropdown" title=""
                                                    data-original-title="表格"><i class="note-icon-table"></i> <span
                                                    class="note-icon-caret"></span></button>
                                            <div class="dropdown-menu note-table">
                                                <div class="note-dimension-picker">
                                                    <div class="note-dimension-picker-mousecatcher"
                                                         data-event="insertTable" data-value="1x1"
                                                         style="width: 10em; height: 10em;"></div>
                                                    <div class="note-dimension-picker-highlighted"></div>
                                                    <div class="note-dimension-picker-unhighlighted"></div>
                                                </div>
                                                <div class="note-dimension-display">1 x 1</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="note-btn-group btn-group note-insert">
                                        <button type="button" class="note-btn btn btn-default btn-sm" tabindex="-1"
                                                title="" data-original-title="链接 (CTRL+K)"><i
                                                class="note-icon-link"></i></button>
                                        <button type="button" class="note-btn btn btn-default btn-sm" tabindex="-1"
                                                title="" data-original-title="图片"><i class="note-icon-picture"></i>
                                        </button>
                                        <button type="button" class="note-btn btn btn-default btn-sm" tabindex="-1"
                                                title="" data-original-title="视频"><i class="note-icon-video"></i>
                                        </button>
                                    </div>
                                    <div class="note-btn-group btn-group note-view">
                                        <button type="button" class="note-btn btn btn-default btn-sm btn-fullscreen"
                                                tabindex="-1" title="" data-original-title="全屏"><i
                                                class="note-icon-arrows-alt"></i></button>
                                        <button type="button" class="note-btn btn btn-default btn-sm btn-codeview"
                                                tabindex="-1" title="" data-original-title="源代码"><i
                                                class="note-icon-code"></i></button>
                                        <button type="button" class="note-btn btn btn-default btn-sm" tabindex="-1"
                                                title="" data-original-title="帮助"><i class="note-icon-question"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="note-editing-area">
                                    <div class="note-placeholder" style="display: block;">写点儿什么吧...</div>
                                    <div class="note-handle">
                                        <div class="note-control-selection" style="display: none;">
                                            <div class="note-control-selection-bg"></div>
                                            <div class="note-control-holder note-control-nw"></div>
                                            <div class="note-control-holder note-control-ne"></div>
                                            <div class="note-control-holder note-control-sw"></div>
                                            <div class="note-control-sizing note-control-se"></div>
                                            <div class="note-control-selection-info"></div>
                                        </div>
                                    </div>
                                    <textarea class="note-codable"></textarea>
                                    <div class="note-editable panel-body" contenteditable="true"
                                         style="height: 340px;"></div>
                                </div>
                                <div class="note-statusbar">
                                    <div class="note-resizebar">
                                        <div class="note-icon-bar"></div>
                                        <div class="note-icon-bar"></div>
                                        <div class="note-icon-bar"></div>
                                    </div>
                                </div>
                                <div class="modal link-dialog" aria-hidden="false" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close"><span aria-hidden="true">×</span></button>
                                                <h4 class="modal-title">插入链接</h4></div>
                                            <div class="modal-body">
                                                <div class="form-group"><label>显示文本</label><input
                                                        class="note-link-text form-control" type="text"></div>
                                                <div class="form-group"><label>链接地址</label><input
                                                        class="note-link-url form-control" type="text" value="http://">
                                                </div>
                                                <div class="checkbox"><label><input type="checkbox" checked="">
                                                    在新窗口打开</label></div>
                                            </div>
                                            <div class="modal-footer">
                                                <button href="#" class="btn btn-primary note-link-btn disabled"
                                                        disabled="">插入链接
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal" aria-hidden="false" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close"><span aria-hidden="true">×</span></button>
                                                <h4 class="modal-title">插入图片</h4></div>
                                            <div class="modal-body">
                                                <div class="form-group note-group-select-from-files">
                                                    <label>从本地上传</label><input class="note-image-input form-control"
                                                                               type="file" name="files" accept="image/*"
                                                                               multiple="multiple"></div>
                                                <div class="form-group note-group-image-url" style="overflow:auto;">
                                                    <label>图片地址</label><input
                                                        class="note-image-url form-control col-md-12" type="text"></div>
                                            </div>
                                            <div class="modal-footer">
                                                <button href="#" class="btn btn-primary note-image-btn disabled"
                                                        disabled="">插入图片
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal" aria-hidden="false" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close"><span aria-hidden="true">×</span></button>
                                                <h4 class="modal-title">插入视频</h4></div>
                                            <div class="modal-body">
                                                <div class="form-group row-fluid"><label>视频地址
                                                    <small class="text-muted">(优酷, Instagram, DailyMotion, Youtube等)
                                                    </small>
                                                </label><input class="note-video-url form-control span12" type="text">
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button href="#" class="btn btn-primary note-video-btn disabled"
                                                        disabled="">插入视频
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal" aria-hidden="false" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close"><span aria-hidden="true">×</span></button>
                                                <h4 class="modal-title">帮助</h4></div>
                                            <div class="modal-body" style="max-height: 300px; overflow: scroll;">
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>ENTER</kbd></label><span>Insert Paragraph</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+Z</kbd></label><span>Undoes the last command</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+Y</kbd></label><span>Redoes the last command</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>TAB</kbd></label><span>Tab</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>SHIFT+TAB</kbd></label><span>Untab</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+B</kbd></label><span>Set a bold style</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+I</kbd></label><span>Set a italic style</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+U</kbd></label><span>Set a underline style</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+SHIFT+S</kbd></label><span>Set a strikethrough style</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+BACKSLASH</kbd></label><span>Clean a style</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+SHIFT+L</kbd></label><span>Set left align</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+SHIFT+E</kbd></label><span>Set center align</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+SHIFT+R</kbd></label><span>Set right align</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+SHIFT+J</kbd></label><span>Set full align</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+SHIFT+NUM7</kbd></label><span>Toggle unordered list</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+SHIFT+NUM8</kbd></label><span>Toggle ordered list</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+LEFTBRACKET</kbd></label><span>Outdent on current paragraph</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+RIGHTBRACKET</kbd></label><span>Indent on current paragraph</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+NUM0</kbd></label><span>Change current block's format as a paragraph(P tag)</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+NUM1</kbd></label><span>Change current block's format as H1</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+NUM2</kbd></label><span>Change current block's format as H2</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+NUM3</kbd></label><span>Change current block's format as H3</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+NUM4</kbd></label><span>Change current block's format as H4</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+NUM5</kbd></label><span>Change current block's format as H5</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+NUM6</kbd></label><span>Change current block's format as H6</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+ENTER</kbd></label><span>Insert horizontal rule</span>
                                                <div class="help-list-item"></div>
                                                <label style="width: 180px; margin-right: 10px;"><kbd>CTRL+K</kbd></label><span>Show Link Dialog</span>
                                            </div>
                                            <div class="modal-footer"><p class="text-center"><a
                                                    href="http://summernote.org/" target="_blank">Summernote 0.8.2</a> ·
                                                <a href="https://github.com/summernote/summernote" target="_blank">Project</a>
                                                · <a href="https://github.com/summernote/summernote/issues"
                                                     target="_blank">Issues</a></p></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group col-md-3 col-sm-4">
                            <label class="col-sm-4">开启评论</label>
                            <div class="col-sm-8">
                                <div class="toggle toggle-success allow-true" onclick="allow_comment(this);" on="true"
                                     style="height: 20px; width: 50px;">
                                    <div class="toggle-slide active">
                                        <div class="toggle-inner" style="width: 80px; margin-left: 0px;">
                                            <div class="toggle-on active"
                                                 style="height: 20px; width: 40px; text-align: center; text-indent: -10px; line-height: 20px;">
                                                开启
                                            </div>
                                            <div class="toggle-blob"
                                                 style="height: 20px; width: 20px; margin-left: -10px;"></div>
                                            <div class="toggle-off"
                                                 style="height: 20px; width: 40px; margin-left: -10px; text-align: center; text-indent: 10px; line-height: 20px;">
                                                关闭
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group col-md-3 col-sm-4">
                            <label class="col-sm-4">允许Ping</label>
                            <div class="col-sm-8">
                                <div class="toggle toggle-success allow-true" onclick="allow_ping(this);" on="true"
                                     style="height: 20px; width: 50px;">
                                    <div class="toggle-slide active">
                                        <div class="toggle-inner" style="width: 80px; margin-left: 0px;">
                                            <div class="toggle-on active"
                                                 style="height: 20px; width: 40px; text-align: center; text-indent: -10px; line-height: 20px;">
                                                开启
                                            </div>
                                            <div class="toggle-blob"
                                                 style="height: 20px; width: 20px; margin-left: -10px;"></div>
                                            <div class="toggle-off"
                                                 style="height: 20px; width: 40px; margin-left: -10px; text-align: center; text-indent: 10px; line-height: 20px;">
                                                关闭
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group col-md-3 col-sm-4">
                            <label class="col-sm-4">允许订阅</label>
                            <div class="col-sm-8">
                                <div class="toggle toggle-success allow-true" onclick="allow_feed(this);" on="true"
                                     style="height: 20px; width: 50px;">
                                    <div class="toggle-slide active">
                                        <div class="toggle-inner" style="width: 80px; margin-left: 0px;">
                                            <div class="toggle-on active"
                                                 style="height: 20px; width: 40px; text-align: center; text-indent: -10px; line-height: 20px;">
                                                开启
                                            </div>
                                            <div class="toggle-blob"
                                                 style="height: 20px; width: 20px; margin-left: -10px;"></div>
                                            <div class="toggle-off"
                                                 style="height: 20px; width: 40px; margin-left: -10px; text-align: center; text-indent: 10px; line-height: 20px;">
                                                关闭
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group col-md-3">
                            <label class="col-sm-5">添加缩略图</label>
                            <div class="col-sm-7">
                                <div id="thumb-toggle" class="toggle toggle-success" on="true" thumb_url=""
                                     onclick="add_thumbimg(this);" style="height: 20px; width: 50px;">
                                    <div class="toggle-slide active">
                                        <div class="toggle-inner" style="width: 80px; margin-left: 0px;">
                                            <div class="toggle-on active"
                                                 style="height: 20px; width: 40px; text-align: center; text-indent: -10px; line-height: 20px;">
                                                开启
                                            </div>
                                            <div class="toggle-blob"
                                                 style="height: 20px; width: 20px; margin-left: -10px;"></div>
                                            <div class="toggle-off"
                                                 style="height: 20px; width: 40px; margin-left: -10px; text-align: center; text-indent: 10px; line-height: 20px;">
                                                关闭
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="dropzone-container" class="form-group col-md-12" style="">
                            <div class="dropzone dropzone-previews dz-clickable" id="dropzone">
                                <div class="dz-message">
                                    <p>可以为你的文章添加一张缩略图 ;)</p>
                                </div>
                            </div>
                            <input type="hidden" name="thumb_img" id="thumb_img" value="">
                        </div>

                        <div class="clearfix"></div>

                        <div class="text-right">
                            <a class="btn btn-default waves-effect waves-light" href="/admin/article">返回列表</a>
                            <button type="button" class="btn btn-primary waves-effect waves-light"
                                    onclick="subArticle('publish');">
                                保存文章
                            </button>
                            <button type="button" class="btn btn-warning waves-effect waves-light"
                                    onclick="subArticle('draft');">
                                存为草稿
                            </button>
                        </div>
                    </form>
                </div>
            </div>


        </section>
    </section>

</section>
</section>
<!-- /中间内容 -->

<%--导入底部文件--%>
<%@include file="/WEB-INF/jsps/format/admin/foot.jsp" %>



