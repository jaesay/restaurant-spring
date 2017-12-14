package org.spring.util;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;

public class ObjectUtils {
	private static final Logger logger = LoggerFactory.getLogger(ObjectUtils.class);
	
	private static Map<String,MediaType> mediaMap;
	
	static{
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
	}
	
	public static MediaType getMediaType(String type){
		logger.info("getMediaType(........... type>>> )"+ type);
		return mediaMap.get(type.toUpperCase());
	}
}
