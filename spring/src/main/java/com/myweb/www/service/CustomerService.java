package com.myweb.www.service;

import com.myweb.www.domain.AdminVO;
import com.myweb.www.domain.CustomerVO;

public interface CustomerService {

	int join(CustomerVO cvo);

	CustomerVO login(CustomerVO cvo);

	int modify(CustomerVO cvo);

	int delete(CustomerVO cvo);

	AdminVO getAdmin();

}
