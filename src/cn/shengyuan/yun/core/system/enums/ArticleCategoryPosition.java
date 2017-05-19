package cn.shengyuan.yun.core.system.enums;
/**
	 * 位置
	 */
	public enum ArticleCategoryPosition {

		/** 购物指南 */
		guide(0,"购物指南"),

		/** 关于我们 */
		about(1,"关于我们"),

		/** 小贴士 */
		tips(2,"小贴士");
		//枚举类型构造函数只能为私有
		private ArticleCategoryPosition(int code, String typeName) {
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
			for (ArticleCategoryPosition articleCategoryPosition : ArticleCategoryPosition.values()) {
				if (articleCategoryPosition.getCode() == code) {
					return articleCategoryPosition.getTypeName();
				}
			}
			return null;
		}
	}