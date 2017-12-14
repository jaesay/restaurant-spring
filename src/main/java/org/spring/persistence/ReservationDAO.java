package org.spring.persistence;

import org.spring.domain.ReservationVO;

public interface ReservationDAO {
	public int insertReservation(ReservationVO vo) throws Exception;

	public ReservationVO checkReservation(String r_email) throws Exception;
}
