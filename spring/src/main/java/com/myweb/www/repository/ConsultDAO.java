package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.CalenderVO;
import com.myweb.www.domain.ConsultVO;
import com.myweb.www.domain.ProductVO;

public interface ConsultDAO {

	int register(ConsultVO csvo);

	List<ProductVO> isThere();

	int calender(CalenderVO clvo);

}

