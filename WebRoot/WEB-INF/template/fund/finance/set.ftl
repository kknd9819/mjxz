<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.member.add")} -  云生源（shengyuan.cn）你的消费很值钱！</title>
<meta name="author" content="云生源（shengyuan.cn）" />
<meta name="copyright" 云生源（shengyuan.cn） />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.tools.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.lSelect.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/input.js"></script>
<script type="text/javascript" src="/resources/common/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {
	[@flash_message /]
	
	
	  $.validator.addMethod("compareMin", function(value,element) {
	  	var minRate = parseFloat($('#minDailyRate').val());
	  	var maxRate = parseFloat(value);
    	return maxRate > minRate;
  	 }, '最大日利率值必须大于最小日利率值');
	
	var $inputForm = $("#inputForm");
 
	// 表单验证
	$inputForm.validate({
		rules: {
			minDailyRate: {
				required: true,
				number:true,
				max: 0.001,
				min: 0
			},
			maxDailyRate:{
				required: true,
				number:true,
				max: 0.001,
				min: 0,
				compareMin:true
			}
		},
			 
	});
 
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.common.set")}
	</div>
	<form id="inputForm" action="save.jhtml" method="post">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="日利率值设置" />
			</li>
		</ul>
		<table class="input tabContent">
			[#if financeRateConfig?exists]
			<tr>
				<th>最小日利率： </>
				<td><span class="requiredField">${financeRateConfig.minDailyRate}</span></td>
			</tr>
			<tr>
				<th >最大日利率： </>
				<td><span class="requiredField">${financeRateConfig.maxDailyRate}</span></td>
			</tr>
			<tr>
				<th >修改人(时间)： </>
				<td>${financeRateConfig.opName}(${financeRateConfig.modifyDate?string("yyyy-MM-dd HH:mm")})</td>
			</tr>
			[#else]
				<tr>
					<th colspan=2>系统出问题了，请联系管理员 </>
				</tr>
			[/#if]
			
			<tr>
				<th>
					<span class="requiredField">*</span>最小日利率值:
				</th>
				<td>
					<input type="text" id="minDailyRate" name="minDailyRate" class="text" maxlength="10" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>最大日利率值:
				</th>
				<td>
					<input type="text" id="maxDailyRate" name="maxDailyRate" class="text"  maxlength="10"/>
				</td>
			</tr>
			 
			 
		</table>
	
		<table class="input">
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="${message("admin.common.submit")}" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>