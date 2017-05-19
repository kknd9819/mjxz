 <!--begin查询条件-->
<fieldset class="fielset">
<legend>查询条件</legend>
<table  class="fieldset_t">
		[#include "/payment/refunds_trade/condition.ftl" /]
		[@shiro.hasPermission name="refundTrade:query"]
		<td align="right"> <font onclick="paymentForPage(1,'${base}/admin/payment/tradeListAjax.jhtml')" style='border: 1px solid #cccccc;padding: 5px 35px;cursor:pointer;'>查询</font><td/>
		[/@shiro.hasPermission]	
	</tr>
</table>
</fieldset>
<!--end 查询条件 -->