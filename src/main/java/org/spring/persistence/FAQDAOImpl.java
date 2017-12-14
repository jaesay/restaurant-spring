package org.spring.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.spring.domain.FAQVO;
import org.spring.domain.SearchCriteria;
import org.springframework.stereotype.Repository;

@Repository
public class FAQDAOImpl implements FAQDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace="org.spring.mapper.FAQMapper";

	@Override
	public List<FAQVO> listFAQSearchCriteria(SearchCriteria cri) throws Exception {
		return sql.selectList(namespace+".listFAQSearchCriteria", cri);
	}

	@Override
	public int listFAQCountSearchCriteria(SearchCriteria cri) throws Exception {
		return sql.selectOne(namespace+".listFAQCountSearchCriteria", cri);
	}
}
