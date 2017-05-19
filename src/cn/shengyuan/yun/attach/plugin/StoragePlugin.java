package cn.shengyuan.yun.attach.plugin;

import java.io.File;
import java.util.List;

import cn.shengyuan.yun.attach.vo.FileInfo;


public interface StoragePlugin {
	/**
	 * 文件路径是否存在
	 * @param fileUrl
	 * @return
	 */
	public boolean isExist(String fileUrl);
	
	/**
	 * 文件上传
	 * 
	 * @param path
	 *            上传路径
	 * @param file
	 *            上传文件
	 * @param contentType
	 *            文件类型
	 */
	public void upload(String path, File file, String contentType);

	/**
	 * 获取文件二进制
	 * 
	 * @param fileUrl
	 * @return
	 */
	byte[] download(String fileUrl);

	/**
	 * 获取访问URL
	 * 
	 * @param path
	 *            上传路径
	 * @return 访问URL
	 */
	public String getUrl(String path);

	/**
	 * 文件浏览
	 * 
	 * @param path
	 *            浏览路径
	 * @return 文件信息
	 */
	public List<FileInfo> browser(String path);
}
