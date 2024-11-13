package com.ict.runningON.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.runningON.service.BoardsService;
import com.ict.runningON.vo.BoardsVO;
import com.ict.runningON.vo.UsersVO;

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
	public ModelAndView getBoard(@RequestParam("board_idx") String board_idx, HttpSession session) {
		try {
			ModelAndView mv = new ModelAndView("boards/board");
			BoardsVO bvo = boardsService.getBoardInfo(board_idx);
			UsersVO uvo = (UsersVO) session.getAttribute("uvo");
			
			mv.addObject("bvo", bvo);
			mv.addObject("uvo", uvo);
			
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}