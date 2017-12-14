package org.spring.service;

import java.util.List;

import org.spring.domain.MenuVO;

public interface BudgetService {

	List<MenuVO> listBudgetMenu(String m_category) throws Exception;

}
