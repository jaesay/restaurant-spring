package org.spring.persistence;

import java.util.List;

import org.spring.domain.Criteria;
import org.spring.domain.FAQVO;
import org.spring.domain.MenuVO;
import org.spring.domain.ReplyVO;
import org.spring.domain.ReservationVO;
import org.spring.domain.SearchCriteria;
import org.spring.domain.UserVO;

public interface AdminDAO {
	public List<UserVO> umlistAll() throws Exception;
	public List<UserVO> umlistCriteria(Criteria cri) throws Exception;
	public int umcountPaging(Criteria cri) throws Exception;
	public List<UserVO> umlistSearch(SearchCriteria cri) throws Exception;
	public int umlistSearchCount(SearchCriteria cri) throws Exception;
	public void umremove(String[] cbArr) throws Exception;
	public UserVO umread(String u_email) throws Exception;
	public void ummodify(UserVO vo) throws Exception;
	public void umregister(UserVO vo) throws Exception;
	public void postMenu(MenuVO mvo) throws Exception;
	public List<MenuVO> listMenu() throws Exception;
	public MenuVO readMenu(int m_id) throws Exception;
	public void deleteMenu(int m_id) throws Exception;
	public void editMenu(MenuVO mvo) throws Exception;
	public List<MenuVO> listMenuSearchCriteria(SearchCriteria cri) throws Exception;
	public int listMenuCountSearchCriteria(SearchCriteria cri) throws Exception;
	public List<ReplyVO> listReviewSearchCriteria(SearchCriteria cri) throws Exception;
	public int listReviewCountSearchCriteria(SearchCriteria cri) throws Exception;
	public void removeReplies(String[] cbArr) throws Exception;
	public List<ReservationVO> listReservationSearchCriteria(SearchCriteria cri) throws Exception;
	public int listReservationCountSearchCriteria(SearchCriteria cri) throws Exception;
	public void deleteReservation(int r_id) throws Exception;
	public void removeReservations(String[] cbArr) throws Exception;
	public void postFAQ(FAQVO vo) throws Exception;
	public List<FAQVO> listFAQSearchCriteria(SearchCriteria cri) throws Exception;
	public int listFAQCountSearchCriteria(SearchCriteria cri) throws Exception;
	public void removeFAQs(String[] cbArr) throws Exception;
	public void deleteUser(String u_email) throws Exception;
	public void editFAQ(FAQVO vo) throws Exception;
	public FAQVO readFAQ(int f_id) throws Exception;
	public void deleteFAQ(int f_id) throws Exception;
}
