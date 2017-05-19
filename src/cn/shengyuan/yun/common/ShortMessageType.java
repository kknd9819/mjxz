package cn.shengyuan.yun.common;

import java.text.MessageFormat;

public enum ShortMessageType {
	/** 会员注册验证码短信 */
	MEMBER_REGISTER(1, "验证码{0}您正在注册手机用户，请妥善保管您的验证码。", "会员注册"),
	/** 会员登录验证码短信 */
	MEMBER_LOGIN(2, "验证码{0}您正在登录生源闪购，请妥善保管您的验证码。", "会员登录"),
	/** 修改登录密码验证短信 */
	MEMBER_CHANGE_PWD(3, "验证码{0}您正在找回密码，请妥善保管您的验证码。", "修改登录密码"),
	/** 修改支付密码验证短信 */
	MEMBER_CHANGE_PAY(4, "验证码{0}您正在绑定手机，请妥善保管您的验证码。", "修改支付密码"),
	/** 手机号码变更验证短信 */
	MEMBER_CHANGE_MOBILE(5, "验证码{0}您正在绑定手机，请妥善保管您的验证码。", "手机号码变更"),
	/** 绑定储值卡验证短信 */
	MEMBER_BLIND_CARD(6, "验证码{0}您正在绑定手机，请妥善保管您的验证码。", "储值卡绑定");

	private ShortMessageType(int code, String template, String typeName) {
		this.code = code;
		this.template = template;
		this.typeName = typeName;
	}

	/** 短信类型编码 */
	private int code;

	/** 模版内容 */
	private String template;

	/** 短信类型名称 */
	private String typeName;

	public int getCode() {
		return code;
	}

	public String getTemplate(Object... params) {
		return MessageFormat.format(template, params);
	}

	public String getTypeName() {
		return typeName;
	}

	/**
	 * 获取短信类型名称
	 * 
	 * @param code
	 * @return
	 */
	public static String getMesaageTypeName(int code) {
		for (ShortMessageType t : ShortMessageType.values()) {
			if (t.getCode() == code) {
				return t.getTypeName();
			}
		}
		return null;
	}

	public static ShortMessageType getEnumByCode(int code) {
		for (ShortMessageType t : ShortMessageType.values()) {
			if (t.getCode() == code) {
				return t;
			}
		}
		return null;
	}
}
