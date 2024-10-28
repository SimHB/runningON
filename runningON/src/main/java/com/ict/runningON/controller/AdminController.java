package com.ict.runningON.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@GetMapping("/login")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/adminpage/login");
		
		return mv;
	}
	
	@GetMapping("/main")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/adminpage/main");
		
		return mv;
	}
	
	@GetMapping("/announcement")
	public ModelAndView announcement(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/adminpage/announcement");
		
		return mv;
	}
	
	
	@GetMapping("/userlist")
	public ModelAndView userlist(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/adminpage/userlist");
		
		return mv;
	}
	
	@GetMapping("/usercomment")
	public ModelAndView usercomment(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/adminpage/usercomment");
		
		return mv;
	}
	
	@GetMapping("/userboard")
	public ModelAndView userboard(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/adminpage/userboard");
		
		return mv;
	}
	
	@GetMapping("/test")
	public ModelAndView test(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/adminpage/test");
		
		return mv;
	}
	
	@GetMapping("/reportedcomment")
	public ModelAndView reportedcomment(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/adminpage/reportedcomment");
		
		return mv;
	}
	
	@GetMapping("/reportedboard")
	public ModelAndView reportedborad(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/adminpage/reportedboard");
		
		return mv;
	}
	
	@GetMapping("/reporteduser")
	public ModelAndView reporteduser(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/adminpage/reporteduser");
		
		return mv;
	}
	
	@GetMapping("/user_information")
	public ModelAndView user_information(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/adminpage/user_information");
		
		return mv;
	}
	
	@GetMapping("/user_board_1")
	public ModelAndView user_board_1(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/adminpage/user_board_1");
		
		return mv;
	}
	
}
