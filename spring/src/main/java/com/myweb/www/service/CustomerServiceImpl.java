package com.myweb.www.service;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.myweb.www.domain.AdminVO;
import com.myweb.www.domain.CustomerVO;
import com.myweb.www.repository.CustomerDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CustomerServiceImpl implements CustomerService{
	
	@Inject
	private CustomerDAO cdao;
	
	@Inject
	BCryptPasswordEncoder passwordencoder;
	
	@Override
    public int join(CustomerVO cvo) {
		log.info("회원가입 서비스 진입");
		CustomerVO tempUser = cdao.getUser(cvo);
		if(tempUser != null) {
			return 0;
		}
		if(cvo.getCid() == null || cvo.getCid().length() == 0) {
			return 0;
		}
		if(cvo.getCpw() == null || cvo.getCpw().length() == 0) {
			return 0;
		}
		int isOk = cdao.join(cvo);
		log.info("isOk : "+isOk);
		return isOk;
   }


	@Override
	public CustomerVO login(CustomerVO cvo) {
		log.info(">> 로그인 서비스 진입");
		CustomerVO user = cdao.getUser(cvo);
		if(user == null){ 
			log.info("로그인 실패");
			return null; }

			return user;

	}


	@Override
	public int modify(CustomerVO cvo) {
		log.info(">> 회원 정보 수정 서비스 진입");
		int isOk = cdao.modify(cvo);
		return isOk;
	}


	@Override
	public int delete(CustomerVO cvo) {
		log.info(">> 회원 정보 삭제 서비스 진입");
		int isOk = cdao.delete(cvo);
		log.info("isOk : "+isOk);
		return isOk;
	}


	@Override
	public AdminVO getAdmin() {
		log.info(">> 관리자 정보 가져오기");
		AdminVO admin = cdao.getAdmin();
		if(admin == null){ 
			log.info("로그인 실패");
			return null; }
		return admin;
	}
	
	
}
