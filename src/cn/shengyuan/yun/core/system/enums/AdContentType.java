package cn.shengyuan.yun.core.system.enums;

/**
 * 广告内容类型
 */
public enum AdContentType {
	
	/** 文章*/
	article(0,"文章"),
	
	/** 商家分类*/
	category(1,"商家分类");
	
	private AdContentType(int code ,String typeName){
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
	
	public static String value(int code){
		for(AdContentType adContentType : AdContentType.values()){
			if(adContentType.getCode() == code){
				return adContentType.getTypeName();
			}
		}
		return null;
	}
}
