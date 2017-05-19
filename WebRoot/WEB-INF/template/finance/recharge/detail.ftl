<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>充值订单明细</title>
<meta name="author" content="云生源（shengyuan.cn）" />
<meta name="copyright" content="云生源（shengyuan.cn）" />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.tools.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/input.js"></script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 充值订单明细
	</div>
	<ul id="tab" class="tab">
		[#if recharge??]
			<li>
				<input type="button" value="充值明细" />
			</li>
		[/#if]
		[#if payment??]
			<li>
				<input type="button" value="支付信息" />
			</li>
		[/#if]
	</ul>
	[#if recharge??]
		<table class="input tabContent">
			<tr>
				<th>订单流水：</th>
				<td>${recharge.id}</td>
				<th>订单编号：</th>
				<td>${recharge.orderSn}</td>
			</tr>
			<tr>
				<th>创建时间：</th>
				<td>[#if recharge.createDate??] ${recharge.createDate?string("yyyy-MM-dd HH:mm:ss")} [/#if]</td>
				<th>修改时间：</th>
				<td>[#if recharge.modifyDate?? ] ${recharge.modifyDate?string("yyyy-MM-dd HH:mm:ss")} [/#if]</td>
			</tr>
			<tr>
				<th>账户类别：</th>
				<td>
					[#if recharge.assetType == 0]
						消费余额
					[#elseif recharge.assetType == 1]
						理财通
					[#else]
						一卡通
					[/#if]
				</td>
				<th>账户卡号(会员ID)：</th>
				<td>${recharge.assetAccount}(${recharge.memberId})</td>
			</tr>
			<tr>
				<th>充值方式：</th>
				<td>
					[#if recharge.genre == 0]
					第三方支付充值
					[#elseif recharge.genre == 1]
					一卡通转账
					[#else]
					后台充值
					[/#if]
				</td>
				<th>充值金额：</th>
				<td>${recharge.money}</td>
			</tr>
			<tr>
				<th>附赠金额：</th>
				<td>${recharge.attachAmount}</td>
				<th>实充金额</th>
				<td>${recharge.accountMoney}</td>
			</tr>
			<tr>
				<th>付款单号：</th>
				<td>${recharge.paymentSn}</td>
				<th>订单状态：</th>
				<td>
					[#if recharge.orderStatus == 0]
					待支付
					[#elseif recharge.orderStatus == 1]
					已支付
					[#elseif recharge.orderStatus == 2]
					待处理
					[#else]
					已完成
					[/#if]
				</td>
			</tr>
			<tr>
				<th>审核人员：</th>
				<td>${recharge.handlers}</td>
				<th>审核时间：</th>
				<td>[#if recharge.audittime??] ${recharge.audittime?string("yyyy-MM-dd HH:mm:ss")} [/#if]</td>
			</tr>
		</table>
	[/#if]
	[#if payment??]
		<table class="input tabContent">
			<tr>
				<th>账户名：</th>
				<td>${payment.account}</td>
				<th>所属银行：</th>
				<td>${payment.bank}</td>
			</tr>
			<tr>
				<th>支付人：</th>
				<td>${payment.payer}</td>
				<th>支付时间：</th>
				<td>${payment.paymentDate}</td>
			</tr>
			<tr>
				<th>支付类别：</th>
				<td>${payment.paymentMethod}</td>
				<th>支付插件名称：</th>
				<td>${payment.paymentPluginId}</td>
			</tr>
			<tr>
				<th>支付编码：</th>
				<td>${payment.streamSn}</td>
				<th>支付流水：</th>
				<td>${payment.tradeNo}</td>
			</tr>
			<tr>
				<th>支付金额：</th>
				<td>${payment.paymentAmount}</td>
				<th>剩余金额：</th>
				<td>${payment.actualAmount}</td>
			</tr>
			<tr>
				<th>充值订单ID：</th>
				<td>${payment.orderId}</td>
				<th>支付状态：</th>
				<td>
					[#if payment.status == 0]
					<span class="red">未支付</span>
					[#else]
					<span class="green">已支付</span>
					[/#if]
				</td>
			</tr>
		</table>
	[/#if]
	<table class="input">
		<tr>
			<th>
				&nbsp;
			</th>
			<td>
				<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml?memberId=${memberId}'" />
			</td>
		</tr>
	</table>
</body>
</html>