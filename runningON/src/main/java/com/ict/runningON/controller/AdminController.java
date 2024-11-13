package com.ict.runningON.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.runningON.service.AdminService;
import com.ict.runningON.vo.AdminVO;


@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/login")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("login Controller진입");
		ModelAndView mv = new ModelAndView("/adminpage/login");
		System.out.println("login Controller반환");
		return mv;
	}
	
	@PostMapping("/loginAction")
	public ModelAndView loginAction(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("loginActoin Controller진입");
		String admin_id = request.getParameter("id");
		System.out.println(admin_id);
		
		String admin_pw = request.getParameter("pw");
		System.out.println(admin_pw);
		
		adminService.AdminLoginAction(request, response);
		
		ModelAndView mv = new ModelAndView("/adminpage/loginaction");
		System.out.println("loginActoin Controller반환");
		return mv;
	}
	
	@GetMapping("/adminLogout")
	public ModelAndView adminLogout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		ModelAndView mv = new ModelAndView("/adminpage/login");
		
		return mv;
	}
	
	@GetMapping("/main")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/adminpage/main");
		
		return mv;
	}
	
	@GetMapping("/announcement")
	public ModelAndView announcement(@ModelAttribute AdminVO vo, Model model) {
		List<AdminVO> list = adminService.announcement();
		model.addAttribute("list", list);
		ModelAndView mv = new ModelAndView("/adminpage/announcement");
		return mv;
	}
	
	
	@GetMapping("/userlist")
	public ModelAndView userlist(Model model) {
		
		List<AdminVO> list = adminService.AdminUserListSelect();
		model.addAttribute("userList", list);
		ModelAndView mv = new ModelAndView("/adminpage/userlist");
		return mv;
	}
	
	@GetMapping("/user_information")
	public ModelAndView user_information(@RequestParam("id")String user_id, Model model) {
		AdminVO vo = new AdminVO();
		vo.setUser_id(user_id);
		AdminVO userInfo = adminService.adminUserDetail(vo);
		model.addAttribute("userInfo", userInfo);
		List<AdminVO> list = adminService.adminUserDetailGroup(vo);
		model.addAttribute("groupList", list);
		ModelAndView mv = new ModelAndView("/adminpage/user_information");	
		return mv;
	}
	
	@GetMapping("adminUserSearch")
	public ModelAndView adminUserSearch(@ModelAttribute AdminVO vo, Model model) {
		List<AdminVO>  list = adminService.adminUserSearchList(vo);
		model.addAttribute("searchList", list);
		ModelAndView mv = new ModelAndView("/adminpage/userSearchList");
		return mv;
	}
	
	
	@GetMapping("/usercomment")
	public ModelAndView usercomment() {
		
		ModelAndView mv = new ModelAndView("/adminpage/usercomment");
		return mv;
	}
	
	@GetMapping("/userboard")
	public ModelAndView userboard(@ModelAttribute AdminVO vo, Model model) {
		List<AdminVO> list = adminService.adminBoardList(vo);
		model.addAttribute("boardList", list);
		ModelAndView mv = new ModelAndView("/adminpage/userboard");
		return mv;
	}
	
	@PostMapping("/boardHide")
	public ModelAndView userBoardHide(@ModelAttribute AdminVO vo, Model model) {
		int result = adminService.adminBoardHide(vo);
		model.addAttribute("result", result);
		ModelAndView mv = new ModelAndView("/adminpage/userboardHide");
		return mv;
	}
	@PostMapping("/boardShow")
	public ModelAndView userBoardShow(@ModelAttribute AdminVO vo, Model model) {
		int result = adminService.adminBoardShow(vo);
		model.addAttribute("result", result);
		ModelAndView mv = new ModelAndView("/adminpage/userboardHide");
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
	

	
	@GetMapping("/user_board_1")
	public ModelAndView user_board_1(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/adminpage/user_board_1");
		
		return mv;
	}
	
}
