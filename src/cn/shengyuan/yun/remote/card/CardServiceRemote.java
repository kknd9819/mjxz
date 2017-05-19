package cn.shengyuan.yun.remote.card;

import java.util.Map;

import cn.shengyuan.basic.model.Message;

/**
 * 生源储值卡业务接口
 * 
 * @author Lin
 *
 */
public interface CardServiceRemote {

	/**
	 * 储值卡卡号
	 */
	static String CARD_NO = "cardNo";

	/**
	 * 验证码
	 */
	static String CAPTCHA = "captcha";

	/**
	 * 消费金额
	 */
	static String AMOUNT = "amount";

	/**
	 * 会员ID
	 */
	static String MEMBER_ID = "memberId";

	/**
	 * 支付流水ID
	 */
	static String PAYMENT_ID = "paymentId";

	/**
	 * 请求参数IP
	 */
	static String REQUEST_IP = "requestIp";

	/**
	 * 退款金额
	 */
	static String REFUND_AMOUNT = "refundAmount";

	/**
	 * 交易的流水号
	 */
	static String SN = "sn";

	/**
	 * 消费类型
	 */
	static String TYPE = "type";

	/**
	 * 消费说明
	 */
	static String MEMO = "memo";

	/**
	 * 消费发起的商家
	 */
	static String MERCHANT_ID = "merchantId";

	/**
	 * 退款流水
	 */
	static String REFUND_SN = "refundSn";

	/**
	 * 退款商家
	 */
	static String REFUND_MERCHANT_ID = "refund_merchant_id";

	/**
	 * 绑定储值卡发送短信验证码
	 * 
	 * @param param
	 *            <p>
	 *            CardServiceRemote.CARD_NO(String)  储值卡卡号
	 *            </p>
	 *            <p>
	 *            CardServiceRemote.MEMBER_ID(Long)  会员ID
	 *            </p>
	 * @return Message
	 */
	public Message sendCaptcha(Map<String, Object> param);

	/**
	 * 绑定储值卡确认绑定
	 * 
	 * @param param
	 *            <p>
	 *            CardServiceRemote.CARD_NO(String) 储值卡卡号
	 *            </p>
	 *            <p>
	 *            CardServiceRemote.CAPTCHA(String) 验证码
	 *            </p>
	 *            <p>
	 *            CardServiceRemote.MEMBER_ID(Long) 会员ID
	 *            </p>
	 * @return Message
	 */
	public Message binding(Map<String, Object> param);

	/**
	 * 储值卡消费扣款
	 * 
	 * @param param
	 *            <p>
	 *            CardServiceRemote.CARD_NO(String) 储值卡卡号
	 *            </p>
	 *            <p>
	 *            CardServiceRemote.SN( String) 交易的流水号
	 *            </p>
	 *            <p>
	 *            CardServiceRemote.AMOUNT( String) 交易的金额
	 *            </p>
	 *            <p>
	 *            CardServiceRemote.TYPE(int) 交易的类型，0消费，1转出
	 *            </p>
	 *            <p>
	 *            CardServiceRemote.MERCHANT_ID( Long) 交易发起的商家
	 *            </p>
	 *            <p>
	 *            CardServiceRemote.MEMO( String) 交易说明
	 *            </p>
	 * @return Message
	 */
	public Message debit(Map<String, Object> param);

	/**
	 * 储值卡查询最新余额
	 * 
	 * @param param
	 *            <p>
	 *            CardServiceRemote.CARD_NO (String) 储值卡卡号
	 *            </p>
	 * @return
	 */
	public Message queryCardNoAmount(Map<String, Object> param);

	/**
	 * 余额记录同步
	 * 
	 * @param paramMap
	 *            <p>
	 *            CardServiceRemote.CARD_NO( String) 卡号:单个-- 必填
	 *            </p>
	 *            <p>
	 *            CardServiceRemote.REQUEST_IP( String) 请求ip
	 *            </p>
	 * @return true 同步成功 false 同步失败
	 * @throws Exception
	 */
	public boolean syndataBalance(Map<String, Object> paramMap) throws Exception;

	/**
	 * 消费记录同步
	 * 
	 * @param paramMap
	 *            <p>
	 *            CardServiceRemote.CARD_NO( String) 卡号:单个-- 必填
	 *            </p>
	 *            <p>
	 *            CardServiceRemote.REQUEST_IP( String) 请求ip
	 *            </p>
	 * @return true 同步成功 false 同步失败
	 * @throws Exception
	 */
	public boolean syndataConsume(Map<String, Object> paramMap) throws Exception;

	/**
	 * 储值卡退款
	 * 
	 * @param paramMap
	 *            <p>
	 *            CardServiceRemote.CARD_NO( String) 卡号(单个) 必填
	 *            </p>
	 *            <p>
	 *            CardServiceRemote.SN (String) 支付流水
	 *            </p>
	 *            <p>
	 *            CardServiceRemote.REFUND_SN( String) 退款流水
	 *            </p>
	 *            <p>
	 *            CardServiceRemote.REFUND_AMOUNT( String) 退款金额
	 *            </p>
	 *            <p>
	 *            CardServiceRemote.REQUEST_IP (String) 请求ip
	 *            </p>
	 *            <p>
	 *            CardServiceRemote.MEMO (String) 退款备注信息
	 *            </p>
	 *            <p>
	 *            CardServiceRemote.REFUND_MERCHANT_ID (Long) 退款发起的商家
	 *            </p>
	 * @return
	 */
	public Message refund(Map<String, Object> paramMap);
}
