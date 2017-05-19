<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.article.add")} -  生源闪购（shengyuan.cn）闪亮生活，购你喜欢！</title>
<meta name="author" content="生源闪购（shengyuan.cn）" />
<meta name="copyright" 生源闪购（shengyuan.cn） />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<link href="/resources/common/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="/resources/common/editor/kindeditor.js"></script>
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


<script type="text/javascript">

	var zNodes=${articleCategoryTree};
	var setting1 = {
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
	
	function showArticleCategoryTree() {
		var cityObj = $("#parentName");
		var cityOffset = $("#parentName").offset();
		$("#articleContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
		$("body").bind("mousedown", onBodyDown);
	}
	
	function hideArticleCategoryTree() {
		$("#articleContent").fadeOut("fast");
		$("body").unbind("mousedown", onBodyDown);
	}
		
	function onBodyDown(event) {
		if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "articleContent" || $(event.target).parents("#articleContent").length>0)) {
			hideArticleCategoryTree();
		}
	}
	
$().ready(function() {
	$.fn.zTree.init($("#treeDemo"), setting1, zNodes);
	var $inputForm = $("#inputForm");
	
	[@flash_message /]
	
	// 表单验证
	$inputForm.validate({
		rules: {
			title: "required",
			articleCategoryId: "required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.article.add")}
	</div>
	<form id="inputForm" action="save.jhtml" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Article.title")}:
				</th>
				<td>
					<input type="text" name="title" class="text" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Article.articleCategory")}:
				</th>
				<td>
					<input type="hidden" id="parent" name="articleCategoryId" value="" />
					<input type="text" id="parentName" class="text" value="" onclick="showArticleCategoryTree();" readonly="true"/>
				</td>
			</tr>
			<tr>
				<th>
					${message("Article.author")}:
				</th>
				<td>
					<input type="text" name="author" class="text" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.common.setting")}:
				</th>
				<td>
					<label>
						<input type="checkbox" name="isPublication" value="true" checked="checked" />${message("Article.isPublication")}
						<input type="hidden" name="_isPublication" value="false" />
					</label>
					<label>
						<input type="checkbox" name="isTop" value="true" />${message("Article.isTop")}
						<input type="hidden" name="_isTop" value="false" />
					</label>
				</td>
			</tr>
			<tr>
				<th>
					${message("Article.tags")}:
				</th>
				<td>
					[#list tags as tag]
						<label>
							<input type="checkbox" name="tagIds" value="${tag.id}" checked="checked"/>${tag.name}
						</label>
					[/#list]
				</td>
			</tr>
			<tr>
				<th>
					${message("Article.content")}:
				</th>
				<td>
					<textarea id="editor" name="content" class="editor" ></textarea>
				</td>
			</tr>
			<tr>
				<th>
					${message("Article.seoTitle")}:
				</th>
				<td>
					<input type="text" name="seoTitle" class="text" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Article.seoKeywords")}:
				</th>
				<td>
					<input type="text" name="seoKeywords" class="text" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Article.seoDescription")}:
				</th>
				<td>
					<input type="text" name="seoDescription" class="text" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="${message("admin.common.submit")}" />
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
		<div id="articleContent" class="articleContent" style="display:none; position: absolute;">
				<ul id="treeDemo" class="ztree" style="margin-top:0; width:178px; height: 250px;"></ul>
			</div>
	</form>
</body>
</html>