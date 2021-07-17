<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>SpringMvc Test</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/themes/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/themes/bootstrap/css/confirm/jquery-confirm.min.css" />
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/themes/bootstrap/js/jquery-2.2.4.min.js"></script>
<!-- 最新的Bootstrap核心 JavaScript 文件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/themes/bootstrap/js/bootstrap.min.js"></script>
<!-- 引入ECharts核心 JavaScript 文件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/themes/echarts/js/echarts.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/themes/bootstrap/js/confirm/jquery-confirm.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/themes/bootstrap/js/confirm/confirm-extend.js"></script>
</head>
<body>
	<table
		class="table table-bordered table-hover table-striped table-condensed"
		style="margin: 0px auto; width: 1000px;">
		<caption>${title}</caption>
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
	<div id="echarts-div"
		style="width: 1000px; height: 500px; margin: 50px auto;"></div>

	<button id="saveBtn" type="button"
		class="btn btn-white btn-success btn-round move-right"
		onclick="queryCompanyList()">
		<i class="glyphicon glyphicon-floppy-disk"></i> 保存
	</button>

	<script type="text/javascript">
			$(function(){
				$.ajax({
			        type: "get",
			        url: "analysisData.do",
			        data: "",
			        dataType: "json",
			        async: false,
			        success: function(res) {
			            if(res.resFlag == "success"){
			            	showSuccess(JSON.stringify(res.amountData));
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
			            text: '2017年度各类衣服销量和单价柱形图'
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
			        url: "getAllOrgsByJson.do",
			        data: "",
			        dataType: "json",
			        async: false,
			        success: function(res) {
			        	console.log(res);
			            if(res.resFlag == "success"){ 
			            	showSuccess(JSON.stringify(res.resData));
			            }else{
			            	showError("查询失败！");
			            }
			        }
			    });
			}
		
		</script>
</body>
</html>