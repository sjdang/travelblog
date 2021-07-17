<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="panel">
	<div class="panel-heading">
		<h3 class="panel-title">通威集团分子公司列表</h3>
	</div>
	<div class="panel-body">

		<table id="dataTable"
			class="table table-bordered table-hover table-striped table-condensed"></table>

	</div>
</div>

<script type="text/javascript">
$(function(){
	
	$('#dataTable').DataTable({
        "bAutoWidth": false,
		"bProcessing": true,
        "bServerSide": true,
        "aLengthMenu": [5, 10, 20, 30],
        "iDisplayLength": 10,
        "bPaginate": true,
        "bInfo": true,
        "sPaginationType": "full_numbers",
        "bSort": false,
        "oLanguage": DATATABLE_LANGUATE,
        "ajax": "${ctx}/manage/test/testDataTable.do?timestamp=" + new Date().getTime(),
        "columns": [
	        {"data": "companyId","sTitle":"ID","sClass":"sjdang-hidden"},
	        {"data": "companyCode","sTitle":"公司编码"},
	        {"data": "companyName","sTitle":"公司名称"},
	        {"data": "isAvailable","sTitle":"是否有效","sClass":"text-center"}
        ]
        
    });
	
	$(".panel-body").delegate('#dataTable tr', 'dblclick', function () {
	    var nTds = $("td",this);
	    var sBrowser = $(nTds[0]).text();
	    $.niftyNoty({
	        type: 'success',
	        title: 'DataTables Values',
	        message: 'companyId : ' + sBrowser,
	        container: 'floating',
	        timer: 5000
	    });
	});
	
});
	
</script>
