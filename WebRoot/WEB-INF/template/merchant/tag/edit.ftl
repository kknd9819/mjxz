<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>标签编辑</title>
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
});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 标签编辑
	</div>
	<form id="inputForm" action="update.jhtml?typeFlag=${typeFlag}" method="post">
		<input type="hidden" name="id" value="${tag.id}" />
		<input type="hidden" name="createDate" value="${tag.createDate}"/>
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>名称:
				</th>
				<td>
					<input type="text" name="name" class="text" value="${tag.name}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					类型:
				</th>
				<td>
					<select name="type">
						<option value="">请选择</option>
						<option value="0" [#if tag.type = 0] selected = "selected"[/#if]>搜索标签</option>
						<option value="1" [#if tag.type = 1] selected = "selected"[/#if]>评价标签</option>
						<option value="2" [#if tag.type = 2] selected = "selected"[/#if]>服务标签</option>
					</select>
				</td>
			</tr>
			<!-- <tr>
				<th>
					图标:
				</th>
				<td>
					<input type="text" name="icon" class="text" value="${tag.icon}" maxlength="200" />
					<input type="button" id="browserButton" class="button" value="${message("admin.browser.select")}" />
					[#if tag.icon??]
						<input id="siteUrl" type="hidden" value="${siteUrl}"/>
						<a href="${siteUrl}${tag.icon}" target="_blank">${message("admin.common.view")}</a>
					[/#if]
				</td>
			</tr>-->
			<tr>
				<th>
					<span class="requiredField">*</span>标签 KEY:
				</th>
				<td>
					<input type="text" name="tagKey" readonly="readonly" style="cursor:not-allowed" class="text" maxlength="20" value="${tag.tagKey}"/>
				</td>
			</tr>
			<tr>
				<th>
					备注:
				</th>
				<td colspan="4">
					<input type="text" name="memo" class="text" value="${tag.memo}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					排序:
				</th>
				<td>
					<input type="text" name="orders" class="text" value="${tag.orders}" maxlength="9" />
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