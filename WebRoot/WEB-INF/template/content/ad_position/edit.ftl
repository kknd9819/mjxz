<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.adPosition.edit")} -  生源闪购（shengyuan.cn）闪亮生活，购你喜欢！</title>
<meta name="Author" content="生源闪购（shengyuan.cn）" />
<meta name="Copyright" 生源闪购（shengyuan.cn） />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.tools.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	[@flash_message /]

	// 表单验证
	$inputForm.validate({
		rules: {
			code: "required",
			name: "required"
		}
	});
});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.adPosition.edit")}
	</div>
	<form id="inputForm" action="update.jhtml" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${adPosition.id}" />
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>编码:
				</th>
				<td>
					<input type="text" name="code" class="text" value="${adPosition.code}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("AdPosition.name")}:
				</th>
				<td>
					<input type="text" name="name" class="text" value="${adPosition.name}" maxlength="200" />
					<input type="button" id="intoAd" class="button" value="${message("admin.adPosition.intoAd")}" />
				</td>
			</tr>
			<tr>
				<th>
					${message("AdPosition.description")}:
				</th>
				<td>
					<input type="text" name="description" class="text" value="${adPosition.description}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Navigation.position")}:
				</th>
				<td>
					<select name="position">
						[#list positions as position]
							<option value="${position.code}"[#if position.code == adPosition.position] selected="selected"[/#if]>${position.typeName}</option>
						[/#list]
					</select>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="${message("admin.common.submit")}" />
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
<script type="text/javascript">
$().ready(function() {
   	jQuery("#intoAd").click(function(){
   	    window.location.href="/content/ad/goAdList.jhtml?adPositionId=${adPosition.id}";
   	});
});
</script>
</body>
</html>