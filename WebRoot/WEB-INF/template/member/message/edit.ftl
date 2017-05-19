<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.message.edit")}</title>
<meta name="author" content="生源闪购（shengyuan.cn）" />
<meta name="copyright" 生源闪购（shengyuan.cn） />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
	<script type="text/javascript" src="/resources/common/jquery/jquery.tools.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {
	var $inputForm = $("#inputForm");
	var $isDraft = $("#isDraft");
	var $send = $("#send");
	var $save = $("#save");

	// 立即发送
	$send.click(function() {
		$isDraft.val("false");
		$inputForm.submit();
	});
	
	// 保存为草稿
	$save.click(function() {
		$isDraft.val("true");
		$inputForm.submit();
	});

	// 表单验证
	$inputForm.validate({
		rules: {
			mobile: {
				remote: {
					url: "check_mobile.jhtml",
					cache: false
				}
			},
			title: {
				required: true
			},
			content: {
				required: true,
				maxlength: 1000
			},
			messageType: {
				required: true
			},
		},
		messages: {
            mobile: {
                remote: "${message("admin.message.memberNotExsit")}"
            },
            title: {
                required:"${message("admin.message.title.notNull")}"
            },
            content: {
                required:"${message("admin.message.content.notNull")}",
                maxlength:"${message("admin.message.content.maxlenth")}"
            }
        }
	});
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.message.edit")}
	</div>
	<form id="inputForm" action="send.jhtml" method="post">
		<input type="hidden" id="isDraft" name="isDraft" value="false" />
		<table class="input">
			<tr>
				<th>
                    <span class="requiredField">*</span>${message("Message.receiver")}:
				</th>
				<td>
					
					<input type="text" name="mobile" class="text" maxlength="20"
						[#if message.memberMobile??]
							value="${message.memberMobile}"
						[/#if ] />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Message.title")}:
				</th>
				<td>
					<input type="text" name="title" class="text" maxlength="200" 
					[#if messageTitle??]
						value="${messageTitle}"
					[/#if]
					 />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Message.content")}:
				</th>
				<td>
					<textarea name="content" class="text">
						[#if messageContent??]
							value=${messageContent}
						[/#if]
					</textarea>
				</td>
			</tr>
			<tr>
				<th>
					 <span class="requiredField">*</span>消息类型:
				</th>
				<td>
		            <label> 
					      <input type="radio" name="messageType" value="0" 
					      	[#if messageType == 0]
					      	 checked="checked"
					      	[/#if]
					      />系统消息
					</label>
					<label>
						  <input type="radio" name="messageType" value="1"  
						  	[#if messageType == 1]
					      	 checked="checked"
					      	[/#if]
						  />理财消息					
					</label>
				 </td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="button" id="send" class="button" value="${message("admin.message.submit")}" />
					<input type="button" id="save" class="button" value="${message("admin.message.saveDraft")}" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>