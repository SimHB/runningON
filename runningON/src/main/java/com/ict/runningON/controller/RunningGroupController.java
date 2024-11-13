package com.ict.runningON.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.protobuf.Service;
import com.ict.runningON.service.RunGroupsService;
import com.ict.runningON.vo.Group_joinVO;
import com.ict.runningON.vo.PostsVO;
import com.ict.runningON.vo.RunGroupsVO;
import com.ict.runningON.vo.UsersVO;

@Controller
public class RunningGroupController {
	@Autowired
	private RunGroupsService rungroupsService;
	
	// 모임 만들기
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
				String group_img = uuid.toString() + "_" + file.getOriginalFilename();
				gvo.setGroup_img(group_img);
				
				// 업로드
				file.transferTo(new File(path, group_img));
			}
			// user_id 가 메퍼에 고정되어있음
			System.out.println(request.getAttribute("user_id"));
			gvo.setUser_id((String) request.getAttribute("user_id"));
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
	
	// 모임 게시판 글쓰기
	@GetMapping("/g_write")
	public ModelAndView g_write() {
		ModelAndView mv = new ModelAndView("runninggroup/g_write");		
		return mv;
	}
	
	@GetMapping("/groupstart")
	public ModelAndView groupstart() {
		ModelAndView mv = new ModelAndView("runninggroup/groupstart");		
		return mv;
	}
	
	@PostMapping("/g_post_write_ok") 
	public ModelAndView boardwriteok(PostsVO pvo, HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("redirect:/board?board_idx="+pvo.getBoard_idx());
			int result = rungroupsService.getGroupPostInsert(pvo);
			if(result>0) {
				return mv;
			}
			return new ModelAndView("posts/error");
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("posts/error");
		}
	}
	
	// 모임 가입 페이지
	@GetMapping("/join_main")

	 public ModelAndView join_main(@RequestParam("group_idx") String group_idx) {
	 ModelAndView mv = new ModelAndView("runninggroup/join_main");
	 //Integer.parseInt(group_idx)      getvo(여기)
	 RunGroupsVO gvo = rungroupsService.getgvo(group_idx);
	 mv.addObject("gvo", gvo);
	 List<PostsVO> pvo = rungroupsService.getpvo(group_idx);
	 mv.addObject("list", pvo) ;
	 List<String> g_list = rungroupsService.getgmem(group_idx);
	 mv.addObject("g_list", g_list);
	 return mv;
	}
	
	// 모임 가입 하기
	@PostMapping("/group_join_go")
	public ModelAndView join_group(@RequestParam("group_idx") String group_idx, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/join_main?group_idx=" + group_idx);
		// RunGroupsVO gvo = rungroupsService.getgvo(15);
		Group_joinVO gjvo = new Group_joinVO();
		// UsersVO uvo = (UsersVO) session.getAttribute("uvo");
        // String user_id = uvo.getUser_id();
		String user_id = "test2";
		gjvo.setUser_id(user_id);
		gjvo.setGroup_idx(group_idx);
		int resutl = rungroupsService.GroupJoinInsert(gjvo);
		// mv.addObject("gvo", gvo);
		return mv;
	}
	
	// 모임 내부 페이지
	@GetMapping("/onegroup")
	public ModelAndView onegroup(@RequestParam("group_idx") String group_idx) {
	ModelAndView mv = new ModelAndView("runninggroup/onegroup");
	RunGroupsVO gvo = rungroupsService.getgvo(group_idx);
	mv.addObject("gvo", gvo);
	List<PostsVO> pvo = rungroupsService.getpvo(group_idx);
	mv.addObject("list", pvo) ;
	List<String> g_list = rungroupsService.getgmem(group_idx);
	mv.addObject("g_list", g_list);	
	PostsVO pvo2 = rungroupsService.noti(group_idx);
	mv.addObject("pvo2", pvo2);
	return mv;
		
	}
}