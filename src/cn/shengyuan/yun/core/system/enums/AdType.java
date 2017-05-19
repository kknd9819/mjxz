package cn.shengyuan.yun.core.system.enums;
/**
	 * 类型
	 */
	public enum AdType {

		/** 文本 */
		text(0,"文本"),

		/** 图片 */
		image(1,"图片"),

		/** flash */
		flash(2,"flash");
		
		//枚举类型构造函数只能为私有
		private AdType(int code, String typeName) {
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
		
		public static String value(int code) {
			for (AdType adType : AdType.values()) {
				if (adType.getCode() == code) {
					return adType.getTypeName();
				}
			}
			return null;
		}
	}