<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>添加商家</title>
<meta name="author" content="云生源（shengyuan.cn）" />
<meta name="copyright" 云生源（shengyuan.cn） />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<link href="/resources/common/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.tools.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="/resources/common/editor/kindeditor.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/input.js"></script>
<script type="text/javascript" src="/resources/common/ztree/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.autocomplete.js"></script>
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
	$().ready(function() {
		[@flash_message /]
		
		var merchantImageIndex = 0;
		
		var previousCategoryId = getCookie("previousCategoryId");
		
		$("#browserButton").browser();
		
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
				$("#categoryId").val("");
				$("#categoryName").val("");
			}else{
				$("#categoryId").val(nodes[0].id);
				$("#categoryName").val(nodes[0].name);
				previousCategoryId = $("#categoryId").val();
			}
		}
		
		function showCategoryTree() {
			var cityObj = $("#categoryName");
			var cityOffset = $("#categoryName").offset();
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
		
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		
		$("#categoryName").click(function(){
			showCategoryTree();
		});
		
		$("#createMerchantCode").click(function() {
			$.ajax({
				url: "createMerchantCode.jhtml",
				type: "GET",
				dataType: "json",
				success: function(data) {
					$("input[name='code']").val(data.code);
				}
			});
		});
		
		// 增加商家图片
		$("#addMerchantImage").click(function() {
			[@compress single_line = true]
				var trHtml = 
				'<tr>
					<td style="width:20%">
						<input type="file" name="merchantImages[' + merchantImageIndex + '].file" class="merchantImageFile" \/>
					<\/td>
					<td style="width:20%">
						<input type="text" name="merchantImages[' + merchantImageIndex + '].title" class="text" maxlength="200" \/>
					<\/td>
					<td class="isDefalut" style="width:20%;text-align:center;">
					     <input type="radio" onClick="changeChecked(this);"  name="isDefault" class="text" value="true" maxlength="9" style="width: 50px;" />是否默认
					     <input type="hidden"  name="merchantImages[' + merchantImageIndex + '].isDefault" class="imageDefault"  value="false"  />
					</td>
					<td style="width:10%">
						<input type="text" name="merchantImages[' + merchantImageIndex + '].orders" class="text merchantImageOrder" maxlength="9" style="width: 50px;" \/>
					<\/td>
					<td style="width:10%">
						<a href="javascript:;" class="deleteMerchantImage">[删除]<\/a>
					<\/td>
				<\/tr>';
			[/@compress]
			$("#merchantImageTable").append(trHtml);
			merchantImageIndex ++;
		});
		
		// 删除商家图片
		$("a.deleteMerchantImage").live("click", function() {
			var $this = $(this);
			$.dialog({
				type: "warn",
				content: "您确定要删除吗？",
				onOk: function() {
					$this.closest("tr").remove();
				}
			});
		});
		
		$.validator.addClassRules({
			merchantImageFile: {
				required: true,
				extension: "jpg,jpeg,bmp,gif,png"
			},
			merchantImageOrder: {
				digits: true
			}
		});
		
		// 表单验证
		$("#inputForm").validate({
			rules: {
				categoryId: "required",
				name: "required",
				fullName: "required",
				address: "required",	
				code: "required"
			},
			messages: {
				code: {
					pattern: "非法字符",
					remote: "已存在"
				}
			},
			submitHandler: function(form) {
			    var name = $("input[name='name']").val();
			    //上传图片仅一个能设置为默认值
			    if(merchantImageIndex==0){
			       $.message("warn", "请上传商家图片!");
			       return false;
			    }else{
					var index = 0;
					var isDefaults=document.getElementsByName("isDefault");
					if(isDefaults!=null && isDefaults.length>0){
						for(var i=0;i<isDefaults.length;i++){
							if(isDefaults[i].checked==true && isDefaults[i].value=='true'){
								index ++;
							}
						}
			        }
				    if(index!=1){
				       $.message("warn", "请设置一张图片为默认图片!");
		     		   return false;
				    }
			    }
			    //商家介绍
			    var description = jQuery("#description").val();
			    jQuery("#description").val(description);
			    //end
			    
			    addCookie("previousCategoryId", $("#categoryId").val(), {expires: 24 * 60 * 60});
				form.submit();
			}
		});
	});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">首页</a> &raquo; 添加商家
	</div>
	<form id="inputForm" action="save.jhtml" method="post" enctype="multipart/form-data">
		<ul id="tab" class="tab">
			<li><input type="button" value="基本信息" /></li>
			<li><input type="button" value="商家介绍" /></li>
			<li><input type="button" value="商家图片" /></li>
			<li><input type="button" value="商家标签" /></li>
		</ul>
		<table class="input tabContent">
			<tr>
				<th>商家分类:</th>
				<td>
					<input type="hidden" id="categoryId" name="category" maxlengh="255" value="" />
					<input type="text" class="text" id="categoryName" maxlengh="255" value="" readonly="true"/>
				</td>
			</tr>
			<tr>
				<th>品牌:</th>
				<td>
					<select name="brandId" id="brandId">
						<option value="">请选择...</option>
						[#list brands as brand]
							<option value="${brand.id}">${brand.name}</option>
						[/#list]
					</select>
				</td>
			</tr>
			<tr>
				<th><span class="requiredField">*</span>名称：</th>
				<td><input type="text" name="name" class="text longInput" maxlength="200" title="" /></td>
			</tr>
			<tr>
				<th><span class="requiredField">*</span>完整名称：</th>
				<td><input type="text" name="fullName" class="text longInput" maxlength="200" /></td>
			</tr>
			<tr>
				<th><span class="requiredField">*</span>商家编码:</th>
				<td><input type="text" name="code" class="text" maxlength="100" />&nbsp;<input type="button" class="button" id="createMerchantCode" value="生成" /></td>
			</tr>
			<tr>
				<th>电话:</th>
				<td><input type="text" name="phone" class="text shortInput" maxlength="11" /></td>
			</tr>
			<tr>
				<th><span class="requiredField">*</span>商家地址:</th>
				<td>
					<input type="text" name="address" class="text" maxlength="200" title="" />
				</td>
			</tr>
			<tr>
				<th>设置:</th>
				<td>
					<label>
						<input type="checkbox" name="isTop" value="true" />是否推荐
						<input type="hidden" name="_isTop" value="false" />
					</label>
				</td>
			</tr>
			<tr>
				<th>
					商家状态:
				</th>
				<td>
					<label><input type="radio" name="status" value="1" checked="true"/>启用</label>
					<label><input type="radio" name="status" value="0"/>禁用</label>
					<input type="hidden" id="_status" name="_status" value="1" />
				</td>
			</tr>
			<tr>
				<th>
					是否开通支付:
				</th>
				<td>
					<label><input type="radio" name="isOpenPaymen" value="1" checked="true"/>是</label>
					<label><input type="radio" name="isOpenPaymen" value="0"/>否</label>
				</td>
			</tr>
			<tr>
				<th>
					是否实体商户:
				</th>
				<td>
					<label><input type="radio" name="isAllianceStore" value="1" checked="true"/>是</label>
					<label><input type="radio" name="isAllianceStore" value="0"/>否</label>
				</td>
			</tr>
			<tr>
				<th>搜索关键词:</th>
				<td><input type="text" name="keyword" class="text longInput" maxlength="200" title="应用于前台商家搜索，多个关键字以(,)分隔" /></td>
			</tr>
			<tr>
				<th>营业时间:</th>
				<td><input type="text" name="businessTime" class="text longInput" maxlength="200" /></td>
			</tr>
		</table>
		<table class="input tabContent">
			<tr>
				<td>
					<textarea id="editor" name="description" class="editor" style="width: 100%;"></textarea>
				</td>
			</tr>
		</table>
		<table id="merchantImageTable" class="input tabContent">
			<tr>
				<td colspan="5">
					<a href="javascript:;" id="addMerchantImage" class="button">增加图片</a>
				</td>
			</tr>
			<tr class="title">
				<td style="width:20%">文件</td>
				<td style="width:20%">标题</td>
				<th style="width:20%;text-align:center;">是否设置默认图片<font color="red">(仅设置商家正面图为默认图片)</font></th>
				<td style="width:10%">排序</td>
				<td style="width:10%">删除</td>
			</tr>
		</table>
		<table class="input tabContent">
			<tr class="title">
				<th>
					请选择商家搜索标签:
				</th>
			</tr>
			<tr>
				<td>
					[#list tags as tag]
						[#if tag.type = 0]
							<label>
								<input type="checkbox" name="searchTagNames" value="${tag.name} " />${tag.name} 
							</label>
							[#if tag_index = 12]
							<br/>
							[/#if]
						[/#if]
					[/#list]
				</td>
			</tr>
			<tr class="title">
				<th>
					请选择商家评价标签:
				</th>
			</tr>
			<tr>
				<td>
					[#list tags as tag]
						[#if tag.type = 1]
							<label>
								<input type="checkbox" name="evaluateTagNames" value="${tag.name}" />${tag.name} 
							</label>
							[#if tag_index = 12]
							<br/>
							[/#if]
						[/#if]
					[/#list]
				</td>
			</tr>
			<tr class="title">
				<th>
					请选择商家服务标签:
				</th>
			</tr>
			<tr>
				<td>
					[#list tags as tag]
						[#if tag.type = 2]
							<label>
								<input type="checkbox" name="serveTagNames" value="${tag.name}" />${tag.name} 
							</label>
							[#if tag_index = 12]
							<br/>
							[/#if]
						[/#if]
					[/#list]
				</td>
			</tr>
		</table>
		<table class="input">
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
	<script>
		function changeChecked(obj){
			if(jQuery(obj).is(':checked')==true){
				jQuery(".imageDefault").val('false')
				jQuery(obj).next().val('true');
			}
		}
	</script>
</body>
</html>