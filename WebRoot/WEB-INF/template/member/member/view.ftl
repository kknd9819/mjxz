<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.member.view")}</title>
<meta name="author" content="云生源（shengyuan.cn）" />
<meta name="copyright" 云生源（shengyuan.cn） />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/common/jquery/jquery.tools.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/input.js"></script>
</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.member.view")}
	</div>
	<ul id="tab" class="tab">
		<li>
			<input type="button" value="账号信息" />
		</li>
		[#if accountVO?has_content]
			<li>
				<input type="button" value="资产信息" />
			</li>
		[/#if]
		[#if memberAuth??]
			<li>
				<input type="button" value="实名信息" />
			</li>
		[/#if]
	</ul>
	<table class="input tabContent">
		<tr>
			<th>头像</th>
			<td><img id="headPortraitPath" src="[#if (((member.portraitPath)!"")?trim) == ""]${webSiteUrl}/resources/images/login/member_index_default.jpg[#else][#if item.portraitPath?starts_with("http:")]${member.portraitPath}[#else]${siteUrl}${member.portraitPath}[/#if][/#if]" width="75px" class="photo_tx"></td>
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
				手机号码:
			</th>
			<td>
				${member.mobile}
			</td>
		</tr>
		<tr>
			<th>
				${message("admin.member.status")}:
			</th>
			<td>
				[#if !member.isEnabled]
					<span class="red">${message("admin.member.disabled")}</span>
				[#elseif member.isLocked]
					<span class="red"> ${message("admin.member.locked")} </span>
				[#else]
					<span class="green">${message("admin.member.normal")}</span>
				[/#if]
			</td>
		</tr>
		[#if member.isLocked]
			<tr>
				<th>
					${message("Member.lockedDate")}:
				</th>
				<td>
				[#if member.lockedDate??]	${member.lockedDate?string("yyyy-MM-dd HH:mm:ss")} [/#if]
				</td>
			</tr>
		[/#if]
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
				${message("Member.loginDate")}:
			</th>
			<td>
				${(member.loginDate?string("yyyy-MM-dd HH:mm:ss"))!"-"}
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
		<tr>
			<th>
				${message("Member.loginIp")}:
			</th>
			<td>
				${member.loginIp}
			</td>
		</tr>
		<tr>
			<th>
				${message("admin.member.reviewCount")}:
			</th>
			<td>
				${reviewNumber}
			</td>
		</tr>
		<tr>
			<th>
				${message("admin.member.favoriteMerchantCount")}:
			</th>
			<td>
				${favoriteMerchantCount}
			</td>
		</tr>
	</table>
	[#if accountVO?has_content]
		<table class="input tabContent">
			[#list accountVO as vo]
				<tr>
					<th>
						会员编号:
					</th>
					<td>
						${vo.memberAccount}
					</td>
				</tr>
				<tr>
					<th>
						资产编号:
					</th>
					<td>
						${vo.balanceAccount}
					</td>
				</tr>
				<tr>
					<th>
						当前余额:
					</th>
					<td>
						${vo.balanceVO.totalIncomeAmount}
					</td>
				</tr>
				<tr>
					<th>
						收益总额:
					</th>
					<td>
						${vo.balanceVO.balanceAmount}
					</td>
				</tr>
				<tr>
					<th>
						返现总金额:
					</th>
					<td>
						${vo.balanceVO.totalCashbackAmount}
					</td>
				</tr>
				<tr>
					<th>
						理财状态:
					</th>
					<td>
						[#if vo.financeVO.isEnabled == true]
							启用
						[#else]
							禁用
						[/#if]	
					</td>
				</tr>
				<tr>
					<th>
						理财金额:
					</th>
					<td>
						${vo.financeVO.financeAmount}
					</td>
				</tr>
				<tr>
					<th>
						冻结金额:
					</th>
					<td>
						${vo.financeVO.freezeAmount}
					</td>
				</tr>
				<tr>
					<th>
						实际金额:
					</th>
					<td>
						${vo.financeVO.actualAmount}
					</td>
				</tr>
				<tr>
					<th>
						昨日收益:
					</th>
					<td>
						${vo.financeVO.yesterdayIncomeAmount}
					</td>
				</tr>
				<tr>
					<th>
						累计益:
					</th>
					<td>
						${vo.financeVO.totalIncomeAmount}
					</td>
				</tr>
				<tr>
					<th>
						七日年化率:
					</th>
					<td>
						${vo.financeVO.sevenDayRate}
					</td>
				</tr>
			[/#list]
		</table>
	[/#if]
	
	[#if memberAuth??]
		<table class="input tabContent">
				<tr>
					<th>
						真实姓名:
					</th>
					<td>
						[#if memberAuth.realName??]
							${memberAuth.realName}	
						[/#if]
					</td>
				</tr>
				<tr>
					<th>
						证件类型:
					</th>
					<td>
						[#if memberAuth.idType == 0]
						身份证
						[/#if]
					</td>
				</tr>
				<tr>
					<th>
						身份证号:
					</th>
					<td>
					[#if memberAuth.idNo??]
						${memberAuth.idNo}	
					[/#if]
					</td>
				</tr>
				<tr>
				   <th>工资卡所属银行:</th>
				   <td>${memberAuth.bankName}</td>
				</tr>	
				<tr>
				   <th>工资银行卡号:</th>
				   <td>${memberAuth.bankCard}</td>
				</tr>
				<tr>
					<th>
						性别:
					</th>
					<td>
					[#if memberAuth.gender == 0]
						男
					[#else]
						女
					[/#if]
					</td>
				</tr>	
				<tr>
					<th>
						生日:
					</th>
					<td>
					[#if memberAuth.birthDate??]
						${memberAuth.birthDate}	
					[/#if]
					</td>
				</tr>	
				<tr>
					<th>
						状态:
					</th>
					<td>
					[#if memberAuth.status == 0]
						待审核	
					[#elseif memberAuth.status ==1]
						审核通过
					[#else]
						审核未通过
					[/#if]
					</td>		
				</tr>
				<tr>
				<th width="150px">
					身份证照:
				</th>
				[#if memberAuth.positivePath??]
				<td width="300px">
					<img src="${siteUrl}${memberAuth.positivePath}" width="280" height="160" >
				</td>
				[/#if]
				[#if memberAuth.backPath??]
				<td colspan="2">
					<img src="${siteUrl}${memberAuth.backPath}" width="280" height="160" >
				</td>
				[/#if]
			</tr>
		</table>
	[/#if]
	<table class="input">
		<tr>
			<th>
				&nbsp;
			</th>
			<td>
				<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
			</td>
		</tr>
	</table>
</body>
</html>