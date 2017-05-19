<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>收款管理</title>
<meta name="author" content="生源闪购（shengyuan.cn）" />
<meta name="copyright" 生源闪购（shengyuan.cn） />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/list.js"></script>
<script type="text/javascript" src="/resources/js/page.js"></script>
<script type="text/javascript" src="/resources/common/datePicker/WdatePicker.js"></script>
<style type="text/css">
table.list th {
	text-align: center;
}
table.list thead tr{
	POSITION: relative;  TOP:0px;
}

</style>
</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 支付流水管理<span></span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
	 <!--查询条件-->
		[#include "/payment/payment_trade/search.ftl" /]
		<!--end-->
		<!--列表头-->
		[#include "/payment/payment_trade/head.ftl" /]
		<!--end-->
	</form>
<script>

paymentForPage(1);
//收款分页查询及显示数据
function paymentForPage(currentPage){
		var beginDate = jQuery("#beginDate").val();
		var endDate = jQuery("#endDate").val();
		var orderSn = jQuery("#orderSn").val();
		var status =  jQuery("#status").val();
		var sn =  jQuery("#sn").val();
		$.ajax({
			url: "/admin/payment/paymentTrade/listAjax.jhtml",
			type: "GET",
			data:{beginDate:beginDate,endDate:endDate,orderSn:orderSn,status:status,sn:sn,pageSize:10,currentPage:currentPage},
			dataType: "json",
			cache: false,
			success: function(data) {
				jQuery("#paymentList").empty();
				var paymentDetail = "";
				if(data.content.length>0){
					jQuery.each(data.content, function(i, item) {
						paymentDetail += "<tr>";
						paymentDetail += "<td class='center'>";
						paymentDetail += "	<span>"+item.sn+"</span>";
						paymentDetail += "</td>";
						paymentDetail += "<td class='center'>";
						if(item.paymentPluginId == "alipayDirectPlugin"){
						   paymentDetail += "支付宝即时到账";
						} else if(item.paymentPluginId == "unionpayPlugin"){
							paymentDetail += "银联在线支付";
						} else if(item.paymentPluginId == "mobileUnionPay"){
							paymentDetail += "银联移动支付";
						} else if(item.paymentPluginId == "mobileAlipayWap"){
							paymentDetail += "支付宝移动网页支付";
						} else if(item.paymentPluginId == "mobileAlipaySecure"){
							paymentDetail += "支付宝移动快捷支付";
						} else if(item.paymentPluginId == "mobileUnionPay"){
							paymentDetail += "银联在线支付";
						} else if(item.paymentPluginId == "mobileUnionpayWap"){
							paymentDetail += "银联在线支付";
						} else if(item.paymentPluginId == "weixinPayPlugin"){
							paymentDetail += "微信支付";
						} else if (item.paymentPluginId == "jmlIntegralPlugin") {
							paymentDetail += "闪豆兑换";
						} else if (item.paymentPluginId == "mobileSyCardPlugin") {
							paymentDetail += "生源一卡通";
						} else if (item.paymentPluginId == "syCardPlugin") {
							paymentDetail += "生源一卡通";
						} else if (item.paymentPluginId == "weixinPublicPayPlugin") {
							paymentDetail += "微信公众号支付";
						}
						paymentDetail += "</td>";
						paymentDetail += "<td class='center'>";
						paymentDetail += item.amount;
						paymentDetail += "</td>";
						paymentDetail += "<td class='center'>";
						paymentDetail +=  item.orderSn;
						paymentDetail += "</td>";
						paymentDetail += "<td class='center'>";
						paymentDetail += "<span title='"+item.tradeNo+"'>"+item.tradeNo+"</span>"; 
						paymentDetail += "</td>";
						paymentDetail += "<td class='center'>";
						paymentDetail += "<span title='"+item.createDate+"'>"+item.createDate+"</span>"; 
						paymentDetail += "</td>";
						paymentDetail += "<td class='center'>"+item.statusName+"</td>";
						paymentDetail += "<td>";
						paymentDetail += "[@shiro.hasPermission name="paymentTrade:log"]<a href=javascript:findPaymentLog("+item.sn+")>[查看日志]</a>[/@shiro.hasPermission]	";
						paymentDetail +="</td>";
						paymentDetail +="</tr>";
					});
				}else{
					jQuery("#paymentList").append("<tr><td colspan='12' align='center'>暂无支付流水记录</td></tr>");
				}
				jQuery("#paymentList").append(paymentDetail);
				if(data.totalPage>1){
					pageInit("paymentPageDiv",data.currentPage,data.totalPage,"paymentForPage");
				}else{
					jQuery("#paymentPageDiv").empty();
				}
			}
		});
	}
 


 
function  findPaymentLog(sn) {
   	$.ajax({
		url: "/admin/payment/paymentLog/getPaymentLogBySn.jhtml",
		type: "GET",
		data:{sn:sn},
		dataType: "json",
		cache: false,
		success: function(data) {
			var html = "<div class='list' style='width:inherit;height:370px;overflow-x:auto;overflow-y:auto;'>"
				+"<table id='moreTable' class='list'>"
				+"<thead><tr><th>序号</th><th>步骤</th><th>步骤名称<\/th><th>创建时间</th><th>操作</th><\/tr></thead>";
			jQuery.each(data, function(i, item) {
			     html += "<tr>";
			     html += "<td style='width:10%;'>"+(i+1)+"</td>";
			     html += "<td>"+item.step+"</td><td>"+item.stepName+"</td>";
				 html += "<td style='width:30%;'><span title='"+item.createDate+"'>"+item.createDate+"</span></td><td style='width:20%;'></td>";
				 html += "</tr>";
			});
		 
			html +="</table></div>";
			
			$.dialog({
				title: "支付日志",
				content: html,
				width: 650,
				height: 450,
				modal: true,
				ok: "关&nbsp;&nbsp;闭"
		   });
		}
	});
}

</script>
</body>
</html>