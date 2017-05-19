<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>品牌列表 -  云生源（shengyuan.cn）你的消费很值钱！</title>
<meta name="author" content="云生源后台管理系统" />
<meta name="copyright" content="云生源后台管理系统" />
<link type="text/css" href="/resources/css/common.css" rel="stylesheet"/>
<link href="/resources/css/fancybox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/list.js"></script>
<script type="text/javascript" src="/resources/js/jquery.fancybox-1.3.1.pack.js"></script>
<script type="text/javascript">
	$().ready(function() {
		[@flash_message /]
		$("a[rel=group]").fancybox({
		'titlePosition' : 'over',
		'cyclic'        : true,
		'titleFormat'	: function(title, currentArray, currentIndex, currentOpts) {
					return '<span id="fancybox-title-over">' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
				}
	});
	$("#showdiv").fancybox({'centerOnScroll':true});
	$("#iframe").fancybox({
		'width':'75%',
		'height':'75%',
		'autoScale':false
	});
	$("#swf").fancybox({
		'autoScale':false
	});
	$("#modal").fancybox({
		'modal':false,
		'overlayShow':true,
		'hideOnOverlayClick':false,
		'hideOnContentClick':false,
		'enableEscapeButton':false,
		'showCloseButton':false,
		'centerOnScroll':true,
		'autoScale':false,
		'width':540,
		'height':360
	});
	});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">首页</a> &raquo; 品牌列表 <span>(共${page.total}条记录)</span>
	</div>
	<form id="listForm" action="#" method="get">
		<div class="bar">
			[@shiro.hasPermission name="brand:add"]
				<a href="add.jhtml" class="iconButton">
					<span class="addIcon">&nbsp;</span>添加
				</a>
			[/@shiro.hasPermission]
			<div class="buttonWrap">
				[@shiro.hasPermission name="brand:delete"]
					<a href="javascript:;" id="deleteButton" class="iconButton disabled">
						<span class="deleteIcon">&nbsp;</span>删除
					</a>
				[/@shiro.hasPermission]
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>刷新
				</a>
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
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "name"] class="current"[/#if] val="name">名称</a>
						</li>
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "url"] class="current"[/#if] val="url">网址</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="name">名称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="logo">logo</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="url">网址</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="type">类型</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="orders">排序</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="introduction">介绍</a>
				</th>
				<th>
					<span>操作</span>
				</th>
			</tr>
			[#list page.content as brand]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${brand.id}" />
					</td>
					<td>
						${brand.name}
					</td>
					<td>
						[#if brand.type == "1" && brand.logo?if_exists]
							<a rel="group" href="${siteUrl}${brand.logo}" title="${brand.name}logo" target="_blank">${message("admin.common.view")}</a>	
						[#else]
							-
						[/#if]
					</td>
					<td>
						[#if brand.url??]
							<a href="${brand.url}" target="_blank">${brand.url}</a>
						[#else]
							-
						[/#if]
					</td>
					<td>
						[#list brandTypes as brandType]
							[#if brandType.code == brand.type] ${brandType.typeName}[/#if]
						[/#list]
					</td>
					<td>
						[#if brand.orders??]
							${brand.orders}
						[#else]
							-
						[/#if]
					</td>
					<td>
						[#if brand.introduction??]
							[#if brand.introduction?length gt 20]
								${brand.introduction[0..20]+'...'}
							[/#if]
							[#if brand.introduction?length lt 10]
								${brand.introduction}
							[/#if]
						[#else]
							-
						[/#if]
					</td>
					<td style="width:200px;">
						[@shiro.hasPermission name="brand:edit"]
							<a href="edit.jhtml?id=${brand.id}">[编辑]</a>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="brand:merchantView"]
							<a href="/admin/merchant/merchantBySubbranchList.jhtml?brandId=${brand.id}">[查看品牌分店]</a>
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