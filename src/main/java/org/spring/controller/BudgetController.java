package org.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.Criteria;
import org.spring.domain.MenuVO;
import org.spring.domain.PageMaker;
import org.spring.domain.ReplyVO;
import org.spring.service.BudgetService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/budget/*")
public class BudgetController {
	private static final Logger logger = LoggerFactory.getLogger(BudgetController.class);
	
	@Inject
	private BudgetService service;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String calBudget(Model model) throws Exception{
		logger.info("calBudget(..............");
		String m_category = "Main";
		model.addAttribute("mList", service.listBudgetMenu(m_category));
		
		
		return "/budget/budget";
	}
	
	@ResponseBody
	@RequestMapping(value = "/{m_category}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listCate(@PathVariable("m_category") String m_category){
		logger.info("listCate(................m_id,page >>>"+m_category);
		ResponseEntity<Map<String, Object>> entity = null;
			try {
				Map<String, Object> map = new HashMap<String, Object>();
				List<MenuVO> mlist = service.listBudgetMenu(m_category);
				map.put("mlist",mlist);
				entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				logger.error("listCate", e.getStackTrace());				
				entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
			}			
		return entity;
	}

}
