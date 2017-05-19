<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.returns.list")}</title>
<meta name="author" content="生源闪购（shengyuan.cn）" />
<meta name="copyright" 生源闪购（shengyuan.cn） />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.tools.js"></script>
<script type="text/javascript" src="/resources/js/list.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript">
	function view(contractId) {
		$.ajax({
			url: "view.jhtml?contractId="+contractId,
			type: "GET",
			dataType: "html",
			cache: false,
			success: function(html) {
				$.dialog({
					title: "合同明细",
					content: html,
					width: 900,
					modal: true
				});
			}
		});
	}

    function ajaxGenerateSettlement(merchantCode){
        $.ajax ({
            url:"/finance/settlement_contract_manager/settlement.jhtml?merchantCode="+merchantCode,
            type:"GET",
            dataType: 'json',
            success: function (data){
                setTimeout(function(){location.href="/finance/settlement_contract_manager/list.jhtml"},2000);
                if(confirm(data.content)){
                  //  location.href="/finance/settlement_contract_manager/executeSettlement.jhtml?merchantCode="+merchantCode;
                    $.ajax({
						url:'/finance/settlement_contract_manager/executeSettlement.jhtml?merchantCode='+merchantCode,
                        type: 'GET',
						async:false,
						dataType:'json',
						success:function(data1){
						    alert(data1.data1);
						}

					});

                }
            },
            error: function (data, status, e){

            }
        });



	}

</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 合同列表 <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" name="listForm" action="list.jhtml" method="get">
	<input type="hidden" id="merchantCode" name="merchantCode" value="${merchantCode}" />
	<input type="hidden" id="settlementPeriod" name="settlementPeriod" value="${settlementPeriod}" />
		<div class="bar">
			<div class="buttonWrap">
				<a href="add.jhtml" class="iconButton">
					<span class="addIcon">&nbsp;</span>添加
				</a>
				<a href="list.jhtml" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>重置
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
					<a href="javascript:;" id="merchantCodeSelect" class="button">
						商家名称<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="merchantCodeOption" class="filterOption">
							[#list merchantList as merchant]
							<li>
								<a href="javascript:;" name="merchantCode" [#if merchant.code == merchantCode] class="current"[/#if] val="${merchant.code}">${merchant.name}</a>
							</li>
							[/#list]
						</ul>
					</div>
				</div>
				<div class="menuWrap">
					<a href="javascript:;" id="settlementPeriodSelect" class="button">
						结算周期<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="settlementPeriodOption" class="filterOption">
							[#list periodEnum as period]
							<li>
								<a href="javascript:;" name="settlementPeriod" [#if period.code == settlementPeriod] class="current"[/#if] val="${period.code}">${period.typeName}</a>
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
							<a href="javascript:;"[#if pageable.searchProperty == "sc.merchant_code"] class="current"[/#if] val="sc.merchant_code">商家编码</a>
						</li>
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "sc.merchant_name"] class="current"[/#if] val="sc.merchant_name">商家名称</a>
						</li>
					</ul>
				</div>
				</div>
		</div>
		
		<table id="listTable" class="list">
			<tr>
				<th class="center">
					<span>商家编码</span>
				</th>
				<th class="center">
					<span>商家名称</span>
				</th>
				<th class="center">
					<span>结算周期</span>
				</th>
				<th class="center">
					<span>结算天数</span>
				</th>
				<th class="center">
					<span>延迟天数</span>
				</th>
				<th class="center">
					<span>扣率</span>
				</th>
				<th class="center">
					<span>满额转结</span>
				</th>
				<th class="center">
					<span>有效期</span>
				</th>
				<th class="center">
					<span>账期规则</span>
				</th>
				<th class="center">
					<span>操作</span>
				</th>
			</tr>
			[#list page.content as item]
			<tr>
				<td class="center">
					<span>${item.merchantCode}</span>
				</td>
				<td class="center">
					<span>${item.merchantName}</span>
				</td>
				<td class="center">
					<span>${item.settlementPeriodName}</span>
				</td>
				<td class="center">
					<span>${item.specificPeriod}</span>
				</td>
				<td class="center">
					<span>${item.delayPeriod}</span>
				</td>
				<td class="center">
					<span>${item.fee}</span>
				</td>
				<td class="center">
					<span>${item.amount}</span>
				</td>
				<td class="center">
					<span>${item.periodOfValidity}</span>
				</td>
				<td class="center">
					<span>${item.paymentDaysFlagName}</span>
				</td>
				<td class="center">
					[#--[@shiro.hasPermission name='paymentSingle:detail']--]
					[#--<a href=javascript:view('${item.id}')>[查看]</a>--]
					[#--[/@shiro.hasPermission]--]
					<a href="edit.jhtml?contractId=${item.id}">[编辑]</a>
				[#if item?exists && item.hasNext()]
                    <a href=javascript:ajaxGenerateSettlement('${item.merchantCode}') >[生成结算单]</a>
				[/#if]
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
$().ready(function() {	

	[@flash_message /]
	
	// 商家筛选
	$("#merchantCodeSelect").mouseover(function() {
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.menuWrap");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
		$menuWrap.mouseleave(function() {
			$popupMenu.hide();
		});
	});
	// 结算周期筛选
	$("#settlementPeriodSelect").mouseover(function() {
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.menuWrap");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
		$menuWrap.mouseleave(function() {
			$popupMenu.hide();
		});
	});
	// 所有筛选选项
	$(".filterOption a").click(function() {
		var $this = $(this);
		var $dest = $("#" + $this.attr("name"));
		if ($this.hasClass("checked")) {
			$dest.val("");
		} else {
			$dest.val($this.attr("val"));
		}
		$("#listForm").submit();
		return false;
	});


});
</script>
</html>