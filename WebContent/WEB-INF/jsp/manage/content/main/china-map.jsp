<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div id="echarts-china-map" style="width: 100%; height: 600px;"></div>

<!-- 引入中国地图JavaScript文件 -->
<script src="${ctx}/themes/echarts/js/map/china.js"></script>
<script type="text/javascript">
	
    // 基于准备好的dom，初始化echarts实例
    var chinaMapChart = echarts.init(document.getElementById('echarts-china-map'));
    // 指定图表的配置项和数据
    var data = [
       	 {name: '北京', value: 200},
       	 {name: '天津', value: 200},
       	 {name: '上海', value: 200},
       	 {name: '重庆', value: 200},
	     {name: '太原', value: 200},
	     {name: '平遥', value: 200},
	     {name: '成都', value: 200},
	     {name: '绵阳', value: 200},
	     {name: '宜宾', value: 200},
	     {name: '乐山', value: 200},
	     {name: '西安', value: 200},
	     {name: '济南', value: 200},
	     {name: '淄博', value: 200},
	     {name: '滨州', value: 200},
	     {name: '兰州', value: 200},
	     {name: '武威', value: 200},
	     {name: '泰安', value: 200}
	];
    
	var geoCoordMap = {
		'北京':[116.46,39.92],
		'天津':[117.20,39.13],
		'上海':[121.47,31.23],
		'重庆':[106.54,29.59],
	    '太原':[112.53,37.87],
	    '平遥':[112.17,37.18],
	    '成都':[104.06,30.67],
	    '绵阳':[104.73,31.48],
	    '宜宾':[104.56,29.77],
	    '乐山':[103.77,29.57],
	    '西安':[108.95,34.27],
	    '济南':[117.00,36.65],
	    '淄博':[118.05,36.78],
	    '滨州':[118.03,37.36],
	    '兰州':[103.73,36.03],
	    '武威':[102.63,37.93],
	    '泰安':[117.13,36.18]
	};
	
	var convertData = function (data) {
	    var res = [];
	    for (var i = 0; i < data.length; i++) {
	        var geoCoord = geoCoordMap[data[i].name];
	        if (geoCoord) {
	            res.push({
	                name: data[i].name,
	                value: geoCoord.concat(data[i].value)
	            });
	        }
	    }
	    return res;
	};
	
	var option = {
	    backgroundColor: '#ecf0f5',
	    title: {
	        text: '我在中华大地上的足迹',
	        //subtext: 'data from PM25.in',
	        //sublink: 'http://www.pm25.in',
	        left: 'center',
	        textStyle: {
	            color: '#fff'
	        }
	    },
	    tooltip : {
	        trigger: 'item'
	    },
	    legend: {
	        orient: 'vertical',
	        y: 'bottom',
	        x: 'right',
	        data:['pm2.5'],
	        textStyle: {
	            color: '#fff'
	        }
	    },
	    geo: {
	        map: 'china',
	        label: {
	            emphasis: {
	                show: false
	            }
	        },
	        roam: true,
	        itemStyle: {
	            normal: {
	                areaColor: '#323c48',
	                borderColor: '#111'
	            },
	            emphasis: {
	                areaColor: '#2a333d'
	            }
	        }
	    },
	    series : [
	        {
	            name: 'pm2.5',
	            type: 'scatter',
	            coordinateSystem: 'geo',
	            data: convertData(data),
	            symbolSize: function (val) {
	                return val[2] / 10;
	            },
	            label: {
	                normal: {
	                    formatter: '{b}',
	                    position: 'right',
	                    show: false
	                },
	                emphasis: {
	                    show: true
	                }
	            },
	            itemStyle: {
	                normal: {
	                    color: '#ddb926'
	                }
	            }
	        },
	        {
	            name: '我的足迹',
	            type: 'effectScatter',
	            coordinateSystem: 'geo',
	            data: convertData(data.sort(function (a, b) {
	                return b.value - a.value;
	            }).slice(0, 100)),
	            symbolSize: function (val) {
	                return val[2] / 10;
	            },
	            showEffectOn: 'render',
	            rippleEffect: {
	                brushType: 'stroke'
	            },
	            hoverAnimation: true,
	            label: {
	                normal: {
	                    formatter: '{b}',
	                    position: 'right',
	                    show: true
	                }
	            },
	            itemStyle: {
	                normal: {
	                    color: '#f4e925',
	                    shadowBlur: 10,
	                    shadowColor: '#333'
	                }
	            },
	            zlevel: 1
	        }
	    ]
	};
    // 使用刚指定的配置项和数据显示图表。
    chinaMapChart.setOption(option);
       
</script>
