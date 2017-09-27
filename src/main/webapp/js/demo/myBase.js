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

/**
 * 转换时间戳
 * @param dateTimeStamp
 * @returns {*}
 */
function getDateDiff(dateTimeStamp) {
    var result;
    var minute = 1000 * 60;
    var hour = minute * 60;
    var day = hour * 24;
    var halfamonth = day * 15;
    var month = day * 30;
    var now = new Date().getTime();
    var diffValue = now - dateTimeStamp;
    if (diffValue < 0) {
        result = "未知";
    }
    var monthC = diffValue / month;
    var weekC = diffValue / (7 * day);
    var dayC = diffValue / day;
    var hourC = diffValue / hour;
    var minC = diffValue / minute;
    if (monthC >= 1) {
        result = "" + parseInt(monthC) + "个月前";
    }
    else if (weekC >= 1) {
        result = "" + parseInt(weekC) + "周前";
    }
    else if (dayC >= 1) {
        result = "" + parseInt(dayC) + "天前";
    }
    else if (hourC >= 1) {
        result = "" + parseInt(hourC) + "小时前";
    }
    else if (minC >= 1) {
        result = "" + parseInt(minC) + "分钟前";
    } else
        result = "刚刚";
    return result;
}

/**
 * 产生头像
 */
function changeHeadImg($imgEle, $useId) {
    if ($useId == '') {
        return;
    }
    var options = {
        /*foreground: [0, 0, 0, 255],               // 后景色 RGBA黑色
         background: [255, 255, 255, 255],         // 前景色 RGBA白色*/
        margin: 0.2,                              // 20% margin
        size: 320,                                // 420px square
        format: 'svg'                             // use SVG instead of PNG
    };
    var data = new Identicon($useId, options).toString();
    $($imgEle).attr("src", 'data:image/svg+xml;base64,' + data + '');
};


