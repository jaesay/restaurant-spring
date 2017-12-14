package org.spring.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.ReservationVO;
import org.spring.domain.UserVO;
import org.spring.dto.LoginDTO;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {
	private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "org.spring.mapper.UserMapper";
	
	@Override
	public void signUp(UserVO vo) throws Exception {
		sql.insert(namespace + ".signUp", vo);
	}

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return sql.selectOne(namespace+".login", dto);
	}

	@Override
	public void keepLogin(String u_email, String sessionId, Date next) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("u_email", u_email);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);
		sql.update(namespace+".keepLogin", paramMap);
	}

	@Override
	public UserVO checkUserWithSessionKey(String value) throws Exception {
		return sql.selectOne(namespace+".checkUserWithSessionKey", value);
	}

	@Override
	public boolean checkId(UserVO vo) throws Exception {
		if(sql.selectOne(namespace+".checkId", vo) == null){
			return true;
		}
		return false;
	}

	@Override
	public void deleteId(UserVO vo) throws Exception {
		sql.delete(namespace+".deleteId", vo);
	}

	@Override
	public boolean checkPwd(UserVO vo) throws Exception {
		if(sql.selectOne(namespace+".checkPwd", vo) == null){
			return false;
		}
		return true;
	}

	@Override
	public UserVO getUserInfo(UserVO vo) throws Exception {
		return sql.selectOne(namespace+".checkId", vo);
	}

	@Override
	public void editInfo(UserVO vo) throws Exception {
		sql.update(namespace+".editInfo", vo);
	}

	@Override
	public ReservationVO getMyReservation(String r_email) throws Exception {
		return sql.selectOne(namespace+".getMyReservation", r_email);
	}

	@Override
	public void deleteReservation(String r_email) throws Exception {
		sql.delete(namespace+".deleteReservation", r_email);
	}

	@Override
	public boolean checkLogin(UserVO vo) throws Exception {
		if(sql.selectOne(namespace+".checkLogin", vo) == null){
			return false;
		}
		return true;
	}
}
