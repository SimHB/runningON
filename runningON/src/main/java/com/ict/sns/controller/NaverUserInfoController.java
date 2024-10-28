package com.ict.sns.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.ict.sns.vo.NaverUserResponse;
import com.ict.sns.vo.NaverVO;

@RestController
public class NaverUserInfoController {
	
	@RequestMapping(value = "/NaverUserInfo", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String NaverUserInfo(HttpServletRequest request) {
		
		NaverVO navo = (NaverVO) request.getSession().getAttribute("navo");
		String access_token = navo.getAccess_token();
		//System.out.println("access_token : " + access_token);
		
		String apiURL = "https://openapi.naver.com/v1/nid/me";
		
		HttpURLConnection conn = null;
		BufferedReader br = null;
		try {
			URL url = new URL(apiURL);
			conn = (HttpURLConnection)url.openConnection();
			
			// POST
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			// 헤더 요청
			// conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setRequestProperty("Authorization", "Bearer " + access_token );
			
			int responseCode = conn.getResponseCode();
			System.out.println("response :" + responseCode);
			
			if(responseCode == HttpURLConnection.HTTP_OK) {
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				
				String line = "";
				StringBuffer sb = new StringBuffer();
				while((line = br.readLine()) != null) {
					sb.append(line);
				}
				
				// System.out.println(sb.toString());
				Gson gson = new Gson();
				NaverUserResponse naverUser = gson.fromJson(sb.toString(), NaverUserResponse.class);
				
				// 네이버는 특별한 로그아웃이 없다. 그래서 로그아웃이 세션을 초기화 한다.
				// 세션만 초기화하면 id는 고정값이 된다.
				System.out.println("id :" + naverUser.getResponse().getId());
				System.out.println("email :" + naverUser.getResponse().getEmail());
				
				// naverUser 정보를 세션에 넣으면 다른 컨트롤러나 jsp에서 호출해서 사용할 수 있다.
				// id를 가지고 사용자 DB에 검색해서 id가 있으면 사용자 정보를 더 가져올 수 있다.
				// id 가지고 사용자 DB에 검색해서 id가 없으면 DB에 등록한다.
				
				
				 return sb.toString();
			}
			
		} catch (Exception e) {
			System.out.println(e);
			
		} finally {
			try {
				br.close();
				conn.disconnect();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		
		
		return null;
		
		
	}
	
}
