package com.myweb.www.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.www.domain.CalenderVO;
import com.myweb.www.service.ConsultService;
import com.myweb.www.service.ReservaionService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/reservation/*")
@Controller
public class ReservationController {
	
	@Inject
	private ReservaionService rssv;
	
	@GetMapping("/calender")
	public String calenderGet() {
		log.info("캘린더 페이지 진입");
		return "/reservation/calender";
	}
	
	@PostMapping("/calender")
	public String calenderPost(Model m, CalenderVO clvo) {
		log.info("캘린더 폼 시작");
		String date = clvo.getDate().substring(0, 10); // 날짜 추출 (yyyy/MM/dd 형식)
		String time = clvo.getTime(); // 시간 추출
		log.info("CalenderVO: " + clvo);
		clvo.setDate(date);
		clvo.setTime(time);
		log.info("Filtered date: " + date);
		log.info("Filtered time: " + time);
		log.info("Clvo: " + clvo);
		int isOk = rssv.calender(clvo);
		log.info(">>>>>>>>>> "+ (isOk > 0 ? "성공" : "실패"));
		return "home";
	}
	
	@GetMapping("/admincalender")
	public String admincalenderGet() {
		log.info("캘린더 페이지 진입");
		return "/reservation/admincalender";
	}

}
