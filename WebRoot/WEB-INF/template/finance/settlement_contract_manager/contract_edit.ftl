<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>创建合同 -  生源闪购（shengyuan.cn）闪亮生活，购你喜欢！</title>
<meta name="author" content="生源闪购（shengyuan.cn）" />
<meta name="copyright" 生源闪购（shengyuan.cn） />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/input.js"></script>
<script type="text/javascript" src="/resources/common/datePicker/WdatePicker.js"></script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 编辑合同
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${settlementContract.id}" />
		<table id="contractTable" class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>商家:
				</th>
				<td colspan="4">
					<select name="merchantName" id="merchantName"  disabled="disabled">
						<option value="">请选择...</option>
						[#list merchantList as merchant]
							<option value="${merchant.name}" code="${merchant.code}" [#if settlementContract.merchantCode==merchant.code]selected[/#if]>${merchant.name}</option>
						[/#list]
					</select>
					<input type="hidden" id="merchantCode" name="merchantCode" value="${settlementContract.merchantCode}" />
				</td>
			</tr>
			<tr id="SettlementPeriod">
				<th>
					<span class="requiredField">*</span>结算周期:
				</th>
				<td colspan="4">
					<select name="settlementPeriod" id="settlementPeriod">
						<option value="">请选择...</option>
						[#list periodEnum as period]
							<option value="${period.code}" [#if settlementContract.settlementPeriod==period.code]selected[/#if]>${period.typeName}</option>
						[/#list]
					</select>
				</td>
			</tr>
			<tr  id="specificDays" >
				<th>
					<span class="requiredField">*</span>结算天数:
				</th>
				<td>
					<input type="text" name="specificPeriod" id="specificPeriod" class="text" value="${settlementContract.specificPeriod}" />
				</td>
			</tr>
			<tr>
			<tr id="DelayPeriod">
				<th>
					<span class="requiredField">*</span>延迟天数:
				</th>
				<td colspan="4">
					<input type="text" name="delayPeriod" id="delayPeriod" class="text" value="${settlementContract.delayPeriod}" />
				</td>
			</tr>
			<tr>
				<th>满额结算:</th>
				<td>
					<input type="checkbox" name="checkFullAmount" id="checkFullAmount"  
					[#if checkFullAmount == "checked"]
						checked="checked"
					[/#if]
					/>
				</td>
			</tr>
			<tr id="Amount" style="display: none;">
				<th><span class="requiredField"></span>设置金额:</th>
				 <td>
					<input type="number" name="amount" id="amount"  value="${settlementContract.amount}" />&nbsp;&nbsp;&nbsp;提示： 如果设置了金额即使结算周期没到
金额满了也会自动做结算，立刻进入下一个账期。
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>账期规则:
				</th>
				<td colspan="4">
					<select name="paymentDaysFlag" id="paymentDaysFlag">
						[#list paymentDaysFlag as flag]
							<option value="${flag.code}" [#if settlementContract.paymentDaysFlag==flag.code]selected[/#if]>${flag.typeName}</option>
						[/#list]
					</select>
				</td>
			</tr>
			<tr id="settlementStartDate">
				<th>
					<span class="requiredField">*</span>结算开始日期:
				</th>
				<td colspan="4">
					<input type="text" name="lastSettlementPeriodEnddate" id="lastSettlementPeriodEnddate" 
					[#if settlementContract.lastSettlementPeriodEnddate??]
						value="${settlementContract.lastSettlementPeriodEnddate?date} "  
					[#else]
						value=""
					[/#if]
					class="Wdate" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span> 合同有效期:
				</th>
				<td colspan="4">
					<input type="text" name="periodOfValidity" id="periodOfValidity"  
					 [#if settlementContract.periodOfValidity?? ]
					 	value="${settlementContract.periodOfValidity?date}" 
					 [/#if]
					 class="Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd 23:59:59'});" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>扣率:
				</th>
				<td colspan="4">
					<input type="text" name="fee" id="fee" placeholder="10%请输入0.1" value="${settlementContract.fee}" />
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
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='back.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
$().ready(function() {
		
	[@flash_message /]
	
	var $inputForm = $("#inputForm");
	var $contractTable = $("#contractTable");


	// 表单验证
	$inputForm.validate({
		rules: {
			merchantName: "required",
			settlementPeriod: "required",
			delayPeriod: "required",
			periodOfValidity: "required",
			lastSettlementPeriodEnddate: "required",
			specificPeriod:"required",
			paymentDaysFlag:"required",
			amount:"required",
			fee:"required"
		}
	});

	$("#merchantName").bind('change', function () {
		var code = $("#merchantName option:selected").attr("code");
		$("#merchantCode").val(code);
	});

	
	$("#paymentDaysFlag").bind('change',function(){
		var paymentDaysFlag = $("#paymentDaysFlag").val();
		if(paymentDaysFlag == 1){ //第一笔消费
			$("#lastSettlementPeriodEnddate").val("");
			$("#lastSettlementPeriodEnddate").removeAttr("onfocus");
			$("#lastSettlementPeriodEnddate").attr("readonly","readonly");	
			$("#settlementStartDate").hide();
			$("#lastSettlementPeriodEnddate").rules("remove");
		} else if(paymentDaysFlag == 0) { //系统默认
			$("#lastSettlementPeriodEnddate").removeAttr("readonly");
			$("#lastSettlementPeriodEnddate").val("");
			$("#lastSettlementPeriodEnddate").attr("onfocus","WdatePicker({dateFmt: 'yyyy-MM-dd 23:59:59'});");
			$("#settlementStartDate").show();
			$("#lastSettlementPeriodEnddate").rules("add","required");
		}
	});
	
//	$("#paymentDaysFlag").attr("disabled","disabled");
	
	if( $("#settlementPeriod").val() == 1){ //结算周期为天的时候
		$("#specificDays").show();
	} else { 
		$("#specificDays").hide();
	}
	
	 if($("#paymentDaysFlag").val() == 1){ //第一笔交易
		$("#lastSettlementPeriodEnddate").removeAttr("onfocus");
		$("#lastSettlementPeriodEnddate").attr("readonly","readonly");	
		$("#settlementStartDate").show();
		$("#lastSettlementPeriodEnddate").rules("remove");
	} else if ($("#paymentDaysFlag").val() == 0){ //系统默认
		$("#lastSettlementPeriodEnddate").attr("readonly","readonly");	
		$("#settlementStartDate").show();
		$("#lastSettlementPeriodEnddate").rules("add","required");
	}
	
	$("#settlementPeriod").bind('change',function(){
		var settlementPeriod = $("#settlementPeriod").val();
		if(settlementPeriod == 1){ 
			$("#specificDays").show();
		} else {
			$("#specificDays").hide();
		}
	});
	
	$("#checkFullAmount").bind('change',function(){
		if($("#checkFullAmount").is(':checked')){
			$("#Amount").show();
			$("#amount").rules("add","required");
		} else {
			$("#Amount").hide();
			$("#amount").rules("remove");
		}
	});
	
	if($("#checkFullAmount").is(':checked')){
		$("#Amount").show();
		$("#amount").rules("add","required");
	}else {
		$("#Amount").hide();
		$("#amount").rules("remove");
	}
	
});
</script>
</html>