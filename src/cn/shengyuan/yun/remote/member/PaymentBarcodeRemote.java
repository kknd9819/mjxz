package cn.shengyuan.yun.remote.member;

import java.util.Map;

import cn.shengyuan.basic.model.Message;

public interface PaymentBarcodeRemote {
	/** 付款码 */
	public static final String PAYMENT_BARCODE = "paymentBarcode";

	/** 用户ID */
	public static final String MEMBER_ID = "memberId";
	/** 资产编号 */
	public static final String ASSET_NO = "assetNo";
	/** 资产类型 */
	public static final String ASSET_TYPE = "assetType";

	/**
	 * 根据付款码获取用户付款的账户信息
	 * 
	 * @param params <br>
	 *            *付款码：PaymentBarcodeRemote.PAYMENT_BARCODE(String) <br>
	 * @return Message <br/>
	 *         PaymentBarcodeRemote.MEMBER_ID Long 会员ID <br/>
	 *         PaymentBarcodeRemote.ASSET_NO String 资产编号 <br/>
	 *         PaymentBarcodeRemote.ASSET_TYPE Integer 资产类型(AssetType枚举)
	 * 
	 * @throws Exception
	 */
	Message checkBarcode(Map<String, String> params) throws Exception;
}
