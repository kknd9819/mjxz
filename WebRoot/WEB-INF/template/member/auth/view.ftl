<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>查看实名制信息-  云生源（shengyuan.cn）你的消费很值钱！</title>
<meta name="author" content="云生源后台管理系统" />
<meta name="copyright" content="云生源后台管理系统" />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	$(function(){
		$("#btnCheck").click(function(){
			$("#status").val("1");
		});
		
		$("#btnUnCheck").click(function(){
			$("#status").val("2");
		});
	})
	
	[@flash_message /]
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 实名制信息
	</div>
	<form id="inputForm" action="view.jhtml" method="post">
		<input type="hidden" name="memberId" value="${autonym.memberId}" />
		<table class="input">
			<tr>
				<th width="150px">
					真实姓名:
				</th>
				<td colspan="3">
					${autonym.realName}
				</td>
			</tr>
			<tr>
				<th>
					证件号:
				</th>
				<td colspan="3">
					${autonym.idNo}
				</td>
			</tr>
			<tr>
				<th>
					性别:
				</th>
				<td colspan="3">
					[#if autonym.gender==0]
						<span class="gray">男</span>
					[#else]
						<span class="gray">女</span>
					[/#if]
				</td>
			</tr>
			<tr>
				<th>
					创建日期:
				</th>
				<td colspan="3">
					${autonym.createDate?string("yyyy-MM-dd HH:mm:ss")}
				</td>
			</tr>
			<tr>
				<th width="150px">
					身份证照:
				</th>
				<td width="300px">
					<img src="${siteUrl}${autonym.positivePath}" width="280" height="160" >
				</td>
				<td colspan="2">
					<img src="${siteUrl}${autonym.backPath}" width="280" height="160" >
				</td>
			</tr>
			<tr>
				<th>
					状态:
				</th>
				<td colspan="3">
                	[#if autonym.status==1]
                		审核通过
                	[#elseif autonym.status==2]
                		审核未通过
                	[#else]
                		待审核
                	[/#if]
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td colspan="3">
					<input type="hidden" id="status" name="status" value="" />
					<input type="submit" class="button" id="btnCheck" value="审核通过" />
					<input type="submit" class="button" id="btnUnCheck" value="审核未通过" />
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>