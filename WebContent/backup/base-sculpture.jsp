<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="panel">
	<div class="panel-heading">
		<h3 class="panel-title">DropzoneJs</h3>
	</div>
	<div class="panel-body">
		<p class="text-main text-bold mar-no">Drag’n’drop file uploads</p>
		<p>DropzoneJs provides drag’n’drop file uploads with image
			previews.</p>

		<br>

		<form id="dropzone" action="${ctx }/manage/test/uploadImage.do"
			class="dropzone" method="post" enctype="multipart/form-data">
			<div class="dz-default dz-message">
				<div class="dz-icon">
					<i class="fa fa-cloud-upload fa-5x"></i>
				</div>
				<div>
					<span class="dz-text">拖拽图片到这里...</span>
					<p class="text-sm text-muted">(或单击此处选择)</p>
				</div>
			</div>
			<div class="fallback">
				<input name="file" type="file" />
			</div>
		</form>

	</div>
</div>

<script type="text/javascript">

jQuery(function($){
	try {
	   Dropzone.autoDiscover = false;
	   var myDropzone = new Dropzone("#dropzone" , {
		    paramName: "file", 										//The name that will be used to transfer the file
		    maxFilesize: 0.5, 										//MB，最大允许上传文件大小
		    parallelUploads: 1,										//每次自动提交上传数量
		    acceptedFiles: ".jpg,.jpeg,.png,.gif",					//文件类型限制
		    maxFiles: 10,											//一次最多允许上传数量
		    uploadMultiple: false,									//是否允许一次提交多个文件
			addRemoveLinks : false, 								//文件移除按钮
			autoProcessQueue: true,									//是否自动提交上传
			dictMaxFilesExceeded: "您一次最多上传{{maxFiles}}个文件",
			dictResponseError: '文件上传失败',
	        dictInvalidFileType: "文件格式只支持{{acceptedFiles}}",
	        dictFallbackMessage:"当前浏览器不支持该文件上传控件",
	        dictFileTooBig:"文件大小超过最大限制{{maxFilesize}M}"
	   });
	  
	   $(document).one('ajaxloadstart.page', function(e) {
			try {
				myDropzone.destroy();
			} catch(e) {}
	   });
	
	} catch(e) {
	  $.niftyNoty({
	        type: 'warning',
	        title: '警告!',
	        message: '该文件上传控件不支持旧版本的浏览器!',
	        container: 'floating',
	        timer: 1000
	   });
	}
	
});

</script>
