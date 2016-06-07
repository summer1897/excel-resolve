package com.netease.edu.util;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

public class FilePathUitl {
	
	public static final String SAVE_FILE_DIR = "/upload/dbsource/";

	public static String getRootPath(HttpServletRequest request,String basePath){
		String savePath = request.getSession()
								 .getServletContext()
								 .getRealPath(basePath);
		File file = new File(savePath);
		if(!file.exists())
			file.mkdirs();
		return savePath;
	}
}
