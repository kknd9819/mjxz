<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.ad.list")} -  生源闪购（shengyuan.cn）闪亮生活，购你喜欢！</title>
<meta name="author" content="生源闪购（shengyuan.cn）" />
<meta name="copyright" 生源闪购（shengyuan.cn） />
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
		<a href="/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.ad.list")} <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
	<input type="hidden" id="isPublic" name="isPublic" value="${isPublic}"/>
	<input type="hidden" id="adPositionId" name="adPositionId" value="${adPositionId}"/>
		<div class="bar">
			[@shiro.hasPermission name="ad:add"]
				<a href="add.jhtml?adPositionId=${adPositionId}" class="iconButton">
					<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
				</a>
			[/@shiro.hasPermission]
			<div class="buttonWrap">
				[@shiro.hasPermission name="ad:delete"]
					<a href="javascript:;" id="deleteButton" class="iconButton disabled">
						<span class="deleteIcon">&nbsp;</span>${message("admin.common.delete")}
					</a>
				[/@shiro.hasPermission]
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
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "title"] class="current"[/#if] val="title">${message("Ad.title")}</a>
						</li>
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "name"] class="current"[/#if] val="name">${message("Ad.adPosition")}</a>
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
					<a href="javascript:;" class="sort" name="title">${message("Ad.title")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="ad_position">${message("Ad.adPosition")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="begin_date">${message("Ad.beginDate")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="end_date">${message("Ad.endDate")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="orders">${message("admin.common.order")}</a>
				</th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list page.content as ad]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${ad.id}" />
					</td>
					<td>
						<span title="${ad.title}">${abbreviate(ad.title, 50, "...")}</span>
					</td>
					<td>
						${ad.adPositionName}
					</td>
					<td>
						[#if ad.beginDate??]
							<span title="${ad.beginDate?string("yyyy-MM-dd HH:mm:ss")}">${ad.beginDate?string("yyyy-MM-dd HH:mm:ss")}</span>
						[#else]
							-
						[/#if]
					</td>
					<td>
						[#if ad.endDate??]
							<span title="${ad.endDate?string("yyyy-MM-dd HH:mm:ss")}">${ad.endDate?string("yyyy-MM-dd HH:mm:ss")}</span>
						[#else]
							-
						[/#if]
					</td>
					<td>
						${ad.orders}
					</td>
					<td>
						[@shiro.hasPermission name="ad:edit"]
							<a href="edit.jhtml?id=${ad.id}">[${message("admin.common.edit")}]</a>
						[/@shiro.hasPermission]
					</td>
				</tr>
			[/#list]
		</table>
			[@pagination pageNumber = page.currentPage totalPages = page.totalPage]
			[#include "/common/pagination.ftl"]
		[/@pagination]
	</form>
<script>
$().ready(function() {
	 // 筛选选项
	 
	jQuery("#isPublicOption a").click(function() {
		var $this = $(this);
		var $dest = $("#" + $this.attr("name"));
		if ($this.hasClass("checked")) {
			$dest.val("");
		} else {
			$dest.val($this.attr("val"));
		}
		jQuery("#isPublic").val($dest.val());
		jQuery("#listForm").submit();
		return false;
	});
	
	// 每页记录数选项
	jQuery("#isPublicSelect").mouseover( function() {
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.menuWrap");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
		$menuWrap.mouseleave(function() {
			$popupMenu.hide();
		});
	});
	
});
</script>
</body>
</html>