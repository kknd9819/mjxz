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
	
	
});


	function commonAjax(url ,id){
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
					setTimeout(function(){$("#listForm").submit()},2000); 
				}
			});
		}
	});
	
}
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">首页</a> &raquo; 薪资计划列表 <span>(共${page.total}条记录)</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<div class="bar">
				<a href="add.jhtml" class="iconButton">
					<span class="addIcon">&nbsp;</span>添加计划
				</a>
			<div class="buttonWrap">
					<a href="javascript:;" id="deleteButton" class="iconButton disabled">
						<span class="deleteIcon">&nbsp;</span>删除
					</a>
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
							<a href="javascript:;"[#if pageable.searchProperty == "s.subject"] class="current"[/#if] val="s.subject">主题</a>
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
					<a href="javascript:;" class="sort" name="s.create_date">创建时间</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="s.subject">薪资主题</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="s.builder_name">创建人名称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="s.audit_status">审核信息</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="s.plan_status">计划状态</a>
				</th>
				<th>
					<span>操作</span>
				</th>
			</tr>
			[#list page.content as salaryPlan]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${salaryPlan.id}" [#if salaryPlan.auditStatus==1]disabled="disabled"[/#if] />
					</td>
					<td>
						<span title="${salaryPlan.createDate?string("yyyy-MM-dd HH:mm:ss")}">${salaryPlan.createDate}</span>
					</td>
					<td>
						${salaryPlan.subject}
					</td>
					<td>
						${salaryPlan.builderName}
					</td>
					<td>
						[#if salaryPlan.auditStatus==0]
						待审核
						[#elseif salaryPlan.auditStatus==1] 
						已审核|${salaryPlan.auditerName}
						[/#if]
					</td>
					<td>
						[#if salaryPlan.planStatus==0]
						待生成
						[#elseif salaryPlan.planStatus==1] 
						已生成
						[/#if]
					</td>
					<td>
						<a href="view.jhtml?id=${salaryPlan.id}">[编辑查看]</a>
						[#if salaryPlan.auditStatus==0]
						<a href="javascript:commonAjax('/finance/salary/checkSalary.jhtml','${salaryPlan.id}')">[审核]</a>
						[#elseif salaryPlan.auditStatus==1] 
							[#if salaryPlan.planStatus==0]
							<a href="javascript:commonAjax('/finance/salary/bulidSalaryBills.jhtml','${salaryPlan.id}')">[生成]</a>
							[#elseif salaryPlan.planStatus==1] 
							
						[/#if]
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