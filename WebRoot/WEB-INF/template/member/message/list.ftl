[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.message.list")}</title>
<meta name="author" content="云生源" />
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
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.message.list")} <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<div class="bar">
			[@shiro.hasPermission name="memberMessage:send"]
				<a href="send.jhtml" class="iconButton">
					<span class="addIcon">&nbsp;</span>${message("admin.message.send")}
				</a>
			[/@shiro.hasPermission]
			<div class="buttonWrap">
				[@shiro.hasPermission name="memberMessage:delete"]
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
							<a href="javascript:;"[#if pageable.searchProperty == "title"] class="current"[/#if] val="title">${message("Message.title")}</a>
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
					<a href="javascript:;" class="sort" name="title">${message("Message.title")}</a>
				</th>
				<th>
					<span>${message("admin.message.receiver")}</span>
				</th>
				<th>
					<span>手机号码</span>
				</th>
				<th>
					<span>${message("admin.message.type")}</span>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="is_draft">是否草稿</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="create_date">${message("admin.common.createDate")}</a>
				</th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list page.content as adminMessage]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${adminMessage.id}" />
					</td>
					<td>
						<span title="${adminMessage.title}">${abbreviate(adminMessage.title, 50, "...")}</span>
					</td>
					<td>
							<a href="/member/member/view.jhtml?id=${adminMessage.receiver}">
								${adminMessage.nickName}
							</a>
					</td>
					<td>
								${adminMessage.mobile}
					</td>
					<td>
						[#if adminMessage.messageType == 0]
							系统消息
						[#else]
							理财消息
						[/#if]
					</td>
					<td>
						[#if adminMessage.isDraft]
							<span style="color:red">是</span>
						[#else]
							否
						[/#if]
					</td>
					<td>
						<span title="${adminMessage.createDate?string("yyyy-MM-dd HH:mm:ss")}">${adminMessage.createDate}</span>
					</td>
					<td>
						[@shiro.hasPermission name="memberMessage:view"]<a href="view.jhtml?id=${adminMessage.id}">[${message("admin.common.view")}]</a>[/@shiro.hasPermission]
						[#if adminMessage.isDraft]
						[@shiro.hasPermission name="memberMessage:edit"]<a href="edit.jhtml?id=${adminMessage.id}&&mobile=${adminMessage.mobile}">[编辑]</a>[/@shiro.hasPermission]
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
</html>