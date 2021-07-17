<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="panel">
	<div class="panel-heading">
		<h3 class="panel-title">管理控制台角色列表</h3>
	</div>
	<div class="panel-body">

		<table id="RoleDataTable"
			class="table table-bordered table-hover table-striped table-condensed"></table>

	</div>
</div>

<script type="text/javascript">
$(function(){
	
	var dataTable = $('#RoleDataTable').DataTable({
		"autoWidth": false,
		"processing": true,
        "serverSide": true,
        "lengthMenu": [5, 10, 20, 30],
        "displayLength": 10,
        "paginate": true,
        "info": true,
        "paginationType": "full_numbers",
        "sort": false,
        "language": DATATABLE_LANGUATE,
        "ajax": "${ctx}/manage/security/role/dataList.do?timestamp=" + new Date().getTime(),
        "columns": [
	        {"data": null,"title":"序号","className":"text-center","width":"30px","render":function(data,type,row,meta) {
                return meta.row + 1 +
                meta.settings._iDisplayStart;
            }},
	        {"data": "roleId","title":"ID","className":"sjdang-hidden"},
	        {"data": "roleCode","title":"角色编码"},
	        {"data": "roleName","title":"角色名称"},
	        {"data": "roleLevel","title":"角色级别"},
	        {"data": "roleDesc","title":"角色描述"},
	        {"data": "isValid","title":"是否启用"},
	        {"data": "createUserName","title":"创建人"},
	        {"data": "createTime","title":"创建时间"},
	        {"data": "lastUpdateUserName","title":"最后更新人"},
	        {"data": "lastUpdateTime","title":"最后更新时间"}
        ]
    });
	
	$(".panel-body").delegate('#RoleDataTable tr', 'dblclick', function () {
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
	
	$('#RoleDataTable').on('click', 'tr', function() {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        } else {
        	dataTable.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });
	
});
	
</script>
