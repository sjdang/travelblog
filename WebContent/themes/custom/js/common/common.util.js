/**
 * @Description: JS常用方法工具包
 * @author SJDANG
 * @date 2018年2月18日
 */

/*
 * 判断字符串为空
 */
function isEmpty(str) {
	if (str==null || str=='null' || str=='' || str=='undefined' || typeof(str)==undefined ) {
		return true;
	}
	return false;
}

/*
 * 判断字符串不为空
 */
function isNotEmpty(str) {
	if (isEmpty(str)) {
		return false;
	}
	return true;
}

/*
 * 数字转化为千分位格式
 */
function formatNum(num){
	if(num){
		var num = parseFloat(num);
	    return (num.toFixed(2) + '').replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,');
	}else{
		return "";
	}
}

/*
 * 文本字段非空检查
 */
function validString(key){
	if(isEmpty(key)){
		return "";
	}else{
		return key;
	}
}

/*
 * 金额字段非空检查
 */
function validNumber(key){
	if(isEmpty(key)){
		return "0.00";
	}else{
		return formatNum(key);
	}
}

/*
 * 截取一定长度的字符串
 */
function getSubString(key, len){
	var strLen = key.length;
	if (strLen >= len) {
		return key.substring(0, len) + "...";
	}
	return key;
}

/*
 * 将格式为 YYYY-MM-DD 的日期转化为 YYYY年MM月DD日
 */
function formatDateToChinese(date) {
	var chineseDate = '';
	if (isEmpty(date)) {
		return chineseDate;
	}
	if (date.length < 10) {
		return chineseDate;
	}
	var dateArr = date.split('-');
	if (dateArr.length < 3) {
		return chineseDate;
	}
	chineseDate = dateArr[0] + '年' + dateArr[1] + '月' + dateArr[2] + '日';
}

/*
 * 获取当前时间区段：1:早上,2:上午,3:中午,4:下午,5:晚上;
 */
function getCurrentTimePeriod() {
	var hour = new Date().getHours();
	if (hour>=6 && hour<8) {
		return 1;
	} else if (hour>=8 && hour<12) {
		return 2;
	} else if (hour>=12 && hour<14) {
		return 3;
	} else if (hour>=14 && hour<=18) {
		return 4;
	} else {
		return 5;
	}
}

/*
 * 选中所有checkBox
 * checkboxName：checkBox的name属性值
 */
function checkAll(obj, checkboxName) {
	var arr = document.getElementsByName(checkboxName);
	if (obj.checked == true) {
		for (i = 0; i < arr.length; i++) {
			arr[i].checked = true;
		}
	} else {
		for (i = 0; i < arr.length; i++) {
			arr[i].checked = false;
		}
	}
}

/*
 * 获取checkBox被选中值的值集
 * checkboxName：checkBox的name属性值
 * 值集格式：IDS = "10001,10002,10003"
 */
function getCheckedValues(checkboxName){
	var obj = document.getElementsByName(checkboxName);
	var ids = "";
	var num = 0;
	for(var i=0; i<obj.length; i++){
		//如果选中，将value添加到变量中
		if(obj[i].checked){
			if(num == 0){
				ids += obj[i].value; 
			}else{
				ids += "," + obj[i].value;
			}
			num = num + 1;
		}
	}
	return ids;
}

/*
 * 获取包含中文字符串的实际长度
 */
function getLengthOfChinese(key){
	if(isEmpty(key)){
		return 0;
	}else{
		return key.replace(/[\u0391-\uFFE5]/g,"ZH").length;
	}
}

/*
 * 检查数组中是否存在重复值，并返回重复值
 */
function checkArrayRepeat(dataArr) {
	var repeatArr = [];
	var count = 0;
	var sortArr = dataArr.sort();
	for (var i=0; i<(sortArr.length - 1); i++) {
		if (sortArr[i] == sortArr[i+1]) {
			repeatArr[count] = sortArr[i];
			count ++;
		}
	}
	return repeatArr;
}