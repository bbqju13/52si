package com.myweb.www.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.CalenderVO;
import com.myweb.www.repository.ReservationDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReservationServiceImpl implements ReservaionService {
	
	@Inject
	private ReservationDAO rdao;

	@Override
	public int calender(CalenderVO clvo) {
		log.info(">>> reservation calender in");
		return rdao.calender(clvo);
	}

}
