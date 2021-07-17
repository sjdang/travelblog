<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<!--STYLESHEET-->
<link href="${ctx}/themes/nifty/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/themes/nifty/css/nifty.min.css" rel="stylesheet">
<link href="${ctx}/themes/nifty/css/magic-check.min.css" rel="stylesheet">
<link href="${ctx}/themes/nifty/css/font-awesome.min.css" rel="stylesheet">
<link href="${ctx}/themes/nifty/css/ionicons.min.css" rel="stylesheet">
<link href="${ctx}/themes/nifty/css/pace.min.css" rel="stylesheet">
<!--JAVASCRIPT-->
<script src="${ctx}/themes/nifty/js/pace.min.js"></script>
<script src="${ctx}/themes/nifty/js/jquery-2.2.4.min.js"></script>
<script src="${ctx}/themes/nifty/js/bootstrap.min.js"></script>
<script src="${ctx}/themes/nifty/js/nifty.min.js"></script>
<style type="text/css">
.panel {
	border-radius: 5px;
}

.form-control {
	font-size: 13px;
	height: 100%;
	border-radius: 0;
	box-shadow: none;
	border: 1px solid #e9e9e9;
	transition-duration: .5s;
}

.bg-mountain {
	background-image: url(${ctx}/themes/nifty/picture/bg-img-5.jpg);
}

.cls-container {
	position: relative;
}

.cls-content {
	position: absolute;
	top: 10%;
	right: 10%;
}

.login-logo {
	font-size: 40px;
	font-weight: bold;
	color: #FFFFFF;
	position: absolute;
	top: 5%;
	left: 10%;
}

.login-title {
	font-size: 20px;
}

.login-image {
	width: 600px;
	height: 528px;
	background-image: url(${ctx}/themes/nifty/picture/login-img.png);
	background-size: 600px 528px;
	position: absolute;
	top: 15%;
	left: 15%;
}

.validation-info {
	height: 10px;
}

.has-hidden {
	display: none;
}
</style>
</head>

<body>
	<div id="container" class="cls-container">

		<!-- BACKGROUND IMAGE -->
		<div id="bg-overlay" class="bg-img bg-mountain"></div>

		<div class="login-logo">
			<i class="fa fa-medium"></i> <span class="login-title">管理控制台</span>
		</div>

		<div class="login-image"></div>

		<!-- LOGIN FORM -->
		<div class="cls-content">
			<div class="cls-content-sm panel border-pad">
				<div class="panel-body">
					<div class="mar-ver pad-btm">
						<h3 class="h4 mar-no">${user.userName }</h3>
					</div>
					<div class="pad-btm mar-btm">
						<img alt="Profile Picture"
							class="img-lg img-circle img-border-light"
							src="${ctx}${user.imageUrl }">
					</div>
					<div class="form-group password">
						<input type="hidden" id="userNo" value="${user.userNo }" /> <input
							type="password" id="password" class="form-control input-lg"
							placeholder="密码" autofocus />
					</div>
					<div class="form-group text-right">
						<button class="btn btn-block btn-success" id="loginBtn">登录</button>
					</div>
					<div class="text-left">
						<a href="${ctx}/manage/login/index.do" class="btn-link mar-rgt">用其他账号登录</a>
					</div>
				</div>

				<div class="pad-hor pad-btm">
					<div class="pad-top bord-top">
						<h3 class="h5 mar-no text-left">温馨提示：</h3>
						<p class="text-left mar-top">为保证平台数据安全，未提供密码找回功能，若您忘记了密码，请及时联系平台管理员。</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${ctx}/themes/custom/js/common/common.util.js"></script>
	<script type="text/javascript">
		
		var c = 0;
		setInterval(function() {
			Pace.restart();
			var imageArr = ["${ctx}/themes/nifty/picture/bg-img-1.jpg","${ctx}/themes/nifty/picture/bg-img-2.jpg","${ctx}/themes/nifty/picture/bg-img-3.jpg","${ctx}/themes/nifty/picture/bg-img-4.jpg","${ctx}/themes/nifty/picture/bg-img-5.jpg"];
			var $target = $("#bg-overlay");
			$target.css('background-image', 'url("' + imageArr[c] + '")');
			if (c >= 4) {
				c = 0;
			} else {
				c ++;
			}
		}, 5000);
		
		
		$('#password').keyup(function() {
			if (isEmpty($(this).val())) {
				validateAfter(false, "password", "请输入密码");
			} else {
				validateAfter(true, "password", "");
			}
		});
		$('#loginBtn').on('click', function() {
			login();
		});
		
		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				login();
			}
		});
		
		function validateAfter(isSuccess, idName, validText) {
			var $groupObj = $("." + idName);
			if (isSuccess) {
				if ($groupObj.hasClass("has-error")) {
					$groupObj.removeClass("has-error");
				}
				if (!$groupObj.hasClass("has-success")) {
					$groupObj.addClass("has-success");
				}
			} else {
				if ($groupObj.hasClass("has-success")) {
					$groupObj.removeClass("has-success");
				}
				if (!$groupObj.hasClass("has-error")) {
					$groupObj.addClass("has-error");
				}
				$("#" + idName).focus();
			}
		}
		
		function login() {
			var password = $("#password").val();
			if (isEmpty(password)) {
				validateAfter(false, "password", "请输入密码");
				return;
			}
			validateAfter(true, "password", "");
			var userNo = $("#userNo").val();
			Pace.restart();
			$.ajax({
		        type: "get",
		        url: "${ctx}/manage/login/login.do",
		        data: {
		        	"userNo" : userNo,
		        	"password" : password
		        },
		        dataType: "json",
		        async: false,
		        success: function(data) {
		            if(data.returnCode == 0) {
		            	window.location.href = "${ctx}/manage/main/index.do";
		            } else {
		            	validateAfter(false, data.returnClass, data.returnMsg);
		            }
		        }
		    });
		}
		
	</script>

</body>
</html>