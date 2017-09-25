var mditor, htmlEditor;
var hutao = new $.hutao();
var attach_url = $('#attach_url').val();
// // 每60秒自动保存一次草稿
var refreshIntervalId = setInterval("autoSave()", 60 * 1000);

$(function () {
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
        if (type == 'markdown') {
            // 切换为富文本编辑器
            $('#md-container').hide();
            $('#html-container').show();
            this_.text('切换为Markdown编辑器');
            $('.myArticleType').val('summernote');
        } else {
            // 切换为markdown编辑器
            $('#html-container').hide();
            $('#md-container').show();
            $('.myArticleType').val('markdown');
            this_.text('切换为富文本编辑器');
        }
    });

    /*添加缩略图*/
    $("#hasPreviewImg").change(function () {
        var $checked = this.checked;
        if ($checked == true) {
            $('#webuploader-container').removeClass('myHidden');
            $('#webuploader-container').show();
        } else {
            $('#webuploader-container').addClass('myHidden');
            $('#previewImg').val('');
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

/*
 * 自动保存为草稿
 * */
/*
 function autoSave() {
 var content = $('#type').val() == 'markdown' ? mditor.value : htmlEditor.summernote('code');
 var title = $('#articleForm input[name=title]').val();
 if (title != '' && content != '') {
 $('#content-editor').val(content);
 $("#articleForm #status").val('draft');
 $("#articleForm #categories").val($('#multiple-sel').val());
 var params = $("#articleForm").serialize();
 var url = $('#articleForm #cid').val() != '' ? '/admin/article/modify' : '/admin/article/publish';
 tale.post({
 url: url,
 data: params,
 success: function (result) {
 if (result && result.success) {
 $('#articleForm #cid').val(result.payload);
 } else {
 tale.alertError(result.msg || '保存文章失败');
 }
 }
 });
 }
 }*/

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
    var content = $('.myArticleType').val() == '0' ? mditor.value : '1';
    var title = $('#articleForm input[name=title]').val();
    if (title == '') {
        hutao.infoContent("请输入您的文章标题");
        return;
    }
    if (content == '') {
        hutao.infoContent('请输入您的文章标题正文内容');
        return;
    }
    clearInterval(refreshIntervalId);
    $('#content-editor').val(content);
    alert(content);
    $("#articleForm #status").val(status);
    var url = $("#articleForm #ajax_url").val();
    var params = $("#articleForm").serialize();
    /*var data = {};
     $("#articleForm").serializeArray().map(function (x) {
     if (data[x.name] !== undefined) {
     if (!data[x.name].push) {
     data[x.name] = [data[x.name]];
     }
     data[x.name].push(x.value || '');
     } else {
     data[x.name] = x.value || '';
     }
     });*/
    // $("#result1").html(JSON.stringify(data));

    $.ajax({
        type: "POST",
        url: url,
        data: params,
        dataType: "json",
        success: function (date) {
            alert("123");
            /*if (result && result.success) {
             tale.alertOk({
             text: '文章保存成功',
             then: function () {
             setTimeout(function () {
             window.location.href = '/admin/article';
             }, 500);
             }
             });
             } else {
             tale.alertError(result.msg || '保存文章失败');
             }*/
        }
    });
}

/*function allow_comment(obj) {
 var this_ = $(obj);
 var on = this_.attr('on');
 if (on == 'true') {
 this_.attr('on', 'false');
 $('#allow_comment').val('false');
 } else {
 this_.attr('on', 'true');
 $('#allow_comment').val('true');
 }
 }

 function allow_ping(obj) {
 var this_ = $(obj);
 var on = this_.attr('on');
 if (on == 'true') {
 this_.attr('on', 'false');
 $('#allow_ping').val('false');
 } else {
 this_.attr('on', 'true');
 $('#allow_ping').val('true');
 }
 }


 function allow_feed(obj) {
 var this_ = $(obj);
 var on = this_.attr('on');
 if (on == 'true') {
 this_.attr('on', 'false');
 $('#allow_feed').val('false');
 } else {
 this_.attr('on', 'true');
 $('#allow_feed').val('true');
 }
 }

 function add_thumbimg(obj) {
 var this_ = $(obj);
 var on = this_.attr('on');
 console.log(on);
 if (on == 'true') {
 this_.attr('on', 'false');
 $('#dropzone-container').addClass('hide');
 $('#thumb_img').val('');
 } else {
 this_.attr('on', 'true');
 $('#dropzone-container').removeClass('hide');
 $('#dropzone-container').show();
 }
 }*/
