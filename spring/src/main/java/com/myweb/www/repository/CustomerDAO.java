package com.myweb.www.repository;

import com.myweb.www.domain.AdminVO;
import com.myweb.www.domain.CustomerVO;

public interface CustomerDAO {

	CustomerVO getUser(CustomerVO cvo);

	int join(CustomerVO uvo);

	int modify(CustomerVO cvo);

	int delete(CustomerVO cvo);

	AdminVO getAdmin();

}
