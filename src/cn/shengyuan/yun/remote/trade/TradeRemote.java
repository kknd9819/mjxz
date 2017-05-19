package cn.shengyuan.yun.remote.trade;

import java.util.Map;

import cn.shengyuan.basic.model.Message;

/**
 * 商家交易处理接口
 * 
 * @author johney
 *
 */
public interface TradeRemote {
	/** 商家ID */
	public static final String MERCHANT_ID = "merchantId";
	/** 交易途径 */
	public static final String TRADE_WAY = "tradeWay";
	/** 交易金额 */
	public static final String TRADE_AMOUNT = "tradeAmount";
	/** 交易描述 */
	public static final String TRADE_SUBJECT = "tradeSubject";
	/** 商户订单号(外部订单号) */
	public static final String OUT_TRADE_NO = "outTradeNo";
	/** 预加载订单号 */
	public static final String PAYMENT_ORDER_NO = "paymentOrderNo";
	/** 用户ID */
	public static final String MEMBER_ID = "memberId";
	/** 资产类型 */
	public static final String ASSET_TYPE = "assetType";
	/** 资产编码 */
	public static final String ASSET_NO = "assetNo";
	/** 支付密码 */
	public static final String PAY_PASSWORD = "payPassword";
	/** 退款金额 */
	public static final String REFUND_AMOUNT = "refundAmount";
	/** 退款说明 */
	public static final String REFUND_SUBJECT = "refundSubject";
	/** 过期时间(分钟) */
	public static final String EXPIRE_TIME = "expireTime";

	/** 交易订单号 */
	public static final String TRADE_NO = "tradeNo";
	/** 退款单号 */
	public static final String REFUND_NO = "refundNo";

	/**
	 * 用户支付商家订单
	 * 
	 * @param params <br>
	 *            *商家编号：TradeRemote.MERCHANT_ID(Long) <br>
	 *            *用户编号：TradeRemote.MEMBER_ID(Long) <br>
	 *            *交易来源：TradeRemote.TRADE_WAY(Integer) <br>
	 *            *资产类型：TradeRemote.ASSET_TYPE(Integer) <br>
	 *            *资产编号：TradeRemote.ASSET_NO(String) <br>
	 *            *交易金额：TradeRemote.TRADE_AMOUNT(Double) <br>
	 *            *支付密码：TradeRemote.PAY_PASSWORD(String) <br>
	 *            外部订单号：TradeRemote.OUT_TRADE_NO(String) <br>
	 *            预支付订单号：TradeRemote.PAYMENT_ORDER_NO(String) <br>
	 *            *交易描述：TradeRemote.TRADE_SUBJECT(String) <br>
	 * @return Message <br>
	 *         TradeRemote.TRADE_NO String 交易订单号
	 * 
	 * @throws Exception
	 */
	Message payTrade(Map<String, Object> params) throws Exception;

	/**
	 * 商家交易订单退款
	 * 
	 * @param params <br>
	 *            *商家编号：TradeRemote.MERCHANT_ID(Long) <br>
	 *            *交易订单号：TradeRemote.TRADE_NO(String) <br>
	 *            *退款金额：TradeRemote.REFUND_AMOUNT(Double) <br>
	 *            *退款说明：TradeRemote.REFUND_SUBJECT(String) <br>
	 * @return Message <br>
	 *         TradeRemote.REFUND_NO String 退款单号
	 * 
	 * @throws Exception
	 */
	Message refundTrade(Map<String, Object> params) throws Exception;

}
