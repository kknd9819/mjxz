<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>商家分类列表 </title>
<meta name="author" content="云生源（shengyuan.cn）" />
<meta name="copyright" 云生源（shengyuan.cn） />
<link type="text/css" href="/resources/css/common.css" rel="stylesheet"/>
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/list.js"></script>
<script type="text/javascript">
	$().ready(function() {
		[@flash_message /]
	});
	
	function deleteCategory(pcid){	
		if(pcid != ""){					
			$.dialog({
				type: "warn",
				content: "您确定要删除吗？",
				onOk: function() {
					$.ajax({
						url: "delete.jhtml",
						type: "POST",
						data: {id: pcid},
						dataType: "json",
						cache: false,
						success: function(message) {
							$.message(message);
							if (message.type == "success") {
								$(this).closest("tr").remove();
								//重新刷新 一下页面
								window.location.href="list.jhtml";
							}
						}
					});
				}
			});
		}
	}
	
	function removeTr(pcid,treePathStr){
	    if(treePathStr==","){
	       $.each(
				$("table:first tbody tr.subCss"), 
				function(i ,tr){
					if($(this).attr("class")=='subCss' && ($(this).attr("id")!=('tr_'+pcid))){//清空子类
						$(this).closest("tr").remove();
					}
				}
			);
	    }
	}
	
	function showCategory(pcid,grade,treePath) {
		if(pcid != ""){
			$.ajax({
				url: "zllist.jhtml",
			  	data: "POST",
			  	data: {id: pcid},
			  	dataType: "json",
			  	success: function(msg){
			  		if (msg.message.type == "success") {
			  		    if(msg.categorys.length>0){
			  		       removeTr(pcid,treePath);		
			  		    }	  						  		
			  			$.each(
							$("table:first tbody tr"), 
							function(i ,tr){
							    var grades = grade+1;
								if($(this).attr("id") == ("tr_" + pcid)){
									var curRow = $("table:first tbody tr:eq("+i+")");
									for(var j=0;j<msg.categorys.length;j++){
									   //处理排序显示null值的问题
									   if(msg.categorys[j].orders==null){
									      msg.categorys[j].orders = "";
									   }
									   //判断当前产生的行是否已经存在，存在就删除
									   if(jQuery("#tr_"+msg.categorys[j].id)){
									      jQuery("#tr_"+msg.categorys[j].id).remove();
									   }
									   if(msg.categorys[j].grade==grades){
										str='<tr id=tr_'+msg.categorys[j].id+' class=subCss>' +
											'<td>'+
												'<span style=margin-left:'+(msg.categorys[j].grade * 20)+'px;[#if '+msg.categorys[j].grade+' == 0] color: #000000;[/#if]>'+ msg.categorys[j].name +'</span>'+
											'</td>' +
											'<td>' + msg.categorys[j].orders + '</td>' +
											'<td>'+
												'<a href=edit.jhtml?id='+msg.categorys[j].id+'>[${message("admin.common.edit")}]</a> ' +
												'<a href=javascript:deleteCategory('+msg.categorys[j].id+'); class=delete>[${message("admin.common.delete")}]</a> '+
												'<a href=javascript:showCategory('+msg.categorys[j].id+','+msg.categorys[j].grade+',\''+msg.categorys[j].treePath+'\');>[子类]</a>'+
											'</td>' +
										 '</tr>';
										 curRow.after(str);
										 }
									}
								}
							});	  			
					}else{
						alert("数据加载失败！");
					}
			  	}					  
			});
		}		
	}
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">首页</a> &raquo; 商家分类列表
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<div class="bar">
			[@shiro.hasPermission name="category:add"]
				<a href="add.jhtml" class="iconButton">
					<span class="addIcon">&nbsp;</span>添加
				</a>
			[/@shiro.hasPermission]
			<a href="javascript:;" id="refreshButton" class="iconButton">
				<span class="refreshIcon">&nbsp;</span>刷新
			</a>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th>
					<span>名称</span>
				</th>
				<th>
					<span>排序</span>
				</th>
				<th>
					<span>操作</span>
				</th>
			</tr>
			<tbody>
			[#list categoryList as category]
				<tr id="tr_${category.id}" [#if category.grade == 0]class="abc"[#else]class="subCss"[/#if] >
					<td>
						<span style="margin-left: ${category.grade * 20}px;[#if category.grade == 0]color: #000000;[/#if]">
							${category.name}
						</span>
					</td>
					<td>
						${category.orders}
					</td>
					<td>
						[@shiro.hasPermission name="category:edit"]
							<a href="edit.jhtml?id=${category.id}">[编辑]</a>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="category:delete"]
							<a href="javascript:deleteCategory(${category.id});" class="delete">[删除]</a>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="category:children"]
							<a href="javascript:showCategory(${category.id},${category.grade},'${category.treePath}');" >[子类]</a>
						[/@shiro.hasPermission]
					</td>
				</tr>
			[/#list]
			</tbody>
		</table>
	</form>
</body>
</html>