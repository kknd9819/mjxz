<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>分店列表</title>
<meta name="author" content="云生源（shengyuan.cn）" />
<meta name="copyright" 云生源（shengyuan.cn） />
<link type="text/css" href="/resources/css/common.css" rel="stylesheet"/>
<link href="/resources/common/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/list.js"></script>
<script type="text/javascript" src="/resources/common/datePicker/WdatePicker.js"></script>
<style type="text/css">
	input[type="text"]{
		width:120px;
		padding-left:2px;
	}
</style>
<script type="text/javascript">
	$().ready(function() {
		[@flash_message /]
		
	});
	
	function submit(){
		$("#listForm").submit();
	}
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">首页</a> &raquo; 分店列表 <span>(共${page.total}条记录)</span>
	</div>
	<form id="listForm" action="merchantBySubbranchList.jhtml" method="get" style="margin:15px 20px 20px 20px;">
		<input type="hidden" id="brandId" name="brandId" value="${brandId}" />
				<table  class="fieldset_t">
					<tr>
						<td style="width:200px;">
							<label>分店名称:</label>
							<input type="text" id="name" name="merchantName" maxlengh="120" value="${merchantName}"/>
						</td>
						<td style="width:200px;">
							<label>分店编码:</label>
							<input type="text" id="code" name="merchantCode" maxlengh="120" value="${merchantCode}"/>
						</td>
						 <td style="width:350px;">
							<label>创建时间:</label>
							<input type="text" id="createTime" name="createTime" class="Wdate"  value="${createTime}" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', maxDate: '#F{$dp.$D(\'createTime\')}'});"/>
							<label>至</label>	
							<input type="text" id="endTime" name="endTime" class="Wdate"  value="${endTime}" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '#F{$dp.$D(\'endTime\')}'});" />
						</td>
						<td>
							<input type="submit" class="button" value="查询分店"/>
							<input type="button" class="button" value="返回" onclick="javascript:location='/merchant/brand/list.jhtml';" />
						</td>
					</tr>
				</table>
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
				<!--<th class="check" width="40px">-->
					<!--<input type="checkbox" id="selectAll" />-->
				<!--</th>-->
				<th width="120px">
					<a href="javascript:;" class="sort" name="code">分店编码</a>
				</th>
				<th width="250px">
					<a href="javascript:;" class="sort" name="name">名称</a>
				</th>
				<th width="120px">
					<a href="javascript:;" class="sort" name="phone">分店电话</a>
				</th>
				<th width="250px">
					<a href="javascript:;" class="sort" name="address">分店地址</a>
				</th>
				<th width="80px">
					<a href="javascript:;" class="sort" name="create_date">创建日期</a>
				</th>
			</tr>
			[#list page.content as merchant]
				<tr>
					<!--<td>-->
						<!--<input type="checkbox" name="ids" value="${merchant.id}" />-->
					<!--</td>-->
					<td>
						${merchant.code}
					</td>
					<td>
						<span title="${merchant.name}">
							${abbreviate(merchant.name, 30, "...")}
						</span>
					</td>
					<td>
						${merchant.phone}
					</td>
					<td>
						${merchant.address}
					</td>
					<td>
						<span title="${merchant.createDate?string("yyyy-MM-dd HH:mm:ss")}">${merchant.createDate}</span>
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