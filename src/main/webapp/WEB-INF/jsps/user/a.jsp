<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="modal-content">
    <!--<form class="avatar-form" action="upload-logo.php" enctype="multipart/form-data" method="post">-->
    <form class="avatar-form">
        <div class="modal-header">
            <button class="close" data-dismiss="modal" type="button">×</button>
            <h4 class="modal-title" id="avatar-modal-label">上传图片</h4>
        </div>
        <div class="modal-body">
            <div class="avatar-body">
                <div class="avatar-upload">
                    <input class="avatar-src" name="avatar_src" type="hidden">
                    <input class="avatar-data" name="avatar_data" type="hidden">
                    <label for="avatarInput" style="line-height: 35px;">图片上传</label>
                    <button class="btn btn-danger" type="button" style="height: 35px;"
                            onclick="$('input[id=avatarInput]').click();">请选择图片
                    </button>
                    <span id="avatar-name">TIM图片20170722084311.jpg</span>
                    <input class="avatar-input hide" id="avatarInput" name="avatar_file" type="file"></div>
                <div class="row">
                    <div class="col-md-9">
                        <div class="avatar-wrapper"><img
                                src="blob:http://www.jq22.com/410984b3-7177-4746-94a0-7c113bad260d"
                                class="cropper-hidden">
                            <div class="cropper-container cropper-bg" style="width: 621px; height: 364px;">
                                <div class="cropper-wrap-box">
                                    <div class="cropper-canvas"
                                         style="width: 292.02px; height: 273.479px; left: 143.741px; top: 57.5304px;">
                                        <img src="blob:http://www.jq22.com/410984b3-7177-4746-94a0-7c113bad260d"
                                             style="width: 292.02px; height: 273.479px; margin-left: 0px; margin-top: 0px; transform: none;">
                                    </div>
                                </div>
                                <div class="cropper-drag-box cropper-modal cropper-crop"></div>
                                <div class="cropper-crop-box"
                                     style="width: 364px; height: 364px; left: 101.9px; top: 0px;"><span
                                        class="cropper-view-box"><img
                                        src="blob:http://www.jq22.com/410984b3-7177-4746-94a0-7c113bad260d"
                                        style="width: 292.02px; height: 273.479px; margin-left: 41.8407px; margin-top: 57.5304px; transform: none;"></span><span
                                        class="cropper-dashed dashed-h"></span><span
                                        class="cropper-dashed dashed-v"></span><span class="cropper-center"></span><span
                                        class="cropper-face cropper-move"></span><span class="cropper-line line-e"
                                                                                       data-action="e"></span><span
                                        class="cropper-line line-n" data-action="n"></span><span
                                        class="cropper-line line-w" data-action="w"></span><span
                                        class="cropper-line line-s" data-action="s"></span><span
                                        class="cropper-point point-e" data-action="e"></span><span
                                        class="cropper-point point-n" data-action="n"></span><span
                                        class="cropper-point point-w" data-action="w"></span><span
                                        class="cropper-point point-s" data-action="s"></span><span
                                        class="cropper-point point-ne" data-action="ne"></span><span
                                        class="cropper-point point-nw" data-action="nw"></span><span
                                        class="cropper-point point-sw" data-action="sw"></span><span
                                        class="cropper-point point-se" data-action="se"></span></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="avatar-preview preview-lg" id="imageHead" style="width: 182px; height: 182px;"><img
                                src="blob:http://www.jq22.com/410984b3-7177-4746-94a0-7c113bad260d"
                                style="display: block; width: 146.01px; height: 136.739px; min-width: 0px !important; min-height: 0px !important; max-width: none !important; max-height: none !important; margin-left: 20.9203px; margin-top: 28.7652px; transform: none;">
                        </div>
                        <!--<div class="avatar-preview preview-md"></div>
                <div class="avatar-preview preview-sm"></div>-->
                    </div>
                </div>
                <div class="row avatar-btns">
                    <div class="col-md-4">
                        <div class="btn-group">
                            <button class="btn btn-danger fa fa-undo" data-method="rotate" data-option="-90"
                                    type="button" title="Rotate -90 degrees"> 向左旋转
                            </button>
                        </div>
                        <div class="btn-group">
                            <button class="btn  btn-danger fa fa-repeat" data-method="rotate" data-option="90"
                                    type="button" title="Rotate 90 degrees"> 向右旋转
                            </button>
                        </div>
                    </div>
                    <div class="col-md-5" style="text-align: right;">
                        <button class="btn btn-danger fa fa-arrows" data-method="setDragMode" data-option="move"
                                type="button" title="移动">
							            <span class="docs-tooltip" data-toggle="tooltip" title=""
                                              data-original-title="$().cropper(&quot;setDragMode&quot;, &quot;move&quot;)">
							            </span>
                        </button>
                        <button type="button" class="btn btn-danger fa fa-search-plus" data-method="zoom"
                                data-option="0.1" title="放大图片">
							            <span class="docs-tooltip" data-toggle="tooltip" title=""
                                              data-original-title="$().cropper(&quot;zoom&quot;, 0.1)">
							              <!--<span class="fa fa-search-plus"></span>-->
							            </span>
                        </button>
                        <button type="button" class="btn btn-danger fa fa-search-minus" data-method="zoom"
                                data-option="-0.1" title="缩小图片">
							            <span class="docs-tooltip" data-toggle="tooltip" title=""
                                              data-original-title="$().cropper(&quot;zoom&quot;, -0.1)">
							              <!--<span class="fa fa-search-minus"></span>-->
							            </span>
                        </button>
                        <button type="button" class="btn btn-danger fa fa-refresh" data-method="reset" title="重置图片">
								            <span class="docs-tooltip" data-toggle="tooltip" title=""
                                                  data-original-title="$().cropper(&quot;reset&quot;)"
                                                  aria-describedby="tooltip866214">
								       </span></button>
                    </div>
                    <div class="col-md-3">
                        <button class="btn btn-danger btn-block avatar-save fa fa-save" type="button"
                                data-dismiss="modal"> 保存修改
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
