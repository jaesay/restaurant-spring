package org.spring.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.Criteria;
import org.spring.domain.ReplyVO;

public interface ReplyService {
	 	public void addReply(ReplyVO vo) throws Exception;
	    public List<ReplyVO> listReply(Integer m_id) throws Exception;
	    public void modifyReply(ReplyVO vo) throws Exception;
	    public void removeReply(Integer rno) throws Exception;
	    public List<ReplyVO> listReplyPage(Integer m_id, Criteria cri) throws Exception;
	    public int count(Integer m_id) throws Exception;
		public Double getReviewScore(Integer m_id) throws Exception;
}
