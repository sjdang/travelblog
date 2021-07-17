<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="panel">
	<div class="panel-heading">
		<h3 class="panel-title">管理控制台用户访问历史日志</h3>
	</div>
	<div class="panel-body">

		<table id="HistoryDataTable"
			class="table table-bordered table-hover table-striped table-condensed"></table>

	</div>
</div>

<script type="text/javascript">
$(function(){
	
	var dataTable = $('#HistoryDataTable').DataTable({
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
        "ajax": "${ctx}/manage/security/user/loginHistoryData.do?timestamp=" + new Date().getTime(),
        "columns": [
	        {"data": null,"title":"序号","className":"text-center","width":"30px","render":function(data,type,row,meta) {
                return meta.row + 1 +
                meta.settings._iDisplayStart;
            }},
	        {"data": "history_id","title":"ID","visible":false},
	        {"data": "user_id","title":"USER_ID","className":"sjdang-hidden"},
	        {"data": "session_id","title":"SESSION_ID"},
	        {"data": "user_no","title":"账号"},
	        {"data": "user_name","title":"名称"},
	        {"data": "login_time","title":"登入时间"},
	        {"data": "logout_time","title":"登出时间"}
        ]
    });
	
	$(".panel-body").delegate('#HistoryDataTable tr', 'dblclick', function () {
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
	
	$('#HistoryDataTable').on('click', 'tr', function() {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        } else {
        	dataTable.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });
	
});
	
</script>
