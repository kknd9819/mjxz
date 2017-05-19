<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.adPosition.list")} -  生源闪购（shengyuan.cn）闪亮生活，购你喜欢！</title>
<meta name="author" content="生源闪购（shengyuan.cn）" />
<meta name="copyright" 生源闪购（shengyuan.cn） />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {

	[@flash_message /]
		
		var $position= $("input[name='position']")
		
		var $filterOption = $("#filterOption a");
		
		var $listForm = $("#listForm");
		
		// 筛选选项
		$filterOption.click(function() {
			var $this = $(this);
			
			var dest = $this.attr("name");
			
			$position.val(dest.trim());
			
			$listForm.submit();
			return false;
			
		});
		
		[#list positions as position]
		if($position.val()=="${position.enumName}"){
			$("a[name='${position.enumName}']").addClass("button2_dq");//为当前标签添加button2_dq类  
			$("a[name='${position.enumName}']").siblings().removeClass("button2_dq");//移除当前元素的同级元素的button2_dq类
		}
		[/#list]
});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.adPosition.list")} <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<input type="hidden" id="position" name="position" value="${ad}" />
		<div class="bar">
			[@shiro.hasPermission name="adPosition:add"]
				<a href="add.jhtml" class="iconButton">
					<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
				</a>
			[/@shiro.hasPermission]
			<div class="buttonWrap">
				[@shiro.hasPermission name="adPosition:delete"]
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
							<a href="javascript:;"[#if pageable.searchProperty == "name"] class="current"[/#if] val="name">${message("AdPosition.name")}</a>
						</li>
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "code"] class="current"[/#if] val="code">编码</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div id="filterOption">
				<a href="#" name="" class="button2 button2_dq">
					全部
				</a>
				[#list positions as position]
				<a href="#" name="${position.enumName}" class="button2">
					${position.typeName}
				</a>
				[/#list]
			</div>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="code">编码</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="name">${message("AdPosition.name")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="name">广告位类型</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="description">${message("AdPosition.description")}</a>
				</th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list page.content as adPosition]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${adPosition.id}" />
					</td>
					<td>
						${adPosition.code}
					</td>
					<td>
						${adPosition.name}
					</td>					
					<td>
						${adPosition.typeName}
					</td>
					<td>
						[#if adPosition.description??]
							<span title="${adPosition.description}">${abbreviate(adPosition.description, 50, "...")}</span>
						[/#if]
					</td>
					<td>
						[@shiro.hasPermission name="adPosition:edit"]
							<a href="edit.jhtml?id=${adPosition.id}">[${message("admin.common.edit")}]</a>
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