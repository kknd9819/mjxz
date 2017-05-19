<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>商家结算管理 -  云生源！</title>
    <meta name="author" content="云生源" />
    <meta name="copyright" 云生源 />
    <link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/finance.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/resources/common/jquery/jquery.js"></script>
    <script type="text/javascript" src="/resources/common/jquery/jquery.validate.js"></script>
    <script type="text/javascript" src="/resources/common/jquery/jquery.tools.js"></script>
    <script type="text/javascript" src="/resources/js/list.js"></script>
    <script type="text/javascript" src="/resources/common/datePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/resources/js/common.js"></script>
    <script type="text/javascript">
        function orderDetail(merchantCode) {
            window.location.href="/merchant/tradeorder/list.jhtml?merchantCode="+merchantCode;
		}
    </script>
</head>
<body>
<div class="path">
    <a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 结算单明细列表 <span>(${message("admin.page.total", page.total)})</span>
</div>
<form id="listForm" name="listForm" action="orderList.jhtml" method="get" target="">
    <!--begin查询条件-->
    <fieldset class="fielset">
        <legend>查询条件</legend>
        <table  class="fieldset_t">
            <tr>
                <td>
                    <label>订单流水号:</label>
                    <input type="text" name="orderSn"/>
                </td>
                <td>
                    <label>交易途径:</label>
                    <select name="tradeWay">
                        <option value="">请选择</option>
                        <option value="0">APP支付</option>
                        <option value="1">扫码支付</option>
                        <option value="2">买单支付</option>
                    </select>
                </td>
                <td>
                    <label>资产类型:</label>
                    <select name="assetType">
                        <option value="">请选择</option>
                        <option value="0">余额</option>
                        <option value="1">理财通</option>
                        <option value="2">一卡通</option>
                    </select>
                </td>
                <td>
                    <font onclick="queryForPage(${settlementId})" style='border: 1px solid #cccccc;padding: 5px 35px;cursor:pointer;'>查询</font>
                    <!--<font onclick="exportExcel()" style='border: 1px solid #cccccc;padding: 5px 35px;cursor:pointer;'>导出Excel</font>-->
                </td>
                <td>
                    <font onclick="exportExcel(${settlementId})" style='border: 1px solid #cccccc;padding: 5px 35px;cursor:pointer;'>导出</font>
                </td>
            </tr>
        </table>
    </fieldset>
    <!--end 查询条件 -->

    <table id="listTable" class="list">
        <tr>
            <th class="center">
                <a href="javascript:;" class="sort" name="sd.settlement_id"><span>结算单号</span></a>
            </th>
            <th class="center">
                <a href="javascript:;" class="sort" name="sd.order_sn"><span>订单流水号</span></a>
            </th>
            <th class="center">
                <a href="javascript:;" class="sort" name="sd.trade_amount"><span>交易金额</span></a>
            </th>
            <th class="center">
                <a href="javascript:;" class="sort" name="sd.refund_amount"><span>退款金额</span></a>
            </th>
            <th class="center">
                <a href="javascript:;" class="sort" name="t.trade_way"><span>交易途径</span></a>
            </th>
            <th class="center">
                <a href="javascript:;" class="sort" name="t.asset_type"><span>资产类型</span></a>
            </th>
            <th class="center">
                <a href="javascript:;" class="sort" name="t.asset_no"><span>资产编号</span></a>
            </th>
            <th class="center">
                <a href="javascript:;" class="sort" name="t.trade_state"><span>交易状态</span></a>
            </th>
            <th class="center">
                <a href="javascript:;" class="sort" name="t.trade_time"><span>交易时间</span></a>
            </th>
            <th class="center">
                <a href="javascript:;" class="sort" name="t.trade_subject"><span>交易描述</span></a>
            </th>
            <th class="center">
                <a href="javascript:;" class="sort" name="t.out_trade_no"><span>商户订单号</span></a>
            </th>
            <th class="center">
                <a href="javascript:;" class="sort" name="t.payment_order_no"><span>预支付订单号</span></a>
            </th>
            <th class="center">
                <a href="javascript:;" class="sort" name="t.initiator"><span>交易发起</span></a>
            </th>
            <th class="center">
                <a href="javascript:;" class="sort" name="t.exceptionFlag"><span>异常状态</span></a>
            </th>
            <th class="center"><span>操作</span></th>
        </tr>
	[#list page.content as settlementDetail]
        <tr>
            <td class="center">
                <span>${settlementDetail.settlementId}</span>
            </td>
            <td class="center">
                <span>${settlementDetail.orderSn}</span>
            </td>
            <td class="center">
                <span>${settlementDetail.tradeAmount}</span>
            </td>
            <td class="center">
                <span>${settlementDetail.refundAmount}</span>
            </td>
            <td class="center">
                <span>${settlementDetail.tradeWayName}</span>
            </td>
            <td class="center">
                <span>${settlementDetail.assetTypeName}</span>
            </td>
            <td class="center">
                <span>${settlementDetail.assetNo}</span>
            </td>
            <td class="center">
                <span>${settlementDetail.tradeStateName}</span>
            </td>
            <td class="center">
                <span>${settlementDetail.tradeTime}</span>
            </td>
            <td class="center">
                <span>${settlementDetail.tradeSubject}</span>
            </td>
            <td class="center">
                <span>${settlementDetail.outTradeNo}</span>
            </td>
            <td class="center">
                <span>${settlementDetail.paymentOrderNo}</span>
            </td>
            <td class="center">
                <span>${settlementDetail.initiatorName}</span>
            </td>
            <td class="center">
                [#if settlementDetail.exceptionFlagName == "正常"]
                    <span class="green">正常</span>
                [#else ]
                    <span class="red">${settlementDetail.exceptionFlagName}</span>
                [/#if]
            </td>
            <td class="center">
                <a href=javascript:orderDetail('${settlementDetail.merchantCode}')>[订单管理]</a>
            </td>
        </tr>
	[/#list]
    </table>
[@pagination pageNumber = page.currentPage totalPages = page.totalPage]
	[#include "/common/pagination.ftl"]
[/@pagination]
</form>
</body>
<script>

    function queryForPage(settlementId){
        $("#listForm").attr("action", "orderList.jhtml?settlementId="+settlementId);
        $("#listForm").attr("target", "");
        $("#listForm").submit();
    }

    function exportExcel(settlementId){
        $("#listForm").attr("action", "export_orderList.jhtml?settlementId="+settlementId+"");
        $("#listForm").attr("target", "_blank");
        $("#listForm").submit();
        $("#listForm").attr("action", "orderList.jhtml");
        $("#listForm").attr("target", "");
    }


    $().ready( function() {
	[@flash_message /]
    });
</script>