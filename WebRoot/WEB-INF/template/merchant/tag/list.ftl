<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>商家标签</title>
<meta name="author" content="云生源（shengyuan.cn）" />
<meta name="copyright" 云生源（shengyuan.cn） />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/list.js"></script>
<script type="text/javascript" src="/resources/js/tagpage.js"></script>
<script type="text/javascript">
$().ready(function() {
	[@flash_message /]
	orderForPage(1);
	
	$("#pageSizeOption a").click(function(){
		var size = $(this).attr('val');
		$("#pageSize").val(size);
		orderForPage(1,size);
	});
	
	var $sort = $("#listTable a.sort");
	var $orderProperty = $("#orderProperty");
	var $orderDirection = $("#orderDirection");
	$sort.click( function() {
		var orderProperty = $(this).attr("name");
		if ($orderProperty.val() == orderProperty) {
			if ($orderDirection.val() == "ASC") {
				$orderDirection.val("ASC");
			} else {
				$orderDirection.val("DESC");
			}
		} else {
			$orderProperty.val(orderProperty);
			$orderDirection.val("ASC");
		}
		if ($orderProperty.val() != "") {
			$("#listTable a").removeClass("desc");
			$("#listTable a").removeClass("asc");
			$sortProperty = $("#listTable a[name='" + $orderProperty.val() + "']");
			if ($orderDirection.val() == "ASC") {
				$sortProperty.removeClass("desc").addClass("asc");
			} else {
				$sortProperty.removeClass("asc").addClass("desc");
			}
		}
		orderForPage($("#pageNumber").val(),$("#pageSize").val());
	});
		
});

	//数据加载
	function orderForPage(currentPage,pageSize){
		var name = $("#name").val();
		var key = $("#key").val();
		var typeClassId = $("#typeClassId").val();
		var orderProperty = $("#orderProperty").val();
		var orderDirection = $("#orderDirection").val();
		var deliverData = {pageNumber:currentPage,pageSize:pageSize,name:name,key:key,typeClassId:typeClassId,orderProperty:orderProperty,orderDirection:orderDirection};
		$("#loading").show();
		var getCouponForPage = "list.jhtml";
		$("#loading").show();
		jQuery.getJSON(getCouponForPage,deliverData,function(data){
			jQuery("#orderList").empty();
			jQuery("#totalSize").html(data.count);
			var orderDetail = "";
			if(data.items.length > 0) {
				jQuery.each(data.items, function(i, item) {
					orderDetail += "<tr>";
					orderDetail += "<td>";
					orderDetail += "<input type='checkbox' name='ids' value='"+item.id+"' onclick='idsClick()'/>";
					orderDetail += "</td>";
					orderDetail += "<td>";
					orderDetail += "<span>"+item.name+"</span>";
					orderDetail += "</td>";
					orderDetail += "<td>";
					orderDetail += "<span>";
					if(item.type == 0) {
						orderDetail += "搜索标签";
					} else if(item.type == 1) {
						orderDetail += "评价标签";
					} else if(item.type == 2){
						orderDetail += "服务标签";
					}
					orderDetail += "</span>";
					orderDetail += "</td>";
					orderDetail += "<td>";
					orderDetail += "<span>"+item.tagKey+"</span>";
					orderDetail += "</td>";
					orderDetail += "<td>";
					orderDetail += "<span>";
					if(item.memo != ''){
						orderDetail += item.memo;
					} else {
						orderDetail += "-";
					}
					orderDetail += "</span>";
					orderDetail += "</td>";
//					orderDetail += "<td>";
//					if(item.icon != null && item.icon != ''){
//						orderDetail += "<a rel='group' href='${siteUrl}"+item.icon+"' title='"+item.name+"标签图标' target='_blank'>查看</a>";
//					} else {
//						orderDetail += "<span>-</span>";
//					}
//					orderDetail += "</td>";
					orderDetail += "<td>";
					orderDetail += "<span>";
					if(item.orders != ''){
						orderDetail += item.orders;
					} else {
						orderDetail += "-";
					}
					orderDetail += "</span>";
					orderDetail += "</td>";
					orderDetail += "<td>";
					orderDetail += "<span title='"+item.createDate+"'>"+item.createDate+"</span>";
					orderDetail += "</td>";
					orderDetail += "<td>";
					orderDetail += "[@shiro.hasPermission name='merchantTag:edit']<a href='edit.jhtml?id="+item.id+"'>[编辑]</a>[/@shiro.hasPermission]";
					orderDetail += "</td>";
					orderDetail += "</tr>";
				});
			} else {
				jQuery("#orderList").append("<tr><td colspan='12' align='center'>暂无标签信息</td></tr>");
			}
			jQuery("#orderList").append(orderDetail);
			$(".total").text(data.count);
			if(data.pageCount>=1) {
				pageInit("orderPageDiv",data.currentPage,data.pageCount,"orderForPage",pageSize);
			} else {
				jQuery("#orderPageDiv").empty();
			}
			jQuery("#loading").hide();
		});
	}
	//删除
	function idsClick(){
		var $deleteButton = $("#deleteButton");
		var $this = $(this);
		if ($this.prop("checked")) {
			$this.closest("tr").addClass("selected");
			$deleteButton.removeClass("disabled");
		} else {
			$this.closest("tr").removeClass("selected");
			if ($("#listTable input[name='ids']:enabled:checked").size() > 0) {
				$deleteButton.removeClass("disabled");
			} else {
				$deleteButton.addClass("disabled");
			}
		}
	}
</script>
</head>
<body>
	<!-- 顶部 -->
	<div id="loading" class="loading" style="display: none;top:40%;">
		<img src="/resources/images/loading_icon.gif"/>正在加载中，请稍后。
	</div>
	<div class="path">
		<a href="/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 商家标签 <span>(共<span class="total"></span>条记录)</span>
	</div>
	<form action="#" method="post">
		<input type="hidden" id="orderProperty"/> 
		<input type="hidden" id="orderDirection"/>
		<input type="hidden" id="pageSize" value="20"/>
		<table  class="fieldset_t">				
			<tr>
				<td style="width:240px;">
					<label>名称：</label>
					<input id="name" maxlengh="20"/>
				</td>
				<td style="width:240px;">
					<label>Key：</label>
					<input id="key" maxlengh="11"/>
				</td>
				<td style="width:240px;">
					<label>类型：</label>
					<select id="typeClassId">
						<option value="">请选择</option>
						<option value="0">搜索标签</option>
						<option value="1">评价标签</option>
						<option value="2">服务标签</option>
					</select>
				</td>
				<td>
			         <input type="button" class="button" value="查询" onclick='orderForPage(1);'/>
				</td>
			</tr>
		</table>
		<div class="bar">
			[@shiro.hasPermission name='merchantTag:add']
				<a href="add.jhtml" class="iconButton">
					<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
				</a>
			[/@shiro.hasPermission]
			<div class="buttonWrap">
				[@shiro.hasPermission name='merchantTag:delete']
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
					<a href="javascript:;" class="sort" name="type">类型</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="tag_key">标签 Key </a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="memo">标签 备注 </a>
				</th>
				<!--<th>
					<a href="javascript:;" class="sort" name="icon">图标</a>
				</th>-->
				<th>
					<a href="javascript:;" class="sort" name="orders">排序</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="create_date">创建日期</a>
				</th>
				<th>
					<span>操作</span>
				</th>
			</tr>
			<tbody id="orderList"></tbody>
		</table>
		<!-- 分页 -->
		<div class="pagination" id="orderPageDiv"></div>
	</form>
</body>
</html>