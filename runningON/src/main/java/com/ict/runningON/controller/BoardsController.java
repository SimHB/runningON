package com.ict.runningON.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardsController {
	
	/* 심현보 */
	
	// 메인페이지(index)
	@GetMapping("/home")
	public ModelAndView homePage() {
		return new ModelAndView("index");
	}
	
	// 게시판 페이지
	@GetMapping("/free_board")
	public ModelAndView freeBoard() {
		return new ModelAndView("boards/board");
	}
	
	// 러닝모임 게시판
	@GetMapping("/group_board")
	public ModelAndView group() {
		return new ModelAndView("boards/groupboard");
	}
}