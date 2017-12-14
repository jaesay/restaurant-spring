package org.spring.util;

import java.io.File;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);
	
	public static void removeFile(String uploadPath, String fileName, HttpServletRequest request, String category ){
		logger.info("removeFile(................");
		String savePath = makePath(uploadPath, category);
		
		new File(uploadPath+savePath, fileName).delete();
		
		FtpCtrl fc = new FtpCtrl();
		try {
			fc.delete("/html/springImg/"+category, fileName, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static String uploadFile(String uploadPath, String originalFileName, byte[] fileData, HttpServletRequest request, String category)throws Exception{
		logger.info("uploadFile(..............)");
		logger.info("orginalFileName : " + originalFileName);
		logger.info("fileData : "+ fileData);
		logger.info("uploadPath : " + uploadPath);
		
		UUID uuid = UUID.randomUUID();
		String saveName = uuid.toString()+"_"+originalFileName;
		String savePath = makePath(uploadPath, category);
		
		File target = new File(uploadPath + savePath, saveName);
		FileCopyUtils.copy(fileData, target);
		
		FtpCtrl fc = new FtpCtrl();
        fc.upload(target.getAbsoluteFile()+"", "/html/springImg/"+category, saveName, request);
		
		return saveName;
	}

	private static String makePath(String uploadPath, String category) {
		logger.info("makePath(..................uploadPath >>>" + uploadPath);
		String savePath = null;
		if(category.equals("Main")){
			savePath = File.separator + "main";
		}else if(category.equals("Special")){
			savePath = File.separator + "special";
		}else if(category.equals("Side")){
			savePath = File.separator + "side";
		}else if(category.equals("Extra")){
			savePath = File.separator + "extra";
		}else{
			savePath = File.separator + "beverage";
		}
		makeDir(uploadPath, savePath);
		return savePath;
	}

	private static void makeDir(String uploadPath, String savePath) {
		File dir = new File(uploadPath + savePath);
	    if(!dir.exists()){
	    	dir.mkdirs(); 
	    }
	}
}
