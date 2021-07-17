/**
 * @Description: 控制台弹出对话框自定义JS
 * @author SJDANG
 * @date 2018年4月10日
 */


/*
 * Alert 提示信息
 */
var $alertInfo = function(msg) {
	bootbox.dialog({
        message: msg,
        title: "<span class='text-primary'><i class='ion-help-circled icon-fw'></i>提示：</span>",
        buttons: {
            main: {
                label: "确定",
                className: "btn-primary",
                animateIn: 'zoomInDown',
                animateOut: 'zoomOutUp',
                callback: function() {}
            }
        }
    });
};

/*
 * Alert 警告信息
 */
var $alertWarning = function(msg) {
	bootbox.dialog({
		message: msg,
		title: "<span class='text-warning'><i class='ion-information-circled icon-fw'></i>警告：</span>",
		buttons: {
			main: {
				label: "确定",
				className: "btn-warning",
				animateIn: 'zoomInDown',
                animateOut: 'zoomOutUp',
				callback: function() {}
			}
		}
	});
};

/*
 * Alert 成功信息
 */
var $alertSuccess = function(msg) {
	bootbox.dialog({
		message: msg,
		title: "<span class='text-success'><i class='ion-checkmark-circled icon-fw'></i>成功：</span>",
		buttons: {
			main: {
				label: "确定",
				className: "btn-success",
				animateIn: 'zoomInDown',
                animateOut: 'zoomOutUp',
				callback: function() {}
			}
		}
	});
};

/*
 * Alert 错误信息
 */
var $alertError = function(msg) {
	bootbox.dialog({
		message: msg,
		title: "<span class='text-danger'><i class='ion-close-circled icon-fw'></i>错误：</span>",
		buttons: {
			main: {
				label: "确定",
				className: "btn-danger",
				animateIn: 'zoomInDown',
                animateOut: 'zoomOutUp',
				callback: function() {}
			}
		}
	});
};

/*
 * Confirm 提醒确认信息
 */
var $confirmInfo = function(msg, fn, param) {
	bootbox.dialog({
        message: msg,
        title: "<span class='text-primary'><i class='ion-help-circled icon-fw'></i>提示：</span>",
        buttons: {
        	success: {
                label: "取消",
                className: "btn-default",
                animateIn: 'zoomInDown',
                animateOut: 'zoomOutUp',
                callback: function() {}
            },
            main: {
                label: "确定",
                className: "btn-primary",
                animateIn: 'zoomInDown',
                animateOut: 'zoomOutUp',
                callback: function() {
                	fn(param);
                }
            }
        }
    });
};
