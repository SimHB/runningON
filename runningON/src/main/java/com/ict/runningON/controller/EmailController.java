package com.ict.runningON.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.runningON.service.EmailService;

@Controller
public class EmailController {
	
	@Autowired
	private EmailService emailService;
	

	/*
	 * @GetMapping("/email") public ModelAndView emailForm() { return new
	 * ModelAndView("/email_form"); }
	 */
	
	@PostMapping("/email_send")
	public ModelAndView sendMail(
			@RequestParam("email") String email,
			HttpServletRequest request
			) {
		
		try {
			ModelAndView mv = new ModelAndView("/email_form");
			// 임시번호 6자리 만들기 
			Random random = new Random();
			// 0 ~ 1000000 미만의 정수를 무작위로 생성 (6자리 숫자 중 하나를 랜덤으로 만듭) 
			String randomNumber = String.valueOf(random.nextInt(1000000));
			
			// 길이가 6자리가 안되면 0으로 채우자 
			if(randomNumber.length() < 6) {
				int substract = 6 - randomNumber.length();
				StringBuffer sb = new StringBuffer();
				for(int i=0; i < substract; i ++) {
					sb.append("0");
				}
				sb.append(randomNumber);
				randomNumber = sb.toString();
			}
			// 임시번호 서버에 출력
			System.out.println("임시번호 : " + randomNumber);
			
			// 해당 임시번호를 DB에 저장하기 또는 세션에 저장하기 
			request.getSession().setAttribute("sessionNumber", randomNumber);
			
			// 세션에 저장된 인증번호 확인 (디버깅용)
	        System.out.println("세션에 저장된 인증번호: " + request.getSession().getAttribute("sessionNumber"));

			
			// EmailService 호출해서 사용하기 
			emailService.sendEmail(randomNumber, email);
			return mv;
			
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	@PostMapping("/email_send_chk")
	@ResponseBody
	public String sendMailChk(@RequestParam("authNumber") String authNumber, HttpServletRequest request) {
		// 세션에서 인증번호 가져오기
		String sessionNumber = (String) request.getSession().getAttribute("sessionNumber");
		if(sessionNumber.equalsIgnoreCase(authNumber)) {
			return "1";
		}else {
			return "0";
		}
		
	}
}