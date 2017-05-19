<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.ad.edit")} -  生源闪购（shengyuan.cn）闪亮生活，购你喜欢！</title>
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
	var $type = $("#type");
	var $pathTr = $("#pathTr");
	var $path = $("#path");
	var $browserButton = $("#browserButton");
	
	[@flash_message /]

	$browserButton.browser({
		type: "image"
	});
	
	//广告位修改		
    var description = $("select option:selected").attr("description");
    $(".description").html(description);
    
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
		<a href="/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.ad.edit")}
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${ad.id}" />
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Ad.title")}:
				</th>
				<td>
					<input type="text" name="title" class="text" value="${ad.title}" maxlength="200" />
					<input type="hidden" name="type" value=1 class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Ad.adPosition")}:
				</th>
				<td>
					<select name="adPositionId">
						[#list adPositions as adPosition]
							<option description="${adPosition.description}" value="${adPosition.id}"[#if adPosition.id == ad.adPosition] selected="selected"[/#if]>${adPosition.name}</option>
						[/#list]
					</select>
				</td>
			</tr>
			<tr id="pathTr">
				<th>
					<span class="requiredField">*</span>${message("Ad.path")}:
				</th>
				<td>
					<span class="fieldSet">
						<input type="text" id="image" name="image" class="text" value="${ad.image}" maxlength="200" />
						<input type="button" id="browserButton" class="button" value="${message("admin.browser.select")}" />
					</span>
				</td>
			</tr>
			<tr>
				<th>
					${message("Ad.beginDate")}:
				</th>
				<td>
					<input type="text" id="beginDate" name="beginDate" class="text Wdate" value="[#if ad.beginDate??]${ad.beginDate?string("yyyy-MM-dd HH:mm:ss")}[/#if]" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', maxDate: '#F{$dp.$D(\'endDate\')}'});" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Ad.endDate")}:
				</th>
				<td>
					<input type="text" id="endDate" name="endDate" class="text Wdate" value="[#if ad.endDate??]${ad.endDate?string("yyyy-MM-dd HH:mm:ss")}[/#if]" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '#F{$dp.$D(\'beginDate\')}'});" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("admin.common.order")}:
				</th>
				<td>
					<input type="text" name="orders" class="text" value="${ad.orders}" maxlength="9" />
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
					广告属性1
				</th>
				<td>
					<input type="text" name="attribute_value1" class="text" value="${ad.attribute_value1}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					广告属性2
				</th>
				<td>
					<input type="text" name="attribute_value2" class="text" value="${ad.attribute_value2}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					广告属性3
				</th>
				<td>
					<input type="text" name="attribute_value3" class="text" value="${ad.attribute_value3}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					广告属性4
				</th>
				<td>
					<input type="text" name="attribute_value4" class="text" value="${ad.attribute_value4}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					广告属性5
				</th>
				<td>
					<input type="text" name="attribute_value5" class="text" value="${ad.attribute_value5}" maxlength="200" />
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