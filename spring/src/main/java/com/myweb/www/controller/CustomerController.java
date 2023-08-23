package com.myweb.www.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.CustomerVO;
import com.myweb.www.service.CustomerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/user/*")
@Controller
public class CustomerController {
	
	@Inject
	private CustomerService csv;
	
	@GetMapping("/signup")
	public String joinGet(Model m) {
		log.info("회원가입 페이지 진입");
		return "/user/signup";
	}
	
   @PostMapping("/signup")
   public String joinPost(Model m, CustomerVO cvo) {
      log.info("회원가입 시작");
           int isOk = csv.join(cvo);
           if (isOk > 0) {
               m.addAttribute("signupFail", 0);
               return "home";
               
           } else {
               m.addAttribute("signupFail", 1);
               return "/user/signup";
           }
    }

	@GetMapping("/login")
	public String loginGet() {
		return "/user/login";
	}
	
	@PostMapping("/login")		
	public String loginPost(Model m, CustomerVO cvo, HttpServletRequest request,
			RedirectAttributes ra) {		
		CustomerVO isUser = csv.login(cvo); 
//		AdminVO isAdmin = csv.getAdmin();
		if(isUser != null) {
			HttpSession ses = request.getSession();
			ses.setAttribute("ses", isUser);
			return "redirect:/home";
		}
		log.info("유저 정보 : "+isUser);
//		로그인 계정이 admin일 경우 관리자 페이지 이동
//		if(isAdmin.getAid().equals(cvo.getCid()) ) {
//			return "/product/register";
//		}else {			
//		}
		if(isUser == null) {
			m.addAttribute("loginFail", 1);
			log.info("loginFail"+m);
		}
		return "/user/login";
	}
	
	@GetMapping("/logout")
	public String logout(Model m, HttpServletRequest request) {
		request.getSession().removeAttribute("ses");
		request.getSession().invalidate();
		m.addAttribute("logout", 1);
		return "home";
	}
	
	@GetMapping("/modify")
	public String modifyGet() {
		return "/user/modify";
	}
	
	@PostMapping("/modify")
	public String modifyPost(Model m, CustomerVO cvo,
			HttpServletRequest request) {
		log.info("회원 정보 수정 진입");
		m.addAttribute("modifyFail", 0);
		log.info("modifyFail"+m);
		int isOk = csv.modify(cvo);
		HttpSession ses = request.getSession();
	    ses.setAttribute("ses", ses);
		if(isOk > 0) {
			m.addAttribute("modifyFail", 2);
            request.getSession().invalidate();
            log.info("modifyFail"+m);
            return "home";
			
		}else {
			m.addAttribute("modifyFail", 1);
			log.info("modifyFail"+m);
			return "/user/modify";
        }
	}
	
	@GetMapping("/delete")
	public String deleteGet() {
		return "/user/delete";
	}
	
	@PostMapping("/delete")
	public String deletePost(Model m, CustomerVO cvo,
			HttpServletRequest request) {
		m.addAttribute("deleteFail", 0);
		log.info("deleteFail"+m);
		log.info("회원 정보 삭제 진입");
		int isOk = csv.delete(cvo);
		if(isOk > 0) {
			m.addAttribute("deleteFail", 2);
            request.getSession().invalidate();
            log.info("deleteFail"+m);
            return "home";
			
		}else {
			m.addAttribute("deleteFail", 1);
			log.info("deleteFail"+m);
			return "/user/delete";
        }
	}
	
}
