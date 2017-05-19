package cn.shengyuan.yun.remote.payment;

import java.util.Map;

import cn.shengyuan.basic.model.Message;
import cn.shengyuan.yun.core.payment.vo.PaymentVO;

public interface PaymentRemote {
	
 
	public static final String PARTNER = "partner";//商户号
	public static final String MEMBER_ID = "memberId";//会员ID
	public static final String ASSET_TYPE = "assetType" ;//支付方式   
	public static final String ASSET_NO = "assetNo" ;//支付方式   
	
	public static final String PAY_PASSWORD = "payPassword";//支付密码
	public static final String PREPAY_ID = "prepayId";//预支付ID
	public static final String QR_CODE = "qrCode";//二维码
	public static final String SIGNATURE = "signature";//签名
	
	/**
	 * 用户确认支付
	 * 
	 * @param params <br>
	 *            *商户号：PaymentRemote.PARTNER(String) <br>
	 *            *会员ID：PaymentRemote.MEMBER_ID(Long) <br>
	 *            *支付方式：PaymentRemote.ASSET_TYPE(String) <br>
	 *            *支付卡号：PaymentRemote.ASSET_NO(String) <br>
	 *            *支付密码：PaymentRemote.PAY_PASSWORD(String) <br>
	 *            *预支付ID：PaymentRemote.PREPAY_ID(String) <br>
	 * @return Message <br>
	 * 
	 * @throws Exception
	 */
	Message confirmPayment(Map<String, String> params) throws Exception;
	
	/**
	 * 获取支付订单信息
	 * @param params 三选一 
	 * 		*预支付ID：PaymentRemote.PREPAY_ID(String) <br>
	 * 
	 * 		*二维码：PaymentRemote.QR_CODE(String)
	 * 
	 * 		*会员ID　：PaymentRemote.MEMBER_ID(Long)　
	 * @return
	 * @throws Exception
	 */
	PaymentVO getPaymentOrder(Map<String, String> params) throws Exception;
	
	
}
