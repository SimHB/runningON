package com.ict.runningON.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.runningON.service.BoardsService;
import com.ict.runningON.vo.BoardsVO;

@Controller
public class BoardsController {
	
	/* 심현보 */
	@Autowired
	private BoardsService boardsService;
	
	// 메인페이지(index)
	@GetMapping("/home")
	public ModelAndView homePage() {
		return new ModelAndView("index");
	}
	
	// 게시판 페이지
	@GetMapping("/board")
	public ModelAndView getBoard(@RequestParam("board_idx") String board_idx) {
		ModelAndView mv = new ModelAndView("boards/board");
		
		BoardsVO board_t = boardsService.getBoardInfo(board_idx); 
	    mv.addObject("board_t", board_t);
		
		return mv;
	}
}