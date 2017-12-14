package org.spring.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.spring.domain.ReservationVO;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAOImpl implements ReservationDAO {
	@Inject
	private SqlSession sql;
	
	private static String namespace="org.spring.mapper.ReservationMapper";

	@Override
	public int insertReservation(ReservationVO vo) throws Exception {
		return sql.insert(namespace + ".insertReservation", vo);
	}

	@Override
	public ReservationVO checkReservation(String r_email) throws Exception {
		return sql.selectOne(namespace+".checkReservation", r_email);
	}
}
