package com.ict.runningON.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RunningONTestController {
	@RequestMapping(value = "/test03", produces="text/xml; charset=utf-8")
	@ResponseBody
	public String Xml_Exam02() {
		StringBuffer sb = new StringBuffer();
		BufferedReader br = null;
		try {
			// 웹 상의 존재하는 xml를 가져오기 
			URL url = new URL("https://www.kma.go.kr/XML/weather/sfc_web_map.xml");
			URLConnection conn = url.openConnection();
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String msg = null;
			while((msg=br.readLine()) != null) {
				sb.append(msg);
			}
			
			return sb.toString();
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	
}
