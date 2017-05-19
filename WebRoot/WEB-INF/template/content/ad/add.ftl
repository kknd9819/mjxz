<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.ad.add")} -  生源闪购（shengyuan.cn）闪亮生活，购你喜欢！</title>
<meta name="author" content="生源闪购（shengyuan.cn）" />
<meta name="copyright" 生源闪购（shengyuan.cn） />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<link href="/resources/common/colorpicker/colorpicker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="/resources/common/editor/kindeditor.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/input.js"></script>
<script type="text/javascript" src="/resources/common/datePicker/WdatePicker.js"></script>

<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $adPositionId = $("#adPositionId");
	var $pathTr = $("#pathTr");
	var $path = $("#path");
	var $browserButton = $("#browserButton");
	
	[@flash_message /]
	
	$browserButton.unbind().browser({
		type: "image"
	});
	
	//广告位修改	
	$("select option").click(function() {
    	var description = $(this).attr("description");
    	$(".description").html(description);    	
   	});
	
	// 表单验证
	$inputForm.validate({
		rules: {
			title: "required",
			adPositionId: "required",
			image: "required",
			orders: {
					required: true,
					digits : true
		    }
		 }		
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.ad.add")}
	</div>
	<form id="inputForm" action="save.jhtml" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Ad.title")}:
				</th>
				<td>
					<input type="text" name="title" class="text" maxlength="200" />
					<input type="hidden" name="type" value=1 class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Ad.adPosition")}:
				</th>
				<td>
					<select name="adPositionId" id="adPositionId">
						[#list adPositions as adPosition]
							<option description="${adPosition.description}" value="${adPosition.id}"[#if adPosition.id ==adPositionId] selected="selected"[/#if]>${adPosition.name}</option>
						[/#list]
					</select>
				</td>
			</tr>
			<tr id="pathTr">
				<th>
					<span class="requiredField">*</span>图片:
				</th>
				<td>
					<span class="fieldSet">
						<input type="text" id="image" name="image" class="text" maxlength="200" />
						<input type="button" id="browserButton" class="button" value="${message("admin.browser.select")}" />
					</span>
				</td>
			</tr>
			<tr>
				<th>
					${message("Ad.beginDate")}:
				</th>
				<td>
					<input type="text" id="beginDate" name="beginDate" class="text Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', maxDate: '#F{$dp.$D(\'endDate\')}'});" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Ad.endDate")}:
				</th>
				<td>
					<input type="text" id="endDate" name="endDate" class="text Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '#F{$dp.$D(\'beginDate\')}'});" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("admin.common.order")}:
				</th>
				<td>
					<input type="text" name="orders" class="text" maxlength="9" />
				</td>
			</tr>
			<tr>
				<th>
					广告位描述:
				</th>
				<td>
					<span class="description"></span>
				</td>
			</tr>
			<tr>
				<th>
					广告属性1:
				</th>
				<td>
					<input type="text" name="attribute_value1" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					广告属性2:
				</th>
				<td>
					<input type="text" name="attribute_value2" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					广告属性3:
				</th>
				<td>
					<input type="text" name="attribute_value3" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					广告属性4:
				</th>
				<td>
					<input type="text" name="attribute_value4" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					广告属性5:
				</th>
				<td>
					<input type="text" name="attribute_value5" class="text" maxlength="200" />
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
</body>
</html>