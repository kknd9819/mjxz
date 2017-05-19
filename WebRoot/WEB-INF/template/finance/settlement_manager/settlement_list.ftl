<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>商家结算管理 -  云生源！</title>
<meta name="author" content="云生源" />
<meta name="copyright" 云生源 />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<link href="/resources/css/finance.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.tools.js"></script>
<script type="text/javascript" src="/resources/js/list.js"></script>
<script type="text/javascript" src="/resources/common/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript">
	function view(settlementId) {
        window.location.href="orderList.jhtml?settlementId="+settlementId;
	}
	function confirmDialog_audit(settlementId) {
		$.dialog({
			type: "warn",
			content: "结算单已经核实通过，准备转交出纳处理？",
//			on:"确认",
//			cancel:"驳回"
			onOk:function(){
					window.location.href="check.jhtml?settlementId="+settlementId;
				}
	//		onCancel:rollback(paymentId)
		});
	}

    function confirmDialog_loan(settlementId) {
        $.dialog({
            type: "warn",
            content: "结算单已经核实完，确认放款？",
//			on:"确认",
//			cancel:"驳回"
            onOk:function(){
                window.location.href="loan.jhtml?settlementId="+settlementId;
            }
            //		onCancel:rollback(paymentId)
        });
    }
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 结算单列表 <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" name="listForm" action="list.jhtml" method="get" target="">
			<!--begin查询条件-->
<fieldset class="fielset">
<legend>查询条件</legend>
<table  class="fieldset_t">
	<tr>
		<td>
			<label>商家:</label>
			<select id="merchantCode" name="merchantCode">
				<option value="" [#if !merchantCode?exists||merchantCode?length==0]selected[/#if]>全部</option> 
				[#if merchantList?exists]
	                [#list merchantList as merchant]
						<option value="${merchant.code}"  [#if merchantCode?exists&&merchantCode==merchant.code]selected[/#if]>${merchant.name}</option>
					[/#list]
	            [/#if]
			</select>
		</td>
		
		<td>
			<label>状态:</label>
			<select id="settlementStatus" name="settlementStatus">
				<option value="" [#if !settlementStatus?exists||settlementStatus?length==0]selected[/#if]>全部</option> 
			[#if settlementStatusEnum?exists]
                [#list settlementStatusEnum as status]
					<option value="${status.code}"  [#if settlementStatus?exists&&settlementStatus==status.code]selected[/#if]>${status.typeName}</option>
				[/#list]
            [/#if]
			</select>
		</td>
		<td>
			<label>结算日期从</label>
			<input type="text" id="beginDate" name="beginDate" value="${beginDate}" class="Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd 00:00:00', maxDate: '#F{$dp.$D(\'endDate\')}'});" />
			<label>至</label>	
			<input type="text" id="endDate" name="endDate" value="${endDate}" class="Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd 23:59:59', minDate: '#F{$dp.$D(\'beginDate\')}'});" />
		</td>
		<td>
		 <font onclick="queryForPage()" style='border: 1px solid #cccccc;padding: 5px 35px;cursor:pointer;'>查询</font>
		<!--<font onclick="exportExcel()" style='border: 1px solid #cccccc;padding: 5px 35px;cursor:pointer;'>导出Excel</font>-->
		</td>
		<td>
			<font onclick="exportExcel()" style='border: 1px solid #cccccc;padding: 5px 35px;cursor:pointer;'>导出</font>
		</td>

	</tr>
</table>
</fieldset>
<!--end 查询条件 -->
		<table id="listTable" class="list">
			<tr>
				<th class="center">
                    <a href="javascript:;" class="sort" name="merchant_id"><span>商家名称</span></a>
				</th>
				<th class="center">
					<a href="javascript:;" class="sort" name="create_date"><span>划账日期</span></a>
				</th>
				<th class="center">
					<span>交易起止日期</span>
				</th>
				<th class="center">
					<a href="javascript:;" class="sort" name="payment_amount"><span>支付金额</span></a>
				</th>
				<th class="center">
					<a href="javascript:;" class="sort" name="refund_amount"><span>退款金额</span></a>
				</th>
                <th class="center">
                    <a href="javascript:;" class="sort" name="only_payment_amount"><span>支付净额</span></a>
                </th>
                <th class="center">
                    <a href="javascript:;" class="sort" name="fee_amount"><span>手续费</span></a>
                </th>
                <th class="center">
                    <a href="javascript:;" class="sort" name="amount"><span>划账金额</span></a>
                </th>
				<th class="center">
					<a href="javascript:;" class="sort" name="apply_date"><span>申请日期</span></a>
				</th>
				<th class="center">
					<a href="javascript:;" class="sort" name="settlement_status"><span>状态</span></a>
				</th>
				<th class="center">
					<a href="javascript:;" class="sort" name="audit_date"><span>审核日期</span></a>
				</th>
                <th class="center">
                    <a href="javascript:;" class="sort" name="have_money_date"><span>打款日期</span></a>
                </th>
				<th class="center"><span>操作</span></th>
			</tr>
			[#list page.content as settlement]
			<tr>
				<td class="center">
					<span>${settlement.merchantName}</span>
				</td>
				<td class="center">
					<span>${settlement.createDate}</span>
				</td>
				<td class="center">
					<span>${settlement.startDate} 至 ${settlement.endDate}</span>
				</td>
				<td class="center">
					<span>${settlement.paymentAmount}</span>
				</td>
				<td class="center">
					<span>${settlement.refundAmount}</span>
				</td>
				<td class="center">
					<span>${settlement.onlyPaymentAmount}</span>
				</td>
                <td class="center">
                    <span>${settlement.feeAmount}</span>
                </td>
                <td class="center">
                    <span>${settlement.amount}</span>
                </td>
                <td class="center">
                    <span>${settlement.applyDate}</span>
                </td>
				<td class="center">
					<span>${settlement.settlementStatusName}</span>
				</td>
				<td class="center">
					<span>${settlement.auditDate}</span>
				</td>
                <td class="center">
                    <span>${settlement.haveMoneyDate}</span>
                </td>
				<td class="center">
					<a href=javascript:view('${settlement.id}')>[查看]</a>
					[#--[@shiro.hasPermission name='finance_payment:confirm']--]
					[#if settlement.settlementStatus == 1]
						<a href=javascript:confirmDialog_audit('${settlement.id}')>[审核]</a>
					[/#if]
					[#if settlement.settlementStatus == 2]
                        <a href=javascript:confirmDialog_loan('${settlement.id}')>[打款]</a>
					[/#if]
					[#--[/@shiro.hasPermission]--]
				</td>
			</tr>
			[/#list]
		</table>
		[@pagination pageNumber = page.currentPage totalPages = page.totalPage]
			[#include "/common/pagination.ftl"]
		[/@pagination]
	</form>
</body>
<script>
function queryForPage(){
	$("#listForm").attr("action", "list.jhtml");
	$("#listForm").attr("target", "");
	$("#listForm").submit();
}
function exportExcel(){
	$("#listForm").attr("action", "export.jhtml");
	$("#listForm").attr("target", "_blank");
	$("#listForm").submit();
	$("#listForm").attr("action", "list.jhtml");
	$("#listForm").attr("target", "");
}
function printPayment(){
	$("#listForm").attr("action", "printPayment.jhtml");
	$("#listForm").attr("target", "_blank");
	$("#listForm").submit();
	$("#listForm").attr("action", "list.jhtml");
	$("#listForm").attr("target", "");
}
function printPaymentTotal(){
	$("#listForm").attr("action", "printPaymentTotal.jhtml");
	$("#listForm").attr("target", "_blank");
	$("#listForm").submit();
	$("#listForm").attr("action", "list.jhtml");
	$("#listForm").attr("target", "");
}
$().ready( function() {
	[@flash_message /]
});
</script>
</html>