package org.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.Criteria;
import org.spring.domain.FAQVO;
import org.spring.domain.MenuVO;
import org.spring.domain.ReplyVO;
import org.spring.domain.ReservationVO;
import org.spring.domain.SearchCriteria;
import org.spring.domain.UserVO;
import org.spring.persistence.AdminDAO;
import org.spring.persistence.MenuDAO;
import org.spring.persistence.ReplyDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdminServiceImpl implements AdminService {
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Inject
	private AdminDAO dao;
	
	@Inject
	private ReplyDAO rdao;
	
	@Inject
	private MenuDAO mdao;
	
	@Override
	public List<UserVO> umlistAll() throws Exception {
		return dao.umlistAll();
	}

	@Override
	public List<UserVO> umlistCriteria(Criteria cri) throws Exception {
		return dao.umlistCriteria(cri);
	}

	@Override
	public int umlistCountCriteria(Criteria cri) throws Exception {
		return dao.umcountPaging(cri);
	}

	@Override
	public List<UserVO> umlistSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.umlistSearch(cri);
	}

	@Override
	public int umlistCountSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.umlistSearchCount(cri);
	}

	@Override
	public void umremove(String[] cbArr) throws Exception {
		dao.umremove(cbArr);
		
	}

	@Override
	public UserVO umread(String u_email) throws Exception {
		return dao.umread(u_email);
	}

	@Override
	public void ummodify(UserVO vo) throws Exception {
		dao.ummodify(vo);
	}

	@Override
	public void umregister(UserVO vo) throws Exception {
		dao.umregister(vo);
	}

	@Override
	public void postMenu(MenuVO mvo) throws Exception {
		dao.postMenu(mvo);
	}

	@Override
	public List<MenuVO> listMenu() throws Exception {
		return dao.listMenu();
	}

	@Override
	public MenuVO readMenu(int m_id) throws Exception {
		return dao.readMenu(m_id);
	}

	@Override
	public void deleteMenu(int m_id) throws Exception {
		dao.deleteMenu(m_id);
		
	}

	@Override
	public void editMenu(MenuVO mvo) throws Exception {
		dao.editMenu(mvo);
	}

	@Override
	public List<MenuVO> listMenuSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listMenuSearchCriteria(cri);
	}

	@Override
	public int listMenuCountSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listMenuCountSearchCriteria(cri);
	}

	@Override
	public List<ReplyVO> listReviewSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listReviewSearchCriteria(cri);
	}

	@Override
	public int listReviewCountSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listReviewCountSearchCriteria(cri);
	}

	@Transactional
	@Override
	public void removeReplies(String[] cbArr, int delCount) throws Exception {
		int[] delId = {0,0,0,0,0,0,0,0,0,0}; 
		for(int i=0; i<delCount; i++){
			int m_id = rdao.getM_id(Integer.parseInt(cbArr[i]));
			delId[i] = m_id;
			mdao.updateReplyCnt(m_id, -1);
		}	
		dao.removeReplies(cbArr);
		for(int j=0; j<delCount; j++){
			int replyCnt = rdao.count(delId[j]);
			if(replyCnt == 0){
				mdao.setReplyScoreZero(delId[j]);
			}else{
				mdao.updateReplyScore(delId[j]);
			}
		}
		
	}

	@Transactional
	@Override
	public void deleteReply(int rno) throws Exception {
		int m_id= rdao.getM_id(rno);
		rdao.delete(rno);
		mdao.updateReplyCnt(m_id, -1);	
		int replyCnt = rdao.count(m_id);
		if(replyCnt == 0){
			mdao.setReplyScoreZero(m_id);
		}else{
			mdao.updateReplyScore(m_id);
		}
	}

	@Override
	public List<ReservationVO> listReservationSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listReservationSearchCriteria(cri);
	}

	@Override
	public int listReservationCountSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listReservationCountSearchCriteria(cri);
	}

	@Override
	public void deleteReservation(int r_id) throws Exception {
		dao.deleteReservation(r_id);		
	}

	@Override
	public void removeReservations(String[] cbArr) throws Exception {
		dao.removeReservations(cbArr);
	}

	@Override
	public void postFAQ(FAQVO vo) throws Exception {
		dao.postFAQ(vo);		
	}

	@Override
	public List<FAQVO> listFAQSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listFAQSearchCriteria(cri);
	}

	@Override
	public int listFAQCountSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listFAQCountSearchCriteria(cri);
	}

	@Override
	public void removeFAQs(String[] cbArr) throws Exception {
		dao.removeFAQs(cbArr);
	}

	@Override
	public void deleteUser(String u_email) throws Exception {
		dao.deleteUser(u_email);		
	}

	@Override
	public void editFAQ(FAQVO vo) throws Exception {
		dao.editFAQ(vo);
	}

	@Override
	public FAQVO readFAQ(int f_id) throws Exception {
		return dao.readFAQ(f_id);
	}

	@Override
	public void deleteFAQ(int f_id) throws Exception {
		dao.deleteFAQ(f_id);
	}
	
	


}
