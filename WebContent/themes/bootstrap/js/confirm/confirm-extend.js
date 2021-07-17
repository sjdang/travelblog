/*
 * Boostrap Alert Extend
 * Author SJDANG
 * 信息提示
 */
function showMessage(content){
	$.alert({
    	icon: 'glyphicon glyphicon-heart',
        title: '提示：',
        content: content,
    });
}

/*
 * Boostrap Confirm Extend
 * Author SJDANG
 * 通用信息提示
 */
function showInfo(content){
    $.confirm({
    	icon: 'glyphicon glyphicon-heart',
        title: '提示：',
        content: content,
        type: 'blue',
        typeAnimated: true,
        buttons: {
            OK: {
                text: '确定',
                btnClass: 'btn-blue',
                action: function(){
                }
            }
        }
    });
}

/*
 * Boostrap Confirm Extend
 * Author SJDANG
 * 错误信息提示
 */
function showError(content){
    $.confirm({
    	icon: 'glyphicon glyphicon-remove-sign',
        title: '提示：',
        content: content,
        type: 'red',
        typeAnimated: true,
        buttons: {
            OK: {
                text: '确定',
                btnClass: 'btn-red',
                action: function(){
                }
            }
        }
    });
}

/*
 * Boostrap Confirm Extend
 * Author SJDANG
 * 成功信息提示
 */
function showSuccess(content){
    $.confirm({
    	icon: 'glyphicon glyphicon-ok-sign',
        title: '提示：',
        content: content,
        type: 'green',
        typeAnimated: true,
        buttons: {
            OK: {
                text: '确定',
                btnClass: 'btn-green',
                action: function(){
                }
            }
        }
    });
}

/*
 * Boostrap Confirm Extend
 * Author SJDANG
 * 警告信息提示
 */
function showWarn(content){
    $.confirm({
    	icon: 'glyphicon glyphicon-warning-sign',
        title: '提示：',
        content: content,
        type: 'orange',
        typeAnimated: true,
        buttons: {
            OK: {
                text: '确定',
                btnClass: 'btn-orange',
                action: function(){
                }
            }
        }
    });
}

