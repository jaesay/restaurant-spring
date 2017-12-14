package org.spring.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.service.MenuService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/menu/*")
public class MenuController {
	private static final Logger logger = LoggerFactory.getLogger(MenuController.class);
	
	@Inject
	private MenuService service;
	
	@RequestMapping(value="/readMenu", method = RequestMethod.GET)
	public void readMenu(@RequestParam("m_id") int m_id, Model model) throws Exception{
		logger.info("readMenu(....................");
		model.addAttribute("mvo", service.readMenu(m_id));
	}
	
	@RequestMapping(value="/all", method = RequestMethod.GET)
	public String listMenuAll(Model model) throws Exception{
		logger.info("listMenuAll(......................");
		model.addAttribute("mList", service.listMenuAll());
		
		return "/menu/allMenu";
	}
	
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String listMainMenu(Model model) throws Exception{
		logger.info("listMainMenu(.................");
		String m_category = "Main";
		model.addAttribute("mList", service.listCateMenu(m_category));
		
		return "/menu/mainMenu";
	}
	
	@RequestMapping(value="/special", method = RequestMethod.GET)
	public String listSpecialMenu(Model model) throws Exception{
		logger.info("listSpecialMenu(.................");
		String m_category = "Special";
		model.addAttribute("mList", service.listCateMenu(m_category));
		
		return "/menu/specialMenu";
	}
	
	@RequestMapping(value="/side", method = RequestMethod.GET)
	public String listSideMenu(Model model) throws Exception{
		logger.info("listSideMenu(.................");
		String m_category = "Side";
		model.addAttribute("mList", service.listCateMenu(m_category));
		
		return "/menu/sideMenu";
	}
	
	@RequestMapping(value="/extra", method = RequestMethod.GET)
	public String listExtraMenu(Model model) throws Exception{
		logger.info("listExtraMenu(.................");
		String m_category = "Extra";
		model.addAttribute("mList", service.listCateMenu(m_category));
		
		return "/menu/extraMenu";
	}
	
	@RequestMapping(value="/beverage", method = RequestMethod.GET)
	public String listBeverageMenu(Model model) throws Exception{
		logger.info("listBeverageMenu(.................");
		String m_category = "Beverage";
		model.addAttribute("mList", service.listCateMenu(m_category));
		
		return "/menu/beverageMenu";
	}

}
