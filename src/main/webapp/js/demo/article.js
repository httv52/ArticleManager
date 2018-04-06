var mditor, htmlEditor;
var hutao = new $.hutao();
var attach_url = $('#attach_url').val();
// // 每60秒自动保存一次草稿
var refreshIntervalId = setInterval("autoSave()", 60 * 1000);


$(function () {

    /*markdown*/
    mditor = Mditor.fromTextarea(document.getElementById('editor'));

    var type = $('.myArticleType').val();

    if (type != '0') {
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
    if (!$("#hasPreviewImg").is(":checked") == true) {
        $('#previewImg').val('');
    }

    clearInterval(refreshIntervalId);
    $('#content-editor').val(content);
    $("#myArticleState").val(state);
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
                saveArticle(url, params);
                return;
            }
        );
    }

    saveArticle(url, params);
}

/**
 * 保存文章或草稿
 * @param params
 */
function saveArticle(url, params) {
    hutao.showLoading();

    $.ajax({
        type: "POST",
        url: url,
        data: params,
        dataType: "json",
        success: function (result) {
            handlerResult(result, function () {
                publish_success();
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
    var olgImg = $('#oldImg').val();
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
