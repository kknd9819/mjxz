<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>实名制信息 -  云生源（shengyuan.cn）你的消费很值钱！</title>
<meta name="author" content="云生源后台管理系统" />
<meta name="copyright" content="云生源后台管理系统" />
<link type="text/css" href="/resources/css/common.css" rel="stylesheet"/>
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
		<a href="/admin/common/index.jhtml">首页</a> &raquo; 实名制信息 <span>(共${page.total}条记录)</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<div class="bar">		
			<div class="buttonWrap">
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
							<a href="javascript:;"[#if pageable.searchProperty == "nickName"] class="current"[/#if] val="nickName">昵称</a>
						</li>
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "mobile"] class="current"[/#if] val="mobile">手机号码</a>
						</li>
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "real_name"] class="current"[/#if] val="real_name">真实姓名</a>
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
					<a href="javascript:;" class="sort" name="m.username">昵称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="m.mobile">手机号码</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="ma.real_name">真实姓名</a>
				</th>				
				<th>
					<a href="javascript:;" class="sort" name="ma.id_no">证件号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="ma.gender">性别</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="ma.create_date">创建日期</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="ma.status">审核状态</a>
				</th>
				<th>
					<span>操作</span>
				</th>
			</tr>
			[#list page.content as autonym]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${autonym.memberId}" />
					</td>
					<td>
						${autonym.nickName}
					</td>
					<td>
						${autonym.mobile}
					</td>
					<td>
						${autonym.realName}
					</td>
					<td>
						${autonym.idNo}
					</td>
					<td>
						[#if autonym.gender==0]
							<span class="gray">男</span>
						[#else]
							<span class="gray">女</span>
						[/#if]
					</td>				
					<td>
						${autonym.createDate?string("yyyy-MM-dd HH:mm:ss")}
					</td>
					<td>
						[#if autonym.status==1]
                			审核通过
	                	[#elseif autonym.status==2]
	                		审核未通过
	                	[#else]
	                		待审核
	                	[/#if]
					</td>
					<td>	
						[#if autonym.status==0]
							<a href="view.jhtml?memberId=${autonym.memberId}">[审核]</a>
	                	[#else]
	                		<a href="view.jhtml?memberId=${autonym.memberId}">[重新审核]</a>
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