/**
 *  Tale全局函数对象   var tale = new $.tale();
 */
$.extend({
    tale: function () {
    },
    fileConstant:function(){ //常量池
        return{
            ///-------文件常量----------
            MAX_FILES:10,//一次队列最大文件数
        }
    }

});

/**
 * 成功弹框
 * @param options
 */
$.tale.prototype.alertOk = function (options) {
    options = options.length ? {text:options} : ( options || {} );
    options.title = options.title || '操作成功';
    options.showCancelButton = false;
    options.showCloseButton = false;
    options.type = 'success';
    this.baseAlert(options);
};

/**
 * 弹出成功，并在500毫秒后刷新页面
 * @param text
 */
$.tale.prototype.alertOkAndReload = function (text) {
    this.alertOk({text:text, then:function () {
        setTimeout(function () {
            window.location.reload();
        }, 700);
    }});
};

/**
 * 警告弹框
 * @param options
 */
$.tale.prototype.alertWarn = function (options) {
    options = options.length ? {text:options} : ( options || {} );
    options.title = options.title || '警告信息';
    options.timer = 3000;
    options.type = 'warning';
    this.baseAlert(options);
};

/**
 * 询问确认弹框，这里会传入then函数进来
 * @param options
 */
$.tale.prototype.alertConfirm = function (options) {
    options = options || {};
    options.title = options.title || '确定要删除吗？';
    options.showCancelButton = true;
    options.type = 'question';
    this.baseAlert(options);
};

/**
 * 错误提示
 * @param options
 */
$.tale.prototype.alertError = function (options) {
    options = options.length ? {text:options} : ( options || {} );
    options.title = options.title || '错误信息';
    options.type = 'error';
    this.baseAlert(options);
};

/**
 * 公共弹框
 * @param options   弹窗参数
 * @param callback  回调函数
 */
$.hutao.prototype.baseAlert = function (options, callback) {
    swal({
            title: options.title,
            text: options.text,
            type: options.type,
            showCloseButton: options.showCloseButton,
            showCancelButton: options.showCancelButton,
            showLoaderOnConfirm: options.showLoaderOnConfirm || false,
            confirmButtonColor: options.confirmButtonColor || '#3085d6',
            cancelButtonColor: options.cancelButtonColor || '#d33',
            confirmButtonText: options.confirmButtonText || '确定',
            cancelButtonText: options.cancelButtonText || '取消'
        }, callback
    );
};

/**
 * 全局post函数
 *
 * @param options   参数
 */
$.tale.prototype.post = function (options) {
    var self = this;
    $.ajax({
        type: 'POST',
        url: options.url,
        data: options.data || {},
        async: options.async || false,
        dataType: 'json',
        success: function (result) {
            self.hideLoading();
            options.success && options.success(result);
        },
        error: function () {
            //
        }
    });
};

/**
 * 显示动画
 */
$.tale.prototype.showLoading = function () {
    if ($('#tale-loading').length == 0) {
        $('body').append('<div id="tale-loading"></div>');
    }
    $('#tale-loading').show();
};

/**
 * 隐藏动画
 */
$.tale.prototype.hideLoading = function () {
    $('#tale-loading') && $('#tale-loading').hide();
};

