<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>商家列表</title>
<meta name="author" content="云生源（shengyuan.cn）" />
<meta name="copyright" 云生源（shengyuan.cn） />
<link type="text/css" href="/resources/css/common.css" rel="stylesheet"/>
<link href="/resources/common/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/list.js"></script>
<script type="text/javascript" src="/resources/common/ztree/js/jquery.ztree.all-3.5.min.js"></script>
<style type="text/css">
	.contentDiv{
		margin-bottom:5px;
		padding:8px; 
		border:1px solid #E9E9E9; 
		background-color:#EEF1F8;
		height:70px;
	}
	.contentDiv .queryConditionDiv {
		float:left; 
		width:800px; 
		border-right:1px solid #C4B8AB;
	}
	.contentDiv .queryBtnDiv {
		float:left; 
	<!--	width:15%;-->
		margin-left:35px;
		margin-top:25px;
		height:58px;
	}
	.contentDiv .queryBtnDiv .queryBtn{
		border: 1px solid #cccccc;
		color:white;
		background-color:#FF8000;
		padding: 9px 30px;cursor:pointer;
		margin-left:24px;
	}
	ul.ztree {
		margin-top: 10px;
		border: 1px solid #617775;
		background: #f0f6e4;
		width: 220px;
		height: 300px;
		overflow-y: auto;
		overflow-x: auto;
	}
	
	.ztree li {
		background:#f0f6e4;
	}
	
	input[type="text"]{
		width:120px;
		padding-left:2px;
	}
</style>
<script type="text/javascript">
	var zNodes=${categoryTree};
	var setting = {
		treeId:'resTree',
		check: {
			enable: true,
			chkStyle: "radio",
			radioType: "all"
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onCheck: onCheck
		}
	};
	
	function onCheck(e, treeId, treeNode) {
		var nodes = $.fn.zTree.getZTreeObj("treeDemo").getCheckedNodes(true);
		if(nodes.length == 0){
			$("#categoryId").val("");
			$("#categoryName").val("");
		}else{
			$("#categoryId").val(nodes[0].id);
			$("#categoryName").val(nodes[0].name);
		}
	}
	
	function showCategoryTree() {
		var cityObj = $("#categoryName");
		var cityOffset = $("#categoryName").offset();
		$("#merchantContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
		$("body").bind("mousedown", onBodyDown);
	}
		
	function hideCategoryTree() {
		$("#merchantContent").fadeOut("fast");
		$("body").unbind("mousedown", onBodyDown);
	}
		
	function onBodyDown(event) {
		if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "merchantContent" || $(event.target).parents("#merchantContent").length>0)) {
			hideCategoryTree();
		}
	}
	
	$().ready(function() {
		
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		var checkedNodes = $.fn.zTree.getZTreeObj("treeDemo").getCheckedNodes(true);
		if (checkedNodes.length > 0) {
			$("#categoryName").val(checkedNodes[0].name);
		}
		var $listForm = $("#listForm");
		var $moreButton = $("#moreButton");
		var $filterSelect = $("#filterSelect");
		var $filterOption = $("#filterOption a");
		
		[@flash_message /]
		
		// 商家筛选
		$filterSelect.mouseover(function() {
			var $this = $(this);
			var offset = $this.offset();
			var $menuWrap = $this.closest("div.menuWrap");
			var $popupMenu = $menuWrap.children("div.popupMenu");
			$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
			$menuWrap.mouseleave(function() {
				$popupMenu.hide();
			});
		});
		
		// 筛选选项
		$filterOption.click(function() {
			var $this = $(this);
			var $dest = $("#" + $this.attr("name"));
			if ($this.hasClass("checked")) {
				$dest.val("");
			} else {
				$dest.val($this.attr("val"));
			}
			$listForm.submit();
			return false;
		});
	});
	
	function submit(){
		$("#listForm").submit();
	}
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">首页</a> &raquo; 商家列表 <span>(共${page.total}条记录)</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get" style="margin:15px 20px 20px 20px;">
		<input type="hidden" id="isTop" name="isTop" value="[#if isTop??]${isTop?string("true", "false")}[/#if]" />
		<div class="contentDiv">
			<div class="queryConditionDiv">
				<table  class="fieldset_t">
					<tr>
						<td style="width:250px;">
							<label>商家分类:</label>
							<input type="hidden" id="categoryId" name="categoryId" maxlengh="160" value="${categoryId}" />
							<input type="text" id="categoryName" style="width:182px" maxlengh="120" value="" onclick="showCategoryTree();" readonly="true"/>
						</td>
						<td style="width:200px;">
							<label>商家名称:</label>
							<input type="text" id="name" name="name" maxlengh="120" value="${name}"/>
						</td>
						<td>
							<label>商家编码:</label>
							<input type="text" id="code" name="code" maxlengh="120" value="${code}"/>
						</td>
					</tr>
					<tr>
						<td>
							<label>开通支付:</label>
							<select name="isOpenPaymen" style="width:188px;height:22px;">
								<option value="">请选择...</option>
								<option value="false" [#if isOpenPaymen = "false"]selected="selected"[/#if]>未开通</option>
								<option value="true" [#if isOpenPaymen = "true"]selected="selected"[/#if]>已开通</option>
							</select>
						</td>
						<td>
							<label>实体商户:</label>
							<select name="isAllianceStore" style="width:126px;height:22px;">
								<option value="">请选择...</option>
								<option value="false" [#if isAllianceStore = "false"]selected="selected"[/#if]>否</option>
								<option value="true" [#if isAllianceStore = "true"]selected="selected"[/#if]>是</option>
							</select>
						</td>
						<td style="width:200px;">
							<label>商家品牌:</label>
							<select name="brandId" style="width:126px;height:22px;">
								<option value="">请选择...</option>
								[#list brands as brand]
									<option value="${brand.id}"[#if brand.id == brandId] selected="selected"[/#if]>
										${brand.name}
									</option>
								[/#list]
							</select>
						</td>
					</tr>
				</table>
			</div>
			<div class="queryBtnDiv">
				<font onclick="submit();" class="queryBtn">查询</font>
			</div>
		</div>
		<div class="bar">
			[#if !mid]
				[@shiro.hasPermission name="merchant:add"]
					<a href="add.jhtml" class="iconButton">
						<span class="addIcon">&nbsp;</span>添加
					</a>
				[/@shiro.hasPermission]
			[/#if]
			<div class="buttonWrap">
			[#if !mid]
				[@shiro.hasPermission name="merchant:delete"]
					<a href="javascript:;" id="deleteButton" class="iconButton disabled">
						<span class="deleteIcon">&nbsp;</span>删除
					</a>
				[/@shiro.hasPermission]
			[/#if]
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>刷新
				</a>
				<div class="menuWrap">
					[@shiro.hasPermission name="merchant:filter"]
						<a href="javascript:;" id="filterSelect" class="button">
							高级筛选<span class="arrow">&nbsp;</span>
						</a>
					[/@shiro.hasPermission]
					<div class="popupMenu">
						<ul id="filterOption" class="check">
							<li class="separator">
								<a href="javascript:;" name="isTop" val="true"[#if isTop?? && isTop] class="checked"[/#if]>已推荐</a>
							</li>
							<li>
								<a href="javascript:;" name="isTop" val="false"[#if isTop?? && !isTop] class="checked"[/#if]>未推荐</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="menuWrap">
					<a href="javascript:;" id="pageSizeSelect" class="button">
						每页显示<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="pageSizeOption">
							<li>
								<a href="javascript:;"[#if page.pageSize == 10] class="current"[/#if] val="10">10</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 15] class="current"[/#if] val="15">15</a>
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
				<th class="check" width="40px">
					<input type="checkbox" id="selectAll" />
				</th>
				<th width="120px">
					<a href="javascript:;" class="sort" name="code">商家编码</a>
				</th>
				<th width="120px">
					<a href="javascript:;" class="sort" name="name">名称</a>
				</th>
				<th width="120px">
					<a href="javascript:;" class="sort" name="merchant_category">商家分类</a>
				</th>
				<th width="120px">
					<a href="javascript:;" class="sort" name="merchant_brand">商家品牌</a>
				</th>
				<th width="120px">
					<a href="javascript:;" class="sort" name="phone">商家电话</a>
				</th>
				<th width="250px">
					<a href="javascript:;" class="sort" name="address">商家地址</a>
				</th>
				<th width="80px">
					<a href="javascript:;" class="sort" name="is_top">是否推荐</a>
				</th>
				<th width="80px">
					<a href="javascript:;" class="sort" name="status">商家状态</a>
				</th>
				<th width="80px">
					<a href="javascript:;" class="sort" name="is_open_paymen">开通支付</a>
				</th>
				<th width="80px">
					<a href="javascript:;" class="sort" name="is_alliance_store">实体商户</a>
				</th>
				<th width="80px">
					<a href="javascript:;" class="sort" name="create_date">创建日期</a>
				</th>
				<th style="min-width:150px">
					<span>操作</span>
				</th>
			</tr>
			[#list page.content as merchant]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${merchant.id}" />
					</td>
					<td>
						${merchant.code}
					</td>
					<td>
						<span title="${merchant.name}">
							${abbreviate(merchant.name, 30, "...")}
						</span>
					</td>
					<td>
						${merchant.categoryName}
					</td>
					<td>
						${merchant.brandName}
					</td>
					<td>
						${merchant.phone}
					</td>
					<td>
						${merchant.address}
					</td>
					<td>
						<span class="${merchant.isTop?string("true", "false")}Icon">&nbsp;</span>
					</td>
					<td>
						[#if merchant.status==0]
							<span class="gray">[禁用]</span>
						[#else]
							<span class="gray">[启用]</span>
						[/#if]
					</td>
					<td>
						[#if merchant.isOpenPaymen]
							<span class="gray">[已开通]</span>
						[#else]
							<span class="gray">[未开通]</span>
						[/#if]
					</td>
					<td>
						
						[#if merchant.isAllianceStore]
							<span class="gray">[是]</span>
						[#else]
							<span class="gray">[否]</span>
						[/#if]
					</td>
					<td>
						<span title="${merchant.createDate?string("yyyy-MM-dd HH:mm:ss")}">${merchant.createDate}</span>
					</td>
					<td>
						[#if !mid]
							[@shiro.hasPermission name="merchant:edit"]
								<a href="edit.jhtml?id=${merchant.id}">[编辑]</a>
							[/@shiro.hasPermission]
							[@shiro.hasPermission name="merchant:order"]
								<a href="/merchant/tradeorder/list.jhtml?merchantCode=${merchant.code}">[查看订单]</a>
							[/@shiro.hasPermission]
							[@shiro.hasPermission name="merchant:dynamic"]
								<a href="/merchant/dynamicMsg/list.jhtml?merchantId=${merchant.id}">[动态信息]</a>
							[/@shiro.hasPermission]
							[@shiro.hasPermission name="admin:finance_contract"]
								<a href="/finance/settlement_contract_manager/list.jhtml?merchantId=${merchant.id}">[合同管理]</a>
							[/@shiro.hasPermission]
						[/#if]
					</td>
				</tr>
			[/#list]
		</table>
		<div id="merchantContent" class="merchantContent" style="display:none; position: absolute;">
			<ul id="treeDemo" class="ztree" style="margin-top:0; width:174px; height: 250px;"></ul>
		</div>
		[@pagination pageNumber = page.currentPage totalPages = page.totalPage]
			[#include "/common/pagination.ftl"]
		[/@pagination]
	</form>
</body>
</html>