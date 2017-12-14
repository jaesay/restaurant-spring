package org.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.spring.domain.MenuVO;
import org.spring.persistence.MenuDAO;
import org.springframework.stereotype.Service;

@Service
public class BudgetServiceImpl implements BudgetService {

	@Inject
	private MenuDAO mdao;

	@Override
	public List<MenuVO> listBudgetMenu(String m_category) throws Exception {
		return mdao.listCateMenu(m_category);	
	}
	
	
}
