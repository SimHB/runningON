package com.ict.runningON.dao;

import com.ict.runningON.vo.UsersVO;

public interface LoginDAO {
	
	// 회원가입
	public int LoginJoin(UsersVO uvo) throws Exception;
	
	
	// 로그인
	public UsersVO LoginChk(String user_id) throws Exception;
	
	// 아이디 중복체크
	UsersVO findByUserId(String userId);

	// 이메일 중복체크
	UsersVO findByUserEmail(String userEmail);

}
