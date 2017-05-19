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
        function orderDetail(orderId) {
            window.location.href="orderDetail.jhtml?orderId="+orderId;
        }
    </script>
</head>
<body>
<div class="path">
    <a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 订单明细
</div>
<form id="listForm" name="listForm" action="orderDetail.jhtml" method="get" target="">


    <table id="listTable" class="list">
        <tr>
            <th class="center">
               <span>订单流水号</span>
            </th>
            <th class="center">
               <span>交易途径</span>
            </th>
            <th class="center">
              <span>商家名称</span>
            </th>
            <th class="center">
               <span>交易资产类型</span>
            </th>
            <th class="center">
                <span>资产编号</span>
            </th>
            <th class="center">
               <span>交易金额</span>
            </th>
            <th class="center">
               <span>交易时间</span>
            </th>
            <th class="center">
             <span>交易描述</span>
            </th>
            <th class="center">
              <span>外部订单号</span>
            </th>
            <th class="center">
               <span>预支付订单号</span>
            </th>
            <th class="center">
             <span>交易状态</span>
            </th>
            <th class="center">
             <span>申请结算时间</span>
            </th>
            <th class="center">
               <span>退款金额</span>
            </th>
        </tr>
        <tr>
            <td class="center">
                <span>${tradeOrder.tradeNo}</span>
            </td>
            <td class="center">
                <span>
                    [#if tradeOrder.tradeWay == 0]
                       APP支付
                    [#elseif tradeOrder.tradeWay == 1]
                       扫码支付
                    [#elseif tradeOrder.tradeWay == 2]
                       买单支付
                    [/#if]
                </span>
            </td>
            <td class="center">
                <span>${tradeOrder.merchantName}</span>
            </td>
            <td class="center">
                <span>
                    [#if tradeOrder.assetType == 0]
                      余额
                    [#elseif tradeOrder.assetType == 1]
                      理财通
                    [#elseif tradeOrder.assetType == 2]
                      一卡通
                    [/#if]
                </span>
            </td>
            <td class="center">
                <span>${tradeOrder.assetNo}</span>
            </td>
            <td class="center">
                <span>${tradeOrder.tradeAmount}</span>
            </td>
            <td class="center">
                <span>${tradeOrder.tradeTime}</span>
            </td>
            <td class="center">
                <span>${tradeOrder.tradeSubject}</span>
            </td>
            <td class="center">
                <span>${tradeOrder.outTradeNo}</span>
            </td>
            <td class="center">
                <span>${tradeOrder.paymentOrderNo}</span>
            </td>
            <td class="center">
                <span>
                    [#if tradeOrder.tradeState == 0]
                        待支付
                    [#elseif tradeOrder.tradeState == 1]
                        交易完成
                    [/#if]
                </span>
            </td>
            <td class="center">
                <span>${tradeOrder.settleApplyDate}</span>
            </td>
            <td class="center">
                <span>${tradeOrder.refundAmount}</span>
            </td>
        </tr>
    </table>
[@pagination pageNumber = page.currentPage totalPages = page.totalPage]
    [#include "/common/pagination.ftl"]
[/@pagination]
</form>
</body>
<script>


    $().ready( function() {
    [@flash_message /]
    });
</script>