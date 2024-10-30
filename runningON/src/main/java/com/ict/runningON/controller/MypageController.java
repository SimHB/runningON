package com.ict.runningON.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageController {
	
	/* 고건우 */
	@GetMapping("/mypage")
	public ModelAndView mypage() {
		return new ModelAndView("mypage/mypage");
	}
	
	@GetMapping("/my_info")
	public ModelAndView my_info() {
		return new ModelAndView("mypage/my_info");
	}
	@GetMapping("/my_act")
	public ModelAndView my_act() {
		return new ModelAndView("mypage/my_act");
	}
	@GetMapping("/my_comment")
	public ModelAndView my_comment() {
		return new ModelAndView("mypage/my_comment");
	}
	@GetMapping("/my_scrap")
	public ModelAndView scrap() {
		ModelAndView mv = new ModelAndView("mypage/my_scrap");
		return mv;
	}
	@GetMapping("/view5")
	public ModelAndView view5() {
		ModelAndView mv = new ModelAndView("mypage/view5");
		return mv;
	}
	@GetMapping("/view6")
	public ModelAndView view6() {
		ModelAndView mv = new ModelAndView("mypage/view6");
		return mv;
	}
	@GetMapping("/view7")
	public ModelAndView view7() {
		ModelAndView mv = new ModelAndView("mypage/view7");
		return mv;
	}
	@GetMapping("/my_msg_write")
	public ModelAndView my_msg_write() {
		return new ModelAndView("mypage/my_msg_write");
	}
	@GetMapping("/my_msg_receive")
	public ModelAndView my_msg_recive() {
		return new ModelAndView("mypage/my_msg_receive");
	}
	@GetMapping("/my_msg_send")
	public ModelAndView my_msg_send() {
		return new ModelAndView("mypage/my_msg_send");
	}
	@GetMapping("/my_msg_detail")
	public ModelAndView my_msg_detail() {
		ModelAndView mv = new ModelAndView("mypage/my_msg_detail");
		return mv;
	}
	@GetMapping("/view12")
	public ModelAndView view12() {
		ModelAndView mv = new ModelAndView("mypage/view12");
		return mv;
	}
	
}