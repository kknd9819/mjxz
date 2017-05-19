<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.member.edit")}</title>
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
			password: {
				pattern: /^[^\s&\"<>]+$/,
				minlength:6,
				maxlength:20
			},
			rePassword: {
				equalTo: "#loginPassword"
			}
		},
		messages: {
			password: {
				pattern: "非法字符"
			}
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 编辑会员
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${member.id}" />
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="${message("admin.member.base")}" />
			</li>
			<li>
				<input type="button" value="账号解锁" />
			</li>
		</ul>
		<table class="input tabContent">
			<tr>
				<th>头像</th>
				<td><img id="headPortraitPath" src="[#if (((member.portraitPath)!"")?trim) == ""]${webSiteUrl}/resources/images/user.jpg[#else][#if item.portraitPath?starts_with("http:")]${member.portraitPath}[#else]${siteUrl}${member.portraitPath}[/#if][/#if]" width="75px" class="photo_tx"></td>
			</tr>
			<tr>
				<th>
					${message("Member.username")}:
				</th>
				<td>
					${member.nickName}
				</td>
			</tr>
			<tr>
				<th>
					${message("Member.password")}:
				</th>
				<td>
					<input type="password" id="loginPassword" name="loginPassword" class="text" maxlength="20" title="若留空则密码将保持不变" />
				</td>
			</tr>
			<tr>
				<th>
					确认密码: 
				</th>
				<td>
					<input type="password" name="rePassword" class="text" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.common.setting")}:
				</th>
				<td>
					<label>
						<input type="checkbox" name="isEnabled" value="true"[#if member.isEnabled] checked="checked"[/#if] />${message("Member.isEnabled")}
						<input type="hidden" name="_isEnabled" value="false" />
					</label>	 
<!-- 					[#if member.isLocked] -->
<!-- 						<label> -->
<!-- 							<input type="checkbox" name="isLocked" value="true" checked="checked" />${message("Member.isLocked")} -->
<!-- 							<input type="hidden" name="_isLocked" value="false" /> -->
<!-- 						</label> -->
<!-- 					[/#if] -->
				</td>
			</tr>
			
<!-- 			<tr> -->
<!-- 				<th> -->
<!-- 					是否锁定: -->
<!-- 				</th> -->
<!-- 				<td> -->
<!-- 					<label> -->
<!-- 						<input type="radio" name="isLocked" value="true"   -->
<!-- 						 [#if member.isLocked == false] checked="checked" [/#if] -->
<!-- 						/>解锁 -->
<!-- 						<input type="radio" name="isLocked" value="false"  [#if member.isLocked == true] checked="checked" [/#if] />锁定 -->
<!-- 					</label>	   -->
<!-- 				</td> -->
<!-- 			</tr> -->
			
			<tr>
				<th>
					${message("admin.common.createDate")}:
				</th>
				<td>
					${member.createDate?string("yyyy-MM-dd HH:mm:ss")}
				</td>
			</tr>
			<tr>
				<th>
					${message("Member.registerIp")}:
				</th>
				<td>
					${member.registerIp}
				</td>
			</tr>
			[@shiro.hasPermission name="member:setpwd"]
			<tr>
				<th>
					${message("admin.common.setpwd")}</a>	
				</th>	
				<td>
					<input type="checkbox"  id="setPwd" name="setPwd"  />
				</td>
			</tr>
			[/@shiro.hasPermission]
		</table>
		
		<table class="input tabContent">
			[#if memberAsset.lockedDate??]
				<tr>
					<th>支付锁定时间:</th>
					<td>
						${memberAsset.lockedDate?string("yyyy-MM-dd HH:mm:ss")}
					</td>
				</tr>
				<tr>
					<th>解除支付锁定</th>
					<td>
						<input  type="checkbox"  name="removeAssetLock" />
					</td>
				</tr>
			[/#if]
			[#if member.lockedDate??]
				<tr>
					<th>登录锁定时间:</th>
					<td>${member.lockedDate?string("yyyy-MM-dd HH:mm:ss")}</td>
				</tr>
				<tr>
					<th>解除登录锁定</th>
					<td>
						<input  type="checkbox" name="removeLoginLock" />
					</td>
				</tr>
			[/#if]
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