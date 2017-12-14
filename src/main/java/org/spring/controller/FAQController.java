package org.spring.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.PageMaker;
import org.spring.domain.SearchCriteria;
import org.spring.service.FAQService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FAQController {
	private static final Logger logger = LoggerFactory.getLogger(FAQController.class);
	
	@Inject
	private FAQService service;
	
/*	@RequestMapping(value="/faq", method=RequestMethod.GET)
	public String readFaq(Model model){
		logger.info("readFaq(.............");
		model.addAttribute("faqList", service.listFAQ());
		
		return "/faq/faq";
	}*/
	
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String listFAQ(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("umlistPage(.....................");
		model.addAttribute("faqList", service.listFAQSearchCriteria(cri));
		PageMaker pmk = new PageMaker();
		pmk.setCri(cri);
		pmk.setTotalCount(service.listFAQCountSearchCriteria(cri));
		model.addAttribute("pmk", pmk);
		
		return "/faq/faq";
	}
}
