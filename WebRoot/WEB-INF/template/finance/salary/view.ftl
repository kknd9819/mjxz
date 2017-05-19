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
<script type="text/javascript" src="/resources/common/datePicker/WdatePicker.js"></script>

<script type="text/javascript" src="/resources/common/thirdparty/jquery.min.js"></script>
<script type="text/javascript" src="/resources/common/thirdparty/ajaxfileupload.js"></script>
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
			url:'/finance/salary/updateUpload.jhtml?subject='+subject+"&id=${salaryPlan.id}", 
			secureuri:false,
			fileElementId:btnFilePositive,
			dataType: 'json',
			success: function (data, status){
        		if(data.message.type == "success"){
        			alert(data.message.content);
					setTimeout(function(){location.href="/finance/salary/list.jhtml"},2000); 
					
					
				}else if(data.message.type == "warn"){
					if(confirm(data.message.content)){
					  //	$("#subject").attr('readonly',"readonly");
					  //	$("#submit").attr('disabled',"true");
					  	
						$.ajax({
							url: "/finance/salary/getSalaryBillsInfo.jhtml?id=${salaryPlan.id}",
							type: "POST",
							dataType: "json",
							cache: false,
							success: function(date) {
								if(date.message.type=="success"){
									var html = "";
									$.each(date.billsList, function(i, item) {
										html+="<tr>";
										html +="<td>"+item.realName+"<\/td><td>"+item.accountNo+"<\/td><td>"+item.salaryAmount+"<\/td>"
										html+="<\/tr>";
									});
									
									$("#tabBills tr:gt(0)").remove();
									$("#tabBills").append(html);
								}
								
							}
						})
						
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
		<a href="${base}/admin/common/index.jhtml">首页</a> &raquo; 编辑查看
	</div>
	<form id="inputForm"  method="post"  enctype="multipart/form-data">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="薪资计划" />
			</li>
		</ul>
		<table class="input tabContent">
			<tr>
				<th>
					<span class="requiredField">*</span>薪资主题:
				</th>
				<td>
					<input type="text" id="subject" name="subject" value=${salaryPlan.subject} class="text" maxlength="100" size="50" />
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
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="工资单" />
			</li>
		</ul>
	<table class="input tabContent" id="tabBills">
			<tr>
				<td>姓名
				</td>
				<td>资金账号
				</td>
				<td>工资
				</td>
			</tr>
			<tr>
			[#list salaryBills as salary]
				<td>${salary.realName}
				</td>
				<td>${salary.accountNo}
				</td>
				<td>${salary.salaryAmount}
				</td>
				</tr>
			[/#list]
			
		</table>
		<table class="input">
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					[#if salaryPlan.auditStatus==1]
						已审核，不能修改
					[#else]
						<input type="button"id="submit" class="button" value="提交" />
					[/#if]
					<input type="button" class="button" value="返回" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>