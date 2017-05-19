<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.articleCategory.list")} -  生源闪购（shengyuan.cn）闪亮生活，购你喜欢！</title>
<meta name="author" content="生源闪购（shengyuan.cn）" />
<meta name="copyright" 生源闪购（shengyuan.cn） />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/list.js"></script>
<script type="text/javascript">
	$().ready(function() {
		[@flash_message /]
	});
	
	function deleteProductCategory(pcid){	
		if(pcid != ""){					
			$.dialog({
				type: "warn",
				content: "${message("admin.dialog.deleteConfirm")}",
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
								$("#tr_"+pcid).remove();;
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
			});
	    }
	}
	
	
	function showProductCategory(pcid,grade,treePath){
		if(pcid != ""){
			$.ajax({
				url: "zllist.jhtml",
			  	data: "POST",
			  	data: {id: pcid},
			  	dataType: "json",
			  	success: function(msg){
			  		if (msg.message.type == "success") {
			  		    if(msg.articleCategorys.length>0){
			  		       removeTr(pcid,treePath);		
			  		    }			  			
			  				  						  		
			  			$.each(
							$("table:first tbody tr"), 
							function(i ,tr){
							    var grades = grade+1;
							   
								if($(this).attr("id") == ("tr_" + pcid)){
								   
									var curRow = $("table:first tbody tr:eq("+i+")") ;
									
									for(var j=0;j<msg.articleCategorys.length;j++){
										
									   //处理排序显示null值的问题
									   if(msg.articleCategorys[j].orders==null){
									      msg.articleCategorys[j].orders = "";
									   }//end
									  
									   //判断当前产生的行是否已经存在，存在就删除
									   if(jQuery("#tr_"+msg.articleCategorys[j].id)){
									      jQuery("#tr_"+msg.articleCategorys[j].id).remove();
									   }//end
									  
									   if(msg.articleCategorys[j].grade==grades){
										str='<tr id=tr_'+msg.articleCategorys[j].id+' class=subCss>' +
											'<td>'+
												'<span style=margin-left:'+(msg.articleCategorys[j].grade * 20)+'px;[#if '+msg.articleCategorys[j].grade+' == 0] color: #000000;[/#if]>'+ msg.articleCategorys[j].name +'</span>'+
											'</td>' +
											'<td>' + '<p>';
											if(msg.articleCategorys[j].position==0){
										    	str +=  '${message("ArticleCategory.type.guide")}';
											}else if(msg.articleCategorys[j].position==1){
											    str +=  '${message("ArticleCategory.type.about")}';
											}else if(msg.articleCategorys[j].position==2){
												str +=  '小贴士';
											}
											str += '</p>' + '</td>' +
											'<td>' + msg.articleCategorys[j].orders + '</td>' +
											'<td>'+												
												'<a href=edit.jhtml?id='+msg.articleCategorys[j].id+'>[${message("admin.common.edit")}]</a>' +
												'<a href=javascript:deleteProductCategory('+msg.articleCategorys[j].id+'); class=delete>[${message("admin.common.delete")}]</a>'+
												'<a href=javascript:showProductCategory('+msg.articleCategorys[j].id+','+msg.articleCategorys[j].grade+',\''+msg.articleCategorys[j].treePath+'\');>[子类]</a>'+
											'</td>' +
										 '</tr>';
										 curRow.after(str);
										 
										 }//end if
										 
									}//end for
									
								}//end if
								
							});//end each	
									  			
					}else{
						alert("数据加载失败！");
					}
					
					//<a href=${webSiteUrl}'+msg.articleCategorys[j].path+' target=_blank>[${message("admin.common.view")}]</a>
			  	}					  
			});
		}		
	}
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.articleCategory.list")}
	</div>
	<form id="listForm" action="list.jhtml" method="get">
	<div class="bar">
		[@shiro.hasPermission name="articleCategory:add"]
			<a href="add.jhtml" class="iconButton">
				<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
			</a>
		[/@shiro.hasPermission]
		<a href="javascript:;" id="refreshButton" class="iconButton">
			<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
		</a>
	</div>
	<table id="listTable" class="list">
		<tr>
			<th>
				<span>${message("ProductCategory.name")}</span>
			</th>
			<th>
				<span>${message("ArticleCategory.type")}</span>
			</th>
			<th>
				<span>${message("admin.common.order")}</span>
			</th>
			<th>
				<span>${message("admin.common.handle")}</span>
			</th>
		</tr>
		
		<tbody>
		[#list page as articleCategory]
			<tr id="tr_${articleCategory.id}" class="abc" >
				<td>
					<span style="margin-left: ${articleCategory.grade * 20}px;color: #000000;">
						${articleCategory.name}
					</span>
				</td>
				<td>
					${articleCategory.typeName}
				</td>
				<td>
					${articleCategory.orders}
				</td>
				<td>
					[@shiro.hasPermission name="articleCategory:view1"]
						<a href="${webSiteUrl}${articleCategory.path}" target="_blank">[${message("admin.common.view")}]</a>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="articleCategory:edit"]
						<a href="edit.jhtml?id=${articleCategory.id}">[${message("admin.common.edit")}]</a>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="articleCategory:delete"]
						<a href="javascript:deleteProductCategory('${articleCategory.id}');" class="delete">[${message("admin.common.delete")}]</a>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="articleCategory:category"]
						[#if articleCategory.grade == 0]
							<a href="javascript:showProductCategory('${articleCategory.id}','${articleCategory.grade}','${articleCategory.treePath}');" >[子类]</a>
						[/#if]
					[/@shiro.hasPermission]
				</td>
			</tr>
		[/#list]
		</tbody>
	</table>
	
	[@pagination pageNumber = page.currentPage totalPages = page.totalPage]
			[#include "/common/pagination.ftl"]
		[/@pagination]
	</form>
</body>
</html>