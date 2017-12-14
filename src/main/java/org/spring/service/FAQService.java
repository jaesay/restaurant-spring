package org.spring.service;

import java.util.List;

import org.spring.domain.FAQVO;
import org.spring.domain.SearchCriteria;

public interface FAQService {

	List<FAQVO> listFAQSearchCriteria(SearchCriteria cri) throws Exception;

	int listFAQCountSearchCriteria(SearchCriteria cri) throws Exception;

}
