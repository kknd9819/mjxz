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
<script type="text/javascript" src="/resources/common/thirdparty/jquery.min.js"></script>
<script type="text/javascript" src="/resources/common/thirdparty/ajaxfileupload.js"></script>
<script type="text/javascript" src="/resources/common/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {
	var $inputForm = $("#inputForm");
	
	[@flash_message /]
	
	
	
	$("#submit").live("click",function(e){
			var subject = $("#subject").val();
			if(subject==""){
			 	alert("薪资主题不能为空！");
				return false;
			}
			ajaxFileUploadPositive("btnFilePositive");
	});
	
	function ajaxFileUploadPositive(btnFilePositive) {
	 var subject = $("#subject").val();
		$.ajaxFileUpload ({
			url:'/finance/salary/saveUpload.jhtml?subject='+subject, 
			secureuri:false,
			fileElementId:btnFilePositive,
			dataType: 'json',
			success: function (data, status){
        		if(data.message.type == "success"){
        			alert(data.message.content);
					setTimeout(function(){location.href="/finance/salary/list.jhtml"},2000); 
        		}else if(data.message.type == "warn"){
					 if(confirm(data.message.content)){
					  	$("#subject").attr('readonly',"readonly");
					  	$("#submit").attr('disabled',"true");
					  	var last=JSON.stringify(data.errorList); 
						location.href="/finance/salary/load.jhtml?date="+last;
						 	
					 }
        		}else{
        			alert(data.message.content);
        		}
			},
		   error: function (data, status, e){
	
			}
		})
		
		return false;
	}

});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">首页</a> &raquo; 添加薪资计划
	</div>
	<form id="inputForm" action="save.jhtml" method="post"  enctype="multipart/form-data">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="添加薪资计划" />
			</li>
		</ul>
		<table class="input tabContent">
			<tr>
				<th>
					<span class="requiredField">*</span>薪资主题:
				</th>
				<td>
					<input type="text" id="subject" name="subject" class="text" maxlength="100" size="50" />
					<a target='_blank' href='${base}/download/salaryBills_template.xls'>&nbsp;&nbsp; &nbsp;点击下载工资单模板</a>
				</td>
			</tr>
			<tr>
				<th>
				</th>
				<td>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField"></span>导入工资单:
				</th>
				<td>
				<input type="file" id= "btnFilePositive" name="filepositive"/>
				</td>
			</tr>
		</table>
	
		<table class="input">
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="button" id="submit" class="button" value="提交" />
					<input type="button" class="button" value="返回" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>