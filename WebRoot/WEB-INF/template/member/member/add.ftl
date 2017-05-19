<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.member.add")} -  云生源（shengyuan.cn）你的消费很值钱！</title>
<meta name="author" content="云生源（shengyuan.cn）" />
<meta name="copyright" 云生源（shengyuan.cn） />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.tools.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.lSelect.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/input.js"></script>
<script type="text/javascript" src="/resources/common/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {
	var $inputForm = $("#inputForm");
	
	[@flash_message /]
	
	
	// 表单验证
	$inputForm.validate({
		rules: {
			nickName: {
				required:true,
				pattern: /^[0-9a-z_A-Z\u4e00-\u9fa5]+$/,
				minlength: 1,
				maxlength: 10
			},
			mobile:{
				required:true,
				pattern: /^1[34589]\d{9}$/,
				remote: {
					url: "check_mobile.jhtml",
					cache: false
				}
			},
			idCard:{
				required:true,
				pattern:/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/,
				remote:{
					url: "check_idCard.jhtml",
					cache: false
				}		
			},
			realname:{
				required:true,
				minlength:2,
				maxlength:5
			}
		},
			messages: {
				nickName: {
					pattern: "非法字符"
				},
				mobile:{
					pattern:"非法字符",
					remote: "手机号被禁用或已存在"
				},
				idCard:{
					pattern:"这不是一个身份证",
					remote:"身份证已存在或不是有效身份证"
				},
				realname:{
					minlength:"最少两个字",
					maxlength:"字数太多了"
				}
			}
	});

});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.member.add")}
	</div>
	<form id="inputForm" action="save.jhtml" method="post">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="${message("admin.member.base")}" />
			</li>
		</ul>
		<table class="input tabContent">
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Member.nickname")}:
				</th>
				<td>
					<input type="text" id="nickName" name="nickName" class="text" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Member.idCard")}:
				</th>
				<td>
					<input type="text" id="idCard" name="idCard" class="text"  maxlength="25" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Member.mobile")}:
				</th>
				<td>
					<input type="text" id="mobile" name="mobile" class="text"  maxlength="11" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>真实姓名:
				</th>
				<td>
					<label>
						<input type="text" id="realname" name="realname" class="text" maxlength="10"/>
					</label>
				</td>
			</tr>
		</table>
	
		<table class="input">
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
	</form>
</body>
</html>