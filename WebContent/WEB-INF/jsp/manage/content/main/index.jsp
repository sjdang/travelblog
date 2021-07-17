<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="${ctx}/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="${ctx}/favicon.ico" type="image/x-icon" />
<link rel="bookmark" href="${ctx}/favicon.ico" type="image/x-icon" />
<title>控制台管理中心</title>

<!-- Bootstrap -->
<link href="${ctx}/themes/nifty/css/bootstrap.min.css" rel="stylesheet">
<!-- Nifty -->
<link href="${ctx}/themes/nifty/css/nifty.min.css" rel="stylesheet">
<!-- Font Ion -->
<link href="${ctx}/themes/nifty/css/ionicons.min.css" rel="stylesheet">
<!-- Pace Loading -->
<link href="${ctx}/themes/nifty/css/pace.min.css" rel="stylesheet">
<!-- Bootstrap Select -->
<link href="${ctx}/themes/nifty/css/bootstrap-select.min.css" rel="stylesheet">
<!-- Chosen -->
<link href="${ctx}/themes/nifty/css/chosen.min.css" rel="stylesheet">
<!-- Select2 -->
<link href="${ctx}/themes/nifty/css/select2.min.css" rel="stylesheet">
<!-- Switchery -->
<link href="${ctx}/themes/nifty/css/switchery.min.css" rel="stylesheet">
<!-- Magic Check -->
<link href="${ctx}/themes/nifty/css/magic-check.min.css" rel="stylesheet">
<!-- Animate -->
<link href="${ctx}/themes/nifty/css/animate.min.css" rel="stylesheet">
<!-- DataTables -->
<link href="${ctx}/themes/nifty/css/datatables.bootstrap.css" rel="stylesheet">
<link href="${ctx}/themes/nifty/css/datatables.responsive.css" rel="stylesheet">
<!-- Bootstrap FileInput -->
<link href="${ctx}/themes/bootstrap/css/fileinput/fileinput.min.css" rel="stylesheet">
<!-- Bootstrap TreeView -->
<link href="${ctx}/themes/bootstrap/css/treeview/bootstrap-treeview.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="${ctx}/themes/font-awesome/css/font-awesome.min.css" rel="stylesheet">

<!-- Pace Loading -->
<script src="${ctx}/themes/nifty/js/pace.min.js"></script>
<!-- JQuery -->
<script src="${ctx}/themes/nifty/js/jquery-2.2.4.min.js"></script>
<!-- Bootstrap -->
<script src="${ctx}/themes/nifty/js/bootstrap.min.js"></script>
<!-- BootstrapValidator -->
<script src="${ctx}/themes/nifty/js/bootstrapvalidator.min.js"></script>
<!-- Nifty -->
<script src="${ctx}/themes/nifty/js/nifty.min.js"></script>
<!-- Bootstrap Select -->
<script src="${ctx}/themes/nifty/js/bootstrap-select.min.js"></script>
<!-- Chosen -->
<script src="${ctx}/themes/nifty/js/chosen.jquery.min.js"></script>
<!-- Select2 -->
<script src="${ctx}/themes/nifty/js/select2.min.js"></script>
<!-- Switchery -->
<script src="${ctx}/themes/nifty/js/switchery.min.js"></script>
<!-- BootboxModals -->
<script src="${ctx}/themes/nifty/js/bootbox.min.js"></script>
<!-- ECharts -->
<script src="${ctx}/themes/echarts/js/echarts.min.js"></script>
<!-- DataTables -->
<script src="${ctx}/themes/nifty/js/jquery.datatables.js"></script>
<script src="${ctx}/themes/nifty/js/datatables.bootstrap.js"></script>
<script src="${ctx}/themes/nifty/js/datatables.responsive.min.js"></script>
<!-- Bootstrap FileInput -->
<script src="${ctx}/themes/bootstrap/js/fileinput/fileinput.min.js"></script>
<script src="${ctx}/themes/bootstrap/js/fileinput/zh.js"></script>
<!-- Bootstrap TreeView -->
<script src="${ctx}/themes/bootstrap/js/treeview/bootstrap-treeview.min.js"></script>
<!-- Common -->
<script src="${ctx}/themes/custom/js/common/common.util.js"></script>
<script src="${ctx}/themes/custom/js/common/dialog.util.js"></script>
<script src="${ctx}/themes/custom/js/common/baidu.api.js"></script>
<!-- Content -->
<script src="${ctx}/themes/custom/js/content/index.js"></script>

<style>
.brand-title-sjdang {
	display: block;
	line-height: 40px;
	padding: 0 1.5em 0 15px;
}

.sjdang-hidden,.new-message-count {
	display: none;
}

.breadcrumb {
	margin-left: -15px;
}

.sjdang-loading {
	width: 100%;
	height: 100%;
	position: relative;
}

.sjdang-spinner {
	font-size: 200px;
	text-align: center;
	opacity: 0.2;
	position: absolute;
	top: 150px;
	left: 42%;
}

.sjdang-loading-text {
	font-size: 20px;
}

.chart-container {
	width: 600px;
	height: 230px;
	overflow-y: hidden;
}

.weather-chart {
	width: 600px;
	height: 260px;
}

.ajax-loading {
	z-index: 9999;
	display: none;
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	background-color: rgba(220, 220, 220, .2);
	text-align: center;
	vertical-align: middle;
}

.ajax-spinner {
	font-size: 150px;
	text-align: center;
	opacity: 0.6;
	position: absolute;
	top: 30%;
	left: 45%;
}

.ajax-loading-text {
	font-size: 15px;
}

.sjdang-img {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	box-shadow: 0 0 0 4px rgba(220, 220, 220, .2);
	margin-left: 12px;
}
.sjdang-dropdown-menu {
	min-width: 200px;
}
</style>

</head>

<body>
	<div id="container" class="effect aside-float aside-bright mainnav-lg navbar-fixed">

		<div class="ajax-loading">
			<div class="ajax-spinner text-info">
				<i class="fa ion-aperture fa-spin"></i>
				<p class="ajax-loading-text">正在努力加载中...</p>
			</div>
		</div>

		<header id="navbar">
		<div id="navbar-container" class="boxed">

			<div class="navbar-header">
				<a href="#" class="navbar-brand text-left">
					<div class="brand-title-sjdang">
						<i class="fa fa-medium"></i>&nbsp;&nbsp; <span class="text-xs">控制台管理中心</span>
					</div>
				</a>
			</div>

			<div class="navbar-content clearfix">
				<ul class="nav navbar-top-links pull-left">
					<li class="tgl-menu-btn"><a class="mainnav-toggle" href="#">
							<i class="fa fa-server"></i>
					</a></li>
					<li class="dropdown">
						<a href="#" data-toggle="dropdown" class="dropdown-toggle">
							<i class="fa fa-bell-o"></i>
							<span class="badge badge-header badge-danger new-message-count">9</span>
						</a>
						<div class="dropdown-menu dropdown-menu-md">
							<div class="pad-all bord-btm">
								<p class="text-semibold text-main mar-no">You have 9 notifications.</p>
							</div>
							<div class="nano scrollable">
								<div class="nano-content">
									<ul class="head-list">
										<li><a href="#">
												<div class="clearfix">
													<p class="pull-left">Database Repair</p>
													<p class="pull-right">70%</p>
												</div>
												<div class="progress progress-sm">
													<div style="width: 70%;" class="progress-bar">
														<span class="sr-only">70% Complete</span>
													</div>
												</div>
										</a></li>
										<li><a href="#">
												<div class="clearfix">
													<p class="pull-left">Upgrade Progress</p>
													<p class="pull-right">10%</p>
												</div>
												<div class="progress progress-sm">
													<div style="width: 10%;"
														class="progress-bar progress-bar-warning">
														<span class="sr-only">10% Complete</span>
													</div>
												</div>
										</a></li>
										<li><a class="media" href="#"> <span
												class="badge badge-success pull-right">90%</span>
												<div class="media-left">
													<i class="demo-pli-data-settings icon-2x"></i>
												</div>
												<div class="media-body">
													<div class="text-nowrap">HDD is full</div>
													<small class="text-muted">50 minutes ago</small>
												</div>
										</a></li>
										<li><a class="media" href="#">
												<div class="media-left">
													<i class="demo-pli-file-edit icon-2x"></i>
												</div>
												<div class="media-body">
													<div class="text-nowrap">Write a news article</div>
													<small class="text-muted">Last Update 8 hours ago</small>
												</div>
										</a></li>
										<li><a class="media" href="#"> <span
												class="label label-danger pull-right">New</span>
												<div class="media-left">
													<i class="demo-pli-speech-bubble-7 icon-2x"></i>
												</div>
												<div class="media-body">
													<div class="text-nowrap">Comment Sorting</div>
													<small class="text-muted">Last Update 8 hours ago</small>
												</div>
										</a></li>
										<li><a class="media" href="#">
												<div class="media-left">
													<i class="demo-pli-add-user-plus-star icon-2x"></i>
												</div>
												<div class="media-body">
													<div class="text-nowrap">New User Registered</div>
													<small class="text-muted">4 minutes ago</small>
												</div>
										</a></li>
										<li class="bg-gray"><a class="media" href="#">
												<div class="media-left">
													<img class="img-circle img-sm" alt="Profile Picture"
														src="${ctx}/themes/nifty/picture/9.png">
												</div>
												<div class="media-body">
													<div class="text-nowrap">Lucy sent you a message</div>
													<small class="text-muted">30 minutes ago</small>
												</div>
										</a></li>
										<li class="bg-gray"><a class="media" href="#">
												<div class="media-left">
													<img class="img-circle img-sm" alt="Profile Picture"
														src="${ctx}/themes/nifty/picture/3.png">
												</div>
												<div class="media-body">
													<div class="text-nowrap">Jackson sent you a message</div>
													<small class="text-muted">40 minutes ago</small>
												</div>
										</a></li>
									</ul>
								</div>
							</div>

							<div class="pad-all bord-top">
								<a href="#" class="btn-link text-dark box-block">
									<i class="fa fa-angle-right fa-lg pull-right"></i>Show All Notifications
								</a>
							</div>
						</div>
					</li>
					<li class="mega-dropdown">
						<a href="#" class="mega-dropdown-toggle">
							<i class="fa fa-th-large"></i>
						</a>
						<div class="dropdown-menu mega-dropdown-menu">
							<div class="row">

								<div class="col-md-6">
									<div class="bord-rgt pad-rgt pad-lef">
										<div class="media pad-all bord-btm">
											<div class="media-left current-weather"></div>
											<div class="media-body pad-lft">
												<h4 class="mar-no text-main current-location"></h4>
												<p class="current-date"></p>
												<span class="text-sm text-muted add-tooltip current-index-0" data-toggle="tooltip" data-container="body" data-placement="top" data-original-title="">
													<i class="ion-tshirt-outline icon-fw"></i>穿衣指数
												</span>
												<span class="text-sm text-muted mar-lft add-tooltip current-index-1" data-toggle="tooltip" data-container="body" data-placement="top" data-original-title="">
													<i class="ion-model-s icon-fw"></i>洗车指数
												</span>
												<span class="text-sm text-muted mar-lft add-tooltip current-index-2" data-toggle="tooltip" data-container="body" data-placement="top" data-original-title="">
													<i class="ion-sad-outline icon-fw"></i>感冒指数
												</span>
												<span class="text-sm text-muted mar-lft add-tooltip current-index-3" data-toggle="tooltip" data-container="body" data-placement="top" data-original-title="">
													<i class="ion-ios-football icon-fw"></i>运动指数
												</span>
												<span class="text-sm text-muted mar-lft add-tooltip current-index-4" data-toggle="tooltip" data-container="body" data-placement="top" data-original-title="">
													<i class="ion-umbrella icon-fw"></i>紫外线强度指数
												</span>
											</div>
										</div>
										<div class="row pad-top">
											<div class="col-md-3 current-temperature"></div>
											<div class="col-md-9">
												<div class="list-unstyled text-center clearfix">
													<div class="col-xs-3 future-weather-0"></div>
													<div class="col-xs-3 future-weather-1"></div>
													<div class="col-xs-3 future-weather-2"></div>
													<div class="col-xs-3 future-weather-3"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="chart-container">
										<div id="weather-chart" class="weather-chart"></div>
									</div>
								</div>

							</div>
						</div></li>
				</ul>
				<ul class="nav navbar-top-links pull-right">
					<li class="dropdown"><a id="demo-lang-switch"
						class="lang-selector dropdown-toggle" href="#"
						data-toggle="dropdown"> <span class="lang-selected"> <img
								class="lang-flag" src="${ctx}/themes/nifty/picture/chinese.png"
								width="24" height="16" alt="Chinese">
						</span>
					</a>
						<ul class="head-list dropdown-menu">
							<li><a href="#"> <img class="lang-flag"
									src="${ctx}/themes/nifty/picture/chinese.png" width="29.5"
									height="22.5" alt="Chinese"> <span class="lang-id">CN</span>
									<span>中文 Chinese</span>
							</a></li>
							<li><a href="#"> <img class="lang-flag"
									src="${ctx}/themes/nifty/picture/united-kingdom.png"
									alt="English"> <span class="lang-id">EN</span> <span>英文
										English</span>
							</a></li>
						</ul></li>
					<li id="dropdown-user" class="dropdown"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle text-right"> <span
							class="pull-right"> <img
								class="img-circle img-user media-object"
								src="${ctx}${user.imageUrl }" alt="Profile Picture">
						</span>
							<div class="username hidden-xs">${user.userName }</div>
					</a>

						<div
							class="dropdown-menu sjdang-dropdown-menu dropdown-menu-right panel-default">

							<div class="pad-all bord-btm">
								<p class="text-main mar-btm">
									<span class="text-bold">750GB</span> of 1,000GB Used
								</p>
								<div class="progress progress-sm">
									<div class="progress-bar" style="width: 70%;">
										<span class="sr-only">70%</span>
									</div>
								</div>
							</div>

							<ul class="head-list">
								<li><a href="#"> <i
										class="fa fa-user-circle-o fa-lg icon-fw"></i> 个人中心
								</a></li>
								<li><a href="#"> <span
										class="badge badge-danger pull-right new-message-count"></span>
										<i class="fa fa-commenting-o fa-lg icon-fw"></i> 信息
								</a></li>
								<li><a href="#"> <span
										class="label label-success pull-right">New</span> <i
										class="fa fa-cogs fa-lg icon-fw"></i> 设置
								</a></li>
								<li><a href="#"> <i
										class="fa fa-question-circle-o fa-lg icon-fw"></i> 帮助
								</a></li>
								<li><a href="${ctx}/manage/login/logout.do"> <i
										class="fa fa-power-off fa-lg icon-fw"></i> 注销
								</a></li>
							</ul>
						</div></li>
				</ul>
			</div>

		</div>
		</header>

		<div class="boxed">

			<div id="content-container">
				<div id="page-title">
					<ol class="breadcrumb">
						<li><a href="#">管理控制台</a></li>
						<li><a href="#">首页</a></li>
						<li class="active">我的世界</li>
					</ol>
					<div class="searchbox">
						<div class="input-group custom-search-form">
							<input type="text" class="form-control" placeholder="搜索...">
							<span class="input-group-btn">
								<button class="text-muted" type="button">
									<i class="ion-ios-search-strong"></i>
								</button>
							</span>
						</div>
					</div>
				</div>
				<div id="page-content"></div>
			</div>

			<nav id="mainnav-container">
			<div id="mainnav">

				<div id="mainnav-menu-wrap">
					<div class="nano">
						<div class="nano-content">

							<div id="mainnav-profile" class="mainnav-profile">
								<div class="profile-wrap">
									<a href="#profile-nav" class="box-block" data-toggle="collapse" aria-expanded="false">
										<div class="pad-btm">
											<img class="sjdang-img" src="${ctx}${user.imageUrl }" alt="Profile Picture">
										</div>
										<p>
											${user.userName }
											<span class="label label-success pull-right">New</span>
										</p>
										<span class="text-xs text-thin text-success">上次登录&nbsp;&nbsp;${lastLoginTime }</span>
									</a>
								</div>
							</div>
							
							<ul id="mainnav-menu" class="list-group">
								<li class="list-divider"></li>
								<li><a
									href="javascript:loadPageContent('${ctx }/manage/main/welcome.do');">
										<i class="ion-ios-home"></i> <span class="menu-title">
											<strong>首页</strong>
									</span>
								</a></li>
								<li><a href="#"> <i class="ion-cube"></i> <span
										class="menu-title"> <strong>基础数据管理</strong>
									</span> <i class="arrow"></i>
								</a>
									<ul class="collapse">
										<li><a
											href="javascript:loadPageContent('${ctx }/manage/common/sculpture/viewList.do');"><i
												class="ion-cube icon-fw"></i>用户头像管理</a></li>
										<li><a
											href="javascript:loadPageContent('${ctx }/manage/test/upload.do');"><i
												class="ion-cube icon-fw"></i>上传用户头像</a></li>
									</ul></li>
								<li><a href="#"> <i class="ion-cube"></i> <span
										class="menu-title"> <strong>安全控制管理</strong>
									</span> <i class="arrow"></i>
								</a>
									<ul class="collapse">
										<li><a
											href="javascript:loadPageContent('${ctx }/manage/security/user/showLoginHistory.do');"><i
												class="ion-cube icon-fw"></i>访问历史</a></li>
										<li><a
											href="javascript:loadPageContent('${ctx }/manage/security/menu/viewList.do');"><i
												class="ion-cube icon-fw"></i>菜单管理</a></li>
										<li><a
											href="javascript:loadPageContent('${ctx }/manage/security/role/viewList.do');"><i
												class="ion-cube icon-fw"></i>角色管理</a></li>
									</ul></li>
								<li><a
									href="javascript:loadPageContent('${ctx }/manage/main/chinaMap.do');">
										<i class="ion-wrench"></i> <span class="menu-title"> <strong>系统设置</strong>
											<span class="pull-right badge badge-warning">24</span>
									</span>
								</a></li>
							</ul>

							<div class="mainnav-widget">

								<div class="show-small">
									<a href="#" data-toggle="menu-widget"
										data-target="#demo-wg-server"> <i class="fa fa-bar-chart"></i>
									</a>
								</div>
								<!-- 
								<div id="demo-wg-server" class="hide-small mainnav-widget-content">
									<ul class="list-group">
										<li class="mar-btm">
											<span class="label label-primary pull-right">15%</span>
											<p>CPU利用率</p>
											<div class="progress progress-sm">
												<div class="progress-bar progress-bar-primary" style="width: 15%;">
													<span class="sr-only">15%</span>
												</div>
											</div>
										</li>
										<li class="mar-btm">
											<span class="label label-purple pull-right">75%</span>
											<p>计划进度</p>
											<div class="progress progress-sm">
												<div class="progress-bar progress-bar-purple" style="width: 75%;">
													<span class="sr-only">75%</span>
												</div>
											</div>
										</li>
									</ul>
								</div>
								 -->
							</div>
							
						</div>
					</div>
				</div>

			</div>
			</nav>

		</div>

		<footer id="footer">
			<div class="show-fixed pull-right">
				You have <a href="#" class="text-bold text-main"><span class="label label-danger">3</span> pending action.</a>
			</div>
			<div class="hide-fixed pull-right pad-rgt">
				14GB of <strong>512GB</strong> Free.
			</div>
			<p class="pad-lft">&#0169; 2018 - 2021 愿你历经千帆，归来仍是少年</p>
		</footer>

		<button class="scroll-top btn">
			<i class="pci-chevron chevron-up"></i>
		</button>

	</div>

	<script type="text/javascript">
    var rootPath = '${ctx }';
    $(window).on('load', function() {
	    var webSocket = new WebSocket('ws://localhost:8080/travelblog/manage/main/websocket');
		webSocket.onerror = function(event) {
			onError(event);
		};
		
		webSocket.onopen = function(event) {
			onOpen(event);
		};
		
		webSocket.onmessage = function(event) {
			onMessage(event);
		};
		
		function onMessage(event) {
			$('.new-message-count').show();
			$('.new-message-count').text(event.data);
			/* 
			$.niftyNoty({
		        type: 'success',
		        title: 'Welcome Administrator.',
		        message: 'You will notice that you now have an admin menu<br> that appears on the right hand side.',
		        container: 'floating',
		        timer: 30000
		    });
			 */
		}
		
		function onOpen(event) {
			console.log('Connection established');
		}	
		
		function onError(event) {
			console.log(event.data);
		}
		
		function start() {
			webSocket.send('Hello WebSocket!');
			return false;
		}	
		
		setTimeout(function(){
			start();
			loadPageContent('${ctx }/manage/main/welcome.do');
		}, 1000);
		
		$.niftyNoty({
	        type: 'warning',
	        title: 'Welcome Administrator.',
	        message: 'You will notice that you now have an admin menu<br> that appears on the right hand side.',
	        container: 'floating',
	        timer: 5000
	    });
		
		ajaxGetBaiduAccessKey(rootPath);
		
    });
    
    </script>

</body>
</html>

