/**
 * @Description: 控制台首页相关JS
 * @author SJDANG
 * @date 2018年3月18日
 */


/*
 * AJAX加载数据时请求等待效果
 */
var $ajaxLoading = function(isShow) {
	if (isShow) {
		$('.ajax-loading').show();
	} else {
		$('.ajax-loading').hide();
	}
};

/*
 * 重新初始化ToolTip插件
 */
var $initTooltip = function() {
	$("[data-toggle='tooltip']").tooltip();
};

/*
 * 菜单切换加载主方法
 */
function loadPageContent(url) {
	Pace.restart();
	var HTML_ = '<div class="sjdang-loading"><div class="sjdang-spinner"><i class="fa fa-sun-o fa-spin"></i><p class="sjdang-loading-text">正在努力加载中...</p></div></div>';
	$('#page-content').html(HTML_);
	$.ajax({
        type: "get",
        url: rootPath + "/manage/login/checkSessionStatus.do",
        data: "",
        dataType: "json",
        async: false,
        success: function(data) {
            if(data.resFlag == 0 && data.resData == 0) {
            	$('#page-content').load(url + '?timestamp=' + (new Date()).getTime());
            } else {
				window.location.href = rootPath + "/manage/login/logout.do";
			}
        }
    });
}

/*
 * DataTables Language Settings
 */
var DATATABLE_LANGUATE = {
	 "sProcessing" : "<i class='ion-load-c icon-3x icon-fw fa fa-spin'></i>正在努力加载中...",
	 "sLengthMenu" : "显示 _MENU_ 条",
	 "sZeroRecords" : "没有您要搜索的内容",
	 "sInfo" : "_START_ -  _END_ 条，  共 _TOTAL_ 条",
	 "sInfoEmpty" : "记录数为0",
	 "sInfoFiltered" : "(全部记录数 _MAX_ 条)",
	 "sInfoPostFix" : "",
	 "sSearch" : "搜索",
	 "sUrl" : "",
	 "oPaginate": {
	     "sFirst" : "首页",
	     "sPrevious" : "上页", 
	     "sNext" : "下页",
	     "sLast" : "尾页",
	     "sJump" : "跳转"
	 }
};

/*
 * 获取百度 API AccessKey
 */
var ajaxGetBaiduAccessKey = function(rootPath) {
	$.ajax({
        type: "get",
        url: rootPath + "/manage/main/baiduApi.do",
        data: "",
        dataType: "json",
        async: false,
        success: function(data) {
            if(data.resFlag == 0) {
            	var apiObj = data.resData;
            	baiduLocationApi(apiObj.baidu_api_location, apiObj.baidu_api_weather, initLocationData);
            }
        }
    });
};


/*
 * 解析位置数据
 */
var initLocationData = function(weatherUrl, data) {
	var currentCity = data.content.address_detail.city;
	var currentLocation = data.content.address_detail.province + '&nbsp;' + currentCity;
	var html_ = '<i class="ion-ios-location-outline icon-fw"></i>' + currentLocation;
	$(".current-location").html(html_);
	var cityName = currentCity.substring(0, currentCity.lastIndexOf('市'));
	juheFutureWeatherApi(cityName, initWeatherData);
	juheLivingIndexApi(cityName, initLivingIndexData);
	//baiduWeatherApi(weatherUrl, currentCity, initWeatherData);
};

/*
 * 解析天气数据
 */
var initWeatherData = function(data) {
	var errorCode = data.error_code;
	if (errorCode != 0) {
		console.log("ERROR: " + data.reason);
		return;
	}
	var weather = data.result.realtime;
	var currentIcon = matchWeatherIcon(weather.wid);
	var currentWeather = '<p class="text-3x mar-no">'+ weather.temperature +'&#176;</p> '+ weather.info +' | '+ weather.direct + '(' + weather.power + ')' +' <br>湿度('+ weather.humidity +')<br>空气指数('+ weather.aqi + ')';
	$('.current-weather').html('<i class="'+ currentIcon +' icon-5x"></i>');
	$('.current-date').text('今天：' + new Date().toLocaleDateString().split('/').join('-') + '  ' + new Date().toLocaleTimeString());
	$('.current-temperature').html(currentWeather);
	var weatherDatas = data.result.future;
	var len = weatherDatas.length;
	var weekArr = [], highArr = [], lowArr = [];
	for (var n=0; n<len; n++) {
		var weatherData = weatherDatas[n];
		var date = weatherData.date;
		var weather = weatherData.weather;
		var wind = weatherData.direct;
		var temperature = weatherData.temperature;
		var weatherIcon = matchWeatherIcon(weatherData.wid.day);
		if (n == 0) {
			date = "今天";
		}
		var html_ = '<i class="'+ weatherIcon +' icon-4x"></i>'
				  + '<p class="text-sm mar-no">'+ date +'</p>'
				  + '<p class="text-sm mar-no">'+ temperature +'</p>'
				  + '<p class="text-sm mar-no">'+ weather +'</p>'
				  + '<p class="text-sm mar-no">'+ wind +'</p>';
		$('.future-weather-' + n).html(html_);
		var tempArr = getTemperatureArr(temperature);
		weekArr.push(date);
		highArr.push(tempArr[0]);
		lowArr.push(tempArr[1]);
	}
	initWeatherEChartByLine(weekArr, highArr, lowArr);
};

/*
 * 解析生活指数数据
 */
var initLivingIndexData = function(data){
	var errorCode = data.error_code;
	if (errorCode != 0) {
		console.log("ERROR: The future weather data of Juhe Open Api has error!")
		return;
	}
	var indexData = data.result.life;
	$(".current-index-0").attr("data-original-title", "【" + indexData.chuanyi.v + "】" + indexData.chuanyi.des);
	$(".current-index-1").attr("data-original-title", "【" + indexData.xiche.v + "】" + indexData.xiche.des);
	$(".current-index-2").attr("data-original-title", "【" + indexData.ganmao.v + "】" + indexData.ganmao.des);
	$(".current-index-3").attr("data-original-title", "【" + indexData.yundong.v + "】" + indexData.yundong.des);
	$(".current-index-4").attr("data-original-title", "【" + indexData.ziwaixian.v + "】" + indexData.ziwaixian.des);
	$initTooltip();
};

/*
 * 统计近4天气温变化报表 - 柱状图
 */
function initWeatherEChartByBar(weekArr, highArr, lowArr){
    var weatherChart = echarts.init(document.getElementById('weather-chart'));
    var option = {
        title: {
            //text: ''
        },
        tooltip: {},
        legend: {
            data:['最高气温','最低气温']
        },
        xAxis: {
            data: weekArr
        },
        yAxis: {},
        series: [{
	            name: '最高气温',
	            type: 'bar',
	            data: highArr,
	            itemStyle: {
                   normal: {
                       //柱形图圆角，初始化效果
                       //barBorderRadius: [10, 10, 10, 10],
                       color: "#6E7B8B"
                   }
	            }
        	},
        	{
	            name: '最低气温',
	            type: 'bar',
	            data: lowArr,
	            itemStyle: {
	                normal: {
	                    //柱形图圆角，初始化效果
	                    //barBorderRadius: [10, 10, 10, 10],
	                    color: "#8B8B7A"
	                }
	            }
        	}
        ]
    };
    weatherChart.setOption(option);
}

/*
 * 统计近4天气温变化报表 - 折线图
 */
function initWeatherEChartByLine(weekArr, highArr, lowArr){
    var weatherChart = echarts.init(document.getElementById('weather-chart'));
    var option = {
		title: {
            //text: ''
        },
		tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['最高气温','最低气温']
	    },
	    toolbox: {
	        show: true,
	        feature: {
	            /*
	        	dataZoom: {
	                yAxisIndex: 'none'
	            },
	            dataView: {readOnly: false},
	        	restore: {},
	            */
	            magicType: {type: ['line', 'bar']},
	            saveAsImage: {}
	        }
	    },
	    xAxis:  {
	        type: 'category',
	        boundaryGap: false,
	        data: weekArr
	    },
	    yAxis: {
	        type: 'value',
	        axisLabel: {
	            formatter: '{value} °C'
	        }
	    },
	    series: [
	        {
	            name:'最高气温',
	            type:'line',
	            data:highArr,
	            markPoint: {
	                data: [
	                    {type: 'max', name: '本周最高'}
	                    //{type: 'min', name: '最小值'}
	                ]
	            },
	            markLine: {
	                data: [
	                    {type: 'average', name: '平均值'}
	                ]
	            },
	            itemStyle: {
	                normal: {
	                    color: "#6E7B8B"
	                }
	            }
	        },
	        {
	            name:'最低气温',
	            type:'line',
	            data:lowArr,
	            markPoint: {
	                data: [
	                    //{name: '周最低', value: -2, xAxis: 1, yAxis: -1.5}
	                    {type: 'min', name: '本周最低'}
	                ]
	            },
	            markLine: {
	                data: [
	                    {type: 'average', name: '平均值'}
	                    /*
	                    [{
	                        symbol: 'none',
	                        x: '90%',
	                        yAxis: 'max'
	                    }, {
	                        symbol: 'circle',
	                        label: {
	                            normal: {
	                                position: 'start',
	                                formatter: '最大值'
	                            }
	                        },
	                        type: 'max',
	                        name: '最高点'
	                    }]
	                    */
	                ]
	            },
	            itemStyle: {
	                normal: {
	                    color: "#8B8B7A"
	                }
	            }
	        }
	    ]
	};
    weatherChart.setOption(option);
}



