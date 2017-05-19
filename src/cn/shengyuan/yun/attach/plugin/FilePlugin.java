package cn.shengyuan.yun.attach.plugin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Component;

import cn.shengyuan.yun.attach.vo.AttachSetting;
import cn.shengyuan.yun.attach.vo.FileInfo;


@Component("filePlugin")
public class FilePlugin implements StoragePlugin {
	@Override
	public boolean isExist(String fileUrl) {
		File tempFile = new File(AttachSetting.getUploadBase() + fileUrl);
		return tempFile.exists();
	}

	@Override
	public void upload(String path, File file, String contentType) {
		File destFile = new File(path);
		try {
			FileUtils.moveFile(file, destFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public byte[] download(String fileUrl) {
		File downFile = new File(AttachSetting.getUploadBase() + fileUrl);
		try {
			byte[] bs = FileUtils.readFileToByteArray(downFile);
			return bs;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String getUrl(String path) {
		return AttachSetting.getAttachSiteUrl() + path;
	}

	@Override
	public List<FileInfo> browser(String path) {
		List<FileInfo> fileInfos = new ArrayList<FileInfo>();
		File directory = new File(AttachSetting.getUploadBase() + path);
		if (directory.exists() && directory.isDirectory()) {
			for (File file : directory.listFiles()) {
				FileInfo fileInfo = new FileInfo();
				fileInfo.setName(file.getName());
				fileInfo.setUrl(AttachSetting.getAttachSiteUrl() + path + file.getName());// 修改成虚拟目录
				fileInfo.setIsDirectory(file.isDirectory());
				fileInfo.setSize(file.length());
				fileInfo.setLastModified(new Date(file.lastModified()));
				fileInfos.add(fileInfo);
			}
		}
		return fileInfos;
	}

}
