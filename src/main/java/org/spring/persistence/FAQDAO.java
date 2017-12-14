package org.spring.persistence;

import java.util.List;

import org.spring.domain.FAQVO;
import org.spring.domain.SearchCriteria;

public interface FAQDAO {

	List<FAQVO> listFAQSearchCriteria(SearchCriteria cri) throws Exception;

	int listFAQCountSearchCriteria(SearchCriteria cri) throws Exception;

}
