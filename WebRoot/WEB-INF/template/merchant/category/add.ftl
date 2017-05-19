<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>商家分类添加</title>
<meta name="author" content="云生源（shengyuan.cn）" />
<meta name="copyright" 云生源（shengyuan.cn） />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<link href="/resources/common/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/input.js"></script>
<script type="text/javascript" src="/resources/common/ztree/js/jquery.ztree.all-3.5.min.js"></script>
<style type="text/css">
	ul.ztree {
		margin-top: 10px;
		border: 1px solid #617775;
		background: #f0f6e4;
		width: 220px;
		height: 300px;
		overflow-y: auto;
		overflow-x: auto;
	}
	
	.ztree li {
		background:#f0f6e4;
	}
</style>
<script>
	var zNodes=${categoryTree};
	var setting = {
		treeId:'resTree',
		check: {
			enable: true,
			chkStyle: "radio",
			radioType: "all"
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onCheck: onCheck
		}
	};
	
	function onCheck(e, treeId, treeNode) {
		var nodes = $.fn.zTree.getZTreeObj("treeDemo").getCheckedNodes(true);
		if(nodes.length == 0){
			$("#parent").val("");
			$("#parentName").val("");
		}else{
			$("#parent").val(nodes[0].id);
			$("#parentName").val(nodes[0].name);
		}
	}
	
	function showCategoryTree() {
		var cityObj = $("#parentName");
		var cityOffset = $("#parentName").offset();
		$("#merchantContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
		$("body").bind("mousedown", onBodyDown);
	}
	
	function hideCategoryTree() {
		$("#merchantContent").fadeOut("fast");
		$("body").unbind("mousedown", onBodyDown);
	}
		
	function onBodyDown(event) {
		if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "merchantContent" || $(event.target).parents("#merchantContent").length>0)) {
			hideCategoryTree();
		}
	}
	
	$().ready(function() {
		
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		var $inputForm = $("#inputForm");
		[@flash_message /]

		//表单验证
		$inputForm.validate({
			rules: {
				name: "required",
				orders: "digits"
			}
		});
	
	});
	
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">首页</a> &raquo; 添加商家分类
	</div>
	<form id="inputForm" action="save.jhtml" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>名称:
				</th>
				<td>
					<input type="text" id="name" name="name" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					上级分类:
				</th>
				<td>
					<input type="hidden" id="parent" name="parent" value="" />
					<input type="text" id="parentName" class="text" value="" onclick="showCategoryTree();" readonly="true"/>
				</td>
			</tr>
			<tr>
				<th>
					页面标题:
				</th>
				<td>
					<input type="text" name="seoTitle" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					页面关键词:
				</th>
				<td>
					<input type="text" name="seoKeywords" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					页面描述:
				</th>
				<td>
					<input type="text" name="seoDescription" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					排序:
				</th>
				<td>
					<input type="text" name="orders" class="text" maxlength="9" />
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="确定" />
					<input type="button" class="button" value="返回" onclick="history.back()" />
				</td>
			</tr>
		</table>
		<div id="merchantContent" class="merchantContent" style="display:none; position: absolute;">
			<ul id="treeDemo" class="ztree" style="margin-top:0; width:178px; height: 250px;"></ul>
		</div>
	</form>
</body>
</html>