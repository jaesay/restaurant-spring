package org.spring.service;

import java.util.Date;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.ReservationVO;
import org.spring.domain.UserVO;
import org.spring.dto.LoginDTO;
import org.spring.persistence.UserDAO;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Inject
	private UserDAO dao;
	
	@Override
	public void signUp(UserVO vo) throws Exception {
		dao.signUp(vo);
	}

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public void keepLogin(String u_email, String sessionId, Date next) throws Exception {
		dao.keepLogin(u_email, sessionId, next);
	}

	@Override
	public UserVO checkLoginBefore(String value) throws Exception {
		return dao.checkUserWithSessionKey(value);
	}

	@Override
	public boolean checkId(UserVO vo) throws Exception {
		return dao.checkId(vo);
	}

	@Override
	public void deleteId(UserVO vo) throws Exception {
		dao.deleteId(vo);
		
	}

	@Override
	public boolean checkPwd(UserVO vo) throws Exception {
		return dao.checkPwd(vo);
	}

	@Override
	public UserVO getUserInfo(UserVO vo) throws Exception {
		return dao.getUserInfo(vo);
	}

	@Override
	public void editInfo(UserVO vo) throws Exception {
		dao.editInfo(vo);
		
	}

	@Override
	public ReservationVO getMyReservation(String r_email) throws Exception {
		return dao.getMyReservation(r_email);
	}

	@Override
	public void deleteReservation(String r_email) throws Exception {
		dao.deleteReservation(r_email);
		
	}

	@Override
	public boolean checkLogin(UserVO vo) throws Exception {
		return dao.checkLogin(vo);
	}
}
