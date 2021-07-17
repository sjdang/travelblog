/**
 * @Description: 百度位置、天气服务接口
 * @author SJDANG
 * @date 2018年3月18日
 */

/*
 * 百度位置服务接口
 */
var baiduLocationApi = function(locationUrl, weatherUrl, fn) {
	$.ajax({
    	url: locationUrl,
        type: "get",
        async: "false",
        dataType: "jsonp",
        jsonp: 'callback',
		jsonpCallback: "callback",
        success: function(data){
        	if(data.status == 0){
        		fn(weatherUrl, data);
        	}
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
        	console.log("Caught an exception when request baidu location api.");
        	console.log(XMLHttpRequest);
        	console.log(textStatus);
        	console.log(errorThrown);
		}
    });
};

/*
 * 百度天气服务接口--已弃用
 */
var baiduWeatherApi = function(weatherUrl, currentCity, fn) {
	$.ajax({
    	url: weatherUrl + currentCity,
        type: "get",
        async: "false",
        dataType: "jsonp",
        jsonp: 'callback',
		jsonpCallback: "callback",
        success: function(data){
        	if(data.status == "success"){
        		fn(data);
        	}
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
        	console.log("Caught an exception when request baidu weather api.");
			console.log(XMLHttpRequest);
        	console.log(textStatus);
        	console.log(errorThrown);
		}
    });
};

/*
 * 聚合数据开放平台未来5天天气状况接口
 */
var juheFutureWeatherApi = function(cityName, fn) {
	$.ajax({
        type: "post",
        url: rootPath + "/manage/main/juheApi/futureWeather.do",
        data: {"cityName": cityName},
        dataType: "json",
        async: false,
        success: function(data) {
			if (data.resFlag == 0) {
            	var apiObj = data.resData;
				fn(apiObj);
            }
        }
    });
};

/*
 * 聚合数据开放平台当天生活指数接口
 */
var juheLivingIndexApi = function(cityName, fn) {
	$.ajax({
        type: "post",
        url: rootPath + "/manage/main/juheApi/livingIndex.do",
        data: {"cityName": cityName},
        dataType: "json",
        async: false,
        success: function(data) {
			if (data.resFlag == 0) {
            	var apiObj = data.resData;
				fn(apiObj);
            }
        }
    });
};

/*
 * 解析温度区间
 */
var getTemperatureArr = function(str) {
	return str.replace('℃', '').split('/');
};

/*
 * 匹配天气 ICON 图标
 */
var matchWeatherIcon = function(wid) {
	var currentPeriod = getCurrentTimePeriod();
	var widIcon = "ion-ios-cloudy";
	switch (wid) {
		case "00":	
			widIcon = "ion-ios-sunny";
			if (currentPeriod == 5) {
				widIcon = 'ion-ios-moon';
			}
			break;
		case "01":
			widIcon = "ion-ios-partlysunny";
			if (currentPeriod == 5) {
				widIcon = 'ion-ios-cloudy-night';
			}
			break;
		case "02":
			widIcon = "ion-ios-cloudy";
			break;
		case "03":
			widIcon = "ion-ios-rainy";
			break;
		case "04":
			widIcon = "ion-ios-thunderstorm";
			break;
		case "14":
			widIcon = "ion-ios-snowy";
			break;
		case "53":
			widIcon = "ion-ios-cloudy";
	}
	return widIcon;
};
