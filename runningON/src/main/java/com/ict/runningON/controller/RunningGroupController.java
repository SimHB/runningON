package com.ict.runningON.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.runningON.service.RunGroupsService;
import com.ict.runningON.vo.RunGroupsVO;

@Controller
public class RunningGroupController {
	
	/* 이하나 */
	
	@Autowired
	private RunGroupsService rungroupsService;
	
	// 모임 만들기
	@GetMapping("/groupstart")
	public ModelAndView groupstart() {
		return new ModelAndView("runninggroup/groupstart");
	}
	
	// 모임 만들기 완료
	@PostMapping("/group_start_ok")
	public ModelAndView groupStartOK(HttpServletRequest request, @ModelAttribute RunGroupsVO gvo) {
		try {
			ModelAndView mv = new ModelAndView("redirect:/onegroup");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = gvo.getFile_name();
			System.out.println(gvo.getFile_name());
			if(file == null || file.isEmpty()) {
				gvo.setGroup_img("");
			}else {
				UUID uuid = UUID.randomUUID();
				String group_image = uuid.toString() + "_" + file.getOriginalFilename();
				gvo.setGroup_img(group_image);
				
				// 업로드
				file.transferTo(new File(path, group_image));
			}
			// DB에 데이더 저장
			int result = rungroupsService.getGroupsInsert(gvo);
			
			if(result > 0) {
				
				return mv;				
			}
			
			return null;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	// 모임 가입 페이지
	@GetMapping("/join_main")
	public ModelAndView join_main(@RequestParam("group_idx") String group_idx) {
		ModelAndView mv = new ModelAndView("runninggroup/join_main");
		RunGroupsVO gvo = rungroupsService.getrungroupsselect(group_idx);
		mv.addObject("gvo", gvo);
		
		return mv;
	}
	
	// 모임 내부 페이지
	@GetMapping("/onegroup")
	public ModelAndView rungroup() {
		return new ModelAndView("runninggroup/onegroup");
	}
}