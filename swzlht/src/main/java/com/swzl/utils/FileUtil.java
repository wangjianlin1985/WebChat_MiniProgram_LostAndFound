package com.swzl.utils;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import org.springframework.web.multipart.MultipartFile;

/**
 * 文件工具类
 */
public class FileUtil {
	/**
	 * 文件存放路径
	 */
	private static String filePath = "D:/swzl/file/";

	/**
	 * 上传文件
	 * @param file
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public static String uploadfile(MultipartFile file) throws IllegalStateException, IOException{
		String name = file.getOriginalFilename();
		String r = new Random().nextInt(100000) + "";
		String path = filePath + System.currentTimeMillis() + r + name.substring(name.lastIndexOf("."), name.length());
		File target = new File(path);
		file.transferTo(target);
		return path.replace(filePath, "/");
	}

}
