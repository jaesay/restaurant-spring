package org.spring.service;

import org.spring.domain.ReservationVO;

public interface ReservationService {

	public int insertReservation(ReservationVO vo) throws Exception;

	public ReservationVO checkReservation(String r_email) throws Exception;
	
}
