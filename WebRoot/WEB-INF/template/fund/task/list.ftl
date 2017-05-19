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
	function doTask(url){
		$.dialog({
		type: "warn",
		content: "您确定需要此项操作",
		ok: message("admin.dialog.ok"),
		cancel: message("admin.dialog.cancel"),
		onOk: function() {
			$.ajax({
				url: url,
				type: "POST",
				dataType: "json",
				cache: false,
				success: function(message) {
					$.message(message);
				}
			});
		}
	});
   }
   
   $('input[type="button"]').click(function(){
   		var url = $(this).data('url');
   		$(this).attr("disabled","disabled");
   		doTask(url);
   });
   
   
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 定时任务
	</div>
	<div>
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="消费余额" />
			</li>
		</ul>
		<table class="input tabContent" >
			<tr>
				<th>
					<span class="requiredField">*</span>消费余额昨日利率:
				</th>
				<td>
				 
					<input type="button" class="button" value="生成消费余额昨日利率" data-url="/fund/task/produceYesterdayBalanceRate.jhtml"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>消费余额昨日余额:
				</th>
				<td>
					<input type="button" class="button" value="生成消费余额昨日余额" data-url="/fund/task/produceYesterdayBalance.jhtml"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>消费余额昨日收益:
				</th>
				<td>
					<input type="button" class="button" value="生成消费余额昨日收益" data-url="/fund/task/produceYesterdayBalanceIncome.jhtml"/>
				</td>
			</tr>
			 
		</table>
	</div>
	
	
	<div>
		<ul id="tab1" class="tab">
			<li>
				<input type="button" value="理财余额" />
			</li>
		</ul>
		<table class="input tabContent">
			<tr>
				<th>
					<span class="requiredField">*</span>理财余额昨日利率:
				</th>
				<td>
					<input type="button" class="button" value="生成理财余额昨日利率" data-url="/fund/task/produceYesterdayFinanceRate.jhtml"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>理财余额昨日余额:
				</th>
				<td>
					<input type="button" class="button" value="生成理财余额昨日余额" data-url="/fund/task/produceYesterdayFinance.jhtml"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>理财余额昨日收益:
				</th>
				<td>
					<input type="button" class="button" value="生成理财余额昨日收益" data-url="/fund/task/produceYesterdayFinanceIncome.jhtml"/>
				</td>
			</tr>
			 
		</table>
	</div>
</body>
</html>