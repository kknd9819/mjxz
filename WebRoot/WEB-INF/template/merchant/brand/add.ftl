<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>品牌新增 -  云生源（shengyuan.cn）你的消费很值钱！</title>
<meta name="author" content="云生源后台管理系统" />
<meta name="copyright" content="云生源后台管理系统" />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="/resources/common/editor/kindeditor.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/input.js"></script>
<script type="text/javascript" src="/resources/common/validate/validateForm.js"></script>
<script type="text/javascript">
	$().ready(function() {
		
		function checkName(){
			var result = false;
			var name = $.trim($("#name").val());
			if(name==""){
				return false;
			}
			$.ajax({
				url:"checkName.jhtml?name="+name,
				type: "POST",
				dataType: "json",
				cache: false,
				async: false,
				success: function(data) {
					result = data;
				}
			});
			return result;
		}
		$("#name").blur(function(){
				if(checkName()){
					$("#check").html("警告！该品牌名称已存在");
				}else{
					$("#check").html("");
				}
			}
		);
		[@flash_message /]
		
		var $inputForm = $("#inputForm");
		var $type = $("#type");
		var $logo = $("#logo");
		var $browserButton = $("#browserButton");
		
		$browserButton.browser();
		
		$type.change(function() {
			if ($(this).val() == 0) {
				$logo.val("").prop("disabled", true);
				$browserButton.prop("disabled", true);
			} else {
				$logo.prop("disabled", false);
				$browserButton.prop("disabled", false);
			}
		});
		
		// 表单验证
		$inputForm.validate({
			rules: {
				name: "required",
				logo: "required",
				orders: "digits"
			},
			//解决【类型】选择“文本”时，logo文本框的样式问题
			submitHandler : function (form){
				if($("#type").val()=="text"){
				    $("#logo").removeClass("fieldError");
				}
				form.submit();
			}
		});	
	});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">首页</a> &raquo; 品牌添加
	</div>
	<form id="inputForm" action="save.jhtml" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>名称:
				</th>
				<td>
					<input type="text" name="name" id="name" class="text" maxlength="200" />
					<span id="check"></span>
				</td>
			</tr>
			<tr>
				<th>
					类型:
				</th>
				<td>
					<select id="type" name="type">
						[#list types as type]
							<option value="${type.code}">${type.typeName}</option>
						[/#list]
					</select>
				</td>
			</tr>
			<tr>
				<th>
					logo:
				</th>
				<td>
					<span class="fieldSet">
						<input type="text" id="logo" name="logo" class="text" maxlength="200" disabled="disabled" />
						<input type="button" id="browserButton" class="button" value="选择文件" disabled="disabled" />
					</span>
				</td>
			</tr>
			<tr>
				<th>
					网址:
				</th>
				<td>
					<input type="text" name="url" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					排序:
				</th>
				<td>
					<input type="text" name="orders" class="text" maxlength="9" />
				</td>
			</tr>
			<tr>
				<th>
					介绍:
				</th>
				<td>
					<textarea  name="introduction" rows="5" cols="100" maxlength="250"></textarea>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="提交" />
					<input type="button" class="button" value="返回" onclick="history.back()" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>