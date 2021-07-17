$(function(){
	$("#createNewCategoryBtn").click(function(){
		createHotCategory();
	});
	$("#createNewGoodsBtn").click(function(){
		createHotGoods();
	});
	$("#saveOneCategoryBtn").click(function(){
		saveOneHotCategory();
	});
	$("#saveAllCategoryBtn").click(function(){
		saveAllHotCategory();
	});
	$("#saveOneGoodsBtn").click(function(){
		saveOneHotGoods();
	});
	$("#saveAllGoodsBtn").click(function(){
		saveAllHotGoods();
	});
	$("#goodsQueryBtn").click(function(){
		var hotGoodsId = $("#id").val();
		ajaxInitMallGoods(1, 0, hotGoodsId);
	});
	
	initHotCategory();
});

//初始化FileUpload控件
$("#uploadImageFile").fileinput({
   	  language: 'zh',
      uploadUrl: '/app/category/hot/uploadGoodsImage',
      uploadExtraData:function (previewId, index) {
    	  var id = $("#id").val();
    	  var goodsId = $("#goodsId").val();
    	  var cateId = $("#cateId").val();
    	  var goodsSortNo = $("#goodsSortNo").val();
          var obj = {
        		  "id" : id,
        		  "goodsId" : goodsId,
        		  "goodsSortNo" : goodsSortNo,
        		  "cateId" : cateId
          };
          return obj;
      },
      allowedFileExtensions : ['jpeg', 'jpg', 'png','gif'],
      overwriteInitial: false,
      minFileSize: 1,
      maxFileSize: 1024,
      minFileCount: 1,
      maxFileCount: 1,
      showUpload: true,
      showRemove: true,
      showCaption: false,
      browseOnZoneClick: true,
      fileActionSettings: {
    	  showZoom: false,
    	  showUpload: false,
    	  showRemove: true
      },
      dropZoneTitle: '点击当前区域选择图片 &hellip;',
      dropZoneClickTitle: '<br>(图片大小介于10K~1M之间)',
      slugCallback: function(filename) {
          return filename.replace('(', '_').replace(']', '_');
      }
});
   
// 文件异步上传成功后事件
$("#uploadImageFile").on("fileuploaded", function (event, data, previewId, index) {
	var response = data.response;
	if (!isEmpty(response)) {
		var responseObj = JSON.parse(response);
		if (responseObj.returnCode == "0") {
			closeGoodsModalBtn.click();
			var cateId = $("#cateId").val();
			ajaxInitHotGoods(cateId, null);
			layer.msg("保存成功！");
	   	} else {
	   		$("#loading").hide();
			layer.msg(responseObj.returnMsg);
	   	}
	}
});

/*
 *  初始化热卖品类
 */
function initHotCategory(){
	$("#loading").show();
	$("#categoryCount").val(0);
	$.ajax({
		url : "/app/category/hot/findHotList",
		type : "post",
		success : function(data) {
			var dataObject = JSON.parse(data);
			var dataObj = JSON.parse(dataObject);
			if (dataObj.returnCode == "1") {
				$("#loading").hide();
				layer.msg(dataObj.returnMsg);
				return;
			}
			var resultList = dataObj.returnList;
			if (resultList == null || resultList.size == 0) {
				$("#loading").hide();
				layer.msg("当前省市尚无热卖品类信息！");
				return;
			}
			var tableTbody = $("#HotCategoryTable").find('tbody');
			tableTbody.empty();
			var HTML_ = '';
			var categoryCount = 0
			for (var i=0; i<resultList.length; i++) {
				categoryCount ++;
				var entity = resultList[i];
				var ID = entity.id;
				var cateInfo;
				if (i <= 1) {
					cateInfo = entity.showName;
				} else {
					cateInfo = entity.showName + "[" + entity.cateNo + "]";
				}
				entity.showName + "[" + entity.cateNo + "]";
				HTML_ += '<tr ondblclick="ajaxInitHotGoods('+ ID +', this)">';
				if (i == 0) {
					HTML_ += '<input type="hidden" id="FIRST_CATE_ID" value="'+ ID +'"/>';
				}
				HTML_ += '<input type="hidden" id="CATEINFO_'+ ID +'" value="'+ cateInfo +'"/>';
				HTML_ += '<input type="hidden" id="CATENO_'+ ID +'" value="'+ entity.cateNo +'"/>';
				HTML_ += '<td class="text-center">'+ (i+1) +'</td>';
				HTML_ += '<td class="text-center">'+ entity.cateNo +'</td>';
				HTML_ += '<td><input type="text" class="form-control input-height" name="NAME_'+ ID +'" value="'+ entity.showName +'"/></td>';
				if (i <= 1) {
					HTML_ += '<td><input type="text" class="form-control text-center input-height"  id="SORT_'+ ID +'" name="SORT_'+ ID +'" value="'+ entity.sortNo +'" readonly/></td>';
					HTML_ += '<td></td>';
				} else {
					HTML_ += '<td><input type="number" min="3" max="20" class="form-control text-center input-height" name="SORT_'+ ID +'" value="'+ entity.sortNo +'"/></td>';
					HTML_ += '<td class="text-center table-index">';
					HTML_ += 			'<button type="button" style="margin-top:4px;" title="删除热卖品类"  class="btn btn-danger btn-xs" onclick="deleteOneHotCategory('+ ID +', this)"><i class="glyphicon glyphicon-trash"></i></button>';
					HTML_ += '</td>';
				}
				HTML_ += '</tr>';
			}
			tableTbody.html(HTML_);
			$("#categoryCount").val(categoryCount);
			$("#loading").hide();
		},
		error : function(msg) {
			$("#loading").hide();
			layer.msg("系统异常，查询热卖品类信息出错！");
		}
	});
}

/*
 *  创建热卖品类弹出框
 */
function createHotCategory() {
	$("#loading").show();
	$("#CreateHotCategoryForm")[0].reset();
	$.ajax({
		url : "/app/category/hot/firstCategoryList",
		type : "post",
		success : function(data) {
			var dataObject = JSON.parse(data);
			var dataObj = JSON.parse(dataObject);
			if (dataObj.returnCode == "1") {
				$("#loading").hide();
				layer.msg(dataObj.returnMsg);
				return;
			}
			var returnCount = dataObj.returnCount;
			$("#sortNo").val(parseInt(returnCount) + 1);
			if (returnCount < 2) {
				$(".input-hidden").hide();
				$("#sortNo").attr("attrVal", 0);
				$("#sortFlag").val(0);
			}
			if (returnCount >= 2) {
				var resultList = dataObj.returnList;
				if (resultList == null || resultList.length == 0) {
					$("#loading").hide();
					layer.msg("当前省市尚无更多在售商品品类信息！");
					return;
				}
				$(".input-hidden").show();
				$("#sortNo").attr("attrVal", 1);
				$("#categorySelect").empty();
				var HTML_ = '<option value="">--请选择商品品类--</option>';
				for (var i=0; i<resultList.length; i++) {
					var entity = resultList[i];
					HTML_ += '<option value="'+ entity.code +'">'+ entity.name +'</option>';
				}
				$("#categorySelect").append(HTML_);
				$("#sortFlag").val(1);
			}
			$("#showNewCategoryModalBtn").click();
			$("#loading").hide();
		},
		error : function(msg) {
			$("#loading").hide();
			layer.msg("系统异常，查询热卖品类信息出错！");
		}
	});
}

/*
 *  AJAX创建一条热卖品类信息
 */
function saveOneHotCategory() {
	var isValidated = true;
	var sortFlag = $("#sortFlag").val();
	if (sortFlag == 1) {
		var formArray = $("#CreateHotCategoryForm").find("input").serializeArray();
		for (var index=0; index<formArray.length; index++) {
			var attrName = formArray[index].name;
			var fieldValue = formArray[index].value;
			if (attrName.indexOf("sortNo") == 0) {
				if (isEmpty(fieldValue)) {
					isValidated = false;
					$("input[name='"+ attrName +"']").focus();
					layer.msg("存在空值或格式有误，请输入大于2的数字!");
					return;
				}
				if (fieldValue <= 2) {
					isValidated = false;
					$("input[name='"+ attrName +"']").focus();
					layer.msg("请输入大于2的数字!");
					return;
				}
			} else {
				if (isEmpty(fieldValue)) {
					isValidated = false;
					$("input[name='"+ attrName +"']").focus();
					layer.msg("存在空值，请输入后再保存!");
					return;
				}
			}
		}
	} else if (sortFlag == 0) {
		var showName = $("#showName").val();
		if (isEmpty(showName)) {
			isValidated = false;
			$("#showName").focus();
			layer.msg("请输入分类名称后再保存!");
			return;
		}
	}
	if (isValidated) {
		layer.confirm("您正在创建热卖品类信息，请确认是否继续？",function(index){
			layer.closeAll('dialog');
			$("#loading").show();
			 $.ajax({
					type : "post",
					async : false,
					url : "/app/category/hot/saveOne",
					data:$("#CreateHotCategoryForm").serialize(),
					success : function(data) {
						var dataObject = JSON.parse(data);
						var dataObj = JSON.parse(dataObject);
						if (dataObj.returnCode == "0") {
							closeCategoryModalBtn.click();
							initHotCategory();
							layer.msg("保存成功！");
						} else {
							$("#loading").hide();
							layer.msg(dataObj.returnMsg);
						}
					},
					error : function(msg) {
						$("#loading").hide();
						layer.msg("系统异常，保存热卖品类信息失败！");
					}
			});
		});
	}
}

/*
 *  AJAX批量更新热卖品类信息
 */
function saveAllHotCategory() {
	var categoryCount = $("#categoryCount").val();
	if (categoryCount <= 0) {
		layer.msg("尚无热卖品类可保存！");
		return;
	}
	var isValidated = true;
	var formObj = $("#HotCategoryForm");
	var textArr = formObj.find("input[type='text']").serializeArray();
	for (var index=0; index<textArr.length; index++) {
		var attrName = textArr[index].name;
		var fieldValue = textArr[index].value;
		if (isEmpty(fieldValue)) {
			isValidated = false;
			$("input[name='"+ attrName +"']").focus();
			layer.msg("存在空值，请重新输入!");
			return;
		}
	}
	var sortArr = [];
	var numberArr = formObj.find("input[type='number']").serializeArray();
	for (var index=0; index<numberArr.length; index++) {
		var attrName = numberArr[index].name;
		var fieldValue = numberArr[index].value;
		if (isEmpty(fieldValue)) {
			isValidated = false;
			$("input[name='"+ attrName +"']").focus();
			layer.msg("存在空值或格式有误，请输入大于2的数字!");
			return;
		}
		var reg = new RegExp("^[0-9]*$");
		if (!reg.test(fieldValue)) {
			isValidated = false;
			$("input[name='"+ attrName +"']").focus();
			layer.msg("格式有误，请输入大于2的数字!");
			return;
		}
		if (fieldValue <= 2) {
			isValidated = false;
			$("input[name='"+ attrName +"']").focus();
			layer.msg("请输入大于2的数字!");
			return;
		}
		sortArr[index] = fieldValue;
	}
	var resultArr = checkArrayRepeat(sortArr);
	if (resultArr.length > 0) {
		isValidated = false;
		layer.msg("排序有先后，排序值不得重复!");
		return;
	}
	if (isValidated) {
		layer.confirm("您正在进行热卖品类信息更新操作，请确认是否继续？",function(index){
			layer.closeAll('dialog');
			$("#loading").show();
			 $.ajax({
					type : "post",
					async : false,
					url : "/app/category/hot/saveAll",
					data:$("#HotCategoryForm").serialize(),
					success : function(data) {
						var dataObject = JSON.parse(data);
						var dataObj = JSON.parse(dataObject);
						if (dataObj.returnCode == "0") {
							layer.msg("保存成功！");
							initHotCategory();
						} else {
							$("#loading").hide();
							layer.msg(dataObj.returnMsg);
						}
					},
					error : function(msg) {
						$("#loading").hide();
						layer.msg("系统异常，保存热卖品类信息失败！");
					}
			});
		});
	}
}

function changeCategoryInfo(obj) {
	var objValue = $(obj).val();
	if (isEmpty(objValue)) {
		$("#cateNo").val("");
		$("#showName").val("");
		return;
	}
	if (objValue < 10) {
		objValue = "0" + objValue;
	}
	var objText = $(obj).find("option:selected").text(); 
	$("#cateNo").val(objValue);
	$("#showName").val(objText);
}

/*
 *  AJAX动态加载热卖商品
 */
function ajaxInitHotGoods(ID, obj){
	$("#loading").show();
	if (obj != null) {
		$(obj).addClass('active').siblings('tr').removeClass('active');
	}
	$("#hotCateId").val(ID);
	$("#cateId").val(ID);
	$("#goodsCount").val(0);
	var cateInfo = $("#CATEINFO_" + ID).val();
	$("#goodsCateInfo").val(cateInfo);
	var hotCateNo = $("#CATENO_" + ID).val();
	$("#hotCateNo").val(hotCateNo);
	var tableTbody = $("#HotGoodsTable").find('tbody');
	tableTbody.empty();
	$(".alert-info").hide();
	var hotCateSort = $("#SORT_" + ID).val();
	if (hotCateSort == 1) {
		$(".firstHotCategoryAlert").show();
		$("#firstHotCategoryName").text("【"+ cateInfo +"】");
	} else if (hotCateSort == 2) {
		$(".secondHotCategoryAlert").show();
		$("#secondHotCategoryName").text("【"+ cateInfo +"】");
	}
	$.ajax({
		url : "/app/category/hot/findHotGoodsList",
		data : {"hotCateId" : ID},
		type : "post",
		success : function(data) {
			var dataObject = JSON.parse(data);
			var dataObj = JSON.parse(dataObject);
			if (dataObj.returnCode == "1") {
				$("#loading").hide();
				layer.msg(dataObj.returnMsg);
				return;
			}
			var resultList = dataObj.returnList;
			if (resultList == null || resultList.size == 0) {
				$("#loading").hide();
				layer.msg("当前热卖品类尚无热卖商品信息！");
				return;
			}
			var HTML_ = '';
			var goodsCount = 0
			for (var i=0; i<resultList.length; i++) {
				goodsCount ++;
				var entity = resultList[i];
				var ID = entity.id;
				HTML_ += '<tr ondblclick="editHotGoods('+ ID +', this)">';
				HTML_ += '<td class="text-center" style="line-height:90px;">'+ (i+1) +'</td>';
				HTML_ += '<td class="text-center"><img src="'+ entity.goods_img +'" width="90px" height="90px"></td>';
				HTML_ += '<td style="line-height:90px;">'+ entity.goods_sku +'</td>';
				HTML_ += '<td style="line-height:90px;" title="'+ entity.goods_show_name +'">'+ getSubString(entity.goods_show_name, 6) +'</td>';
				HTML_ += '<td style="line-height:90px;">'+ cateInfo +'</td>';
				HTML_ += '<td class="input-width"><input type="number" class="form-control text-center input-height" style="margin-top:30px;" min="1" max="4" name="SORT_'+ ID +'" value="'+ entity.sort_no +'"/></td>';
				HTML_ += '</tr>';
			}
			tableTbody.html(HTML_);
			$("#goodsCount").val(goodsCount);
			$("#loading").hide();
		},
		error : function(msg) {
			$("#loading").hide();
			layer.msg("系统异常，查询热卖品类信息出错！");
		}
	});
}

/*
 *  AJAX初始化已上架商品
 */
function ajaxInitMallGoods(goodsPage, flag, hotGoodsId){
	$("#loading").show();
	var goodsNameQuery = $("#goodsNameQuery").val();
	var goodsCateNoQuery = $("#goodsCateNoQuery").val();
	var hotCateNo = $("#hotCateNo").val();
	if (!isEmpty(hotCateNo) && hotCateNo < 10) {
		hotCateNo = "0" + hotCateNo;
	}
	$.ajax({
		url : "/app/category/hot/findGoodsByCategory",
		data : {
			"page" : goodsPage,
			"cateCode" : hotCateNo,
			"goodsSku" : goodsCateNoQuery,
			"goodsShowName" : goodsNameQuery,
			"id" : hotGoodsId
		},
		type : "post",
		success : function(data) {
			var dataObject = JSON.parse(data);
			var dataObj = JSON.parse(dataObject);
			if (dataObj.returnCode == "1") {
				$("#loading").hide();
				layer.msg(dataObj.returnMsg);
				return;
			}
			var resultList = dataObj.returnList;
			if (resultList == null || resultList.size == 0) {
				$("#loading").hide();
				layer.msg("当前品类尚无在售商品！");
				return;
			}
			var tableTbody = $("#MallGoodsTable").find('tbody');
			var tableTfoot = $("#MallGoodsTable").find('tfoot');
			tableTbody.empty();
			tableTfoot.empty();
			var HTML_ = '';
			for (var i=0; i<resultList.length; i++) {
				var entity = resultList[i];
				var ID = entity.id;
				var goodsShowName = entity.goods_show_name;
				var goodsSku = entity.goods_sku;
				HTML_ += '<tr ondblclick="changeGoodsInfo('+ ID +', this)">';
				HTML_ += '<input type="hidden" id="GOODSNAME_'+ ID +'" value="'+ goodsShowName +'"/>';
				HTML_ += '<input type="hidden" id="GOODSKU_'+ ID +'" value="'+ goodsSku +'"/>';
				HTML_ += '<td class="text-center">'+ (i+1) +'</td>';
				HTML_ += '<td>'+ goodsSku +'</td>';
				HTML_ += '<td>'+ goodsShowName +'</td>';
				HTML_ += '</tr>';
			}
			var HTML_TFOOT_ = '<tr><td colspan=3 class="tfoot-padding">';
			HTML_TFOOT_ += '共' + dataObj.totalCount + '条记录  共' + dataObj.totalPages + '页  第' + dataObj.page + '页';
			if (goodsPage > 1) {
				HTML_TFOOT_ += '<a href="javascript:void(0);" onclick="changePage(' + (goodsPage-1) + ')">&nbsp;上一页&nbsp;</a>';
			}
			if (goodsPage < dataObj.totalPages) {
				HTML_TFOOT_ += '<a href="javascript:void(0);" onclick="changePage(' + (goodsPage+1) + ')">&nbsp;下一页&nbsp;</a>';
			}
			HTML_TFOOT_ += '</td></tr>';
			tableTbody.html(HTML_);
			tableTfoot.html(HTML_TFOOT_);
			if (flag == 1) {
				if (hotGoodsId > 0) {
					initHotGoodsDetail(dataObj.returnMap);
				}
				$("#showNewGoodsModalBtn").click();
			}
			$("#loading").hide();
		},
		error : function(msg) {
			$("#loading").hide();
			layer.msg("系统异常，查询上架商品信息出错！");
		}
	});
}

function changePage(pageNum) {
	var hotGoodsId = $("#id").val();
	ajaxInitMallGoods(pageNum, 0, hotGoodsId);
}

function initHotGoodsDetail(dataObj) {
	$("#goodsShowName").val(dataObj.goods_show_name);
	$("#goodsSkuCode").val(dataObj.goods_sku);
	$("#goodsSortNo").val(dataObj.sort_no);
	$("#id").val(dataObj.id);
	$("#goodsId").val(dataObj.goods_id);
}

function initModalComponent() {
	$(".fileinput-remove").click();
	$("#goodsNameQuery").val("");
	$("#goodsCateNoQuery").val("");
	$("#goodsShowName").val("");
	$("#goodsSkuCode").val("");
	$("#goodsSortNo").val("");
	$("#id").val("");
	$("#goodsId").val("");
}

/*
 *  创建热卖商品弹出框
 */
function createHotGoods() {
	var hotCateId = $("#hotCateId").val();
	if (isEmpty(hotCateId)) {
		layer.msg("请先双击选中左侧的热卖品类！");
		return;
	}
	var goodsCount = $("#goodsCount").val();
	if (goodsCount >= 4) {
		layer.msg("您为当前品类创建的热卖商品数量已达上限，不可继续创建！");
		return;
	}
	$("#loading").show();
	$("#modalHeaderText").text("创建热卖商品");
	initModalComponent();
	ajaxInitMallGoods(1, 1, 0);
}

/*
 *  编辑热卖商品弹出框
 */
function editHotGoods(ID, obj) {
	$("#loading").show();
	$("#modalHeaderText").text("编辑热卖商品");
	$(obj).addClass('active').siblings('tr').removeClass('active');
	initModalComponent();
	ajaxInitMallGoods(1, 1, ID);
}

/*
 *  AJAX动态加载热卖商品
 */
function changeGoodsInfo(ID, obj){
	if (obj != null) {
		$(obj).addClass('active').siblings('tr').removeClass('active');
	}
	$("#goodsShowName").val($("#GOODSNAME_" + ID).val());
	$("#goodsSkuCode").val($("#GOODSKU_" + ID).val());
	$("#goodsId").val(ID);
}

/*
 *  AJAX保存一条热卖商品信息
 */
function saveOneHotGoods() {
	var goodsId = $("#goodsId").val();
	if (isEmpty(goodsId)) {
		layer.msg("请先双击左侧选中一条商品！");
		return;
	}
	var goodsSortNo = $("#goodsSortNo").val();
	if (isEmpty(goodsSortNo)) {
		$("#goodsSortNo").focus();
		layer.msg("请输入排序");
		return;
	}
	var isValidated = true;
	var fileValue = $("#uploadImageFile").val();
	if (!isEmpty(fileValue)) {
		isValidated = false
	}
	if (isValidated) {
		layer.confirm("您正在保存热卖商品信息，请确认是否继续？",function(index){
			layer.closeAll('dialog');
			$("#loading").show();
			 $.ajax({
					type : "post",
					async : false,
					url : "/app/category/hot/saveOneHotGoods",
					data:$("#CreateHotGoodsForm").serialize(),
					success : function(data) {
						var dataObject = JSON.parse(data);
						var dataObj = JSON.parse(dataObject);
						if (dataObj.returnCode == "0") {
							closeGoodsModalBtn.click();
							var cateId = $("#cateId").val();
							ajaxInitHotGoods(cateId, null);
							layer.msg("保存成功！");
						} else {
							$("#loading").hide();
							layer.msg(dataObj.returnMsg);
						}
					},
					error : function(msg) {
						$("#loading").hide();
						layer.msg("系统异常，保存热卖商品信息失败！");
					}
			});
		});
	} else {
		layer.confirm("您正在保存热卖商品信息，请确认是否继续？",function(index){
			layer.closeAll('dialog');
			$("#loading").show();
			$(".fileinput-upload-button").click();
		});
	}
}

/*
 *  AJAX批量更新热卖商品排序
 */
function saveAllHotGoods() {
	var goodsCount = $("#goodsCount").val();
	if (goodsCount <= 0) {
		layer.msg("尚无热卖商品可保存！");
		return;
	}
	var isValidated = true;
	var sortArr = [];
	var formArray = $("#HotGoodsForm").find("input[type='number']").serializeArray();
	for (var index=0; index<formArray.length; index++) {
		var attrName = formArray[index].name;
		var fieldValue = formArray[index].value;
		if (isEmpty(fieldValue)) {
			isValidated = false;
			$("input[name='"+ attrName +"']").focus();
			layer.msg("存在空值或格式有误，请重新输入!");
			return;
		}
		var reg = new RegExp("^[0-9]*$");
		if (!reg.test(fieldValue)) {
			isValidated = false;
			$("input[name='"+ attrName +"']").focus();
			layer.msg("格式有误，请输入正整数!");
			return;
		}
		sortArr[index] = fieldValue;
	}
	var resultArr = checkArrayRepeat(sortArr);
	if (resultArr.length > 0) {
		isValidated = false;
		layer.msg("排序有先后，排序值不得重复!");
		return;
	}
	if (isValidated) {
		layer.confirm("您正在进行热卖商品排序更新操作，请确认是否继续？",function(index){
			layer.closeAll('dialog');
			$("#loading").show();
			 $.ajax({
					type : "post",
					async : false,
					url : "/app/category/hot/saveAllHotGoods",
					data:$("#HotGoodsForm").serialize(),
					success : function(data) {
						var dataObject = JSON.parse(data);
						var dataObj = JSON.parse(dataObject);
						if (dataObj.returnCode == "0") {
							layer.msg("保存成功！");
							var cateId = $("#cateId").val();
							ajaxInitHotGoods(cateId, null);
						} else {
							$("#loading").hide();
							layer.msg(dataObj.returnMsg);
						}
					},
					error : function(msg) {
						$("#loading").hide();
						layer.msg("系统异常，保存热卖商品信息失败！");
					}
			});
		});
	}
}

/*
 *  AJAX删除热卖品类
 */
function deleteOneHotCategory(hotCateId, obj) {
	layer.confirm("您正在删除热卖品类，删除后不可恢复，请确认是否继续？",function(index){
		layer.closeAll('dialog');
		$("#loading").show();
		 $.ajax({
				type : "post",
				async : false,
				url : "/app/category/hot/deleteHotCategory",
				data : {
					"hotCateId" : hotCateId
				},
				success : function(data) {
					var dataObject = JSON.parse(data);
					var dataObj = JSON.parse(dataObject);
					if (dataObj.returnCode == "0") {
						$(obj).parent().parent().remove();
						var cateId = $("#cateId").val();
						if (hotCateId == cateId) {
							var firstCateId = $("#FIRST_CATE_ID").val();
							ajaxInitHotGoods(firstCateId, null);
							$("#FIRST_CATE_ID").parent().addClass('active');
						} else {
							$("#loading").hide();
						}
						layer.msg("删除成功！");
					} else {
						$("#loading").hide();
						layer.msg(dataObj.returnMsg);
					}
				},
				error : function(msg) {
					$("#loading").hide();
					layer.msg("系统异常，删除热卖品类失败！");
				}
		});
	});
}

