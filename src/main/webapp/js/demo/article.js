var mditor, htmlEditor;
var hutao = new $.hutao();
var attach_url = $('#attach_url').val();
// // 每60秒自动保存一次草稿
// var refreshIntervalId = setInterval("autoSave()", 60 * 1000);


$(function () {

    /*markdown*/
    mditor = Mditor.fromTextarea(document.getElementById('editor'));

    mditor.on('ready', function () {
        // console.log(mditor.value);
        // mditor.value = '** hello **';
    });


    var type = $('.myArticleType').val();

    if (type !== '0') {
        // 富文本编辑器
        var this_ = $('#switch-btn');
        $('#md-container').hide();
        $('#html-container').show();
        $('.myArticleType').val('1');
        this_.attr('type', '1');
        this_.text('切换为Markdown编辑器');
    } else {
        //Markdown
        var this_ = $('#switch-btn');
        $('#html-container').hide();
        $('#md-container').show();
        $('.myArticleType').val('0');
        this_.attr('type', '0');
        this_.text('切换为富文本编辑器');
    }


    /*
     * 切换编辑器
     * */
    $("#switch-btn").click(function () {
        var type = $('.myArticleType').val();
        var this_ = $(this);
        if (type == '0') {
            // 切换为富文本编辑器
            $('#md-container').hide();
            $('#html-container').show();
            this_.text('切换为Markdown编辑器');
            $('.myArticleType').val('1');
        } else {
            // 切换为markdown编辑器
            $('#html-container').hide();
            $('#md-container').show();
            $('.myArticleType').val('0');
            this_.text('切换为富文本编辑器');
        }
    });

    /*添加缩略图*/
    $("#hasPreviewImg").change(function () {
        var $checked = this.checked;
        if ($checked == true) {
            $('#webuploader-container').removeClass('myHidden');
            $('#webuploader-container').show();
            $('#allowPreview').val("1");
        } else {
            $('#webuploader-container').addClass('myHidden');
            $('#allowPreview').val("0");
        }
    });

    /*订阅*/
    $("#hasAllowSub").change(function () {
        var $checked = this.checked;
        if ($checked == true) {
            $('#allowSub').val("1");
        } else {
            $('#allowSub').val("0");
        }
    });
    /*评论*/
    $("#hasAllowCommon").change(function () {
        var $checked = this.checked;
        if ($checked == true) {
            $('#allowCommon').val("1");
        } else {
            $('#allowCommon').val("0");
        }
    });

    //粘贴图
    $('#md-container').off("paste").on("paste", function (e) {

        //判断图片类型的正则
        var isImage = (/.jpg$|.jpeg$|.png$|.gif$/i);
        var e = e || event;
        var contentE = $('.textarea');
        var img = null;
        //IE支持window.clipboardData,chrome支持e.originalEvent.clipboardData
        var clipboardData = e.originalEvent.clipboardData || window.clipboardData;
        if (!(clipboardData && clipboardData.items)) {
            return;
        }

        for (var i = 0, length = clipboardData.items.length; i < length; i++) {
            var item = clipboardData.items[i];
            if (item.kind === 'file' && isImage.test(item.type)) {
                img = item.getAsFile();
                var url = img_URL;
                var formData = new FormData();
                formData.append('file', img);

                //上传图片
                var xhr = new XMLHttpRequest();
                //上传结束
                xhr.onload = function () {
                    var data = JSON.parse(xhr.responseText);
                    if (data.success) {
                        hutao.successContent("复制的图片上传成功 ：" + imgPath + data.relativePath,{
                            positionClass:"toast-buttom-right"
                        });
                        if (contentE.val().length === 0) {
                            //在光标后插入文本
                            mditor.editor.insertBeforeText("![alt](" + imgPath + data.relativePath + ")\r\n");
                        } else {
                            //在光标后插入文本
                            mditor.editor.insertBeforeText("\r\n![alt](" + imgPath + data.relativePath + ")\n");
                        }
                    }
                }

                xhr.open('POST', url, true);
                xhr.send(formData);

                //当剪贴板里是图片时，禁止默认的粘贴
                return false;
            }
        }

    });
});


/*分类*/
function changeCategoryId(categoryId) {
    $categoryId = categoryId;
    $("#categoryId").val($categoryId);
}

/**
 * 保存文章
 * @param status
 */
function submitArticle(state) {
    var content;
    // var content = $('.myArticleType').val() == '0' ? mditor.value : '1';
    if ($('.myArticleType').val() == '0') {
        content = mditor.value;
    } else {
        var $iframeEle = document.getElementById('summernoteText').contentWindow;
        content = $iframeEle.$(".summernote").code()
    }
    var title = $('#articleForm input[name=title]').val();
    if (title == '') {
        hutao.infoContent("请输入您的文章标题");
        return;
    }
    if (content == '') {
        hutao.infoContent('请输入您的文章标题正文内容');
        return;
    }
    //若不添加缩略图，清空previewImg的值
    if (!$("#hasPreviewImg").is(":checked") === true && $("#hasPreviewImg").length > 0) {
        $('#previewImg').val('');
    }

    $('#content-editor').val(content);
    // $("#myArticleState").val(state);
    var url = $("#articleForm #ajax_url").val();
    var params = $("#articleForm").serialize();

    if ($(".filelist .title").length > 0 && $("#previewImg").val() == '') {
        swal({
                title: '确认发布',
                text: '您的文章缩略图尚未上传，确认发布文章？',
                type: 'warning',

                showCancelButton: true,                //是否显示“取消”按钮。
                cancelButtonText: "取消",            //按钮内容
                cancelButtonColor: '#d33',

                showConfirmButton: true,
                confirmButtonColor: '#3085d6',
                confirmButtonText: '确定',
                closeOnConfirm: false,
                closeOnCancel: true                //点击返回上一步操作

            }, function () {
                saveArticle(url, params, state);
            }
        );
        return;
    }

    saveArticle(url, params, state);
}

/**
 * 保存文章或草稿
 * @param url
 * @param params
 * @param state
 */
function saveArticle(url, params, state) {
    if (state === 'submit') {
        hutao.showLoading({text: "发表中~~~"});
    }

    $.ajax({
        type: "POST",
        url: url,
        data: params,
        dataType: "json",
        success: function (result) {
            handlerResult(result, function () {
                if (state === 'submit') {
                    publish_success();
                } else {
                    hutao.successContent("保存成功");
                }
            });
        },
        error: function (result) {
            hutao.hideLoading();
            hutao.errorAlert(result.msg || '保存文章失败');
        }
    });
}

function publish_success() {
    hutao.successAlert({
        text: '文章保存成功'
    }, function () {
        setTimeout(function () {
            hutao.hideLoading();
            window.location.href = '/article/admin/articleManege';
        }, 500);
    });
}

function changeArticleImg(url, imgPath) {
    $('#oldImg').val();
    hutao.showLoadingEle("#articleImgEle");

    $.ajax({
        type: "GET",
        url: url,
        success: function (result) {
            handlerResult(result, function () {
                $("#articleImg").attr("src", imgPath + result.data);
                $('#previewImg').val(result.data);
                $("#restoreArticleImg").show();
                hutao.hideLoadingEle("#articleImgEle");
            });
        },
        error: function (result) {
            hutao.errorAlert(result.msg || '操作失败');
            hutao.hideLoadingEle("#articleImg");
        }
    });
}

function restoreArticleImg(imgPath) {
    hutao.showLoadingEle("#articleImgEle");
    var olgImg = $('#oldImg').val();
    $("#articleImg").attr("src", imgPath + olgImg);
    $('#previewImg').val(olgImg);
    $("#restoreArticleImg").hide();
    hutao.hideLoadingEle("#articleImgEle");
}
