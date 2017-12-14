package org.spring.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.Criteria;
import org.spring.domain.FAQVO;
import org.spring.domain.MenuVO;
import org.spring.domain.ReplyVO;
import org.spring.domain.ReservationVO;
import org.spring.domain.SearchCriteria;
import org.spring.domain.UserVO;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {
	private static final Logger logger = LoggerFactory.getLogger(AdminDAOImpl.class);

	@Inject
	private SqlSession sql;
	
	private static String namespace="org.spring.mapper.AdminMapper";
	
	@Override
	public List<UserVO> umlistAll() throws Exception {
		return sql.selectList(namespace + ".umlistAll");
	}

	@Override
	public List<UserVO> umlistCriteria(Criteria cri) throws Exception {
		return sql.selectList(namespace +".umlistCriteria", cri);
	}

	@Override
	public int umcountPaging(Criteria cri) throws Exception {
		return sql.selectOne(namespace +".umcountPaging", cri);
	}

	@Override
	public List<UserVO> umlistSearch(SearchCriteria cri) throws Exception {
		return sql.selectList(namespace+".umlistSearch", cri);
	}

	@Override
	public int umlistSearchCount(SearchCriteria cri) throws Exception {
		return sql.selectOne(namespace+".umlistSearchCount", cri);
	}

	@Override
	public void umremove(String[] cbArr) {
		Map<String, String> cbMap = new HashMap<String, String>();
		for(int i=0; i<cbArr.length; i++){
			cbMap.put("email" + i, cbArr[i]);
		}
		sql.delete(namespace+".umremove", cbMap);
	}

	@Override
	public UserVO umread(String u_email) {
		return sql.selectOne(namespace+".umread", u_email);
	}

	@Override
	public void ummodify(UserVO vo) throws Exception {
		sql.update(namespace+".umupdate", vo);
	}

	@Override
	public void umregister(UserVO vo) throws Exception {
		sql.insert(namespace+".uminsert", vo);
	}

	@Override
	public void postMenu(MenuVO mvo) throws Exception {
		sql.insert(namespace+".postMenu", mvo);
	}

	@Override
	public List<MenuVO> listMenu() throws Exception {
		return sql.selectList(namespace+".listMenu");
	}

	@Override
	public MenuVO readMenu(int m_id) throws Exception {
		return sql.selectOne(namespace+".readMenu", m_id);
	}

	@Override
	public void deleteMenu(int m_id) throws Exception {
		sql.delete(namespace+".deleteMenu", m_id);
	}

	@Override
	public void editMenu(MenuVO mvo) throws Exception {
		sql.update(namespace+".editMenu", mvo);
	}

	@Override
	public List<MenuVO> listMenuSearchCriteria(SearchCriteria cri) throws Exception {
		return sql.selectList(namespace+".listMenuSearchCriteria", cri);
	}

	@Override
	public int listMenuCountSearchCriteria(SearchCriteria cri) throws Exception {
		return sql.selectOne(namespace+".listMenuCountSearchCriteria", cri);
	}

	@Override
	public List<ReplyVO> listReviewSearchCriteria(SearchCriteria cri) throws Exception {
		return sql.selectList(namespace+".listReviewSearchCriteria", cri);
	}

	@Override
	public int listReviewCountSearchCriteria(SearchCriteria cri) throws Exception {
		return sql.selectOne(namespace+".listReviewCountSearchCriteria", cri);
	}

	@Override
	public void removeReplies(String[] cbArr) throws Exception {
		Map<String, String> cbMap = new HashMap<String, String>();
		for(int i=0; i<cbArr.length; i++){
			cbMap.put("rno" + i, cbArr[i]);
		}
		sql.delete(namespace+".removeReplies", cbMap);
	}

	@Override
	public List<ReservationVO> listReservationSearchCriteria(SearchCriteria cri) throws Exception {
		return sql.selectList(namespace+".listReservationSearchCriteria", cri);
	}

	@Override
	public int listReservationCountSearchCriteria(SearchCriteria cri) throws Exception {
		return sql.selectOne(namespace+".listReservationCountSearchCriteria", cri);
	}

	@Override
	public void deleteReservation(int r_id) throws Exception {
		sql.delete(namespace+".deleteReservation", r_id);
	}

	@Override
	public void removeReservations(String[] cbArr) throws Exception {
		Map<String, String> cbMap = new HashMap<String, String>();
		for(int i=0; i<cbArr.length; i++){
			cbMap.put("r_id" + i, cbArr[i]);
		}
		sql.delete(namespace+".removeReservations", cbMap);
	}

	@Override
	public void postFAQ(FAQVO vo) throws Exception {
		sql.insert(namespace+".postFAQ", vo);
	}

	@Override
	public List<FAQVO> listFAQSearchCriteria(SearchCriteria cri) throws Exception {
		return sql.selectList(namespace+".listFAQSearchCriteria", cri);
	}

	@Override
	public int listFAQCountSearchCriteria(SearchCriteria cri) throws Exception {
		return sql.selectOne(namespace+".listFAQCountSearchCriteria", cri);
	}

	@Override
	public void removeFAQs(String[] cbArr) throws Exception {
		Map<String, String> cbMap = new HashMap<String, String>();
		for(int i=0; i<cbArr.length; i++){
			cbMap.put("f_id" + i, cbArr[i]);
		}
		sql.delete(namespace+".removeFAQs", cbMap);
	}

	@Override
	public void deleteUser(String u_email) throws Exception {
		sql.delete(namespace+".deleteUser", u_email);
	}

	@Override
	public void editFAQ(FAQVO vo) throws Exception {
		sql.update(namespace+".editFAQ", vo);
	}

	@Override
	public FAQVO readFAQ(int f_id) throws Exception {
		return sql.selectOne(namespace+".readFAQ", f_id);
	}

	@Override
	public void deleteFAQ(int f_id) throws Exception {
		sql.delete(namespace+".deleteFAQ", f_id);
		
	}
}
