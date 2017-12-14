package org.spring.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.Criteria;
import org.spring.domain.ReplyVO;
import org.springframework.stereotype.Repository;

import oracle.net.aso.p;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	private static final Logger logger = LoggerFactory.getLogger(ReplyDAOImpl.class);
	@Inject
	private SqlSession sql;
	
	private static String namespace = "org.spring.mapper.ReplyMapper";
	@Override
	public void create(ReplyVO vo) throws Exception {
		sql.insert(namespace+".create", vo);
	}

	@Override
	public List<ReplyVO> list(Integer m_id) throws Exception {
		return sql.selectList(namespace+".list", m_id);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		sql.update(namespace+".update", vo);
	}

	@Override
	public void delete(Integer rno) throws Exception {
		sql.delete(namespace+".delete", rno);
	}

	@Override
	public List<ReplyVO> listPage(Integer m_id, Criteria cri) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("m_id", m_id);
		paramMap.put("cri", cri);
		return sql.selectList(namespace+".listPage", paramMap);
	}

	@Override
	public int count(Integer m_id) throws Exception {
		return sql.selectOne(namespace+".count", m_id);
	}

	@Override
	public int getM_id(Integer rno) throws Exception {
		return sql.selectOne(namespace + ".getMId", rno);
	}


}
