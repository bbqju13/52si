package com.myweb.www.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.service.CommentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/comment/*")
@Controller
public class CommentController {
	
	@Inject
	private CommentService cmsv;

	@PostMapping(value = "/post", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> post(@RequestBody CommentVO cmvo){
		log.info(">>> cvo : "+cmvo);
		int isOk = cmsv.post(cmvo);
		return isOk > 0? new ResponseEntity<String>("1", HttpStatus.OK)
		: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/{pno}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<CommentVO>> spread(@PathVariable("pno")int pno,
			Model m){
		log.info(">>>> comment List pno "+pno);
		//DB 요청
		List<CommentVO> list = cmsv.getList(pno);
//		int getAvg = cmsv.getAvg(pno);
//		log.info("히힛 : "+getAvg);
		return new ResponseEntity<List<CommentVO>>(list, HttpStatus.OK);
	}
	
//	@GetMapping(value="/{pno}", produces = {MediaType.APPLICATION_JSON_VALUE})
//	public ResponseEntity<Integer> sumList(@PathVariable("pno")int pno,
//			Model m){
//		int sumList = cmsv.sumList(pno);
//		return new ResponseEntity<Integer>(sumList, HttpStatus.OK);
//	}
	
	@PutMapping(value = "/{cno}", consumes = "application/json"
			, produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> edit(@PathVariable("cno")int cno,
			@RequestBody CommentVO cmvo){
		log.info(">>> edit cno : "+cno);
		log.info(">>> edit cvo : "+cmvo);
		
		int isOk = cmsv.edit(cmvo);
		
		return isOk>0?
				new ResponseEntity<String>("1",HttpStatus.OK)
				:new ResponseEntity<String>("0",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value = "/{cno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String>remove(@PathVariable("cno")int cno){
		log.info(">>> remove cno : "+cno);
		int isOk = cmsv.remove(cno);
		return isOk > 0? new ResponseEntity<String>("1", HttpStatus.OK)
		: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	

}

