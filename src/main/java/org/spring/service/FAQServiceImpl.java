package org.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.spring.domain.FAQVO;
import org.spring.domain.SearchCriteria;
import org.spring.persistence.FAQDAO;
import org.springframework.stereotype.Service;

@Service
public class FAQServiceImpl implements FAQService {

	@Inject
	private FAQDAO dao;

	@Override
	public List<FAQVO> listFAQSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listFAQSearchCriteria(cri);
	}

	@Override
	public int listFAQCountSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listFAQCountSearchCriteria(cri);
	}
}
