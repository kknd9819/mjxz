<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>充值订单列表</title>
<meta name="author" content="云生源（shengyuan.cn）" />
<meta name="copyright" content="云生源（shengyuan.cn）" />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {
	[@flash_message /]
	
	$(".recharge_rehandle_a").click(function(){
		var _this = this;
		$.dialog({
			type: "warn",
			content: "是否对充值异常的订单重新处理？",
			ok: message("admin.dialog.ok"),
			cancel: message("admin.dialog.cancel"),
			onOk: function() {
				$.ajax({
					url: "rehandle.jhtml",
					type: "POST",
					data: {"orderSn" : $(_this).attr("orderSn")},
					dataType: "json",
					cache: false,
					success: function(message) {
						$.message(message);
						if (message.type == "success") {
							setTimeout(function() {
								location.reload(true);
							}, 3000);
						}
					}
				});
			}
		});
	});
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("Member.recharge.list")} <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="/finance/recharge/list.jhtml" method="get">
		[#if member??]
			<input type="hidden" name="memberId" value="${member.id}" />
		[/#if]
		<div class="bar">
			<div class="buttonWrap">
				[#if member??]
					<a href="/member/member/list.jhtml" class="button">${message("admin.common.back")}</a>
				[/#if]
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="pageSizeSelect" class="button">
						${message("admin.page.pageSize")}<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="pageSizeOption">
							<li>
								<a href="javascript:;"[#if page.pageSize == 10] class="current"[/#if] val="10">10</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 20] class="current"[/#if] val="20">20</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 50] class="current"[/#if] val="50">50</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 100] class="current"[/#if] val="100">100</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="searchValue" name="searchValue" value="${pageable.searchValue}" maxlength="200" />
					<input type="hidden"  id="memberId" name="memberId" value="${memberId}" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "o.order_sn"] class="current"[/#if] val="o.order_sn">订单编号</a>
						</li>
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "o.payment_sn"] class="current"[/#if] val="o.payment_sn">付款单号</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th>
					<a href="javascript:;" class="sort" name="o.create_date">创建时间</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="o.order_sn">订单编号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="o.payment_sn">付款单号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="o.genre">充值方式</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="o.money">充值金额</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="o.asset_type">账户类别</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="o.asset_account">账户卡号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="o.order_status">订单状态</a>
				</th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list page.content as rechargeList]
				<tr>
					<td>${rechargeList.createDate?string("yyyy-MM-dd HH:mm:ss")}</td>
					<td>${rechargeList.orderSn}</td>
					<td>${rechargeList.paymentSn}</td>
					<td>
						[#if rechargeList.genre == 0]
						第三方支付充值
						[#elseif rechargeList.genre == 1]
						一卡通转账
						[#else]
						后台充值
						[/#if]
					</td>	
					<td>${rechargeList.money}</td>
					<td>
						[#if rechargeList.assetType == 0]
						消费余额
						[#elseif rechargeList.assetType == 1]
						理财通
						[#else]
						一卡通
						[/#if]
					</td>
					<td>${rechargeList.assetAccount}</td>
					<td>
						[#if rechargeList.orderStatus == 0]
						待支付
						[#elseif rechargeList.orderStatus == 1]
						已支付
						[#elseif rechargeList.orderStatus == 2]
						待处理
						[#else]
						已完成
						[/#if]
					</td>
					<td>
						<a href="detail.jhtml?orderId=${rechargeList.id}&findAll=${findAll}">[查看明细]</a>
						[@shiro.hasPermission name="recharge:rehandle"]
						[#if rechargeList.orderStatus == 2]
						<a class="recharge_rehandle_a" orderSn="${rechargeList.orderSn}" href="javascript:;">[异常处理]</a>
						[/#if]
						[/@shiro.hasPermission]
					</td>
				</tr>
			[/#list]
		</table>
		[@pagination pageNumber = page.currentPage totalPages = page.totalPage]
			[#include "/common/pagination.ftl"]
		[/@pagination]
	</form>

</body>
</html>