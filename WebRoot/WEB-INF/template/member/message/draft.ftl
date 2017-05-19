[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>消息编辑 -  生源闪购（shengyuan.cn）闪亮生活，购你喜欢！</title>
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
	[@flash_message /]
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
                remote: "该手机号码不存在"
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
		<a href="${base}/admin/common/index.jhtml">首页</a> &raquo;消息编辑
	</div>
	<form id="inputForm" action="send.jhtml" method="post">
		<input type="hidden" id="isDraft" name="isDraft" value="${(message.isDraft)}" />
		<input type="hidden" id="isAdd" name="isAdd" value="false" />
		<input type="hidden" id="id" name="id" value="${(message.id)}" />
		<table class="input">
			<tr>
				<th>
                                                 手机号码:
				</th>
				<td>
					<input type="text" name="mobile" class="text" maxlength="20" value="${(mobile)}"></input>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>消息标题:
				</th>
				<td>
					<input type="text" name="title" class="text" maxlength="200" value="${(message.title)!}" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>消息内容:
				</th>
				<td>
					<textarea name="content" class="text">${(message.content?html)!}</textarea>
				</td>
			</tr>
			<tr>
				<th>
					 <span class="requiredField">*</span>消息类型:
				</th>
				<td>
		            <label> 
					      <input type="radio" name="messageType" value="0"  [#if message.messageType==0] checked="checked" [/#if]/>系统消息
					</label>
					<label>
						  <input type="radio" name="messageType" value="1" [#if message.messageType==1] checked="checked" [/#if]/>理财消息					
					</label>
				 </td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td id="test">
					<input type="button" id="send" class="button" value="立即发送" />
					<input type="button" id="save" class="button" value="保存为草稿" />
					<span id='codeTip'></span>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>