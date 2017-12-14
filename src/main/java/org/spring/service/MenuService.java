package org.spring.service;

import java.util.List;

import org.spring.domain.MenuVO;

public interface MenuService {
	public List<MenuVO> listMenuAll() throws Exception;
	public List<MenuVO> listCateMenu(String m_category) throws Exception;
	public MenuVO readMenu(int m_id) throws Exception;
}
