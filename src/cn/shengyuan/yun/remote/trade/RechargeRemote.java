package cn.shengyuan.yun.remote.trade;

import java.util.Map;

import cn.shengyuan.basic.model.Message;

/**
 * 充值处理接口
 * 
 * @author johney
 *
 */
public interface RechargeRemote {
	/** 第三方支付插件 */
	public static final String PAYMENT_PLUGIN_ID = "paymentPluginId";
	/** 充值金额 */
	public static final String RECHARGE_AMOUT = "amout";
	/** 会员ID */
	public static final String MEMBER_ID = "memberId";
	/** 终端类型 */
	public static final String TERMINAL_ID = "terminal";
	/** 请求IP */
	public static final String REQUEST_IP = "ip";
	/** 转账的一卡通卡号 */
	public static final String CARD_NO = "cardNo";
	/** 充值订单号 */
	public static final String ORDER_SN = "orderSn";
	/** 支付流水ID */
	public static final String PAYMENT_TRADE_ID = "tradeId";
	/** 支付单号 */
	public static final String PAYMENT_TRADE_SN = "tradeSn";
	/** 薪资计划ID */
	public static final String SALARY_PLAN_ID = "salaryPlanId";
	/** 审核人ID */
	public static final String AUDITER_ID = "auditerId";
	/** 审核人姓名 */
	public static final String AUDITER_NAME = "auditerName";
	/** 支付密码 */
	public static final String PAY_PASSWORD = "payPassword";

	/**
	 * 余额充值，生成用户的充值订单，并为订单生成第三方支付支付数据
	 * 
	 * @param params <br/>
	 *            *第三方支付插件：RechargeRemote.PAYMENT_PLUGIN_ID(String) <br/>
	 *            *充值金额：RechargeRemote.RECHARGE_AMOUT(Double) <br/>
	 *            *会员ID：RechargeRemote.MEMBER_ID(Long) <br/>
	 *            *终端类型：RechargeRemote.TERMINAL_ID(Integer)<br/>
	 *            *请求IP：RechargeRemote.REQUEST_IP(String)
	 * @return Message <br/>
	 *         PayRemote.REQUEST_URL String 请求URL<br/>
	 *         PayRemote.REQUEST_METHOD String 请求方式　<br/>
	 *         PayRemote.REQUEST_CHARSET String 请求字符<br/>
	 *         PayRemote.REQUEST_PARAMS Map 请求参数
	 * @throws Exception
	 */
	public Message recharge(Map<String, Object> params) throws Exception;

	/**
	 * 薪资计划充值，根据后台生成的薪资计划生成用户充值订单
	 * 
	 * @param params <br/>
	 *            *薪资计划ID：RechargeRemote.SALARY_PLAN_ID(Long) <br/>
	 *            *审核人：RechargeRemote.AUDITER_NAME(String)
	 * @return Message
	 * @throws Exception
	 */
	public Message salary(Map<String, Object> params) throws Exception;

	/**
	 * 一卡通转账，生成用户的充值订单，并直接调用一卡通交易接口完成转账
	 * 
	 * @param params <br/>
	 *            *充值金额：RechargeRemote.RECHARGE_AMOUT(Double) <br/>
	 *            *转账卡号：RechargeRemote.CARD_NO(String) <br/>
	 *            *支付密码：RechargeRemote.PAY_PASSWORD(String) <br/>
	 *            *会员ID：RechargeRemote.MEMBER_ID(Long) <br/>
	 *            *终端类型：RechargeRemote.TERMINAL_ID(Integer)<br/>
	 *            *请求IP：RechargeRemote.REQUEST_IP(String)
	 * @return Message <br/>
	 *         key： order (RechargeOrder) 充值订单数据
	 * @throws Exception
	 */
	public Message transfer(Map<String, Object> params) throws Exception;

	/**
	 * 第三方支付充值的支付成功通知
	 * 
	 * @param params <br/>
	 *            *充值订单号：RechargeRemote.ORDER_SN(String) <br/>
	 *            *支付流水ID：RechargeRemote.PAYMENT_TRADE_ID(Long)
	 * @return Message
	 * @throws Exception
	 */
	public Message notifySuccess(Map<String, Object> params) throws Exception;

	/**
	 * 对处理失败的充值订单重新审计
	 * 
	 * @param params <br/>
	 *            *充值订单号：RechargeRemote.ORDER_SN(String) <br/>
	 *            *操作人员：RechargeRemote.AUDITER_NAME(String)
	 * @return Message
	 * @throws Exception
	 */
	public Message reaudit(Map<String, Object> params) throws Exception;
}
