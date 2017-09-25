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

