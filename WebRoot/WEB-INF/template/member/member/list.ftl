<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.member.list")}</title>
<meta name="author" content="云生源（shengyuan.cn）" />
<meta name="copyright" 云生源（shengyuan.cn） />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {
	[@flash_message /]
	
	// 批量导入
	$("#batchImportButton").click(function() {
		var $this = $(this);
		if ($this.hasClass("disabled")) {
			return false;
		}
		$.dialog({
			title: "批量导入会员",
			[@compress single_line = true]
				content: "
				<form id='batchImportForm' action='member_import.jhtml' method='post' enctype='multipart/form-data'>
				<table id='batchImportTable' class='moreTable'>
					<tr>
						<th>
							模板文件:
						<\/th>
						<td>
							<a target='_blank' href='${base}/download/member_import.xls'>点击此处下载</a>
						<\/td>
					<\/tr>
					<tr>
						<th>
							导入文件:
						<\/th>
						<td>
							<input type='file' name='batchImportFile'/>
						<\/td>
					<\/tr>
				<\/table>
				<\/form>
				",
			[/@compress]
			width: 470,
			modal: true,
			ok: "${message("admin.dialog.ok")}",
			cancel: "${message("admin.dialog.cancel")}",
			onOk: function() {
				$("#batchImportForm").submit();
			}
		});
	});
});

function commonAjax(t ,id){
	
	var url = "" ;
	if(t == "un"){
		url = "unlock.jhtml" ;
	}else{
		url = "setpwd.jhtml" ;
	}
	
	$.dialog({
		type: "warn",
		content: "您确定需要此项操作",
		ok: message("admin.dialog.ok"),
		cancel: message("admin.dialog.cancel"),
		onOk: function() {
			$.ajax({
				url: url,
				type: "POST",
				data: {id:id},
				dataType: "json",
				cache: false,
				success: function(message) {
					$.message(message);
				}
			});
		}
	});
	
	
	
	
}
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.member.list")} <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<div class="bar">
			[@shiro.hasPermission name="member:add"]
				<a href="add.jhtml" class="iconButton">
					<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
				</a>
				<a href="javascript:;" id="batchImportButton" class="iconButton">
					<span class="upIcon">&nbsp;</span>批量导入
				</a>
			[/@shiro.hasPermission]
			<div class="buttonWrap">
<!-- 				[@shiro.hasPermission name="member:delete"] -->
<!-- 					<a href="javascript:;" id="deleteButton" class="iconButton disabled"> -->
<!-- 						<span class="deleteIcon">&nbsp;</span>${message("admin.common.delete")} -->
<!-- 					</a> -->
<!-- 				[/@shiro.hasPermission] -->
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
							<a href="javascript:;"[#if pageable.searchProperty == "m.mobile"] class="current"[/#if] val="m.mobile">${message("Member.mobile")}</a>
						</li>
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "m.nick_name"] class="current"[/#if] val="m.nick_name">${message("Member.username")}</a>
						</li>
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "a.asset_no"] class="current"[/#if] val="a.asset_no">${message("Member.assetNo")}</a>
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
					<span>昵称</span>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="m.mobile">${message("Member.mobile")}</a>
				</th>
				<th>
					<span>资产编号</span>
				</th>
				<th>
					<span>资产状态</span>
				</th>
				<th>
					<span>真实姓名</span>
				</th>
				<th>
					<span>支付锁定</span>
				</th>
				<th>
					<span>${message("admin.member.status")}</span>
				</th>
				<th>
					<span>账号锁定</span>
				</th>
				<th>
					<span>激活状态</span>
				</th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list page.content as member]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${member.id}" />
					</td>
					<td>
						${member.nickName}
					</td>
					<td>
						${member.mobile}
					</td>
					<td>
						${member.assetNo}
					</td>
					<td>
						[#if member.aEnabled == true]
							<span class="green">已开通</span>
						[#else]
							<span class="red"> 未开通</span>
						[/#if]	
					</td>
					<td>
							<span class="blue">${member.realName}</span>
							[#if member.auStatus == 1]
							(已审核)
						[#elseif member.auStatus == 0 && member.realName??]
							 (未审核)
						[#else]
							
						[/#if]
					</td>
					<td>
						[#if member.aLockedDate??]
							<span class="red">锁定</span>
						[#else]
							<span class="green"> 正常</span>
						[/#if]	
					</td>
					<td>
						[#if member.isEnabled]
							<span class="green">${message("admin.member.normal")}</span>
						[#else]
							<span class="red">${message("admin.member.disabled")}</span>
						[/#if]
					</td>
					<td>
						[#if member.lockedDate??]
							<span class="red">锁定</span>
						[#else]
							<span class="green">正常</span>
						[/#if]
					</td>
					<td>
						[#if member.loginPassword??]
						    <span class="green">已激活</span>
						[#else]
						   <span class="red">未激活</span>
						[/#if]
					</td>
					<td>
						[@shiro.hasPermission name="member:view"]
							<a href="view.jhtml?id=${member.id}">[${message("admin.common.view")}]</a>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="member:edit"]
							[#if member.loginPassword??]
							<a href="edit.jhtml?id=${member.id}">[${message("admin.common.edit")}]</a>
							[/#if]
						[/@shiro.hasPermission]		
						<a href="/finance/recharge/list.jhtml?memberId=${member.id}">[充值记录]</a>
						<a href="consumeList.jhtml?memberId=${member.id}">[消费记录]</a>
						<a href="assetList.jhtml?memberId=${member.id}">[资金收益]</a>
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