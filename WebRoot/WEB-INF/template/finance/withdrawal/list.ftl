<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>提款申请列表</title>
<meta name="author" content="云生源（shengyuan.cn）" />
<meta name="copyright" content="云生源（shengyuan.cn）" />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/list.js"></script>
<script type="text/javascript">
$(function($) {
	[@flash_message /]
	
	$("#planStatusSelect").mouseover(function() {
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.menuWrap");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
		$menuWrap.mouseleave(function() {
			$popupMenu.hide();
		});
	});
	
	$("#planStatusOption a").click(function() {
		$("#planStatus").val($(this).attr("val"));
		$("#listForm").submit();
		return false;
	});
	
	$(".withdrawal_handle_a").click(function() {
		var planId = $(this).attr('planId');
		$.dialog({
			type: "warn",
			content: "确认要审核吗？建议审核后再进行转账操作。",
			onOk: function() {
				jQuery.ajax({
					url: "/finance/withdrawal/audit.jhtml",
					type: "POST",
					data: {planId:planId},
					dataType: "json",
					cache: false,
					success: function(message) {
						$.message(message);
						if (message.type == "success") {
							 $("#listForm").submit();
						}
					}
				});
			}
		});
	});
	
	$(".withdrawal_success_a").click(function() {
		var planId = $(this).attr('planId');
		$.dialog({
			title: "填写转账流水号及成功备注",
			content: "<form id='handleSuccessForm' action='' method='post'> <table id='handleSuccessTable' class='moreTable'> <tr> <th> 转账流水号: <\/th> <td> <input type='hidden' name='transferPlanId' value='"+planId+"'/><input type='text' name='transferAccountSn'/> <\/td> <\/tr> <tr> <th> 成功备注: <\/th> <td> <input type='text' name='successMsg'/> <\/td> <\/tr> <\/table> <\/form> ",
			width: 470,
			modal: true,
			ok: "提&nbsp;&nbsp;交",
			cancel: "取&nbsp;&nbsp;消",
			onOk: function() {
				jQuery.ajax({
					url: "/finance/withdrawal/handle_success.jhtml",
					type: "POST",
					data: $("#handleSuccessForm").serialize(),
					dataType: "json",
					cache: false,
					success: function(message) {
						$.message(message);
						if (message.type == "success") {
							 $("#listForm").submit();
						}
					}
				});
			}
		});
	});
	
	$(".withdrawal_fail_a").click(function() {
		var planId = $(this).attr('planId');
		$.dialog({
			title: "填写转账失败的原因备注",
			content: "<form id='handleFailForm' action='' method='post'> <table id='handleFailTable' class='moreTable'> <tr> <th> 失败原因: <\/th> <td> <input type='hidden' name='transferPlanId' value='"+planId+"'/><input type='text' name='failMsg'/> <\/td> <\/tr> <\/table> <\/form> ",
			width: 470,
			modal: true,
			ok: "提&nbsp;&nbsp;交",
			cancel: "取&nbsp;&nbsp;消",
			onOk: function() {
				jQuery.ajax({
					url: "/finance/withdrawal/handle_fail.jhtml",
					type: "POST",
					data: $("#handleFailForm").serialize(),
					dataType: "json",
					cache: false,
					success: function(message) {
						$.message(message);
						if (message.type == "success") {
							 $("#listForm").submit();
						}
					}
				});
			}
		});
	});
	
	$("#handleExportButton").click(function() {
		var url='exportHandle.jhtml';
		$("<iframe src='"+url+"' width=0 heigth=0 style='display:none'></iframe>").appendTo("body");
	});
	
	$("#handleImportButton").click(function() {
		var $this = $(this);
		if ($this.hasClass("disabled")) {
			return false;
		}
		$.dialog({
			title: "批量导入提款申请转账结果",
			content: " <form id='handleImportForm' action='handle_result_import.jhtml' method='post' enctype='multipart/form-data'> <table id='batchImportTable' class='moreTable'> <tr> <th> 导入文件： <\/th> <td> <input type='file' name='handleImportFile'/> <\/td> <\/tr> <\/table> <\/form> ",
			width: 470,
			modal: true,
			ok: "导&nbsp;&nbsp;入",
			cancel: "取&nbsp;&nbsp;消",
			onOk: function() {
				$("#batchImportForm").submit();
			}
		});
	});
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 提款申请列表 <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="/finance/withdrawal/list.jhtml" method="get">
		<input type="hidden" id="planStatus" name="planStatus" value="${statusSelect}" />
		<div class="bar">
			[@shiro.hasPermission name="withdrawal:handle"]
			<a href="javascript:;" id="handleExportButton" class="iconButton">
				<span class="downIcon">&nbsp;</span>导出转账申请
			</a>
			<a href="javascript:;" id="handleImportButton" class="iconButton">
				<span class="upIcon">&nbsp;</span>导入转账结果
			</a>
			[/@shiro.hasPermission]
			<div class="buttonWrap">
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
				<div class="menuWrap">
					<a href="javascript:;" id="planStatusSelect" class="button">申请状态<span class="arrow">&nbsp;</span></a>
					<div class="popupMenu">
						<ul id="planStatusOption">
							<li>
								<a href="javascript:;"[#if planStatus == null] class="current"[/#if] val="">全部</a>
							</li>
							[#list planStatusEnum as status]
								<li>
									<a href="javascript:;"[#if status.code == planStatus] class="current"[/#if] val="${status.code}">${status.typeName}</a>
								</li>
							[/#list]
						</ul>
					</div>
				</div>
			</div>
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="searchValue" name="searchValue" value="${pageable.searchValue}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "p.serial_number"] class="current"[/#if] val="p.serial_number">提款串号</a>
						</li>
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "p.asset_no"] class="current"[/#if] val="p.asset_no">提款卡号</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th>
					<a href="javascript:;" class="sort" name="p.create_date">创建时间</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="p.with_type">提款方式</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="p.asset_No">提款卡号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="p.draw_amount">提款金额</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="p.bank_name">转账银行</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="p.account_no">转账卡号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="p.account_name">开户名</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="p.plan_status">申请状态</a>
				</th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list page.content as plan]
				<tr>
					<td>${plan.createDate}</td>
					<td>
						[#if plan.withType == 0]
						柜台提现
						[#else]
						银行转账
						[/#if]
					</td>
					<td>${plan.assetNo}</td>
					<td>${plan.drawAmount}</td>
					<td>${plan.bankName!'-'}</td>
					<td>${plan.accountNo!'-'}</td>
					<td>${plan.accountName!'-'}</td>
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
					<td>
						<a href="detail.jhtml?planId=${plan.id}">[查看明细]</a>
						[@shiro.hasPermission name="withdrawal:handle"]
						[#if plan.planStatus == 0]
						<a class="withdrawal_handle_a" planId="${plan.id}" href="javascript:;">[审核]</a>
						[/#if]
						[#if plan.planStatus == 1]
						<a class="withdrawal_success_a" planId="${plan.id}" href="javascript:;">[转账成功]</a>
						<a class="withdrawal_fail_a" planId="${plan.id}" href="javascript:;">[转账失败]</a>
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