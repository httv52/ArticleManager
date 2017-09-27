/**
 *  全局函数对象   var hutao = new $.hutao();
 */
$.extend({
    hutao: function () {
    },
    constant: function () { //常量池
        return {
            ///-------文件常量----------
            MAX_FILES: 10,//一次队列最大文件数
        }
    }

});

/*简单弹窗*/
/**
 * 错误弹窗
 * @param msg
 */
$.hutao.prototype.errorContent = function (msg) {
    toastr.options = {
        closeButton: true,
        debug: false,
        progressBar: true,
        positionClass: "toast-top-center",
        onclick: null,
        showDuration: 400,
        hideDuration: 1000,
        timeOut: 7000,
        extendedTimeOut: 1000,
        showEasing: "swing",
        hideEasing: "linear",
        showMethod: "fadeIn",
        hideMethod: "fadeOut"
    };

    toastr.error(msg);
}

/**
 * 成功弹窗
 * @param msg
 */
$.hutao.prototype.successContent = function (msg) {
    toastr.options = {
        closeButton: true,
        debug: false,
        progressBar: true,
        positionClass: "toast-top-center",
        onclick: null,
        showDuration: 400,
        hideDuration: 1000,
        timeOut: 7000,
        extendedTimeOut: 1000,
        showEasing: "swing",
        hideEasing: "linear",
        showMethod: "fadeIn",
        hideMethod: "fadeOut"
    };

    toastr.success(msg);
}

/**
 * 警告弹窗
 * @param msg
 */
$.hutao.prototype.warningContent = function (msg) {
    toastr.options = {
        closeButton: true,
        debug: false,
        progressBar: true,
        positionClass: "toast-top-center",
        onclick: null,
        showDuration: 400,
        hideDuration: 1000,
        timeOut: 7000,
        extendedTimeOut: 1000,
        showEasing: "swing",
        hideEasing: "linear",
        showMethod: "fadeIn",
        hideMethod: "fadeOut"
    };

    toastr.warning(msg);
}

/**
 * 警告弹窗
 * @param msg
 */
$.hutao.prototype.infoContent = function (msg) {
    toastr.options = {
        closeButton: true,
        debug: false,
        progressBar: true,
        positionClass: "toast-top-center",
        onclick: null,
        showDuration: 400,
        hideDuration: 1000,
        timeOut: 7000,
        extendedTimeOut: 1000,
        showEasing: "swing",
        hideEasing: "linear",
        showMethod: "fadeIn",
        hideMethod: "fadeOut"
    };

    toastr.info(msg);
}

/*复杂弹窗*/
/**
 * 成功弹框
 * @param options
 */
$.hutao.prototype.successAlert = function (options, callback) {
    options = options.length ? {text: options} : ( options || {} );
    options.title = options.title || '操作成功';
    options.text = options.text;
    options.showCancelButton = false;
    options.showCloseButton = false;
    options.type = 'success';
    this.baseAlert(options, callback);
};

/**
 * 弹出成功，并在700毫秒后刷新页面
 * @param text
 */
$.hutao.prototype.successAlertAndReload = function (text) {
    this.successAlert({
        text: text
    }, function () {
        setTimeout(function () {
            window.location.reload();
        }, 700);
    });
};

/**
 * 警告弹框
 * @param options
 */
$.hutao.prototype.warningAlert = function (options, callback) {
    options = options.length ? {text: options} : ( options || {} );
    options.title = options.title || '警告信息';
    options.text = options.text;
    options.timer = 3000;
    options.type = 'warning';
    this.baseAlert(options, callback);
};

/**
 * 询问确认弹框，这里会传入then函数进来
 * @param options
 */
$.hutao.prototype.questionAlert = function (options, callback) {
    options = options || {};
    options.title = options.title || '确定要删除吗？';
    options.text = options.text;
    options.showCancelButton = true;
    options.type = 'warning';
    this.baseAlert(options, callback);
};

/**
 * 错误提示
 * @param options
 */
$.hutao.prototype.errorAlert = function (options) {
    options = options.length ? {text: options} : ( options || {} );
    options.title = options.title || '错误信息';
    options.text = options.text;
    options.type = 'error';
    this.baseAlert(options);
};

/**
 * 公共弹框
 * @param options
 */
$.hutao.prototype.baseAlert = function (options, callback) {
    swal({
            title: options.title,
            text: options.text,
            type: options.type,
            timer: options.timer || 9999,
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


