<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>财务提款审核</title>
<meta name="author" content="云生源（shengyuan.cn）" />
<meta name="copyright" content="云生源（shengyuan.cn）" />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.tools.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {
	[@flash_message /]
	
	$(".cashInfo").hide();
	
	$("#drawCashCancel").click(function() {
		$(".cashInfo").hide();
		$("#plan_draw_amount").html("");
		$("#auth_real_name").html("");
		$("#auth_id_type").html("");
		$("#auth_gender").html("");
		$("#auth_id_no").html("");
	});
	
	$("#drawCashSubmit").click(function() {
		var serialNumber = $("#serialNumberHidden").val();
		if (serialNumber == "") {
			alert("请先查询提款串号信息");
			return;
		}
		$.ajax({
			type : "POST",
			url : "/finance/withdrawal/check.jhtml",
			data : {"serialNumber" : serialNumber},
			dataType : "json",
			cache : false,
			success : function(msg) {
				if (msg.type == "success") {
					$("#drawCashSubmit").hide();
					alert("提现处理成功");
				} else {
					alert(msg.content);
				}
			},
			error : function(err) {
				alert("网络请求错误");
			}
		});
	});
	
	$("#serialButton").click(function() {
		if($("#serialNumber").val()==""){
			 $.message({"type":"warn","content":"提款串号不能为空"});
			 return;
		}
		$("#serialNumberHidden").val($("#serialNumber").val());
		$.ajax({
			type : "POST",
			url : "/finance/withdrawal/load.jhtml",
			data : {"serialNumber" : $("#serialNumber").val()},
			dataType : "json",
			cache : false,
			success : function(msg) {
				if (msg.type == "success") {
					var plan = msg.resultMap.plan;
					var auth = msg.resultMap.auth;
					if (plan) {
						$("#plan_asset_no").html(plan.assetNo);
						$("#plan_draw_amount").html(plan.drawAmount);
					}
					if (auth) {
						$("#auth_real_name").html(auth.realName);
						$("#auth_id_type").html(auth.idType==0?"身份证":"其他证件");
						$("#auth_gender").html(auth.gender==0?"男":"女");
						$("#auth_id_no").html(auth.idNo);
					}
					$(".cashInfo").show();
					if(plan && auth) {
						$("#drawCashSubmit").show();
					} else {
						$("#drawCashSubmit").hide();
					}
				} else {
					$.message(msg);
					$(".cashInfo").hide();
				}
			},
			error : function(err) {
				$.message({"type":"error","content":"网络请求错误"});
			}
		});
	});
});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 财务提款审核
	</div>
	<table class="input">
		<tr>
			<th>提款串号：</th>
			<td><input type="text" id="serialNumber" class="text" maxlength="100" />&nbsp;<input type="button" class="button" id="serialButton" value="确认"/></td>
		</tr>
	</table>
	<table class="input tabContent cashInfo">
		<input type="hidden" id="serialNumberHidden" value="" />
		<tr>
			<td colspan="4" align="center">提款申请信息</td>
		</tr>
		<tr>
			<th>提款账号：</th>
			<td id="plan_asset_no"></td>
			<th>提款金额：</th>
			<td id="plan_draw_amount"></td>
		</tr>
		<tr>
			<th>真实姓名：</th>
			<td id="auth_real_name"></td>
			<th>证件类型：</th>
			<td id="auth_id_type"></td>
		</tr>
		<tr>
			<th>性别：</th>
			<td id="auth_gender"></td>
			<th>证件号：</th>
			<td id="auth_id_no"></td>
		</tr>
	</table>
	<table class="input cashInfo">
		<tr>
			<th>
				&nbsp;
			</th>
			<td>
				<input id="drawCashSubmit" type="button" class="button" value="提款" />&nbsp;&nbsp;&nbsp;&nbsp;<input id="drawCashCancel" type="button" class="button" value="关闭" />
			</td>
		</tr>
	</table>
</body>
</html>