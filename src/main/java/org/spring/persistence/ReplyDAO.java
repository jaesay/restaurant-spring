package org.spring.persistence;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.Criteria;
import org.spring.domain.ReplyVO;

public interface ReplyDAO {
	public void create(ReplyVO vo)throws Exception;
	public List<ReplyVO> list(Integer m_id)throws Exception;
	public void update(ReplyVO vo)throws Exception;
	public void delete(Integer rno)throws Exception;
	public List<ReplyVO> listPage(Integer m_id, Criteria cri) throws Exception;
	public int count(Integer m_id) throws Exception;
	public int getM_id(Integer rno) throws Exception;
}
