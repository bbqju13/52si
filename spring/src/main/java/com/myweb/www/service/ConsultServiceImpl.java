package com.myweb.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.CalenderVO;
import com.myweb.www.domain.ConsultVO;
import com.myweb.www.domain.ProductVO;
import com.myweb.www.repository.ConsultDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ConsultServiceImpl implements ConsultService{
	
	@Inject
	private ConsultDAO csdao;

	@Override
	public int register(ConsultVO csvo) {
		return csdao.register(csvo);
	}

	@Override
	public List<ProductVO> isThere() {
		log.info(">>> consult isThere in");
		return csdao.isThere();
	}

	@Override
	public int calender(CalenderVO clvo) {
		log.info(">>> consult calender in");
		return csdao.calender(clvo);
	}
}

