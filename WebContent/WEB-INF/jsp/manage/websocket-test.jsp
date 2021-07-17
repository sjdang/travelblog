<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>SpringMvc Test</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="../themes/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="../themes/bootstrap/css/confirm/jquery-confirm.min.css" />
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script type="text/javascript"
	src="../themes/bootstrap/js/jquery.min.js"></script>
<!-- 最新的Bootstrap核心 JavaScript 文件 -->
<script type="text/javascript"
	src="../themes/bootstrap/js/bootstrap.min.js"></script>
<!-- 引入ECharts核心 JavaScript 文件 -->
<script type="text/javascript" src="../themes/echarts/js/echarts.min.js"></script>
<script type="text/javascript"
	src="../themes/bootstrap/js/confirm/jquery-confirm.min.js"></script>
<script type="text/javascript"
	src="../themes/bootstrap/js/confirm/confirm-extend.js"></script>
</head>
<body>
	<div style="margin: 10px auto; width: 1000px;">
		<button id="saveBtn" type="button" class="btn btn-success"
			onclick="start()">开始</button>
	</div>
	<div id="messages"
		style="width: 1000px; height: 500px; margin: 10px auto;"></div>

	<script type="text/javascript">
		var webSocket = new WebSocket('ws://localhost:8080/SSMDemo/manage/login/websocket');
		
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
			document.getElementById('messages').innerHTML 
				+= '<br />' + event.data;
		}
		
		function onOpen(event) {
			document.getElementById('messages').innerHTML 
				= 'Connection established';
		}	
		
		function onError(event) {
			alert(event.data);
		}
		
		function start() {
			webSocket.send('hello');
			return false;
		}
		
		</script>
</body>
</html>