package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.CalenderVO;
import com.myweb.www.domain.ConsultVO;
import com.myweb.www.domain.ProductVO;

public interface ConsultService {

	int register(ConsultVO csvo);

	List<ProductVO> isThere();

	int calender(CalenderVO clvo);

}
