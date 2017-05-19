<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>商家动态信息列表</title>
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
		<a href="/admin/common/index.jhtml">首页</a> &raquo; 商家动态信息列表 <span>(共${page.total}条记录)</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<input type="hidden" id="merchantId" name="merchantId" value="${merchantId}" />
		<div class="bar">
			[@shiro.hasPermission name="dynamicMsg:add"]
				<a href="add.jhtml?merchantId=${merchantId}" class="iconButton">
					<span class="addIcon">&nbsp;</span>添加
				</a>	
			[/@shiro.hasPermission]
			<div class="buttonWrap">
				[@shiro.hasPermission name="dynamicMsg:delete"]
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
					<a href="javascript:;" class="sort" name="dynamicMsg_type">动态类型</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="create_date">创建时间</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="begin_time">开始时间</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="end_time">结束时间</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="msg">动态内容</a>
				</th>
				<th>
					<span>操作</span>
				</th>
			</tr>
			[#list page.content as dynamicMsg]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${dynamicMsg.id}" />
					</td>
					<td>
						<span title="${dynamicMsg.dynamicMsgName}">${abbreviate(dynamicMsg.dynamicMsgName, 50, "...")}</span>
					</td>
					<td>
						<span title="动态类型">
						 [#if dynamicMsg.dynamicMsgType==0]返现
						 [#elseif dynamicMsg.dynamicMsgType==1]优惠
						 [/#if]
						</span>
					</td>
					<td>
						<span title="${dynamicMsg.createDate?string("yyyy-MM-dd HH:mm:ss")}">${dynamicMsg.createDate}</span>
					</td>
					<td>
						${dynamicMsg.startTime?string("yyyy-MM-dd HH:mm:ss")}
					</td>
					<td>
						${dynamicMsg.endTime?string("yyyy-MM-dd HH:mm:ss")}
					</td>
					<td>
						${dynamicMsg.msg}
					</td>
					<td>
						[@shiro.hasPermission name="dynamicMsg:edit"]
							<a href="edit.jhtml?id=${dynamicMsg.id}">[编辑]</a>
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