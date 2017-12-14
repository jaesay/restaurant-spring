package org.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.spring.domain.MenuVO;
import org.spring.persistence.MenuDAO;
import org.springframework.stereotype.Service;

@Service
public class MenuServiceImpl implements MenuService {

	@Inject
	private MenuDAO dao;

	@Override
	public List<MenuVO> listMenuAll() throws Exception {
		return dao.listMenuAll();
	}

	@Override
	public List<MenuVO> listCateMenu(String m_category) throws Exception {
		return dao.listCateMenu(m_category);
	}

	@Override
	public MenuVO readMenu(int m_id) throws Exception {
		return dao.readMenu(m_id);
	}
}
