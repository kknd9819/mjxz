<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.article.list")} -  生源闪购（shengyuan.cn）闪亮生活，购你喜欢！</title>
<meta name="author" content="生源闪购（shengyuan.cn）" />
<meta name="copyright" 生源闪购（shengyuan.cn） />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {
	
	var $listForm = $("#listForm");
	var $type = $("#type");
	var $typeSelect = $("#typeSelect");
	var $typeOption = $("#typeOption a");

	[@flash_message /]
	
	$typeSelect.mouseover(function() {
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.menuWrap");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
		$menuWrap.mouseleave(function() {
			$popupMenu.hide();
		});
	});
	
	$typeOption.click(function() {
		var $this = $(this);
		$type.val($this.attr("val"));
		$listForm.submit();
		return false;
	});

});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.article.list")} <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<input type="hidden" id="type" name="type" value="${type}" />
		<div class="bar">
			[@shiro.hasPermission name="article:add"]
				<a href="add.jhtml" class="iconButton">
					<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
				</a>
			[/@shiro.hasPermission]
			<div class="buttonWrap">
				[@shiro.hasPermission name="article:delete"]
					<a href="javascript:;" id="deleteButton" class="iconButton disabled">
						<span class="deleteIcon">&nbsp;</span>${message("admin.common.delete")}
					</a>
				[/@shiro.hasPermission]
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				<div class="menuWrap">
					[@shiro.hasPermission name="article:select"]
						<a href="javascript:;" id="typeSelect" class="button">
							${message("admin.review.type")}<span class="arrow">&nbsp;</span>
						</a>
					[/@shiro.hasPermission]
					<div class="popupMenu">
						<ul id="typeOption">
							<li>
								<a href="javascript:;"[#if type == null] class="current"[/#if] val="">${message("admin.review.allType")}</a>
							</li>
							[#assign currentType = type]
							[#list types as type]
								<li>
									<a href="javascript:;"[#if type.id == currentType] class="current"[/#if] val="${type.id}">${type.name}</a>
								</li>
							[/#list]
						</ul>
					</div>
				</div>
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
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "title"] class="current"[/#if] val="title">${message("Article.title")}</a>
						</li>
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "name"] class="current"[/#if] val="name">文章分类</a>
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
					<a href="javascript:;" class="sort" name="title">${message("Article.title")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="article_category">${message("Article.articleCategory")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="is_publication">${message("Article.isPublication")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="create_date">${message("admin.common.createDate")}</a>
				</th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list page.content as article]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${article.id}" />
					</td>
					<td>
						<span title="${article.title}">${abbreviate(article.title, 50, "...")}</span>
					</td>
					<td>
						${article.articleCategoryName}
					</td>
					<td>
						<span class="${article.isPublication?string("true", "false")}Icon">&nbsp;</span>
					</td>
					<td>
						<span title="${article.createDate?string("yyyy-MM-dd HH:mm:ss")}">${article.createDate}</span>
					</td>
					<td>
						[@shiro.hasPermission name="article:edit"]
							<a href="edit.jhtml?id=${article.id}">[${message("admin.common.edit")}]</a>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="article:view1"]
							[#if article.isPublication]
									<a href="${webSiteUrl}/article/view.jhtml?id=${article.id}" target="_blank">[${message("admin.common.view")}]</a>
							[#else]
								[${message("admin.article.notPublished")}]
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