package org.spring.persistence;

import java.util.List;

import org.spring.domain.MenuVO;

public interface MenuDAO {
	public List<MenuVO> listMenuAll() throws Exception;
	public List<MenuVO> listCateMenu(String m_category) throws Exception;
	public MenuVO readMenu(int m_id) throws Exception;
	public void updateReplyCnt(Integer m_id, int amount) throws Exception;
	public void updateReplyScore(int m_id) throws Exception;
	public Double getReviewScore(Integer m_id) throws Exception;
	public void setReplyScoreZero(int m_id) throws Exception;
}
