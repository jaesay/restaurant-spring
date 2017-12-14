package org.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.Criteria;
import org.spring.domain.ReplyVO;
import org.spring.persistence.MenuDAO;
import org.spring.persistence.ReplyDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReplyServiceImpl implements ReplyService {
	private static final Logger logger = LoggerFactory.getLogger(ReplyServiceImpl.class);
	
	@Inject
	private ReplyDAO dao;
	
	@Inject
	private MenuDAO mdao;
	
	@Transactional
	@Override
	public void addReply(ReplyVO vo) throws Exception {
		dao.create(vo);
		mdao.updateReplyCnt(vo.getM_id(), 1);
		mdao.updateReplyScore(vo.getM_id());
		
	}

	@Override
	public List<ReplyVO> listReply(Integer m_id) throws Exception {
		return dao.list(m_id);
	}

	@Transactional
	@Override
	public void modifyReply(ReplyVO vo) throws Exception {
		dao.update(vo);
		mdao.updateReplyScore(vo.getM_id());
	}

	@Transactional
	@Override
	public void removeReply(Integer rno) throws Exception {
		int m_id= dao.getM_id(rno);
		dao.delete(rno);
		mdao.updateReplyCnt(m_id, -1);
		int replyCnt = dao.count(m_id);
		if(replyCnt == 0){
			mdao.setReplyScoreZero(m_id);
		}else{
			mdao.updateReplyScore(m_id);
		}
	}

	@Override
	public List<ReplyVO> listReplyPage(Integer m_id, Criteria cri) throws Exception {
		return dao.listPage(m_id, cri);
	}

	@Override
	public int count(Integer m_id) throws Exception {
		return dao.count(m_id);
	}

	@Override
	public Double getReviewScore(Integer m_id) throws Exception {
		return mdao.getReviewScore(m_id);
	}


}
