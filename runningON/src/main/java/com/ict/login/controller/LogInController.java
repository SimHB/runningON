package com.ict.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.runningON.service.LoginService;
import com.ict.runningON.vo.UsersVO;

@Controller
public class LogInController {

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder ;
	
	// 로그인 폼 으로 이동  
	@GetMapping("/loginForm")
	public ModelAndView getLogInForm() {
		return new ModelAndView("/login");
	}
	
	// 회원가입 폼으로 이동
	@GetMapping("/login_join_form")
	public ModelAndView getLogInJoinForm() {
		return new ModelAndView("/join_test2");
	}
	
	// 회원가입하기 
	@PostMapping("/login_join_ok")
	public ModelAndView getLogInJoinOk(UsersVO uvo) {
		ModelAndView mv = new ModelAndView("/login");
		try {
			System.out.println("name: "  +uvo.getUser_name());
			// 비번 암호화
			String user_pw = passwordEncoder.encode(uvo.getUser_pw());
			uvo.setUser_pw(user_pw);
			
			int result = loginService.LoginJoin(uvo);
			if(result>0) {
				mv.addObject("result", "1");
			}else {
				mv.addObject("result", "0");
			}
			
		} catch (Exception e) {
			System.out.println(e);
			mv.addObject("result", "0");
		}
		return mv;
	}
	
	// 아이디 중복확인
	/*
	 * @GetMapping("/checkUserId") public ResponseEntity<String>
	 * checkUserId(@RequestParam("user_id") String userId) { boolean isAvailable =
	 * loginService.isUserIdAvailable(userId); if (isAvailable) { return
	 * ResponseEntity.ok("available"); } else { return
	 * ResponseEntity.ok("unavailable"); } }
	 */
	
	@PostMapping("/checkId")
	@ResponseBody
	public String checkId(@RequestParam("userId") String userId) {
	    try {
	        // 아이디가 존재하는지 확인
	        boolean isExist = loginService.isUserIdAvailable(userId);

	        if (isExist) {
	            return "fail"; // 아이디가 이미 존재
	        } else {
	            return "success"; // 아이디가 사용 가능
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "error"; // 오류 발생 시
	    }
	}


	// 로그인 하기
	@PostMapping("/login_login")
	// uvo jsp에서 입력한 정보
	public ModelAndView getLoginOK(UsersVO uvo, HttpSession session) {
		try {
			ModelAndView mv = new ModelAndView();
			// uvo2에 DB에서 불러온 정보 저장
			UsersVO uvo2 = loginService.LoginChk(uvo.getUser_id());

			// 입력된 아이디 출력
			System.out.println("입력된 아이디: " + uvo.getUser_id()); 
			// DB에서 가져온 아이디 출력
			System.out.println("DB에서 가져온 아이디: " + (uvo2 != null ? uvo2.getUser_id() : "해당 아이디 없음")); 

			
			if(uvo2 == null) {
				// 아이디가 없어서 로그인 실패
				return new ModelAndView("/login");
			}else {
			   // 비밀번호 검사 
				
				if(passwordEncoder.matches(uvo.getUser_pw(), uvo2.getUser_pw())) {
			//	if(uvo.getUser_pw().equals(uvo2.getUser_pw())) {
					// 성공
					session.setAttribute("loginchk", "ok");
					// 일반유저와 관리자 유저 구분
					if(uvo2.getUser_id().equals("admin")) {
						session.setAttribute("admin", "ok");
					}
					mv.setViewName("redirect:/home");
					session.setAttribute("uvo", uvo);
					return mv;
				}else {
					
					// 비밀번호가 안 맞아서 로그인 실패
					// request에 값을 저장해서 loginForm에서 로그인 실패를 alert 할 수 있다.
					return new ModelAndView("/login");
				}
			}
			
		} catch (Exception e) {
			System.out.println("e:"+e);
			
		}
		
		return null;
		
			
	}


	
	// 로그아웃
    @GetMapping("/logout_logout")
    public ModelAndView memLogout(HttpSession session) {
        // 세션 초기화
        session.invalidate();
        System.out.println("로그아웃 성공");
        return new ModelAndView("redirect:/home");
    }
	
	
	
}














