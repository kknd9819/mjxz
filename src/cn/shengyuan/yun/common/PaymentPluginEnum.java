package cn.shengyuan.yun.common;

public enum PaymentPluginEnum {
	/** 支付宝 */
	MOBILE_ALIPAY("mobileAlipaySecure", "支付宝"),
	/** 微信支付 */
	MOBILE_WEIXINPAY("weixinPayPlugin", "微信支付"),
	/** 生源一卡通 */
	MOBILE_CARDPAY("mobileSyCardPlugin", "生源一卡通");

	private PaymentPluginEnum(String pluginId, String pluginName) {
		this.pluginId = pluginId;
		this.pluginName = pluginName;
	}

	private String pluginId;// 插件ID
	private String pluginName;// 插件名称

	public String getPluginId() {
		return pluginId;
	}

	public String getPluginName() {
		return pluginName;
	}

	public static String getPaymentPluginName(String pluginId) {
		for (PaymentPluginEnum p : PaymentPluginEnum.values()) {
			if (p.getPluginId() == pluginId) {
				return p.getPluginName();
			}
		}
		return null;
	}
}
