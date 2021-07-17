<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<style>
.fileinput-upload-button,.fileinput-remove-button,.btn-file {
	display: none;
}

.col-hgt {
	height: 46px;
	line-height: 46px;
}

.icon-opa,.text-opa {
	opacity: 0.1;
}

.icon-opa-2x,.text-opa-2x {
	opacity: 0.3;
}

.icon-opa-3x,.text-opa-3x {
	opacity: 0.5;
}

.icon-opa-4x,.text-opa-4x {
	opacity: 0.7;
}

.icon-opa-5x,.text-opa-5x {
	opacity: 0.9;
}
</style>

<div class="panel">
	<div class="panel-heading">
		<h3 class="panel-title">平台自定义用户头像列表</h3>
	</div>
	<div class="panel-body">
		<div class="row pad-btm bord-btm">
			<button id="createNewSculpture" class="btn btn-default btn-hover-primary">
				<i class="ion-ios-plus-outline icon-fw fa-lg"></i>创建新头像
			</button>
			<button id="stopSculpture" class="btn btn-default btn-hover-danger add-tooltip" data-toggle="tooltip" data-container="body" data-placement="right" data-original-title="头像一旦被弃用后将永久废止，请谨慎操作！">
				<i class="ion-ios-trash-outline icon-fw fa-lg"></i>弃用头像
			</button>
		</div>
		<br>
		<table id="SculptureDataTable" class="table table-bordered table-hover table-striped table-condensed"></table>
	</div>
</div>

<div class="modal fade" id="SculptureModal" role="dialog" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<i class="pci-cross pci-circle"></i>
				</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body">
				<form id="SculptureForm" class="form-horizontal">
					<input type="hidden" id="sculptureId" name="sculptureId">
					<input type="hidden" id="operate" name="operate">
					<fieldset>
						<div class="form-group">
							<label class="col-lg-3 control-label">头像色系</label>
							<div class="col-lg-7">
								<select id="sculptureClass" name="sculptureClass" class="form-control" data-placeholder="请选择头像色系">
									<option value="bg-primary" class="bg-primary">bg-primary</option>
									<option value="bg-success" class="bg-success">bg-success</option>
									<option value="bg-warning" class="bg-warning">bg-warning</option>
									<option value="bg-pink" class="bg-pink">bg-pink</option>
									<option value="bg-mint" class="bg-mint">bg-mint</option>
									<option value="bg-purple" class="bg-purple">bg-purple</option>
									<option value="bg-info" class="bg-info">bg-info</option>
									<option value="bg-danger" class="bg-danger">bg-danger</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3 control-label">适用性别</label>
							<div class="col-lg-7">
								<select id="genderRole" name="genderRole" class="form-control" data-placeholder="请选择适用性别">
									<option value="0">男</option>
									<option value="1">女</option>
									<option value="2">通用</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3 control-label">是否启用</label>
							<div class="col-lg-7">
								<input id="isValid" type="checkbox" checked>
							</div>
						</div>
					</fieldset>
					<!-- 
	                <p class="bord-btm pad-ver text-main">上传头像图片</p>
	                 -->
					<fieldset>
						<div class="form-group">
							<label class="col-lg-3 control-label">头像图片</label>
							<div class="col-lg-7">
								<div style="height: 300px;">
									<input id="uploadSculptureImage" type="file" class="file"
										multiple>
								</div>
							</div>
						</div>
					</fieldset>
				</form>

			</div>
			<div class="modal-footer">
				<button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
				<button id="saveSculpture" class="btn btn-primary">保存</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

var sculptureDataTable;

$(function(){
	
	// 初始化Tooltip插件
	$initTooltip();
	
	sculptureDataTable = $('#SculptureDataTable').DataTable({
        "autoWidth": false,
		"processing": true,
        "serverSide": true,
        "lengthMenu": [5, 10, 20, 30],
        "displayLength": 5,
        "paginate": true,
        "info": true,
        "paginationType": "full_numbers",
        "sort": false,
        "language": DATATABLE_LANGUATE,
        "ajax": "${ctx}/manage/common/sculpture/dataList.do?timestamp=" + new Date().getTime(),
        "columns": [
	        {"data": null,"title":"序号","className":"text-center","width":"30px","render":function(data,type,row,meta) {
	        	var index = meta.row + 1 + meta.settings._iDisplayStart;
                return '<div class="col-hgt">'+ index +'</div>';
            }},
	        {"data": "sculptureId","title":"SCULPTURE_ID","className":"sjdang-hidden"},
	        {"data": "sculptureUrl","title":"头像图片","className":"text-center","render":function(data,type,row,meta) {
	        	return '<img class="img-circle img-sm" src="'+ data +'">';
            }},
	        {"data": "sculptureClass","title":"头像色系","render":function(data,type,row,meta) {
	        	return '<div class="col-hgt '+ data +'">'+ data +'</div>';
            }},
	        {"data": "genderRole","title":"适用性别","className":"text-center","render":function(data,type,row,meta) {
	        	var genderRoleDesc = '';
                if (data == 0) {
                	genderRoleDesc = '男';
                } else if (data == 1) {
                	genderRoleDesc = '女';
                } else {
                	genderRoleDesc = '通用';
                }
                return '<div class="col-hgt">'+ genderRoleDesc +'</div>';
            }},
	        {"data": "isValid","title":"是否启用","className":"text-center","render":function(data,type,row,meta) {
	        	var isValidDesc = '';
	        	if (data == 1) {
	        		isValidDesc = '<p class="text-success text-bold">是</p>';
                } else {
                	isValidDesc = '<p class="text-danger text-bold">否</p>';
                }
	        	return '<div class="col-hgt">'+ isValidDesc +'</div>';
            }},
	        {"data": "createUserName","title":"创建人","render":function(data,type,row,meta) {
	        	return '<div class="col-hgt">'+ data +'</div>';
            }},
	        {"data": "createTime","title":"创建时间","render":function(data,type,row,meta) {
	        	return '<div class="col-hgt">'+ data +'</div>';
            }},
	        {"data": "lastUpdateUserName","title":"最后更新人","render":function(data,type,row,meta) {
	        	return '<div class="col-hgt">'+ data +'</div>';
            }},
	        {"data": "lastUpdateTime","title":"最后更新时间","render":function(data,type,row,meta) {
	        	return '<div class="col-hgt">'+ data +'</div>';
            }}
        ]
    });
	
	$(".panel-body").delegate('#SculptureDataTable tr', 'dblclick', function () {
	    var nTds = $("td",this);
	    var sBrowser = $(nTds[3]).text();
	    $.niftyNoty({
	        type: 'success',
	        title: 'DataTables Values',
	        message: 'SESSION-ID : ' + sBrowser,
	        container: 'floating',
	        timer: 5000
	    });
	});
	
	$('#SculptureDataTable').on('click', 'tr', function() {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        } else {
        	dataTable.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });
	
});

/*
 *  初始化JQuery Chosen插件
 */
$('#genderRole').chosen();
$('#sculptureClass').chosen();
$('.chosen-container ').css('width','100%');

/*
 *  初始化Switchery插件
 */
new Switchery(document.getElementById('isValid'));

/*
 *  初始化BootstrapValidator表单验证插件
 */
$('#SculptureForm').bootstrapValidator({
	message: '当前值不合法',
	fields: {
		sculptureClass: {
			validators: {
				notEmpty: {
					message: '“头像色系”值不能为空'
				},
				regexp: {
					regexp: /^[A-Z-]+$/i,
					message: '“头像色系”值只能包含空格或英文字母'
				}
			}
		}
	}
}).on('success.field.bv', function(e, data) {
	e.preventDefault();
	var $parent = data.element.parents('.form-group');
	$parent.removeClass('has-success');
});

/*
 *  初始化Bootstrap Fileinput插件
 */
$("#uploadSculptureImage").fileinput({
   	  language: 'zh',
      uploadUrl: '${ctx}/manage/common/sculpture/save.do',
      uploadExtraData:function (previewId, index) {
    	  var sculptureClass = $("#sculptureClass").val();
    	  var genderRole = $("#genderRole").val();
    	  //var isValid = $("#isValid").val();
    	  var operate = $("#operate").val();
          var obj = {
        		  "sculptureClass" : sculptureClass,
        		  "genderRole" : genderRole,
        		  //"isValid" : isValid,
        		  "operate" : operate,
        		  "upload" : 'TRUE'
          };
          return obj;
      },
      allowedFileExtensions : ['jpeg', 'jpg', 'png','gif'],
      overwriteInitial: false,
      minFileSize: 1,
      maxFileSize: 1024,
      minFileCount: 1,
      maxFileCount: 1,
      showUpload: true,
      showRemove: true,
      showCaption: false,
      browseOnZoneClick: true,
      fileActionSettings: {
    	  showZoom: false,
    	  showUpload: false,
    	  showRemove: true
      },
      dropZoneTitle: '<i class="fa fa-cloud-upload fa-4x text-success icon-opa-2x"></i>',
      dropZoneClickTitle: '',
      slugCallback: function(filename) {
          return filename.replace('(', '_').replace(']', '_');
      }
});
   
/*
 *  文件异步上传成功后回调事件
 */
$("#uploadSculptureImage").on("fileuploaded", function (event, data, previewId, index) {
	var responseObj = data.response;
	if (isNotEmpty(responseObj)) {
		if (responseObj.resFlag == 0) {
			$('#SculptureModal').modal('hide');
			reloadDataTable();
	   	} else {
	   		
	   	}
	}
});

$('#createNewSculpture').bind('click', function() {
	$('.modal-title').text('创建用户头像');
	$(".fileinput-remove").click();
	$('#operate').val('CREATE');
	$('#sculptureId').val('');
	$('#SculptureClass').val('');
	$('#SculptureModal').modal('show');
});

$('#saveSculpture').bind('click', function() {
	saveOneSculpture();
});

/*
 *  保存用户头像信息
 */
function saveOneSculpture() {
	$('#SculptureForm').submit();
	var fileValue = $("#uploadSculptureImage").val();
	if (isNotEmpty(fileValue)) {
		$(".fileinput-upload-button").click();
	}
}

/*
 *  重新刷新DataTable并加载数据
 */
function reloadDataTable() {
	sculptureDataTable.ajax.reload();
}

</script>
