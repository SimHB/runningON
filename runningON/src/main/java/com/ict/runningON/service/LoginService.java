package com.ict.runningON.service;

import com.ict.runningON.vo.UsersVO;

public interface LoginService {
	
	// 회원가입
	public int LoginJoin(UsersVO uvo) throws Exception;
	
	
	// 로그인
	public UsersVO LoginChk(String user_id) throws Exception;
	
	// 아이디 중복체크
	boolean isUserIdAvailable(String userId);

	// 이메일 중복체크
	boolean isUserEmailAvailable(String userId);

	
}
