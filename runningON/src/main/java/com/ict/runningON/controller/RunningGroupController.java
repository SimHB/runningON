package com.ict.runningON.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RunningGroupController {
	
	/* 이하나 */
	
	// 모임 글쓰기
	@GetMapping("/groupstart")
	public ModelAndView groupstart() {
		return new ModelAndView("runninggroup/groupstart");
	}
	
	// 모임 가입 페이지
	@GetMapping("/join_main")
	public ModelAndView rungroup2() {
		return new ModelAndView("runninggroup/join_main");
	}
	
	// 모임 내부 페이지
	@GetMapping("/rungroup")
	public ModelAndView rungroup() {
		return new ModelAndView("runninggroup/onegroup");
	}
}