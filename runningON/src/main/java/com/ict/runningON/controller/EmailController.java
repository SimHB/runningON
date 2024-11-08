package com.ict.runningON.controller;

import java.util.Iterator;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.runningON.service.EmailService;

@Controller
public class EmailController {

	@Autowired
	private EmailService emailService;
	
	@PostMapping("/email_send")
	public ModelAndView sendMail(
			@RequestParam("email") String email,
			HttpServletRequest request
			) {
		
	try {
		ModelAndView mv = new ModelAndView("join");
		
		Random random = new Random();
		String randomNumber = String.valueOf(random.nextInt(1000000));
		
		if(randomNumber.length() < 6) {
			int substract = 6 - randomNumber.length();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < substract; i++) {
				sb.append("0");
			}
			sb.append(randomNumber);
			randomNumber = sb.toString();
			
			}
		
			System.out.println("임시번호 : " + randomNumber);
		
			request.getSession().setAttribute("sessionNumber", randomNumber);
			
			emailService.sendEmail(randomNumber, email);
			return mv;
			
			} catch (Exception e) {
				System.out.println(e);
				return null;
			}
				
		}
	
	@PostMapping("/email_send_chk")
	public ModelAndView sendMailChk(@RequestParam("authNumber") String authNumber, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("join");
		
		String sessionNumber = (String) request.getSession().getAttribute("sessionNumber");
		
		if(authNumber.equalsIgnoreCase(sessionNumber)) {
			mv.addObject("chkEmail", "인증번호 일치");
		}
		
		return mv;
		
	}
	
}
