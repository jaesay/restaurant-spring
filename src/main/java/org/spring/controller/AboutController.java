package org.spring.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/about/*")
public class AboutController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping(value="/contact", method=RequestMethod.GET)
	public void contact(Model model) throws Exception {
		logger.info("contact(................");
	}
	
	@RequestMapping(value="/intro", method=RequestMethod.GET)
	public void introduce(Model model) throws Exception {
		logger.info("introduce(................");
	}
	
	@RequestMapping(value="/location", method=RequestMethod.GET)
	public void locate(Model model) throws Exception {
		logger.info("locate(................");
	}
	
}
