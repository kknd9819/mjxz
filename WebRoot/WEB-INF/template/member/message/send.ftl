<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.message.send")} -  生源闪购（shengyuan.cn）闪亮生活，购你喜欢！</title>
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
		var $radio= $('input:radio[name="messageType"]:checked');
		var $mobile= $('input:text[name="mobile"]');
		if($radio.val() == 1 && $mobile.val()==""){
			$("#codeTip").html("理财消息,手机号码不能可为空");
			return;
		}else{
			$isDraft.val("false");
			$inputForm.submit();
		}
		
	});
	
	// 保存为草稿
	$save.click(function() {
		var $radio= $('input:radio[name="messageType"]:checked');
		var $mobile= $('input:text[name="mobile"]');
		if($radio.val() == 1 && $mobile.val()==""){
			$("#codeTip").html("理财消息,手机号码不能可为空");
			return;
		}else{
			$isDraft.val("true");
			$inputForm.submit();
		}
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
                required:"消息标题不能为空"
            },
            content: {
                required:"消息内容不能为空"
            }
        }
	});
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.message.send")}
	</div>
	<form id="inputForm" action="send.jhtml" method="post">
		<input type="hidden" id="isDraft" name="isDraft" value="false" />
		<input type="hidden" id="isAdd" name="isAdd" value="true" />
		<table class="input">
			<tr>
				<th>
                    ${message("Message.receiver")}:
				</th>
				<td>
					<input type="text" name="mobile" class="text" maxlength="20"></input>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Message.title")}:
				</th>
				<td>
					<input type="text" name="title" class="text" maxlength="200" value="${(draftMessage.title)!}" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Message.content")}:
				</th>
				<td>
					<textarea name="content" class="text">${(draftMessage.content?html)!}</textarea>
				</td>
			</tr>
			<tr>
				<th>
					 <span class="requiredField">*</span>消息类型:
				</th>
				<td>
		            <label> 
					      <input type="radio" name="messageType" value="0"/>系统消息
					</label>
					<label>
						  <input type="radio" name="messageType" value="1"/>理财消息					
					</label>
				 </td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td id="test">
					<input type="button" id="send" class="button" value="${message("admin.message.submit")}" />
					<input type="button" id="save" class="button" value="${message("admin.message.saveDraft")}" />
					<span id='codeTip'></span>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>