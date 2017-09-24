var mditor, htmlEditor;
// var tale = new $.tale();
var attach_url = $('#attach_url').val();
// // 每60秒自动保存一次草稿
var refreshIntervalId = setInterval("autoSave()", 60 * 1000);

$(function () {
    mditor = Mditor.fromTextarea(document.getElementById('editor'));

    var type = $('.myArticleType').val();
    // 富文本编辑器
    if (type != 'markdown') {
        var this_ = $('#switch-btn');
        mditor.value = '';
        $('#md-container').hide();
        $('#html-container').show();
        this_.text('切换为Markdown编辑器');
        this_.attr('type', 'texteditor');
    } else {
        var this_ = $('#switch-btn');
        $('#html-container').hide();
        $('#md-container').show();
        $('.myArticleType').val('markdown');
        this_.attr('type', 'markdown');
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
            mditor.value = '';
            $('#md-container').hide();
            $('#html-container').show();
            this_.text('切换为Markdown编辑器');
            $('.myArticleType').val('html');
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
            $('#webuploader-container').removeClass('hide');
            $('#webuploader-container').show();
        } else {
            $('#webuploader-container').addClass('hide');
            $('#previewImg').val('');
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
 }

 /!**
 * 保存文章
 * @param status
 *!/
 function subArticle(status) {
 var content = $('#type').val() == 'markdown' ? mditor.value : htmlEditor.summernote('code');
 var title = $('#articleForm input[name=title]').val();
 if (title == '') {
 tale.alertWarn('请输入文章标题');
 return;
 }
 if (content == '') {
 tale.alertWarn('请输入文章内容');
 return;
 }
 clearInterval(refreshIntervalId);
 $('#content-editor').val(content);
 $("#articleForm #status").val(status);
 $("#articleForm #categories").val($('#multiple-sel').val());
 var params = $("#articleForm").serialize();
 var url = $('#articleForm #cid').val() != '' ? '/admin/article/modify' : '/admin/article/publish';
 tale.post({
 url: url,
 data: params,
 success: function (result) {
 if (result && result.success) {
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
 }
 }
 });
 }

 function allow_comment(obj) {
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
