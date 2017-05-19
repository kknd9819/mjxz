<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("Member.recharge.list")}</title>
<meta name="author" content="云生源（shengyuan.cn）" />
<meta name="copyright" 云生源（shengyuan.cn） />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {
	[@flash_message /]
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("Member.consume.list")} <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="consumeList.jhtml" method="get">
		[#if member??]
			<input type="hidden" name="memberId" value="${member.id}" />
		[/#if]
		<div class="bar">
			<div class="buttonWrap">
				[#if member??]
					<a href="list.jhtml?" class="button">${message("admin.common.back")}</a>
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
		</div>
		<table id="listTable" class="list">		
			<tr>
				<th>
					<a href="javascript:;" class="sort" name="m.create_time">创建时间</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="m.trade_time">消费时间</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="m.trade_no">订单号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="m.merchant_name">商家名称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="m.asset_type">资产类型</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="m.asset_no">资产编号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="m.trade_amount">消费金额</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="m.trade_state">状态</a>
				</th>
				<th>
					<a href="javascript:;"  name="m.trade_subject">消费描述</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="m.has_refund">是否有退款</a>
				</th>
			</tr>
			[#list page.content as consumeList]
				<tr>
					<td>${consumeList.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
					<td>[#if consumeList.tradeTime??]  ${consumeList.tradeTime?string("yyyy-MM-dd HH:mm:ss")} [/#if]</td>
					<td>
						[#if consumeList.tradeNo??]
							${consumeList.tradeNo}
						[/#if]
					</td>
					<td>${consumeList.merchantName}</td>
					<td>
					[#if consumeList.assetType == 0]
					消费余额
					[#elseif consumeList.assetType == 1]
					理财通
					[#else]
					一卡通
					[/#if]
					<td>${consumeList.assetNo}</td>
					<td>${consumeList.tradeAmount}</td>
					<td>
					[#if consumeList.tradeState == 0]
					待支付
					[#else]
					交易完成
					[/#if]
					</td>
					<td>${consumeList.tradeSubject}</td>
					<td>
					[#if consumeList.hasRefund==true]
					是
					[#else]
					否
					[/#if]</td>
				</tr>
			[/#list]
		</table>
		[@pagination pageNumber = page.currentPage totalPages = page.totalPage]
			[#include "/common/pagination.ftl"]
		[/@pagination]
	</form>
</body>
</html>