package com.ict.runningON.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
	@Autowired
	private JavaMailSender javaMailSender;
	
	// Controller 에서 호출할 메서드 생성
	public void sendEmail(String randomNumber, String toMail) {
		try {
			EmailHandler sendMail = new EmailHandler(javaMailSender);
			
			// 메일 제목
			sendMail.setSubject("[ICT EDU  인증 메일입니다.]");
			
			// 내용
			sendMail.setText("<table><tbody>"
					+ "<tr><td><h2>ICT EDU 메일 인증 </h2></td></tr>"
					+ "<tr><td><h3>ICT EDU</h3></td></tr>"
					+ "<tr><td><font size='8px'>인증	번호 안내</font></td></tr>"
					+ "<tr><td><font size='10px'>확인번호 : "+ randomNumber +"</font></td></tr>"
					+"</tbody></table>");
			
			// 보내 사람의 이메일과 제목
			sendMail.setForm("ictedu@gmail.com", "ict 관리자");
			
			// 받는 이메일 
			sendMail.setTo(toMail);
			sendMail.send();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
