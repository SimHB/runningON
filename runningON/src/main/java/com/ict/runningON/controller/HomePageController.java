package com.ict.runningON.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomePageController {
	
	/* 최소희 */
	
	// 날씨 페이지
	@GetMapping("/weather")
	public ModelAndView ajaxTest() {
		return new ModelAndView("/weather");
	}
	
	// 로그인 페이지
	@GetMapping("/login1")
	public ModelAndView login1() {
		return new ModelAndView("/login");
	}
    
	// 회원가입 페이지
	@GetMapping("/login_join_form")
	public ModelAndView join() {
		return new ModelAndView("/join");
	}
}