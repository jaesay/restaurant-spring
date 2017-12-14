package org.spring.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.spring.domain.MenuVO;
import org.springframework.stereotype.Repository;

@Repository
public class MenuDAOImp implements MenuDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace="org.spring.mapper.MenuMapper";
	
	@Override
	public List<MenuVO> listMenuAll() throws Exception {
		return sql.selectList(namespace+".listMenuAll");
	}

	@Override
	public List<MenuVO> listCateMenu(String m_category) throws Exception {
		return sql.selectList(namespace+".listCateMenu", m_category);
	}

	@Override
	public MenuVO readMenu(int m_id) throws Exception {
		return sql.selectOne(namespace+".readMenu", m_id);
	}

	@Override
	public void updateReplyCnt(Integer m_id, int amount) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("m_id", m_id);
		paramMap.put("amount", amount);
		
		sql.update(namespace + ".updateReplyCnt", paramMap);
	}

	@Override
	public void updateReplyScore(int m_id) throws Exception {
		sql.update(namespace + ".updateReplyScore", m_id);
	}

	@Override
	public Double getReviewScore(Integer m_id) throws Exception {
		return sql.selectOne(namespace+".getReviewScore", m_id);
	}

	@Override
	public void setReplyScoreZero(int m_id) throws Exception {
		sql.update(namespace+".setReplyScoreZero", m_id);
	}


}
