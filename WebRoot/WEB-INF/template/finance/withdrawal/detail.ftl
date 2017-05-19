<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>提款申请明细</title>
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
		<a href="/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 提款申请明细
	</div>
	<ul id="tab" class="tab">
		<li>
			<input type="button" value="提款申请" />
		</li>
	</ul>
	<table class="input tabContent">
		<tr>
			<th>申请流水：</th>
			<td>${plan.id!}</td>
			<th>提款编号：</th>
			<td>${plan.drawPlanSn!}</td>
		</tr>
		<tr>
			<th>创建时间：</th>
			<td>[#if plan.createDate??]${plan.createDate?string("yyyy-MM-dd HH:mm:ss")}[/#if]</td>
			<th>修改时间：</th>
			<td>[#if plan.modifyDate??]${plan.modifyDate?string("yyyy-MM-dd HH:mm:ss")}[/#if]</td>
		</tr>
		<tr>
			<th>提款方式：</th>
			<td>
				[#if plan.withType == 0]
					柜台提现
				[#elseif plan.withType == 1]
					银行转账
				[/#if]
			</td>
			<th>账户卡号(会员ID)：</th>
			<td>${plan.assetNo!}(${plan.memberId!})</td>
		</tr>
		<tr>
			<th>提款金额：</th>
			<td>${plan.drawAmount!}</td>
			<th>申请状态：</th>
			<td>
				[#if plan.planStatus == 0]
				已申请
				[#elseif plan.planStatus == 1]
				提款中
				[#elseif plan.planStatus == 2]
				提款成功
				[#else]
				提款失败
				[/#if]
			</td>
		</tr>
		<tr>
			<th>转账银行编码：</th>
			<td>${plan.bankCode!'-'}</td>
			<th>转账银行名称</th>
			<td>${plan.bankName!'-'}</td>
		</tr>
		<tr>
			<th>银行账号：</th>
			<td>${plan.accountNo!'-'}</td>
			<th>开户名：</th>
			<td>${plan.accountName!'-'}</td>
		</tr>
		<tr>
			<th>审核人员：</th>
			<td>${plan.handlers!'-'}</td>
			<th>审核时间：</th>
			<td>[#if plan.audittime??]${plan.audittime?string("yyyy-MM-dd HH:mm:ss")}[/#if]</td>
		</tr>
		<tr>
			<th>审核说明：</th>
			<td colspan="3">${plan.auditdesc!'-'}</td>
		</tr>
	</table>
	<table class="input">
		<tr>
			<th>
				&nbsp;
			</th>
			<td>
				<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
			</td>
		</tr>
	</table>
</body>
</html>