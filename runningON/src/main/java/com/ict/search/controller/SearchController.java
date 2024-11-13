package com.ict.search.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class SearchController {
		
	
	@PostMapping("/emp_dynamic_search")
	public ModelAndView emp_dynamic_search(
			@RequestParam("keyword") String keyword) {
			ModelAndView mv = new ModelAndView("boards/search");
			mv.addObject("keyword", keyword);  // keyword를 JSP로 전달
			System.out.println(keyword);
			return mv;
	}
}