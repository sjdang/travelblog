<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/web_resources/bootstrap-3.3.7/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/web_resources/bootstrap-3.3.7/css/fileinput/fileinput.min.css">
<style>
.content {
	width: 98%;
	margin: -20px auto;
}

.page-header {
	margin-top: 30px;
}

.loading {
	z-index: 9999;
	display: none;
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	background-color: #ccc;
	text-align: center;
	vertical-align: middle;
	opacity: 0.4;
}

.loading img {
	margin-top: 300px;
}

.text-center {
	text-align: center;
}

.table-index {
	width: 40px;
}

.input-width {
	width: 120px;
}

.btn-padding {
	float: right;
	margin-right: 10px;
}

.tfoot-padding {
	text-align: right;
}

.tr-padding {
	height: 90px;
	line-height: 90px;
}

.fileinput-upload-button,.fileinput-remove-button,.btn-file {
	display: none;
}
</style>

<div id="loading" class="loading">
	<img alt="加载中..." src="/images/loading-extend.gif" />
</div>
<div class="content">
	<div class="page-header"></div>
	<div class="row">
		<div class="col-xs-5">
			<form id="HotCategoryForm" name="HotCategoryForm">
				<input type="hidden" id="categoryCount" value="0" />
				<div class="panel panel-default">
					<div class="panel-heading">
						热卖品类
						<button type="button" id="saveAllCategoryBtn"
							class="btn btn-success btn-xs btn-padding" title="保存热卖品类">
							<i class="glyphicon glyphicon-floppy-save"></i>
						</button>
						<button type="button" id="createNewCategoryBtn"
							class="btn btn-warning btn-xs btn-padding" title="新增热卖品类">
							<i class="glyphicon glyphicon-plus-sign"></i>
						</button>
						<button type="button" id="showNewCategoryModalBtn"
							data-toggle="modal" data-target="#hotCategoryModal"
							style="display: none;"></button>
					</div>
					<table id="HotCategoryTable"
						class="table table-bordered table-hover table-condensed">
						<thead>
							<tr>
								<th class="text-center table-index">序号</th>
								<th class="text-center">品类编码</th>
								<th class="text-center">品类名称</th>
								<th class="text-center input-width">排序</th>
								<th class="text-center table-index">操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</form>
		</div>
		<div class="col-xs-7">
			<form id="HotGoodsForm" name="HotGoodsForm">
				<input type="hidden" id="hotCateId" name="hotCateId" /> <input
					type="hidden" id="hotCateNo" /> <input type="hidden"
					id="goodsCount" value="0" />
				<div class="panel panel-default">
					<div class="panel-heading">
						热卖商品
						<button type="button" id="saveAllGoodsBtn"
							class="btn btn-success btn-xs btn-padding" title="保存热卖商品">
							<i class="glyphicon glyphicon-floppy-save"></i>
						</button>
						<button type="button" id="createNewGoodsBtn"
							class="btn btn-warning btn-xs btn-padding" title="新增热卖商品">
							<i class="glyphicon glyphicon-plus-sign"></i>
						</button>
						<button type="button" id="showNewGoodsModalBtn"
							data-toggle="modal" data-target="#hotGoodsModal"
							style="display: none;"></button>
					</div>
					<table id="HotGoodsTable"
						class="table table-bordered table-hover table-condensed">
						<thead>
							<tr>
								<th class="text-center table-index">序号</th>
								<th class="text-center">商品图片</th>
								<th class="text-center">商品编码</th>
								<th class="text-center">商品名称</th>
								<th class="text-center">热卖品类</th>
								<th class="text-center input-width">排序</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- 弹出框 热卖品类 -->
<div class="modal" id="hotCategoryModal" data-backdrop="false">
	<div class="modal-dialog"
		style="left: 1%; padding-top: 100px; width: 30%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">创建热卖品类</h4>
			</div>
			<div class="modal-body">
				<form id="CreateHotCategoryForm" name="CreateHotCategoryForm">
					<input type="hidden" id="sortFlag">
					<ul class="list-group">
						<li class="list-group-item input-hidden"><select
							id="categorySelect" class="form-control"
							onchange="changeCategoryInfo(this)"></select></li>
						<li class="list-group-item input-hidden"><input type="text"
							id="cateNo" name="cateNo" class="form-control"
							placeholder="请输入品类编码" readonly></li>
						<li class="list-group-item"><input type="text" id="showName"
							name="showName" class="form-control" placeholder="请输入品类名称">
						</li>
						<li class="list-group-item"><input type="number" id="sortNo"
							name="sortNo" attrVal="" class="form-control" min="3" max="20"
							readonly></li>
					</ul>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="closeCategoryModalBtn"
					class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" id="saveOneCategoryBtn"
					class="btn btn-success">保存</button>
			</div>
		</div>
	</div>
</div>

<!-- 弹出框 热卖商品 -->
<div class="modal" id="hotGoodsModal" data-backdrop="false">
	<div class="modal-dialog"
		style="left: 1%; padding-top: 10px; width: 60%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="modalHeaderText"></h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-xs-7">
						<div class="row" style="padding-bottom: 10px;">
							<div class="col-xs-4">
								<input type="text" id="goodsNameQuery" class="form-control"
									placeholder="请输入商品名称">
							</div>
							<div class="col-xs-4">
								<input type="text" id="goodsCateNoQuery" class="form-control"
									placeholder="请输入商品编码">
							</div>
							<div class="col-xs-4">
								<button type="button" id="goodsQueryBtn"
									class="btn btn-default btn-primary btn-padding">查询</button>
							</div>
						</div>
						<div class="panel panel-default">
							<table id="MallGoodsTable"
								class="table table-bordered table-hover table-condensed">
								<thead>
									<tr>
										<th class="text-center table-index">序号</th>
										<th class="text-center">商品编码</th>
										<th class="text-center">商品名称</th>
									</tr>
								</thead>
								<tbody></tbody>
								<tfoot></tfoot>
							</table>
						</div>
						<div
							class="alert alert-info alert-dismissible firstHotCategoryAlert"
							role="alert">
							<strong><span id="firstHotCategoryName"></span>栏图片上传建议：</strong><br />
							左侧图片【建议比例： 1:1，建议尺寸：369 * 369】<br /> 右侧图片【建议比例： 2:1，建议尺寸：360 *
							180】
						</div>
						<div
							class="alert alert-info alert-dismissible secondHotCategoryAlert"
							role="alert">
							<strong><span id="secondHotCategoryName"></span>栏图片上传建议：</strong><br />
							上侧图片【建议比例： 3:1，建议尺寸：1020 * 340】<br /> 下侧图片【建议比例： 1:1，建议尺寸：330 *
							330】
						</div>
					</div>
					<div class="col-xs-5" style="border-left: 1px solid #ccc;">
						<form id="CreateHotGoodsForm" name="CreateHotGoodsForm"
							enctype="multipart/form-data">
							<input type="hidden" id="id" name="id" /> <input type="hidden"
								id="goodsId" name="goodsId" /> <input type="hidden" id="cateId"
								name="cateId" />
							<ul class="list-group">
								<li class="list-group-item"><input type="text"
									id="goodsCateInfo" class="form-control" readonly></li>
								<li class="list-group-item"><input type="text"
									id="goodsShowName" class="form-control" placeholder="请双击选中左侧商品"
									readonly></li>
								<li class="list-group-item"><input type="text"
									id="goodsSkuCode" class="form-control" placeholder="请双击选中左侧商品"
									readonly></li>
								<li class="list-group-item"><input type="number"
									id="goodsSortNo" name="goodsSortNo" class="form-control"
									min="1" max="4" placeholder="请输入排序"></li>
								<li class="list-group-item" style="height: 360px;">
									<div style="height: 300px;">
										<input id="uploadImageFile" type="file" multiple class="file">
									</div>
								</li>
							</ul>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" id="closeGoodsModalBtn"
					class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" id="saveOneGoodsBtn" class="btn btn-success">保存</button>
			</div>
		</div>
	</div>
</div>

<script
	src="${pageContext.request.contextPath}/web_resources/goodscategory/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/web_resources/bootstrap-3.3.7/js/fileinput/fileinput.min.js"></script>
<script
	src="${pageContext.request.contextPath}/web_resources/bootstrap-3.3.7/js/fileinput/zh.js"></script>
<script
	src="${pageContext.request.contextPath}/js/support/standard/common/common-utils.js"></script>
<script
	src="${pageContext.request.contextPath}/js/support/wechatmall/goodsCategory/category-hot.js"></script>
