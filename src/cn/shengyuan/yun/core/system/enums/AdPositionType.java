package cn.shengyuan.yun.core.system.enums;

/**
 * 位置
 */
public enum AdPositionType {

	/** 商家首页优惠信息*/
	index(0, "首页广告"),
	
	/** 商家首页顶部分类广告 */
	merchantHome(1, "商家首页广告"),

	/** 其它 */
	other(2, "其它");

	private AdPositionType(int code, String typeName) {
		this.code = code;
		this.typeName = typeName;
	}

	private int code;

	private String typeName;

	public int getCode() {
		return this.code;
	}

	public String getTypeName() {
		return this.typeName;
	}

	public String getEnumName() {
		return this.name();
	}

	public static String value(int code) {
		for (AdPositionType adPositionType : AdPositionType.values()) {
			if (adPositionType.getCode() == code) {
				return adPositionType.getTypeName();
			}
		}
		return null;
	}
}