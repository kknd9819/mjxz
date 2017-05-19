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
	
	var accountType = 0;
	var $position= $("input[name='position']");
    	
	var $filterOption = $("#filterOption a");
	
	var $listForm = $("#listForm");
	
	if($position.val()== 1 ){
		accountType = 1;
		$("a[name=1]").addClass("button2_dq");//为当前标签添加button2_dq类  
		$("a[name=1]").siblings().removeClass("button2_dq");//移除当前元素的同级元素的button2_dq类 
		$("#balanceTable").hide(); 
		$("#financeTable").show(); 
		$("#financePageDiv").show();
		$("#balancePageDiv").hide();
	}
	if($position.val()== 0){
		accountType = 0;
		$("a[name=0]").addClass("button2_dq");//为当前标签添加button2_dq类  
		$("a[name=0]").siblings().removeClass("button2_dq");//移除当前元素的同级元素的button2_dq类
		$("#balanceTable").show(); 
		$("#financeTable").hide(); 
		$("#balancePageDiv").show(); 
		$("#financePageDiv").hide();
	}
	
	// 筛选选项
	$filterOption.click(function() {
		var $this = $(this);
		var dest = $this.attr("name");
		$position.val(dest.trim());
		if($position.val()== 1 ){
			accountType = 1;
			$("a[name=1]").addClass("button2_dq");//为当前标签添加button2_dq类  
			$("a[name=1]").siblings().removeClass("button2_dq");//移除当前元素的同级元素的button2_dq类 
			$("#balanceTable").hide(); 
			$("#financeTable").show(); 
			$("#financePageDiv").show();
			$("#balancePageDiv").hide();
		}
		if($position.val()== 0){
			accountType = 0;
			$("a[name=0]").addClass("button2_dq");//为当前标签添加button2_dq类  
			$("a[name=0]").siblings().removeClass("button2_dq");//移除当前元素的同级元素的button2_dq类
			$("#balanceTable").show(); 
			$("#financeTable").hide(); 
			$("#balancePageDiv").show(); 
			$("#financePageDiv").hide();
		}
	});
	
});
</script>
</head>
<body>
<div class="path"><a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 资金收益</div>
	<form id="listForm" action="assetList.jhtml" method="get">
	<input type="hidden" id="position" name="position" value="${position}" />
	<input type="hidden" id="memberId" name="memberId" value="${(memberId)}" />
		<div class="bar">
			<div class="buttonWrap">
				<a href="list.jhtml" class="button">${message("admin.common.back")}</a>
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
		<div id="filterOption">
				<a href="#" name="0" class="button2 button2_dq">消费账户收益记录(${message("admin.page.total",balance.total)})</a>
				<a href="#" name="1" class="button2">理财账户收益记录(${message("admin.page.total",finance.total)})</a>
		</div>
		
		<table id="balanceTable" class="list">
			<tr>
				<th>
					<a href="javascript:;" class="sort" name="type">收益时间</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="type">收益余额</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="debit">日利率</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="debit">收益</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="credit">内容</a>
				</th>
			</tr>
			   [#list balance.content as balance]
				<tr> 
					<td>${balance.incomeDate}</td>
					<td>${balance.balacneAmount}</td>
					<td>${balance.dailyRate}</td>
					<td>${balance.incomeAmount}</td>
					<td>${balance.content}</td>
				</tr>
				[/#list]
		</table>
		<div id="balancePageDiv" >	
			[#list balance as page]
			[@pagination pageNumber = page.currentPage totalPages = page.totalPage]
			   [#include "/common/pagination.ftl"]
		    [/@pagination]
		    [/#list]
		</div>
		 
		<table id="financeTable" class="list" style="display:none"> 
			<tr>
				<th>
					<a href="javascript:;" class="sort" name="type">收益时间</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="type">收益余额</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="debit">日利率</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="debit">收益</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="credit">内容</a>
				</th>
			</tr>
			    [#list finance.content as finance]
				<tr> 
					<td>${finance.incomeDate}</td>
					<td>${finance.financeAmount}</td>
					<td>${finance.dailyRate}</td>
					<td>${finance.incomeAmount}</td>
					<td>${finance.content}</td>
				</tr>
				[/#list]
		</table>
		<div id="financePageDiv"  style="display:none">	
			[#list finance as page]
			[@pagination pageNumber = page.currentPage totalPages = page.totalPage]
			   [#include "/common/pagination.ftl"]
		    [/@pagination]
		    [/#list]
		</div>
			
	</form>
</body>
</html>