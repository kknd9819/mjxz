<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>新增标签</title>
<meta name="author" content="云生源（shengyuan.cn）" />
<meta name="copyright" 云生源（shengyuan.cn） />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $browserButton = $("#browserButton");
	
	[@flash_message /]
	
	$browserButton.browser();
	
	// 表单验证
	$inputForm.validate({
		rules: {
			name: "required",
			tagKey:"required",
			orders: "digits"
		}
	});
	
	$("#createMerchantCode").click(function(){
		$("input[name='tagKey']").val("bq"+ran(4));
	});
});

function ran(m) {
	m = m > 12 ? 12 : m;
	var num = new Date().getTime();
	return num.toString().substring(12 - m);
}
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 新增标签 
	</div>

	
	<form id="inputForm" action="save.jhtml?typeFlag=${typeFlag}" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>名称:
				</th>
				<td >
					<input type="text" name="name" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					类型:
				</th>
				<td>
					<select name="type">
						<option value="">请选择</option>
						<option value="0">搜索标签</option>
						<option value="1">评价标签</option>
						<option value="2">服务标签</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>标签 KEY:
				</th>
				<td>
					<input type="text" readonly="readonly" style="cursor:not-allowed" name="tagKey" class="text" maxlength="20" />&nbsp;<input type="button" class="button" id="createMerchantCode" value="生成" />
				</td>
			</tr>
			<!-- <tr>
				<th>
					图标:
				</th>
				<td>
					<input type="text" name="icon" class="text" maxlength="200" />
					<input type="button" id="browserButton" class="button" value="${message("admin.browser.select")}" />
				</td>
			</tr>-->
			<tr>
				<th>
					备注:
				</th>
				<td colspan="4">
					<input type="text" name="memo" class="text" maxlength="200" />
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
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="${message("admin.common.submit")}" />
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='tagList.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>