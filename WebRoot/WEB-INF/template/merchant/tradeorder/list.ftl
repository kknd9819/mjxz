[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>订单列表 -  云生源（shengyuan.cn）你的消费很值钱！</title>
<meta name="author" content="云生源后台管理系统" />
<meta name="copyright" content="云生源后台管理系统" />
<link type="text/css" href="/resources/css/common.css" rel="stylesheet"/>
<script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/page.js"></script>
<script type="text/javascript" src="/resources/js/phone.js"></script>
<script type="text/javascript" src="/resources/common/datePicker/WdatePicker.js"></script>
<style type="text/css">
	.contentDiv{
		margin-bottom:5px;
		padding:8px; 
		border:1px solid #E9E9E9; 
		background-color:#EEF1F8;
		height:70px;
	}
	.contentDiv .queryConditionDiv {
		float:left; 
		width:800px; 
		border-right:1px solid #C4B8AB;
	}
	.contentDiv .queryBtnDiv {
		float:left; 
	<!--	width:15%;-->
		margin-left:35px;
		margin-top:25px;
		height:58px;
	}
	.contentDiv .queryBtnDiv .queryBtn{
		border: 1px solid #cccccc;
		color:white;
		background-color:#FF8000;
		padding: 9px 30px;cursor:pointer;
		margin-left:24px;
	}
	ul.ztree {
		margin-top: 10px;
		border: 1px solid #617775;
		background: #f0f6e4;
		width: 220px;
		height: 300px;
		overflow-y: auto;
		overflow-x: auto;
	}
	
	.ztree li {
		background:#f0f6e4;
	}
	
	input[type="text"]{
		width:120px;
		padding-left:2px;
	}
</style>
<script type="text/javascript">
	$().ready(function() {
		[@flash_message /]
		
		orderForPage(1);
		var $sort = $("#listTable a.sort");
		var $orderProperty = $("#orderProperty");
		var $orderDirection = $("#orderDirection");
		 
		$sort.click( function() {
			var orderProperty = $(this).attr("name");
			if ($orderProperty.val() == orderProperty) {
				if ($orderDirection.val() == "ASC") {
					$orderDirection.val("DESC");
				} else {
					$orderDirection.val("ASC");
				}
			} else {
				$orderProperty.val(orderProperty);
				$orderDirection.val("ASC");
			}
			
			if ($orderProperty.val() != "") {
				$("#listTable a").removeClass("desc");
			    $("#listTable a").removeClass("asc");
				$sortProperty = $("#listTable a[name='" + $orderProperty.val() + "']");
				if ($orderDirection.val() == "ASC") {
					$sortProperty.removeClass("desc").addClass("asc");
				} else {
					$sortProperty.removeClass("asc").addClass("desc");
				}
			}
			
			orderForPage($("#pageNumber").val());
		});
	});
	
	
	
	//查询交易订单
	function orderForPage(currentPage){
		var tradeNo = $("#tradeNo").val();
		var mobile = $("#mobile").val();
		var assetType = $("#assetType").val();
		var hasRefund = $("#hasRefund").val();
		var nickName = $("#nickName").val();
		var createTime = $("#createTime").val();
		var endTime = $("#endTime").val();
		var tradeState = $("#tradeState").val();
		var merchantCode = $("#merchantCode").val();
		var orderProperty = $("#orderProperty").val();
		var orderDirection = $("#orderDirection").val();
		var merchantCode = $("#merchantCode").val();
		var deliverData = {pageNumber:currentPage,merchantCode:merchantCode,tradeNo:tradeNo,mobile:mobile,assetType:assetType,hasRefund:hasRefund,nickName:nickName,createTime:createTime,endTime:endTime,tradeState:tradeState,merchantCode:merchantCode,orderProperty:orderProperty,orderDirection:orderDirection};
		$("#loading").show();
		var getCouponForPage = "/merchant/tradeorder/tradeList.jhtml";
		jQuery.getJSON(getCouponForPage,deliverData,function(data){
			jQuery("#orderList").empty();
			jQuery("#totalSize").html(data.count);
			var orderDetail = "";
			if(data.items.length > 0) {
				jQuery.each(data.items, function(i, item) {
					orderDetail += "<tr>";
					orderDetail += "<td>";
					orderDetail += "<span>"+item.tradeNo+"</span><br><span class='red'>&#65509;"+item.tradeAmount+"</span><br><span>"+item.merchantName+"</span>";
					orderDetail += "</td>";
					orderDetail += "<td>";
					orderDetail += "<span>"+item.nickName+"</span><br><span>"+item.mobile+"</span>";
					orderDetail += "</td>";
					orderDetail += "<td>";
					orderDetail += "<span>";
					if(item.assetType == 0) {
						orderDetail += "消费余额";
					} else if(item.assetType == 1) {
						orderDetail += "理财通";
					} else if(item.assetType == 2) {
						orderDetail += "一卡通";
					}
					orderDetail += "</span>";
					orderDetail += "</td>";
					orderDetail += "<td>";
					orderDetail += "<span>";
					if(item.tradeState == 0) {
						orderDetail += "待交易";
					} else {
						orderDetail += "交易完成";
					}
					orderDetail += "</span>";
					orderDetail += "</td>";
					orderDetail += "<td>";
					orderDetail += "<span title='"+item.createTime+"'><p>"+item.createTime+"</p>";
					orderDetail += "</td>";
					orderDetail += "<td>";
					if(item.tradeTime != null && item.tradeTime != ''){
						orderDetail += "<span title='"+item.tradeTime+"'><p>"+item.tradeTime+"</p>";
					}else{
						orderDetail += "<span><p>-</p></span>";
					}
					orderDetail += "</td>";
					orderDetail += "<td>";
					orderDetail += "<span>";
					if(item.hasRefund) {
						orderDetail += "是";
					} else {
						orderDetail += "否";
					}
					orderDetail += "</span>";
					orderDetail += "</td>";
					orderDetail += "<td>";
					orderDetail += "[@shiro.hasPermission name='normalOrder:view']<a href='/merchant/tradeorder/tradeView.jhtml?tradeNo="+item.tradeNo+"'>[订 单 查 看]</a>[/@shiro.hasPermission]";
					orderDetail += "</td>";
					orderDetail += "</tr>";
				});
			} else {
				jQuery("#orderList").append("<tr><td colspan='12' align='center'>暂无订单信息</td></tr>");
			}
			jQuery("#orderList").append(orderDetail);
			$(".total").text(data.count);
			if(data.pageCount>1) {
				pageInit("orderPageDiv",data.currentPage,data.pageCount,"orderForPage");
			} else {
				jQuery("#orderPageDiv").empty();
			}
			jQuery("#loading").hide();
		});
	}
</script>
</head>
<body>
	<!-- 顶部 -->
	<div id="loading" class="loading" style="display: none;top:40%;">
		<img src="/resources/images/loading_icon.gif"/>正在加载中，请稍后。
	</div>
	<div class="path">
		<a href="/admin/common/index.jhtml">首页</a> &raquo; 订单列表 <span>(共<span class="total"></span>条记录)</span>
	</div>
	<!-- end -->
	<form action="#" method="post">
		<input type="hidden" id="orderProperty"/> 
		<input type="hidden" id="orderDirection"/>
		<input type="hidden" id="merchantCode" value="${merchantCode}"/>
		<!-- 条件 -->
		<table class="fieldset_t">
			<tr>
				<td>
					<label>订单编号:</label>
					<input id="tradeNo" name="tradeNo" maxlengh="20"/>
				</td>
			    <td> 
					<label>手机号码 :</label>
					<input id="mobile" name="mobile" maxlengh="11"/>
				</td>
				<td>
					<label>交易方式:</label>
					<select id="assetType" name="assetType">
						<option value="">全部</option>
						<option value="0">消费余额</option>
						<option value="1">理财通</option>
						<option value="2">一卡通</option>
					</select>
				</td>
				<td>
					<label>是否退款:</label>
					<select id="hasRefund" name="hasRefund">
						<option value="">全部</option>
						<option value="true">是</option>
						<option value="false">否</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<label>会员昵称:</label>
					<input id="nickName" name="nickName" maxlengh="20"/>
				</td>
				 
				 <td>
					<label>创建时间:</label>
					<input type="text" id="createTime" name="createTime" class="Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', maxDate: '#F{$dp.$D(\'createTime\')}'});" />
					<label>至</label>	
					<input type="text" id="endTime" name="endTime" class="Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '#F{$dp.$D(\'endTime\')}'});" />
				</td>
				
				 <td>
					<label >交易状态:</label>
					<select id="tradeState" name="tradeState">
						<option value="">全部</option>
						<option value="0">待交易</option>
						<option value="1">交易完成</option>
					</select> 
				 </td>
				<td>
					<input type="button" class="button" value="查询订单" onclick='orderForPage(1);'/>
					<input type="submit" class="button" value="返回" onclick="javascript:history.go(-1);" />
				</td>
			</tr>
		</table>
		<!-- end -->
		<!-- 订单列表 -->
		<table id="listTable" class="list">
			<tr>
				<th>
					<a href="javascript:;" class="sort" name="trade_no">订单号/金额/所属商家</a> 
				</th>
				<th>
					<a href="javascript:;" class="sort" name="nick_name">会员昵称/手机号码</a>
				</th>
				<th>
					 交易方式 
				</th>
				<th>
					  交易状态 
				</th>
				<th>
					<a href="javascript:;" class="sort" name="create_time">创建时间</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="trade_time">交易时间</a>
				</th>
				<th>
					<span>是否有退款</span>
				</th>
				<!-- <th> -->
				<!-- <span>打印</span> -->
				<!-- </th> -->
				<th>
					<span>操作</span>
				</th>
			</tr>
			<tbody id="orderList"></tbody>
		</table>
		<!-- 分页 -->
		<div class="pagination" id="orderPageDiv"></div>
	</form>
</body>
</html>