package com.ict.search.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.runningON.service.SearchService;
import com.ict.runningON.vo.PostsVO;


@Controller
public class SearchController {
	
		@Autowired
		private SearchService searchService;
		
		@PostMapping("/emp_dynamic_search")
		public ModelAndView emp_dynamic_search(
				@RequestParam("keyword") String keyword) {
			try {
				ModelAndView mv = new ModelAndView("index");
				List<PostsVO> list = searchService.getSearch(keyword);
				mv.addObject("list", list);
				mv.addObject("keyword", keyword);
				return mv;
			} catch (Exception e) {
				System.out.println(e);
				return null;
			}
		}
}
