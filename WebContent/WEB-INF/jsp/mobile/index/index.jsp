<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的世界</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link href="${ctx}/themes/mui/css/mui.min.css" rel="stylesheet" />
<link href="${ctx}/themes/mui/css/app.css" rel="stylesheet" />
<link href="${ctx}/themes/mui/css/icons-extra.css" rel="stylesheet" />
<link href="${ctx}/themes/nifty/css/pace.min.css" rel="stylesheet" />
<link href="${ctx}/themes/custom/css/common/common.css" rel="stylesheet" />
<script src="${ctx}/themes/nifty/js/pace.min.js"></script>
<script src="${ctx}/themes/mui/js/mui.min.js"></script>
<script src="${ctx}/themes/mui/js/jquery.min.js"></script>
<script src="${ctx}/themes/echarts/js/echarts.min.js"></script>
<style>
.mui-content img {
	width: 100%;
}

.mui-icon-size {
	font-size: 1.3em;
}

.mui-icon-location {
	float: right;
}

.mui-img-border {
	border-radius: 21px;
}
</style>
</head>
<body>
	<header id="header" class="mui-bar mui-bar-transparent">
	<h1 class="mui-title">我的世界</h1>
	</header>
	<div class="mui-content">
		<!--静态图片-->
		<img id="img1" src="${ctx}/themes/mui/images/yuantiao.jpg" />
		<div class="mui-card">
			<div class="mui-card-header mui-card-media"
				style="height:40vw;background-image:url(${ctx}/themes/mui/images/cbd.jpg)"></div>
			<div class="mui-card-content">
				<div class="mui-card-content-inner">
					<p>无所适从的一天</p>
					<p style="color: #333;">这里显示文章摘要，让读者对文章内容有个粗略的概念...</p>
				</div>
			</div>
			<div class="mui-card-footer">
				2018-01-29 17:43:50 <span> <a> <span
						class="mui-icon mui-icon-chat mui-icon-size"></span> <span
						class="mui-badge mui-badge-primary mui-badge-inverted">200</span>
				</a> <a> <span
						class="mui-icon-extra mui-icon-extra-like mui-icon-size"></span> <span
						class="mui-badge mui-badge-primary mui-badge-inverted">20</span>
				</a>
				</span>
			</div>
		</div>
		<div class="mui-card">
			<div class="mui-card-content">
				<div class="mui-card-content-inner">
					包含页眉页脚的卡片，页眉常用来显示面板标题，页脚用来显示额外信息或支持的操作（比如点赞、评论等）</div>
			</div>
			<div class="mui-card-footer">
				2018-01-29 17:43:50 <span> <a> <span
						class="mui-icon mui-icon-chat mui-icon-size"></span> <span
						class="mui-badge mui-badge-primary mui-badge-inverted">200</span>
				</a> <a> <span
						class="mui-icon-extra mui-icon-extra-like mui-icon-size"></span> <span
						class="mui-badge mui-badge-primary mui-badge-inverted">20</span>
				</a>
				</span>
			</div>
		</div>
		<div class="mui-card">
			<div class="mui-card-header mui-card-media"
				style="height:40vw;background-image:url(${ctx}/themes/mui/images/yuantiao.jpg)"></div>
			<div class="mui-card-content">
				<div class="mui-card-content-inner">
					<p style="color: #333;">这里显示文章摘要，让读者对文章内容有个粗略的概念...</p>
				</div>
			</div>
			<div class="mui-card-footer">
				2018-01-29 17:43:50 <span> <a> <span
						class="mui-icon mui-icon-chat mui-icon-size"></span> <span
						class="mui-badge mui-badge-primary mui-badge-inverted">200</span>
				</a> <a> <span
						class="mui-icon-extra mui-icon-extra-like mui-icon-size"></span> <span
						class="mui-badge mui-badge-primary mui-badge-inverted">20</span>
				</a>
				</span>
			</div>
		</div>
		<div class="mui-card">
			<div class="mui-card-header">无所适从的一天</div>
			<div class="mui-card-content">
				<div class="mui-card-content-inner">
					包含页眉页脚的卡片，页眉常用来显示面板标题，页脚用来显示额外信息或支持的操作（比如点赞、评论等）</div>
			</div>
			<div class="mui-card-footer">
				2018-01-29 17:43:50 <span> <a> <span
						class="mui-icon mui-icon-chat mui-icon-size"></span> <span
						class="mui-badge mui-badge-primary mui-badge-inverted">200</span>
				</a> <a> <span
						class="mui-icon-extra mui-icon-extra-like mui-icon-size"></span> <span
						class="mui-badge mui-badge-primary mui-badge-inverted">20</span>
				</a>
				</span>
			</div>
		</div>
		<div class="mui-card">
			<div class="mui-card-header mui-card-media"
				style="height:40vw;background-image:url(${ctx}/themes/mui/images/shuijiao.jpg)"></div>
			<div class="mui-card-content">
				<div class="mui-card-content-inner">
					<p>Posted on January 18, 2016</p>
					<p style="color: #333;">这里显示文章摘要，让读者对文章内容有个粗略的概念...</p>
				</div>
			</div>
			<div class="mui-card-footer">
				2018-01-29 17:43:50 <span> <a> <span
						class="mui-icon mui-icon-chat mui-icon-size"></span> <span
						class="mui-badge mui-badge-primary mui-badge-inverted">200</span>
				</a> <a> <span
						class="mui-icon-extra mui-icon-extra-like mui-icon-size"></span> <span
						class="mui-badge mui-badge-primary mui-badge-inverted">20</span>
				</a>
				</span>
			</div>
		</div>
		<div class="mui-card">
			<div class="mui-card-header">无所适从的一天</div>
			<div class="mui-card-content">
				<div class="mui-card-content-inner">
					包含页眉页脚的卡片，页眉常用来显示面板标题，页脚用来显示额外信息或支持的操作（比如点赞、评论等）</div>
			</div>
			<div class="mui-card-footer">
				2018-01-29 17:43:50 <span> <a> <span
						class="mui-icon mui-icon-chat mui-icon-size"></span> <span
						class="mui-badge mui-badge-primary mui-badge-inverted">200</span>
				</a> <a> <span
						class="mui-icon-extra mui-icon-extra-like mui-icon-size"></span> <span
						class="mui-badge mui-badge-primary mui-badge-inverted">20</span>
				</a>
				</span>
			</div>
		</div>
		<div class="mui-card">
			<ul class="mui-table-view">
				<li class="mui-table-view-cell mui-media"><a
					href="javascript:;"> <img
						class="mui-media-object mui-pull-right"
						src="${ctx}/themes/mui/images/muwu.jpg">
						<div class="mui-media-body">
							木屋
							<p class='mui-ellipsis'>想要这样一间小木屋，夏天挫冰吃瓜，冬天围炉取暖.</p>
						</div>
				</a></li>
				<li class="mui-table-view-cell mui-media"><a
					href="javascript:;"> <img
						class="mui-media-object mui-pull-right"
						src="${ctx}/themes/mui/images/cbd.jpg">
						<div class="mui-media-body">
							CBD
							<p class='mui-ellipsis'>烤炉模式的城，到黄昏，如同打翻的调色盘一般.</p>
						</div>
				</a></li>
				<li class="mui-table-view-cell mui-media"><a
					href="javascript:;"> <img
						class="mui-media-object mui-pull-right"
						src="${ctx}/themes/mui/images/yuantiao.jpg">
						<div class="mui-media-body">
							远眺
							<p class='mui-ellipsis'>静静的看这个世界，最后终于疯了</p>
						</div>
				</a></li>
			</ul>
		</div>
		<div class="mui-card">
			<div id="echarts-div1" style="width: 100%; height: 300px;"></div>
		</div>
		<div class="mui-card">
			<ul class="mui-table-view">
				<li class="mui-table-view-cell mui-media"><a
					href="javascript:;"> <img
						class="mui-media-object mui-pull-left"
						src="${ctx}/themes/mui/images/muwu.jpg">
						<div class="mui-media-body">
							木屋
							<p class='mui-ellipsis'>想要这样一间小木屋，夏天挫冰吃瓜，冬天围炉取暖.</p>
						</div>
				</a></li>
			</ul>
		</div>
		<div class="mui-card">
			<ul class="mui-table-view">
				<li class="mui-table-view-cell mui-media"><a
					href="javascript:;"> <img
						class="mui-media-object mui-pull-left mui-img-border"
						src="${ctx}/themes/mui/images/cbd.jpg">
						<div class="mui-media-body">
							CBD
							<p class='mui-ellipsis'>烤炉模式的城，到黄昏，如同打翻的调色盘一般.</p>
						</div>
				</a></li>
				<li class="mui-table-view-cell mui-media"><a
					href="javascript:;"> <img
						class="mui-media-object mui-pull-left mui-img-border"
						src="${ctx}/themes/mui/images/yuantiao.jpg">
						<div class="mui-media-body">
							远眺
							<p class='mui-ellipsis'>静静的看这个世界，最后终于疯了</p>
						</div>
				</a></li>
			</ul>
		</div>
		<div class="mui-card">
			<ul class="mui-table-view">
				<li class="mui-table-view-cell mui-media"><a
					href="javascript:;"> <img
						class="mui-media-object mui-pull-left mui-img-border"
						src="${ctx}/themes/mui/images/cbd.jpg">
						<div class="mui-media-body">
							CBD
							<p class='mui-ellipsis'>烤炉模式的城，到黄昏，如同打翻的调色盘一般.</p>
						</div>
				</a></li>
			</ul>
		</div>
		<div class="mui-card">
			<ul class="mui-table-view">
				<li class="mui-table-view-cell mui-media"><a
					href="javascript:;"> <img
						class="mui-media-object mui-pull-left mui-img-border"
						src="${ctx}/themes/mui/images/muwu.jpg">
						<div class="mui-media-body">
							<p>木屋</p>
							<p>2018年01月29日 17:43</p>
							想要这样一间小木屋，夏天挫冰吃瓜，冬天围炉取暖.
						</div>
				</a></li>
				<li class="mui-table-view-cell mui-media"><a
					href="javascript:;"> <img
						class="mui-media-object mui-pull-left mui-img-border"
						src="${ctx}/themes/mui/images/cbd.jpg">
						<div class="mui-media-body">
							<p>CBD</p>
							<p>2018年01月29日 17:43</p>
							烤炉模式的城，到黄昏，如同打翻的调色盘一般.
						</div>
				</a></li>
				<li class="mui-table-view-cell mui-media"><a
					href="javascript:;"> <img
						class="mui-media-object mui-pull-left mui-img-border"
						src="${ctx}/themes/mui/images/yuantiao.jpg">
						<div class="mui-media-body">
							<p>远眺</p>
							<p>2018年01月29日 17:43</p>
							静静的看这个世界，最后终于疯了静静的看这个世界，最后终于疯了静静的看这个世界，最后终于疯了
						</div>
				</a></li>
			</ul>
		</div>

	</div>

	<script>
			// 基于准备好的dom，初始化echarts实例
	        var myChart1 = echarts.init(document.getElementById('echarts-div1'));
	        // 指定图表的配置项和数据
	        var option = {
	            title: {
	                text: 'ECharts'
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
	                data: [5, 20, 36, 10, 10, 20],
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
	                data: [10, 10, 40, 50, 15, 6],
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
	        myChart1.setOption(option);
		</script>
</body>
</html>