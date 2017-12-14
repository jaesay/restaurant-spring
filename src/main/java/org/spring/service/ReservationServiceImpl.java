package org.spring.service;

import javax.inject.Inject;

import org.spring.domain.ReservationVO;
import org.spring.persistence.ReservationDAO;
import org.springframework.stereotype.Service;

@Service
public class ReservationServiceImpl implements ReservationService {
	@Inject
	private ReservationDAO dao;

	@Override
	public int insertReservation(ReservationVO vo) throws Exception {
		return dao.insertReservation(vo);
		
	}

	@Override
	public ReservationVO checkReservation(String r_email) throws Exception {
		return dao.checkReservation(r_email);
	}
}
