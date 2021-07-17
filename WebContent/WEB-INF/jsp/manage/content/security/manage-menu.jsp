<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="panel">
	<div class="panel-heading">
		<h3 class="panel-title">管理控制台菜单目录</h3>
	</div>
	<div class="panel-body">
		<div class="row pad-btm bord-btm">
			<button id="createMenu"
				class="btn btn-default btn-hover-primary add-tooltip"
				data-toggle="tooltip" data-container="body" data-placement="right"
				data-original-title="当选中列表某一菜单时，则创建其子菜单，否则默认创建一级菜单。">
				<i class="ion-ios-plus-outline icon-fw fa-lg"></i> 创建菜单
			</button>
			<button id="editMenu" class="btn btn-default btn-hover-warning">
				<i class="ion-ios-compose-outline icon-fw fa-lg"></i> 编辑菜单
			</button>
			<button id="deleteMenu" class="btn btn-default btn-hover-danger">
				<i class="ion-ios-trash-outline icon-fw fa-lg"></i> 删除菜单
			</button>
		</div>
		<br>
		<div id="MenuTree"></div>

	</div>
</div>

<div class="modal fade" id="MenuModal" role="dialog" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<i class="pci-cross pci-circle"></i>
				</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body">
				<input type="hidden" id="totalCount" value="1">
				<form id="MenuForm" class="form-horizontal">
					<input type="hidden" id="menuId" name="menuId"> <input
						type="hidden" id="parentId" name="parentId"> <input
						type="hidden" id="operate" name="operate">
					<fieldset>
						<div class="form-group">
							<label class="col-lg-3 control-label">菜单编码</label>
							<div class="col-lg-7">
								<input type="text" id="menuCode" class="form-control"
									placeholder="自动生成" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3 control-label"><span
								class="text-danger icon-fw">*</span>菜单名称</label>
							<div class="col-lg-7">
								<input type="text" id="menuName" name="menuName"
									class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3 control-label">菜单图标</label>
							<div class="col-lg-7">
								<input type="text" id="menuIcon" name="menuIcon"
									class="form-control" placeholder="如：ion-cube icon-fw">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3 control-label">菜单URL</label>
							<div class="col-lg-7">
								<input type="text" id="menuUrl" name="menuUrl"
									class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3 control-label"><span
								class="text-danger icon-fw">*</span>菜单排序</label>
							<div class="col-lg-7">
								<input type="number" min="1" max="100" id="menuSort"
									name="menuSort" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3 control-label">菜单描述</label>
							<div class="col-lg-7">
								<textarea id="menuDesc" name="menuDesc" rows="4"
									class="form-control" placeholder="最多允许输入200个汉字..."></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3 control-label"><span
								class="text-danger icon-fw">*</span>是否启用</label>
							<div class="col-lg-7">
								<div class="radio">
									<input id="isValid-1" class="magic-radio" type="radio"
										name="isValid" value="1" checked> <label
										for="isValid-1">是</label> <input id="isValid-0"
										class="magic-radio" type="radio" name="isValid" value="0">
									<label for="isValid-0">否</label>
								</div>
							</div>
						</div>
					</fieldset>
					<p class="bord-btm pad-ver text-main">父级菜单信息</p>
					<fieldset>
						<div class="form-group">
							<label class="col-lg-3 control-label">父级菜单编码</label>
							<div class="col-lg-7">
								<input type="text" id="parentMenuCode" class="form-control"
									readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3 control-label">父级菜单名称</label>
							<div class="col-lg-7">
								<input type="text" id="parentMenuName" class="form-control"
									readonly>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
				<button type="button" id="saveMenu" class="btn btn-primary"
					data-loading-text="保存中...">保存</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

$(function(){
	
	// 初始化Tooltip插件
	$initTooltip();
	// 初始化Treeview插件
	initMenuData();
	
});

function initMenuData() {
	$ajaxLoading(true);
	$.ajax({
		type: 'get',
		async: false,
		url: '${ctx}/manage/security/menu/treeList.do',
		data: '',
		dataType: "json",
		success: function(data) {
			if (data.resFlag == 0) {
				$('#totalCount').val(data.resData.length);
				initTreeview(data.resData);
			} else {
				$ajaxLoading(false);
			}
		},
		error: function(msg) {
			$ajaxLoading(false);
		}
	});
}

function initTreeview(jsonData) {
	var options = {
          data: jsonData,
          levels: 5,
          showTags: true,
          multiSelect: false,
          onNodeSelected: function(event, node) {
            $.niftyNoty({
    	        type: 'warning',
    	        title: 'Welcome Administrator.',
    	        message: node.text + ' was selected.',
    	        container: 'floating',
    	        timer: 5000
    	    });
          }
        };

	$('#MenuTree').treeview(options);
	$ajaxLoading(false);
}

// 创建菜单
$('#createMenu').bind('click', function() {
	$('#MenuForm')[0].reset();
	$('#operate').val('CREATE');
	$('.modal-title').html('<i class="ion-ios-plus-outline icon-fw fa-lg"></i>创建菜单');
	var totalCount = parseInt($('#totalCount').val());
	if (totalCount == 0) {
		$('#parentId').val(0);
		$('#MenuModal').modal('show');
		return;
	}
	var selectedArr = $('#MenuTree').treeview('getSelected');
	if (selectedArr.length <= 0) {
		$('#parentId').val(0);
	} else {
		var menuObj = selectedArr[0];
		$('#parentId').val(menuObj.menuId);
		$('#parentMenuCode').val(menuObj.menuCode);
		$('#parentMenuName').val(menuObj.menuName);
	}
	$('#MenuModal').modal('show');
});

// 编辑菜单
$('#editMenu').bind('click', function() {
	var totalCount = parseInt($('#totalCount').val());
	if (totalCount == 0) {
		$alertInfo('暂无记录可编辑');
		return;
	}
	var selectedArr = $('#MenuTree').treeview('getSelected');
	if (selectedArr.length <= 0) {
		$alertInfo('请先选中一条记录');
		return;
	}
	$ajaxLoading(true);
	$.ajax({
		type: 'get',
		async: false,
		url: '${ctx}/manage/security/menu/getOne.do',
		data: {'menuId': selectedArr[0].menuId},
		dataType: 'json',
		success: function(data) {
			if (data.resFlag == 0) {
				reloadMenuForm(data.resData);
			} else {
				$ajaxLoading(false);
				$alertError(data.resMsg);
			}
		},
		error: function(msg) {
			$ajaxLoading(false);
			$alertError('系统异常');
		}
	});
});

// 填充表单数据
function reloadMenuForm(dataObj) {
	$('#operate').val('UPDATE');
	$('.modal-title').html('<i class="ion-ios-compose-outline icon-fw fa-lg"></i>编辑菜单');
	$('#MenuForm')[0].reset();
	for (var key in dataObj) {
		var value = dataObj[key];
		if (key == 'isValid') {
			$("input:radio[value='"+ value +"']").prop('checked','checked');
			continue;
		}
		if ($('#' + key).length > 0) {
			$('#' + key).val(value);
		}
	}
	$ajaxLoading(false);
	$('#MenuModal').modal('show');
}

// 删除菜单
$('#deleteMenu').bind('click', function() {
	var totalCount = parseInt($('#totalCount').val());
	if (totalCount == 0) {
		$alertInfo('暂无记录可删除');
		return;
	}
	var selectedArr = $('#MenuTree').treeview('getSelected');
	if (selectedArr.length <= 0) {
		$alertInfo('请先选中一条记录');
		return;
	}
	$confirmInfo('您正在删除当前菜单，删除后不可恢复，请确认是否继续？', deleteMenu, selectedArr[0].menuId);
});

function deleteMenu(menuId) {
	$ajaxLoading(true);
	$.ajax({
		type: 'post',
		async: false,
		url: '${ctx}/manage/security/menu/delete.do',
		data: {'menuId': menuId},
		dataType: 'json',
		success: function(data) {
			if (data.resFlag == 0) {
				initMenuData();
				$ajaxLoading(false);
				$alertSuccess(data.resMsg);
			} else {
				$ajaxLoading(false);
				$alertError(data.resMsg);
			}
		},
		error: function(msg) {
			$ajaxLoading(false);
			$alertError('系统异常');
		}
	});
}

// 保存菜单
$('#saveMenu').bind('click', function() {
	
	var btn = $(this).button('loading');
	
	$.ajax({
		type: 'post',
		async: false,
		url: '${ctx}/manage/security/menu/save.do',
		data: $('#MenuForm').serialize(),
		dataType: 'json',
		success: function(data) {
			btn.button('reset')
			if (data.resFlag == 0) {
				$('#MenuModal').modal('hide');
				initMenuData();
			} else {
				$alertError(data.resMsg);
			}
		},
		error: function(msg) {
			btn.button('reset')
			$alertError('系统异常');
		}
	});
	
});
	
</script>
