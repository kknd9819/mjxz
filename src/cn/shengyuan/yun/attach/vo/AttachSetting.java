package cn.shengyuan.yun.attach.vo;

import cn.shengyuan.tools.util.ResourceUtils;

public class AttachSetting {
	
	private static final String CONF_FILE_NAME = "attach";

	/** 支付回调URL */
	public static String getPaymentSiteUrl() {
		return ResourceUtils.getStringForDefault(CONF_FILE_NAME, "paymentSiteUrl", "http://127.0.0.1");
	}
	
	/** 附件访问URL */
	public static String getAttachSiteUrl() {
		return ResourceUtils.getStringForDefault(CONF_FILE_NAME, "attachSiteUrl", "localhost");
	}

	/** 附件使用插件 */
	public static String getAttachPlugin() {
		return ResourceUtils.getStringForDefault(CONF_FILE_NAME, "attachPlugin", "filePlugin");
	}

	/** 上传本地根路径(D:或/jz) */
	public static String getUploadBase() {
		return ResourceUtils.getStringForDefault(CONF_FILE_NAME, "attachUploadBase", "E:");
	}

	/** 上传文件最大限制 */
	public static Integer getUploadMaxSize() {
		return ResourceUtils.getInt(CONF_FILE_NAME, "uploadMaxSize", 5);
	}

	/** 允许上传图片扩展名 */
	public static String[] getUploadImageExtensions() {
		return ResourceUtils.getStringArray(CONF_FILE_NAME, "uploadImageExtension");
	}

	/** 允许上传Flash扩展名 */
	public static String[] getUploadFlashExtensions() {
		return ResourceUtils.getStringArray(CONF_FILE_NAME, "uploadFlashExtension");
	}

	/** 允许上传媒体扩展名 */
	public static String[] getUploadMediaExtensions() {
		return ResourceUtils.getStringArray(CONF_FILE_NAME, "uploadMediaExtension");
	}

	/** 允许上传文件扩展名 */
	public static String[] getUploadFileExtensions() {
		return ResourceUtils.getStringArray(CONF_FILE_NAME, "uploadFileExtension");
	}

	/** 图片上传路径 */
	public static String getImageUploadPath() {
		return ResourceUtils.getStringForDefault(CONF_FILE_NAME, "imageUploadPath", "/upload/image/");
	}

	/** 图片上传路径临时文件目录 */
	public static String getImageUploadPathTemp() {
		return ResourceUtils.getStringForDefault(CONF_FILE_NAME, "imageUploadPathTemp", "/upload/image/temp/");
	}

	/** Flash上传路径 */
	public static String getFlashUploadPath() {
		return ResourceUtils.getStringForDefault(CONF_FILE_NAME, "flashUploadPath", "/upload/flash/");
	}

	/** 媒体上传路径 */
	public static String getMediaUploadPath() {
		return ResourceUtils.getStringForDefault(CONF_FILE_NAME, "mediaUploadPath", "/upload/media/");
	}

	/** 文件上传路径 */
	public static String getFileUploadPath() {
		return ResourceUtils.getStringForDefault(CONF_FILE_NAME, "fileUploadPath", "/upload/file/");
	}
	
	/**
	 * 获取水印图片
	 * @return 水印图片
	 */
	public static String getWatermarkImage() {
		return ResourceUtils.getStringForDefault(CONF_FILE_NAME, "watermarkImage", "/resources/images/watermark.png");
	}
	
	/**
	 * 获取商家图片(大)宽度
	 * @return 商家图片(大)宽度
	 */
	public static Integer getLargeMerchantImageWidth() {
		return ResourceUtils.getInt(CONF_FILE_NAME, "largeMerchantImageWidth", 800);
	}
	
	/**
	 * 获取商家图片(大)高度
	 * @return 商家图片(大)高度
	 */
	public static Integer getLargeMerchantImageHeight() {
		return ResourceUtils.getInt(CONF_FILE_NAME, "largeMerchantImageHeight", 800);
	}
	
	/**
	 * 获取水印透明度
	 * @return 水印透明度
	 */
	public static Integer getWatermarkAlpha() {
		return ResourceUtils.getInt(CONF_FILE_NAME, "watermarkAlpha", 50);
	}
	
	/**
	 * 获取商家图片(中)宽度
	 * @return 商家图片(中)宽度
	 */
	public static Integer getMediumMerchantImageWidth() {
		return ResourceUtils.getInt(CONF_FILE_NAME, "mediumMerchantImageWidth", 350);
	}
	
	/**
	 * 获取商家图片(中)高度
	 * @return 商家图片(中)高度
	 */
	public static Integer getMediumMerchantImageHeight() {
		return ResourceUtils.getInt(CONF_FILE_NAME, "mediumMerchantImageHeight", 350);
	}
	
	/**
	 * 获取商家缩略图宽度
	 * @return 商家缩略图宽度
	 */
	public static Integer getThumbnailMerchantImageWidth() {
		return ResourceUtils.getInt(CONF_FILE_NAME, "thumbnailMerchantImageWidth", 170);
	}
	
	/**
	 * 获取商家缩略图高度
	 * @return 商家缩略图高度
	 */
	public static Integer getThumbnailMerchantImageHeight() {
		return ResourceUtils.getInt(CONF_FILE_NAME, "thumbnailMerchantImageHeight", 170);
	}

}
