<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="panel">
	<div class="panel-heading">
		<h3 class="panel-title">${title }</h3>
	</div>
	<div class="panel-body">
		<table id="company-table"
			class="table table-bordered table-hover table-striped">
			<thead>
				<tr>
					<th style="text-align: center;">公司编码</th>
					<th style="text-align: center;">公司名称</th>
					<th style="text-align: center;">是否有效</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${companyList}" var="company">
					<tr>
						<td>${company.companyCode}</td>
						<td>${company.companyName}</td>
						<td>${company.isAvailable}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<div class="panel">
	<div class="panel-heading">
		<h3 class="panel-title">2017年度各类衣服销量和单价柱形图</h3>
	</div>
	<div class="panel-body">
		<div id="echarts-div" style="width: 100%; height: 500px;"></div>
	</div>
</div>

<!-- 
<button id="saveBtn" type="button" class="btn btn-white btn-success btn-round move-right" onclick="queryCompanyList()">
	<i class="glyphicon glyphicon-floppy-disk"></i>
	保存
</button>
 -->

<script type="text/javascript">
	$(function(){
		
		var rowSelection = $('#company-table').DataTable({
	        "responsive": true,
	        "language": {
	            "paginate": {
	              "previous": '上一页',
	              "next": '下一页'
	            }
	        }
	    });
		
		$.ajax({
	        type: "get",
	        url: "${ctx}/manage/test/analysisData.do",
	        data: "",
	        dataType: "json",
	        async: false,
	        success: function(res) {
	            if(res.resFlag == "success"){
	            	initECharts(res.amountData,res.priceData);
	            }
	        }
	    });
	});
	
	function initECharts(amountData,priceData){
		// 基于准备好的dom，初始化echarts实例
	    var myChart = echarts.init(document.getElementById('echarts-div'));
	    // 指定图表的配置项和数据
	    var option = {
	        title: {
	            //text: '2017年度各类衣服销量和单价柱形图'
	        },
	        tooltip: {},
	        legend: {
	            data:['销量','单价']
	        },
	        xAxis: {
	            data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
	        },
	        yAxis: {},
	        series: [{
		            name: '销量',
		            type: 'bar',
		            data: amountData,
		            itemStyle: {
	                   //柱形图圆角，鼠标移上去效果(无效果)
	                   emphasis: {
	                       barBorderRadius: [10, 10, 10, 10]
	                   },
	                   normal: {
	                       //柱形图圆角，初始化效果
	                       barBorderRadius:[10, 10, 10, 10]
	                   }
		            }
	        	},
	        	{
		            name: '单价',
		            type: 'bar',
		            data: priceData,
		            itemStyle: {
		            	//柱形图圆角，鼠标移上去效果(无效果)
		                emphasis: {
		                    barBorderRadius: [10, 10, 10, 10]
		                },
		                normal: {
		                    //柱形图圆角，初始化效果
		                    barBorderRadius:[10, 10, 10, 10]
		                }
		            }
	        	}
	        ]
	    };
	 	// 使用刚指定的配置项和数据显示图表。
	    myChart.setOption(option);
	}
	
	function queryCompanyList(){
		$.ajax({
	        type: "post",
	        url: "${ctx}/manage/test/getAllOrgsByJson.do",
	        data: "",
	        dataType: "json",
	        async: false,
	        success: function(res) {
	        	console.log(res);
	            if(res.resFlag == "success"){ 
	            	alert(JSON.stringify(res.resData));
	            }else{
	            	showError("查询失败！");
	            }
	        }
	    });
	}

</script>
