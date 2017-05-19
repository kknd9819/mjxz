<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>商家动态信息添加</title>
<meta name="author" content="云生源（shengyuan.cn）" />
<meta name="copyright" 云生源（shengyuan.cn） />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/input.js"></script>
<script type="text/javascript" src="/resources/common/datePicker/WdatePicker.js"></script>
<script>
	$().ready(function() {
		
		var $inputForm = $("#inputForm");
		[@flash_message /]

		//表单验证
		$inputForm.validate({
			rules: {
				dynamicMsgName: "required",
				msg: "required",
				startTime:{
					required: true
				},
				endTime:{
					required: true
				}
			}
		});
	
	});
	
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">首页</a> &raquo; 添加商家动态信息
	</div>
	<form id="inputForm" action="save.jhtml" method="post">
		<input type="hidden" name="merchantId" value="${merchantId}" />
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>名称:
				</th>
				<td>
					<input type="text" id="dynamicMsgName" name="dynamicMsgName" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>动态类型:
				</th>
				<td colspan="2">
					<select name="dynamicMsgType">
					<option value="0">返现</option>
					<option value="1">优惠</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>开始时间:
				</th>
				<td colspan="2">
					<input type="text" id="startTime" name="startTime" class="text Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', maxDate: '#F{$dp.$D(\'endTime\')}'});" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>结束时间:
				</th>
				<td colspan="2">
					<input type="text" id="endTime" name="endTime" class="text Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '#F{$dp.$D(\'startTime\')}'});" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>动态内容:
				</th>
				<td>
					<input type="text" name="msg" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="确定" />
					<input type="button" class="button" value="返回" onclick="history.back()" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>