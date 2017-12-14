package org.spring.persistence;

import java.util.Date;

import org.spring.domain.ReservationVO;
import org.spring.domain.UserVO;
import org.spring.dto.LoginDTO;

public interface UserDAO {
	public void signUp(UserVO vo) throws Exception;
	public UserVO login(LoginDTO dto) throws Exception;
	public void keepLogin(String u_email, String sessionId, Date next) throws Exception;
	public UserVO checkUserWithSessionKey(String value) throws Exception;
	public boolean checkId(UserVO vo) throws Exception;
	public void deleteId(UserVO vo) throws Exception;
	public boolean checkPwd(UserVO vo) throws Exception;
	public UserVO getUserInfo(UserVO vo) throws Exception;
	public void editInfo(UserVO vo) throws Exception;
	public ReservationVO getMyReservation(String r_email) throws Exception;
	public void deleteReservation(String r_email) throws Exception;
	public boolean checkLogin(UserVO vo) throws Exception;
}
